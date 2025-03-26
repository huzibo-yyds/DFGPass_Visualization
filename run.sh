if [ -d "./test/output" ]; then
  rm -rf "./test/output/*"
else
  mkdir -p "./test/output"
fi

cd "./test/output"
opt-14 \
  -load "../../build/DFGPass/libLLVMDFGPass.so" \
  -enable-new-pm=false \
  -DFGPass \
  "../../test/a.o.3-1.ll"
python3 "../convert.py"
