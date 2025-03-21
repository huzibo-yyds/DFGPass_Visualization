cd test/output
opt-14 \
  -load ../../build/DFGPass/libLLVMDFGPass.so \
  -enable-new-pm=false \
  -DFGPass \
  ../../test/a.o.3-as.ll \
  -o ../../test/a.o.3-as-1.bc
python3 ../convert.py
