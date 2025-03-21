// DFGPass.cpp
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Value.h"
#include "llvm/Pass.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>

using namespace llvm;

namespace {
struct DFGPass : public FunctionPass {
  static char ID;
  DFGPass() : FunctionPass(ID) {}

  bool runOnFunction(Function &F) override {
    std::error_code EC;
    raw_fd_ostream dotFile("dfg.dot", EC, sys::fs::OF_Text);
    dotFile << "digraph DFG {\n";

    // 遍历所有基本块和指令
    for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
        // 为每条指令创建节点
        dotFile << "  \"" << &I << "\" [label=\"" << I << "\"];\n";

        // 遍历操作数，建立依赖边
        for (Use &U : I.operands()) {
          Value *V = U.get();
          if (Instruction *OpI = dyn_cast<Instruction>(V)) {
            dotFile << "  \"" << OpI << "\" -> \"" << &I << "\";\n";
          }
        }
      }
    }

    dotFile << "}\n";
    dotFile.close();
    return false; // 未修改 IR
  }
};
} // namespace

char DFGPass::ID = 0;
static RegisterPass<DFGPass> X("dfg", "Data Flow Graph Pass");