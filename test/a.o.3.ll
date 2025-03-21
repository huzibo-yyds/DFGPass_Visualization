; ModuleID = 'test/test_fpga/a.o.3.bc'
source_filename = "test/test_fpga/a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecPipeline = comdat any

$_ssdm_op_SpecLoopTripCount = comdat any

$_ssdm_op_SpecLoopName = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

$_ssdm_op_Read.ap_auto.float = comdat any

$_ssdm_op_BitConcatenate.i12.i6.i6 = comdat any

@lpwr_1_lpwr_2_str = internal unnamed_addr constant [14 x i8] c"lpwr_1_lpwr_2\00"
@lprd_1_lprd_2_str = internal unnamed_addr constant [14 x i8] c"lprd_1_lprd_2\00"
@lp1_lp2_str = internal unnamed_addr constant [8 x i8] c"lp1_lp2\00"
@p_str = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty = internal unnamed_addr constant [8 x i8] c"ap_auto\00"
@empty_0 = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty_1 = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@empty_2 = internal unnamed_addr constant [3 x i8] c"aA\00"
@empty_3 = internal unnamed_addr constant [7 x i8] c"lpwr_2\00"
@empty_4 = internal unnamed_addr constant [4 x i8] c"lp2\00"
@empty_5 = internal unnamed_addr constant [7 x i8] c"lprd_2\00"

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #0

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #0

; Function Attrs: nounwind
define internal void @aA_Pipeline_lpwr_1_lpwr_2([4096 x i32]* %A_out, [4096 x float]* %buff_A_out) #1 {
newFuncRoot:
  %j = alloca i7, align 1, !bitwidth !56
  %i = alloca i7, align 1, !bitwidth !56
  %indvar_flatten13 = alloca i13, align 2, !bitwidth !57
  call void (...) @_ssdm_op_SpecInterface([4096 x i32]* %A_out, [10 x i8]* @empty_1, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  store i13 0, i13* %indvar_flatten13, align 2, !bitwidth !9, !dep_idx !58, !deps !59
  store i7 0, i7* %i, align 1, !bitwidth !9, !dep_idx !64, !deps !65
  store i7 0, i7* %j, align 1, !bitwidth !9, !dep_idx !68, !deps !69
  br label %for.inc47, !bitwidth !9

for.end52.exitStub:                               ; preds = %for.inc47
  ret void, !bitwidth !9

for.inc47:                                        ; preds = %for.inc50, %newFuncRoot
  %indvar_flatten13_load = load i13, i13* %indvar_flatten13, align 2, !bitwidth !72, !dep_idx !73, !deps !74
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 1, i32 0, [1 x i8]* @p_str) #1
  %icmp_ln22 = icmp eq i13 %indvar_flatten13_load, -4096, !bitwidth !79
  %add_ln22_1 = add i13 %indvar_flatten13_load, 1, !bitwidth !72
  br i1 %icmp_ln22, label %for.end52.exitStub, label %for.inc50, !bitwidth !9

for.inc50:                                        ; preds = %for.inc47
  %j_load = load i7, i7* %j, align 1, !bitwidth !80, !dep_idx !81, !deps !82
  %i_load = load i7, i7* %i, align 1, !bitwidth !80, !dep_idx !85, !deps !86
  %add_ln22 = add i7 %i_load, 1, !bitwidth !80
  call void (...) @_ssdm_op_SpecLoopName([14 x i8]* @lpwr_1_lpwr_2_str)
  %empty = call i32 (...) @_ssdm_op_SpecLoopTripCount(i64 4096, i64 4096, i64 4096) #1
  %icmp_ln23 = icmp eq i7 %j_load, -64, !bitwidth !79
  %select_ln22 = select i1 %icmp_ln23, i7 0, i7 %j_load, !bitwidth !80
  %select_ln22_1 = select i1 %icmp_ln23, i7 %add_ln22, i7 %i_load, !bitwidth !80
  %trunc_ln24 = trunc i7 %select_ln22_1 to i6, !bitwidth !89
  %tmp_2 = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %trunc_ln24, i6 0), !bitwidth !90
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 1, i32 0, [1 x i8]* @p_str) #1
  %zext_ln24 = zext i7 %select_ln22 to i12, !bitwidth !91
  %add_ln24 = add i12 %tmp_2, %zext_ln24, !bitwidth !90
  %zext_ln24_1 = zext i12 %add_ln24 to i64, !bitwidth !92
  %A_out_addr = getelementptr [4096 x i32], [4096 x i32]* %A_out, i64 0, i64 %zext_ln24_1, !bitwidth !7
  %buff_A_out_addr = getelementptr [4096 x float], [4096 x float]* %buff_A_out, i64 0, i64 %zext_ln24_1, !bitwidth !9
  call void (...) @_ssdm_op_SpecLoopName([7 x i8]* @empty_3)
  %buff_A_out_load = load float, float* %buff_A_out_addr, align 4, !bitwidth !45
  %bitcast_ln24 = bitcast float %buff_A_out_load to i32, !bitwidth !45
  store i32 %bitcast_ln24, i32* %A_out_addr, align 4, !bitwidth !9
  %add_ln23 = add i7 %select_ln22, 1, !bitwidth !80
  store i13 %add_ln22_1, i13* %indvar_flatten13, align 2, !bitwidth !9, !dep_idx !93, !deps !94
  store i7 %select_ln22_1, i7* %i, align 1, !bitwidth !9, !dep_idx !98, !deps !99
  store i7 %add_ln23, i7* %j, align 1, !bitwidth !9, !dep_idx !102, !deps !103
  br label %for.inc47, !llvm.loop !106, !bitwidth !9
}

; Function Attrs: nounwind
define internal void @aA_Pipeline_lprd_1_lprd_2([4096 x i32]* %A, [4096 x float]* %buff_A) #1 {
newFuncRoot:
  %j = alloca i7, align 1, !bitwidth !56
  %i = alloca i7, align 1, !bitwidth !56
  %indvar_flatten = alloca i13, align 2, !bitwidth !57
  call void (...) @_ssdm_op_SpecInterface([4096 x i32]* %A, [10 x i8]* @empty_1, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  store i13 0, i13* %indvar_flatten, align 2, !bitwidth !9, !dep_idx !108, !deps !109
  store i7 0, i7* %i, align 1, !bitwidth !9, !dep_idx !112, !deps !113
  store i7 0, i7* %j, align 1, !bitwidth !9, !dep_idx !116, !deps !117
  br label %for.inc, !bitwidth !9

for.inc27.preheader.exitStub:                     ; preds = %for.inc
  ret void, !bitwidth !9

for.inc:                                          ; preds = %for.inc10, %newFuncRoot
  %indvar_flatten_load = load i13, i13* %indvar_flatten, align 2, !bitwidth !72, !dep_idx !120, !deps !121
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 1, i32 0, [1 x i8]* @p_str) #1
  %icmp_ln10 = icmp eq i13 %indvar_flatten_load, -4096, !bitwidth !79
  %add_ln10_1 = add i13 %indvar_flatten_load, 1, !bitwidth !72
  br i1 %icmp_ln10, label %for.inc27.preheader.exitStub, label %for.inc10, !bitwidth !9

for.inc10:                                        ; preds = %for.inc
  %j_load = load i7, i7* %j, align 1, !bitwidth !80, !dep_idx !124, !deps !125
  %i_load = load i7, i7* %i, align 1, !bitwidth !80, !dep_idx !128, !deps !129
  %add_ln10 = add i7 %i_load, 1, !bitwidth !80
  call void (...) @_ssdm_op_SpecLoopName([14 x i8]* @lprd_1_lprd_2_str)
  %empty = call i32 (...) @_ssdm_op_SpecLoopTripCount(i64 4096, i64 4096, i64 4096) #1
  %icmp_ln11 = icmp eq i7 %j_load, -64, !bitwidth !79
  %select_ln10 = select i1 %icmp_ln11, i7 0, i7 %j_load, !bitwidth !80
  %select_ln10_1 = select i1 %icmp_ln11, i7 %add_ln10, i7 %i_load, !bitwidth !80
  %trunc_ln12 = trunc i7 %select_ln10_1 to i6, !bitwidth !89
  %tmp = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %trunc_ln12, i6 0), !bitwidth !90
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 1, i32 0, [1 x i8]* @p_str) #1
  %zext_ln12 = zext i7 %select_ln10 to i12, !bitwidth !91
  %add_ln12 = add i12 %tmp, %zext_ln12, !bitwidth !90
  %zext_ln12_1 = zext i12 %add_ln12 to i64, !bitwidth !92
  %A_addr = getelementptr [4096 x i32], [4096 x i32]* %A, i64 0, i64 %zext_ln12_1, !bitwidth !7
  %buff_A_addr = getelementptr [4096 x float], [4096 x float]* %buff_A, i64 0, i64 %zext_ln12_1, !bitwidth !9
  call void (...) @_ssdm_op_SpecLoopName([7 x i8]* @empty_5)
  %A_load = load i32, i32* %A_addr, align 4, !bitwidth !45
  %bitcast_ln12 = bitcast i32 %A_load to float, !bitwidth !45
  store float %bitcast_ln12, float* %buff_A_addr, align 4, !bitwidth !9
  %add_ln11 = add i7 %select_ln10, 1, !bitwidth !80
  store i13 %add_ln10_1, i13* %indvar_flatten, align 2, !bitwidth !9, !dep_idx !132, !deps !133
  store i7 %select_ln10_1, i7* %i, align 1, !bitwidth !9, !dep_idx !136, !deps !137
  store i7 %add_ln11, i7* %j, align 1, !bitwidth !9, !dep_idx !140, !deps !141
  br label %for.inc, !llvm.loop !144, !bitwidth !9
}

; Function Attrs: nounwind
define internal void @aA_Pipeline_lp1_lp2([4096 x float]* %buff_A, [4096 x float]* %buff_A_out, float %alpha) #1 {
newFuncRoot:
  %j = alloca i7, align 1, !bitwidth !56
  %i = alloca i7, align 1, !bitwidth !56
  %indvar_flatten6 = alloca i13, align 2, !bitwidth !57
  %alpha_read = call float @_ssdm_op_Read.ap_auto.float(float %alpha) #1, !bitwidth !45
  store i13 0, i13* %indvar_flatten6, align 2, !bitwidth !9, !dep_idx !146, !deps !147
  store i7 0, i7* %i, align 1, !bitwidth !9, !dep_idx !150, !deps !151
  store i7 0, i7* %j, align 1, !bitwidth !9, !dep_idx !154, !deps !155
  br label %for.inc27, !bitwidth !9

for.inc47.preheader.exitStub:                     ; preds = %for.inc27
  ret void, !bitwidth !9

for.inc27:                                        ; preds = %for.inc30, %newFuncRoot
  %indvar_flatten6_load = load i13, i13* %indvar_flatten6, align 2, !bitwidth !72, !dep_idx !158, !deps !159
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 1, i32 0, [1 x i8]* @p_str) #1
  %icmp_ln16 = icmp eq i13 %indvar_flatten6_load, -4096, !bitwidth !79
  %add_ln16_1 = add i13 %indvar_flatten6_load, 1, !bitwidth !72
  br i1 %icmp_ln16, label %for.inc47.preheader.exitStub, label %for.inc30, !bitwidth !9

for.inc30:                                        ; preds = %for.inc27
  %j_load = load i7, i7* %j, align 1, !bitwidth !80, !dep_idx !162, !deps !163
  %i_load = load i7, i7* %i, align 1, !bitwidth !80, !dep_idx !166, !deps !167
  %add_ln16 = add i7 %i_load, 1, !bitwidth !80
  call void (...) @_ssdm_op_SpecLoopName([8 x i8]* @lp1_lp2_str)
  %empty = call i32 (...) @_ssdm_op_SpecLoopTripCount(i64 4096, i64 4096, i64 4096) #1
  %icmp_ln17 = icmp eq i7 %j_load, -64, !bitwidth !79
  %select_ln16 = select i1 %icmp_ln17, i7 0, i7 %j_load, !bitwidth !80
  %select_ln16_1 = select i1 %icmp_ln17, i7 %add_ln16, i7 %i_load, !bitwidth !80
  %trunc_ln18 = trunc i7 %select_ln16_1 to i6, !bitwidth !89
  %tmp_1 = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %trunc_ln18, i6 0), !bitwidth !90
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 1, i32 0, [1 x i8]* @p_str) #1
  %zext_ln18 = zext i7 %select_ln16 to i12, !bitwidth !91
  %add_ln18 = add i12 %tmp_1, %zext_ln18, !bitwidth !90
  %zext_ln18_1 = zext i12 %add_ln18 to i64, !bitwidth !92
  %buff_A_addr = getelementptr [4096 x float], [4096 x float]* %buff_A, i64 0, i64 %zext_ln18_1, !bitwidth !9
  %buff_A_out_addr = getelementptr [4096 x float], [4096 x float]* %buff_A_out, i64 0, i64 %zext_ln18_1, !bitwidth !9
  call void (...) @_ssdm_op_SpecLoopName([4 x i8]* @empty_4)
  %buff_A_load = load float, float* %buff_A_addr, align 4, !bitwidth !45
  %mul = fmul float %buff_A_load, %alpha_read, !bitwidth !45
  store float %mul, float* %buff_A_out_addr, align 4, !bitwidth !9
  %add_ln17 = add i7 %select_ln16, 1, !bitwidth !80
  store i13 %add_ln16_1, i13* %indvar_flatten6, align 2, !bitwidth !9, !dep_idx !170, !deps !171
  store i7 %select_ln16_1, i7* %i, align 1, !bitwidth !9, !dep_idx !174, !deps !175
  store i7 %add_ln17, i7* %j, align 1, !bitwidth !9, !dep_idx !178, !deps !179
  br label %for.inc27, !llvm.loop !182, !bitwidth !9
}

; Function Attrs: nounwind
define void @aA(float %alpha, [4096 x i32]* noalias %A, [4096 x i32]* noalias %A_out) #1 {
entry:
  call void (...) @_ssdm_op_SpecTopModule([3 x i8]* @empty_2)
  call void (...) @_ssdm_op_SpecBitsMap(float %alpha), !map !184
  call void (...) @_ssdm_op_SpecInterface(float %alpha, [8 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([4096 x i32]* %A, [10 x i8]* @empty_1, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([4096 x i32]* %A), !map !184
  call void (...) @_ssdm_op_SpecInterface([4096 x i32]* %A_out, [10 x i8]* @empty_1, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([4096 x i32]* %A_out), !map !184
  %alpha_read = call float @_ssdm_op_Read.ap_auto.float(float %alpha) #1, !bitwidth !45
  %buff_A = alloca [4096 x float], i64 1, align 4, !bitwidth !9
  %buff_A_out = alloca [4096 x float], i64 1, align 4, !bitwidth !9
  call void @aA_Pipeline_lprd_1_lprd_2([4096 x i32]* %A, [4096 x float]* %buff_A), !bitwidth !9, !dep_idx !185, !deps !186
  call void @aA_Pipeline_lp1_lp2([4096 x float]* %buff_A, [4096 x float]* %buff_A_out, float %alpha_read), !bitwidth !9, !dep_idx !188, !deps !189
  call void @aA_Pipeline_lpwr_1_lpwr_2([4096 x i32]* %A_out, [4096 x float]* %buff_A_out), !bitwidth !9, !dep_idx !192, !deps !193
  ret void, !bitwidth !9
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecTopModule(...) #1 comdat {
entry:
  ret void
}

define weak void @_ssdm_op_SpecPipeline(...) comdat {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) comdat {
entry:
  ret i32 0
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopName(...) #1 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecInterface(...) #1 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecBitsMap(...) #1 comdat {
entry:
  ret void
}

define weak float @_ssdm_op_Read.ap_auto.float(float %0) comdat {
entry:
  ret float %0
}

; Function Attrs: nounwind readnone
declare i6 @_ssdm_op_PartSelect.i6.i7.i32.i32(i7, i32, i32) #2

; Function Attrs: nounwind readnone
define weak i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %0, i6 %1) #2 comdat {
entry:
  %empty = zext i6 %0 to i12
  %empty_9 = zext i6 %1 to i12
  %empty_10 = shl i12 %empty, 6
  %empty_11 = or i12 %empty_10, %empty_9
  ret i12 %empty_11
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4, !37, !41, !48}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void ([4096 x i32]*, [4096 x float]*)* @aA_Pipeline_lpwr_1_lpwr_2, !5}
!5 = !{!6, !8, !10, !12, !14, !15, !16, !18, !20, !22, !23, !25, !26, !27, !28, !30, !32, !34, !36}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 32, i32 2}
!8 = !{!"Arg", i32 1, !9}
!9 = !{i32 0, i32 0, i32 0, i32 2}
!10 = !{i32 1, !11}
!11 = !{i32 1, i32 32, i32 0, i32 0}
!12 = !{[10 x i8]* @empty_1, !13}
!13 = !{i32 0, i32 0, i32 8, i32 2}
!14 = !{i32 0, !11}
!15 = !{[1 x i8]* @empty_0, !13}
!16 = !{i32 -1, !17}
!17 = !{i32 1, i32 32, i32 0, i32 1}
!18 = !{i13 0, !19}
!19 = !{i32 1, i32 13, i32 0, i32 0}
!20 = !{i7 0, !21}
!21 = !{i32 1, i32 7, i32 0, i32 0}
!22 = !{[1 x i8]* @p_str, !13}
!23 = !{i13 -4096, !24}
!24 = !{i32 13, i32 13, i32 0, i32 1}
!25 = !{i13 1, !19}
!26 = !{i7 1, !21}
!27 = !{[14 x i8]* @lpwr_1_lpwr_2_str, !13}
!28 = !{i64 4096, !29}
!29 = !{i32 14, i32 64, i32 0, i32 1}
!30 = !{i7 -64, !31}
!31 = !{i32 7, i32 7, i32 0, i32 1}
!32 = !{i6 0, !33}
!33 = !{i32 1, i32 6, i32 0, i32 0}
!34 = !{i64 0, !35}
!35 = !{i32 1, i32 64, i32 0, i32 0}
!36 = !{[7 x i8]* @empty_3, !13}
!37 = !{void ([4096 x i32]*, [4096 x float]*)* @aA_Pipeline_lprd_1_lprd_2, !38}
!38 = !{!6, !8, !10, !12, !14, !15, !16, !18, !20, !22, !23, !25, !26, !39, !28, !30, !32, !34, !40}
!39 = !{[14 x i8]* @lprd_1_lprd_2_str, !13}
!40 = !{[7 x i8]* @empty_5, !13}
!41 = !{void ([4096 x float]*, [4096 x float]*, float)* @aA_Pipeline_lp1_lp2, !42}
!42 = !{!43, !8, !44, !10, !18, !20, !16, !14, !22, !23, !25, !26, !46, !28, !30, !32, !34, !47}
!43 = !{!"Arg", i32 0, !9}
!44 = !{!"Arg", i32 2, !45}
!45 = !{i32 32, i32 32, i32 0, i32 2}
!46 = !{[8 x i8]* @lp1_lp2_str, !13}
!47 = !{[4 x i8]* @empty_4, !13}
!48 = !{void (float, [4096 x i32]*, [4096 x i32]*)* @aA, !49}
!49 = !{!50, !51, !52, !53, !54, !14, !15, !16, !12, !55}
!50 = !{!"Arg", i32 0, !45}
!51 = !{!"Arg", i32 1, !7}
!52 = !{!"Arg", i32 2, !7}
!53 = !{[3 x i8]* @empty_2, !13}
!54 = !{[8 x i8]* @empty, !13}
!55 = !{i64 1, !35}
!56 = !{i32 0, i32 0, i32 7, i32 1}
!57 = !{i32 0, i32 0, i32 13, i32 1}
!58 = !{i32 27}
!59 = !{!60, !62}
!60 = !{i32 21, !61}
!61 = !{!"RAW", !"indep"}
!62 = !{i32 22, !63}
!63 = !{!"WAW", !"indep"}
!64 = !{i32 29}
!65 = !{!66, !67}
!66 = !{i32 23, !61}
!67 = !{i32 24, !63}
!68 = !{i32 28}
!69 = !{!70, !71}
!70 = !{i32 25, !61}
!71 = !{i32 26, !63}
!72 = !{i32 13, i32 13, i32 0, i32 2}
!73 = !{i32 21}
!74 = !{!75, !77}
!75 = !{i32 27, !76}
!76 = !{!"WAR", !"indep"}
!77 = !{i32 22, !78}
!78 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!79 = !{i32 1, i32 1, i32 0, i32 2}
!80 = !{i32 7, i32 7, i32 0, i32 2}
!81 = !{i32 25}
!82 = !{!83, !84}
!83 = !{i32 28, !76}
!84 = !{i32 26, !78}
!85 = !{i32 23}
!86 = !{!87, !88}
!87 = !{i32 29, !76}
!88 = !{i32 24, !78}
!89 = !{i32 6, i32 6, i32 0, i32 2}
!90 = !{i32 12, i32 12, i32 0, i32 2}
!91 = !{i32 12, i32 12, i32 0, i32 0}
!92 = !{i32 64, i32 64, i32 0, i32 0}
!93 = !{i32 22}
!94 = !{!95, !96}
!95 = !{i32 27, !63}
!96 = !{i32 21, !97}
!97 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!98 = !{i32 24}
!99 = !{!100, !101}
!100 = !{i32 29, !63}
!101 = !{i32 23, !97}
!102 = !{i32 26}
!103 = !{!104, !105}
!104 = !{i32 28, !63}
!105 = !{i32 25, !97}
!106 = distinct !{!106, !1, !1, !107}
!107 = !{!"llvm.loop.name", !"lpwr_2"}
!108 = !{i32 18}
!109 = !{!110, !111}
!110 = !{i32 12, !61}
!111 = !{i32 13, !63}
!112 = !{i32 20}
!113 = !{!114, !115}
!114 = !{i32 14, !61}
!115 = !{i32 15, !63}
!116 = !{i32 19}
!117 = !{!118, !119}
!118 = !{i32 16, !61}
!119 = !{i32 17, !63}
!120 = !{i32 12}
!121 = !{!122, !123}
!122 = !{i32 18, !76}
!123 = !{i32 13, !78}
!124 = !{i32 16}
!125 = !{!126, !127}
!126 = !{i32 19, !76}
!127 = !{i32 17, !78}
!128 = !{i32 14}
!129 = !{!130, !131}
!130 = !{i32 20, !76}
!131 = !{i32 15, !78}
!132 = !{i32 13}
!133 = !{!134, !135}
!134 = !{i32 18, !63}
!135 = !{i32 12, !97}
!136 = !{i32 15}
!137 = !{!138, !139}
!138 = !{i32 20, !63}
!139 = !{i32 14, !97}
!140 = !{i32 17}
!141 = !{!142, !143}
!142 = !{i32 19, !63}
!143 = !{i32 16, !97}
!144 = distinct !{!144, !1, !1, !145}
!145 = !{!"llvm.loop.name", !"lprd_2"}
!146 = !{i32 9}
!147 = !{!148, !149}
!148 = !{i32 3, !61}
!149 = !{i32 4, !63}
!150 = !{i32 11}
!151 = !{!152, !153}
!152 = !{i32 5, !61}
!153 = !{i32 6, !63}
!154 = !{i32 10}
!155 = !{!156, !157}
!156 = !{i32 7, !61}
!157 = !{i32 8, !63}
!158 = !{i32 3}
!159 = !{!160, !161}
!160 = !{i32 9, !76}
!161 = !{i32 4, !78}
!162 = !{i32 7}
!163 = !{!164, !165}
!164 = !{i32 10, !76}
!165 = !{i32 8, !78}
!166 = !{i32 5}
!167 = !{!168, !169}
!168 = !{i32 11, !76}
!169 = !{i32 6, !78}
!170 = !{i32 4}
!171 = !{!172, !173}
!172 = !{i32 9, !63}
!173 = !{i32 3, !97}
!174 = !{i32 6}
!175 = !{!176, !177}
!176 = !{i32 11, !63}
!177 = !{i32 5, !97}
!178 = !{i32 8}
!179 = !{!180, !181}
!180 = !{i32 10, !63}
!181 = !{i32 7, !97}
!182 = distinct !{!182, !1, !1, !183}
!183 = !{!"llvm.loop.name", !"lp2"}
!184 = !{!1}
!185 = !{i32 1}
!186 = !{!187}
!187 = !{i32 0, !61}
!188 = !{i32 0}
!189 = !{!190, !191}
!190 = !{i32 1, !76}
!191 = !{i32 2, !61}
!192 = !{i32 2}
!193 = !{!194}
!194 = !{i32 0, !76}
