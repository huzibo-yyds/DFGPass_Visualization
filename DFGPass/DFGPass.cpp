#include <llvm/Analysis/CFG.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Use.h>
#include <llvm/IR/Value.h>
#include <llvm/Pass.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

namespace {
struct DFGPass : public FunctionPass {
public:
  static char ID;

  std::vector<std::pair<Value *, Value *>>
      inst_edges; // 存储每条指令之间的先后执行顺序
  std::vector<std::pair<Value *, Value *>> edges; // 存储data flow的边
  std::vector<Value *> nodes;                     // 存储每条指令
  int num = 0;

  DFGPass() : FunctionPass(ID) {}

  // 将指令的内容输出到string中去
  std::string changeIns2Str(Instruction *ins) {
    std::string temp_str;
    raw_string_ostream os(temp_str);
    ins->print(os);
    return os.str();
  }

  // 如果是变量则获得变量的名字，如果是指令则获得SSA编号
  std::string getValueName(Value *v) {
    std::string result;
    if (!v) {
      return "undefined";
    }
    if (v->getName().empty()) {
      result = "val" + std::to_string(num++);
    } else {
      result = v->getName().str();
    }
    errs() << result;
    return result;
  }

  bool runOnFunction(Function &F) override {
    std::error_code error;
    enum sys::fs::OpenFlags F_None = sys::fs::OpenFlags::OF_Text;
    std::string fileName(F.getName().str() + ".dot");
    raw_fd_ostream file(fileName, error, F_None);

    errs() << "Hello\n";
    edges.clear();
    nodes.clear();
    inst_edges.clear();

    for (auto BB = F.begin(), BEnd = F.end(); BB != BEnd; ++BB) {
      BasicBlock *curBB = &*BB;
      for (auto II = curBB->begin(), IEnd = curBB->end(); II != IEnd; ++II) {
        Instruction *curII = &*II;
        errs() << getValueName(curII) << "\n";

        switch (curII->getOpcode()) {
        // 由于load和store对内存进行操作，需要对load指令和stroe指令单独进行处理
        case llvm::Instruction::Load: {
          LoadInst *linst = dyn_cast<LoadInst>(curII);
          Value *loadValPtr = linst->getPointerOperand();
          edges.push_back({loadValPtr, curII});
          break;
        }

        case llvm::Instruction::Store: {
          StoreInst *sinst = dyn_cast<StoreInst>(curII);
          Value *storeValPtr = sinst->getPointerOperand();
          Value *storeVal = sinst->getValueOperand();
          edges.push_back({storeVal, curII});
          edges.push_back({curII, storeValPtr});
          break;
        }

        default: {
          for (auto op = curII->op_begin(), opEnd = curII->op_end();
               op != opEnd; ++op) {
            if (dyn_cast<Instruction>(*op)) {
              edges.push_back({op->get(), curII});
            }
          }
          break;
        }
        }

        // errs() << curII << "\n";
        nodes.push_back(curII);
        auto next = II;
        ++next;
        if (next != IEnd) {
          inst_edges.push_back({curII, &*next});
        }
      }

      Instruction *terminator = curBB->getTerminator();
      for (auto sucBB : successors(curBB)) {
        Instruction *first = &*(sucBB->begin());
        inst_edges.push_back({terminator, first});
      }
    }

    // errs() << "Write\n";
    // errs() << "Write DFG\n";
    file << "digraph \"DFG for '" + F.getName() + "\' function\" {\n";
    // 将node节点dump
    for (auto node : nodes) {
      if (auto *inst = dyn_cast<Instruction>(node)) {
        std::string s;
        raw_string_ostream os(s);
        if (auto *callInst = dyn_cast<CallInst>(inst)) {
          os << (inst->getName().empty() ? "" : "%" + inst->getName() + " = ")
             << "call "
             << "@" << callInst->getCalledFunction()->getName();
        } else {
          os << *inst;
        }
        file << "\tNode" << node << "[shape=record, label=\"" << os.str()
             << "\"];\n";
      } else {
        file << "\tNode" << node << "[shape=record, label=\""
             << getValueName(node) << "\"];\n";
      }
    }
    // errs() << "Write Done\n";

    // 将inst_edges边dump
    for (auto edge : inst_edges) {
      file << "\tNode" << edge.first << " -> Node" << edge.second << "\n";
    }

    // 将data flow的边dump
    file << "edge [color=red]" << "\n";
    for (auto edge : edges) {
      file << "\tNode" << edge.first << " -> Node" << edge.second << "\n";
    }
    errs() << "Write Done\n";

    file << "}\n";
    file.close();

    return false;
  }
};
} // namespace

char DFGPass::ID = 0;
static RegisterPass<DFGPass> X("DFGPass", "DFG Pass Analyse", false, false);
