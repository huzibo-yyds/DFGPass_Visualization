#include <list>
#include <llvm/Analysis/CFG.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/Use.h>
#include <llvm/IR/Value.h>
#include <llvm/Passes/PassBuilder.h> // 新增头文件
#include <llvm/Passes/PassPlugin.h>  // 新增头文件
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

namespace {
struct DFGPass : public PassInfoMixin<DFGPass> { // 修改基类
  // 保持原有数据结构不变
  typedef std::pair<Value *, StringRef> node;
  typedef std::pair<node, node> edge;
  typedef std::list<node> node_list;
  typedef std::list<edge> edge_list;

  edge_list inst_edges;
  edge_list edges;
  node_list nodes;
  int num;

  DFGPass() {
    num = 0;
  } // 移除 legacy ID 初始化

  // 保持工具函数不变
  std::string changeIns2Str(Instruction *ins) {
    std::string temp_str;
    raw_string_ostream os(temp_str);
    ins->print(os);
    return os.str();
  }

  StringRef getValueName(Value *v) {
    // 修改字符串处理逻辑
    static std::string temp_result; // 使用静态变量保持生命周期
    temp_result = "val";
    if (!v)
      return "undefined";

    if (v->getName().empty()) {
      temp_result += std::to_string(num++);
    } else {
      temp_result = v->getName().str();
    }
    return temp_result;
  }

  // 修改为新的 pass 接口
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
    std::error_code error;
    StringRef fileName(F.getName().str() + ".dot");
    raw_fd_ostream file(fileName, error, sys::fs::OF_None); // 修复 F_None

    errs() << "Hello\n";
    edges.clear();
    nodes.clear();
    inst_edges.clear();
    for (Function::iterator BB = F.begin(), BEnd = F.end(); BB != BEnd; ++BB) {
      BasicBlock *curBB = &*BB;
      for (BasicBlock::iterator II = curBB->begin(), IEnd = curBB->end();
           II != IEnd; ++II) {
        Instruction *curII = &*II;
        errs() << getValueName(curII) << "\n";
        switch (curII->getOpcode()) {
        // 由于load和store对内存进行操作，需要对load指令和stroe指令单独进行处理
        case llvm::Instruction::Load: {
          LoadInst *linst = dyn_cast<LoadInst>(curII);
          Value *loadValPtr = linst->getPointerOperand();
          edges.push_back(edge(
              node(loadValPtr, getValueName(loadValPtr)),
              node(curII, getValueName(curII))));
          break;
        }
        case llvm::Instruction::Store: {
          StoreInst *sinst = dyn_cast<StoreInst>(curII);
          Value *storeValPtr = sinst->getPointerOperand();
          Value *storeVal = sinst->getValueOperand();
          edges.push_back(edge(
              node(storeVal, getValueName(storeVal)),
              node(curII, getValueName(curII))));
          edges.push_back(edge(
              node(curII, getValueName(curII)),
              node(storeValPtr, getValueName(storeValPtr))));
          break;
        }
        default: {
          for (Instruction::op_iterator op = curII->op_begin(),
                                        opEnd = curII->op_end();
               op != opEnd; ++op) {
            Instruction *tempIns;
            if (dyn_cast<Instruction>(*op)) {
              edges.push_back(edge(
                  node(op->get(), getValueName(op->get())),
                  node(curII, getValueName(curII))));
            }
          }
          break;
        }
        }
        BasicBlock::iterator next = II;
        // errs() << curII << "\n";
        nodes.push_back(node(curII, getValueName(curII)));
        ++next;
        if (next != IEnd) {
          inst_edges.push_back(edge(
              node(curII, getValueName(curII)),
              node(&*next, getValueName(&*next))));
        }
      }

      Instruction *terminator = curBB->getTerminator();
      for (BasicBlock *sucBB : successors(curBB)) {
        Instruction *first = &*(sucBB->begin());
        inst_edges.push_back(edge(
            node(terminator, getValueName(terminator)),
            node(first, getValueName(first))));
      }
    }
    // errs() << "Write\n";
    file << "digraph \"DFG for'" + F.getName() + "\' function\" {\n";
    // errs() << "Write DFG\n";
    // 将node节点dump
    for (node_list::iterator node = nodes.begin(), node_end = nodes.end();
         node != node_end; ++node) {
      // errs() << "Node First:" << node->first << "\n";
      // errs() << "Node Second:" << node-> second << "\n";
      if (dyn_cast<Instruction>(node->first))
        file << "\tNode" << node->first << "[shape=record, label=\""
             << *(node->first) << "\"];\n";
      else
        file << "\tNode" << node->first << "[shape=record, label=\""
             << node->second << "\"];\n";
    }
    // errs() << "Write Done\n";
    // 将inst_edges边dump
    for (edge_list::iterator edge = inst_edges.begin(),
                             edge_end = inst_edges.end();
         edge != edge_end; ++edge) {
      file << "\tNode" << edge->first.first << " -> Node" << edge->second.first
           << "\n";
    }
    // 将data flow的边dump
    file << "edge [color=red]" << "\n";
    for (edge_list::iterator edge = edges.begin(), edge_end = edges.end();
         edge != edge_end; ++edge) {
      file << "\tNode" << edge->first.first << " -> Node" << edge->second.first
           << "\n";
    }
    errs() << "Write Done\n";
    file << "}\n";
    file.close();

    return PreservedAnalyses::all();
  }
};
} // namespace

// 新的插件注册方式
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return {
      LLVM_PLUGIN_API_VERSION, "DFGPass", LLVM_VERSION_STRING,
      [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
            [](StringRef Name, FunctionPassManager &FPM,
               ArrayRef<PassBuilder::PipelineElement>) {
              if (Name == "DFGPass") {
                FPM.addPass(DFGPass());
                return true;
              }
              return false;
            });
      }};
}