#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include <algorithm>
#include <fstream>
#include <map>

using namespace llvm;

namespace {
class DFGPass : public FunctionPass {
public:
  static char ID;
  DFGPass() : FunctionPass(ID) {}

  bool runOnFunction(Function &F) override {
    std::ofstream fout("a.o.3.dot");

    fout << "digraph DFG {\n";
    fout << "  node [shape=box, fontname=\"Courier\"];\n";
    fout << "  rankdir=TB;\n\n";

    std::map<Value *, std::string> NodeMap;
    unsigned NodeCounter = 0;

    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        // 为每个指令创建节点
        std::string NodeName = "N" + std::to_string(NodeCounter++);
        NodeMap[&I] = NodeName;

        // 生成节点标签
        std::string Label;
        raw_string_ostream RSO(Label);
        I.print(RSO);
        RSO.flush();

        // 转义特殊字符
        std::replace(Label.begin(), Label.end(), '"', '\'');
        fout << "  " << NodeName << " [label=\"" << Label << "\"];\n";

        // 生成数据流边
        for (Use &U : I.operands()) {
          if (Instruction *OpI = dyn_cast<Instruction>(U.get())) {
            if (NodeMap.count(OpI)) {
              fout << "  " << NodeMap[OpI] << " -> " << NodeName << ";\n";
            }
          }
        }
      }
    }

    fout << "}\n";
    return false; // 不修改原始IR
  }
};
} // namespace

char DFGPass::ID = 0;
static RegisterPass<DFGPass> X("dfg", "Print DFG", false, true);