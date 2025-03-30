; ModuleID = './a_data/top_dfg/a.o.3.bc'
source_filename = "./a_data/top_dfg/a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"

$_ssdm_op_Write.ap_auto.i32P0A = comdat any

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

$_ssdm_op_Read.ap_auto.i32P0A = comdat any

@empty = internal unnamed_addr constant [8 x i8] c"ap_auto\00"
@empty_0 = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty_1 = internal unnamed_addr constant [8 x i8] c"top_dfg\00"

; Function Attrs: nounwind
define void @top_dfg(i32* noalias nocapture %a, i32* noalias nocapture %b, i32* noalias nocapture %c) #0 {
entry:
  call void (...) @_ssdm_op_SpecTopModule([8 x i8]* @empty_1)
  call void (...) @_ssdm_op_SpecBitsMap(i32* %a), !map !22
  call void (...) @_ssdm_op_SpecInterface(i32* %a, [8 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap(i32* %b), !map !22
  call void (...) @_ssdm_op_SpecInterface(i32* %b, [8 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap(i32* %c), !map !22
  call void (...) @_ssdm_op_SpecInterface(i32* %c, [8 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  %b_read = call i32 @_ssdm_op_Read.ap_auto.i32P0A(i32* %b) #0, !bitwidth !23
  %add_ln3 = add nsw i32 %b_read, 2, !bitwidth !23
  call void @_ssdm_op_Write.ap_auto.i32P0A(i32* %a, i32 %add_ln3) #0, !bitwidth !24
  %mul_ln4 = mul nsw i32 %b_read, %add_ln3, !bitwidth !23
  %t1 = add nsw i32 %mul_ln4, 4, !bitwidth !23
  %c_read = call i32 @_ssdm_op_Read.ap_auto.i32P0A(i32* %c) #0, !bitwidth !23, !dep_idx !25, !deps !26
  %t2 = add nsw i32 %c_read, %t1, !bitwidth !23
  %t3 = mul nsw i32 %b_read, %t2, !bitwidth !23
  %add_ln7 = add i32 %t1, %t3, !bitwidth !23
  %add_ln7_1 = add i32 %add_ln7, %t2, !bitwidth !23
  call void @_ssdm_op_Write.ap_auto.i32P0A(i32* %c, i32 %add_ln7_1) #0, !bitwidth !24, !dep_idx !29, !deps !30
  ret void, !bitwidth !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #1

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

declare i32 @_ssdm_op_SpecLoopTripCount(...)

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

attributes #0 = { nounwind }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void (i32*, i32*, i32*)* @top_dfg, !5}
!5 = !{!6, !8, !9, !10, !12, !13, !15, !16, !18, !20}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 32, i32 2}
!8 = !{!"Arg", i32 1, !7}
!9 = !{!"Arg", i32 2, !7}
!10 = !{[8 x i8]* @empty_1, !11}
!11 = !{i32 0, i32 0, i32 8, i32 2}
!12 = !{[8 x i8]* @empty, !11}
!13 = !{i32 0, !14}
!14 = !{i32 1, i32 32, i32 0, i32 0}
!15 = !{[1 x i8]* @empty_0, !11}
!16 = !{i32 -1, !17}
!17 = !{i32 1, i32 32, i32 0, i32 1}
!18 = !{i32 2, !19}
!19 = !{i32 3, i32 32, i32 0, i32 1}
!20 = !{i32 4, !21}
!21 = !{i32 4, i32 32, i32 0, i32 1}
!22 = !{!1}
!23 = !{i32 32, i32 32, i32 0, i32 2}
!24 = !{i32 0, i32 0, i32 0, i32 2}
!25 = !{i32 1}
!26 = !{!27}
!27 = !{i32 0, !28}
!28 = !{!"WAR", !"indep"}
!29 = !{i32 0}
!30 = !{!31}
!31 = !{i32 1, !32}
!32 = !{!"RAW", !"indep"}
