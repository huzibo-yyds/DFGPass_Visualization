; ModuleID = 'test/a.o.3.bc'
source_filename = "test/a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"

$_ssdm_op_Write.ap_auto.i32P0A = comdat any

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecPipeline = comdat any

$_ssdm_op_SpecLoopTripCount = comdat any

$_ssdm_op_SpecLoopName = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

$_ssdm_op_Read.ap_auto.i32P0A = comdat any

@p_str = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty = internal unnamed_addr constant [8 x i8] c"ap_auto\00"
@empty_0 = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty_1 = internal unnamed_addr constant [9 x i8] c"top_cdfg\00"
@empty_2 = internal unnamed_addr constant [15 x i8] c"VITIS_LOOP_4_1\00"

; Function Attrs: nounwind
define void @top_cdfg(i32* noalias nocapture %a, i32* noalias nocapture %b) #0 {
entry:
  %sum = alloca i32, align 4, !bitwidth !26
  %i = alloca i4, align 1, !bitwidth !27
  call void (...) @_ssdm_op_SpecTopModule([9 x i8]* @empty_1)
  call void (...) @_ssdm_op_SpecBitsMap(i32* %a), !map !28
  call void (...) @_ssdm_op_SpecInterface(i32* %a, [8 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap(i32* %b), !map !28
  call void (...) @_ssdm_op_SpecInterface(i32* %b, [8 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  store i4 1, i4* %i, align 1, !bitwidth !29, !dep_idx !30, !deps !31
  store i32 0, i32* %sum, align 4, !bitwidth !29, !dep_idx !36, !deps !37
  br label %for.inc, !bitwidth !29

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_1 = load i4, i4* %i, align 1, !bitwidth !40, !dep_idx !41, !deps !42
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 1, i32 0, [1 x i8]* @p_str) #0
  %icmp_ln4 = icmp eq i4 %i_1, -6, !bitwidth !47
  %empty = call i32 (...) @_ssdm_op_SpecLoopTripCount(i64 9, i64 9, i64 9) #0
  br i1 %icmp_ln4, label %for.end, label %for.inc.split, !llvm.loop !48, !bitwidth !29

for.inc.split:                                    ; preds = %for.inc
  %sum_load = load i32, i32* %sum, align 4, !bitwidth !50, !dep_idx !51, !deps !52
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_2)
  %a_read = call i32 @_ssdm_op_Read.ap_auto.i32P0A(i32* %a) #0, !bitwidth !50, !dep_idx !55, !deps !56
  %sum_1 = add nsw i32 %a_read, %sum_load, !bitwidth !50
  %shl_ln7 = shl i32 %sum_1, 1, !bitwidth !50
  call void @_ssdm_op_Write.ap_auto.i32P0A(i32* %a, i32 %shl_ln7) #0, !bitwidth !29, !dep_idx !58, !deps !59
  %zext_ln8 = zext i4 %i_1 to i32, !bitwidth !62
  %mul_ln8 = mul nsw i32 %sum_1, %zext_ln8, !bitwidth !50
  %add_ln8 = add i4 %i_1, 1, !bitwidth !40
  call void @_ssdm_op_Write.ap_auto.i32P0A(i32* %b, i32 %mul_ln8) #0, !bitwidth !29
  store i4 %add_ln8, i4* %i, align 1, !bitwidth !29, !dep_idx !63, !deps !64
  store i32 %sum_1, i32* %sum, align 4, !bitwidth !29, !dep_idx !67, !deps !68
  br label %for.inc, !llvm.loop !48, !bitwidth !29

for.end:                                          ; preds = %for.inc
  ret void, !bitwidth !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #1

define weak void @_ssdm_op_Write.ap_auto.i32P0A(i32* %0, i32 %1) comdat {
entry:
  store i32 %1, i32* %0, align 4
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecTopModule(...) #0 comdat {
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
define weak void @_ssdm_op_SpecLoopName(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecInterface(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecBitsMap(...) #0 comdat {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.ap_auto.i32P0A(i32* %0) comdat {
entry:
  %empty = load i32, i32* %0, align 4
  ret i32 %empty
}

; Function Attrs: nounwind readnone
declare i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) #2

; Function Attrs: nounwind readnone
declare i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) #2

attributes #0 = { nounwind }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void (i32*, i32*)* @top_cdfg, !5}
!5 = !{!6, !8, !9, !11, !13, !14, !15, !16, !18, !20, !21, !23, !25}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 32, i32 2}
!8 = !{!"Arg", i32 1, !7}
!9 = !{i32 1, !10}
!10 = !{i32 1, i32 32, i32 0, i32 0}
!11 = !{[9 x i8]* @empty_1, !12}
!12 = !{i32 0, i32 0, i32 8, i32 2}
!13 = !{[8 x i8]* @empty, !12}
!14 = !{i32 0, !10}
!15 = !{[1 x i8]* @empty_0, !12}
!16 = !{i32 -1, !17}
!17 = !{i32 1, i32 32, i32 0, i32 1}
!18 = !{i4 1, !19}
!19 = !{i32 1, i32 4, i32 0, i32 0}
!20 = !{[1 x i8]* @p_str, !12}
!21 = !{i4 -6, !22}
!22 = !{i32 4, i32 4, i32 0, i32 1}
!23 = !{i64 9, !24}
!24 = !{i32 5, i32 64, i32 0, i32 1}
!25 = !{[15 x i8]* @empty_2, !12}
!26 = !{i32 0, i32 0, i32 32, i32 1}
!27 = !{i32 0, i32 0, i32 4, i32 1}
!28 = !{!1}
!29 = !{i32 0, i32 0, i32 0, i32 2}
!30 = !{i32 4}
!31 = !{!32, !34}
!32 = !{i32 0, !33}
!33 = !{!"RAW", !"indep"}
!34 = !{i32 1, !35}
!35 = !{!"WAW", !"indep"}
!36 = !{i32 5}
!37 = !{!38, !39}
!38 = !{i32 2, !33}
!39 = !{i32 3, !35}
!40 = !{i32 4, i32 4, i32 0, i32 2}
!41 = !{i32 0}
!42 = !{!43, !45}
!43 = !{i32 4, !44}
!44 = !{!"WAR", !"indep"}
!45 = !{i32 1, !46}
!46 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!47 = !{i32 1, i32 1, i32 0, i32 2}
!48 = distinct !{!48, !1, !1, !49}
!49 = !{!"llvm.loop.name", !"VITIS_LOOP_4_1"}
!50 = !{i32 32, i32 32, i32 0, i32 2}
!51 = !{i32 2}
!52 = !{!53, !54}
!53 = !{i32 5, !44}
!54 = !{i32 3, !46}
!55 = !{i32 7}
!56 = !{!57}
!57 = !{i32 6, !46}
!58 = !{i32 6}
!59 = !{!60}
!60 = !{i32 7, !61}
!61 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!62 = !{i32 32, i32 32, i32 0, i32 0}
!63 = !{i32 1}
!64 = !{!65, !66}
!65 = !{i32 4, !35}
!66 = !{i32 0, !61}
!67 = !{i32 3}
!68 = !{!69, !70}
!69 = !{i32 5, !35}
!70 = !{i32 2, !61}
