; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -instcombine -S < %s | FileCheck %s

declare double @llvm.pow.f64(double, double)
declare float @llvm.pow.f32(float, float)
declare <2 x double> @llvm.pow.v2f64(<2 x double>, <2 x double>)
declare <2 x float> @llvm.pow.v2f32(<2 x float>, <2 x float>)

; pow(x, 3.0)
define double @test_simplify_3(double %x) {
; CHECK-LABEL: @test_simplify_3(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul fast double [[X:%.*]], [[X]]
; CHECK-NEXT:    [[TMP2:%.*]] = fmul fast double [[TMP1]], [[X]]
; CHECK-NEXT:    ret double [[TMP2]]
;
  %1 = call fast double @llvm.pow.f64(double %x, double 3.000000e+00)
  ret double %1
}

; powf(x, 4.0)
define float @test_simplify_4f(float %x) {
; CHECK-LABEL: @test_simplify_4f(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul fast float [[X:%.*]], [[X]]
; CHECK-NEXT:    [[TMP2:%.*]] = fmul fast float [[TMP1]], [[TMP1]]
; CHECK-NEXT:    ret float [[TMP2]]
;
  %1 = call fast float @llvm.pow.f32(float %x, float 4.000000e+00)
  ret float %1
}

; pow(x, 4.0)
define double @test_simplify_4(double %x) {
; CHECK-LABEL: @test_simplify_4(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul fast double [[X:%.*]], [[X]]
; CHECK-NEXT:    [[TMP2:%.*]] = fmul fast double [[TMP1]], [[TMP1]]
; CHECK-NEXT:    ret double [[TMP2]]
;
  %1 = call fast double @llvm.pow.f64(double %x, double 4.000000e+00)
  ret double %1
}

; powf(x, <15.0, 15.0>)
define <2 x float> @test_simplify_15(<2 x float> %x) {
; CHECK-LABEL: @test_simplify_15(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul fast <2 x float> [[X:%.*]], [[X]]
; CHECK-NEXT:    [[TMP2:%.*]] = fmul fast <2 x float> [[TMP1]], [[X]]
; CHECK-NEXT:    [[TMP3:%.*]] = fmul fast <2 x float> [[TMP2]], [[TMP2]]
; CHECK-NEXT:    [[TMP4:%.*]] = fmul fast <2 x float> [[TMP3]], [[TMP3]]
; CHECK-NEXT:    [[TMP5:%.*]] = fmul fast <2 x float> [[TMP2]], [[TMP4]]
; CHECK-NEXT:    ret <2 x float> [[TMP5]]
;
  %1 = call fast <2 x float> @llvm.pow.v2f32(<2 x float> %x, <2 x float> <float 1.500000e+01, float 1.500000e+01>)
  ret <2 x float> %1
}

; pow(x, -7.0)
define <2 x double> @test_simplify_neg_7(<2 x double> %x) {
; CHECK-LABEL: @test_simplify_neg_7(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul fast <2 x double> [[X:%.*]], [[X]]
; CHECK-NEXT:    [[TMP2:%.*]] = fmul fast <2 x double> [[TMP1]], [[TMP1]]
; CHECK-NEXT:    [[TMP3:%.*]] = fmul fast <2 x double> [[TMP2]], [[X]]
; CHECK-NEXT:    [[TMP4:%.*]] = fmul fast <2 x double> [[TMP1]], [[TMP3]]
; CHECK-NEXT:    [[TMP5:%.*]] = fdiv fast <2 x double> <double 1.000000e+00, double 1.000000e+00>, [[TMP4]]
; CHECK-NEXT:    ret <2 x double> [[TMP5]]
;
  %1 = call fast <2 x double> @llvm.pow.v2f64(<2 x double> %x, <2 x double> <double -7.000000e+00, double -7.000000e+00>)
  ret <2 x double> %1
}

; powf(x, -19.0)
define float @test_simplify_neg_19(float %x) {
; CHECK-LABEL: @test_simplify_neg_19(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul fast float [[X:%.*]], [[X]]
; CHECK-NEXT:    [[TMP2:%.*]] = fmul fast float [[TMP1]], [[TMP1]]
; CHECK-NEXT:    [[TMP3:%.*]] = fmul fast float [[TMP2]], [[TMP2]]
; CHECK-NEXT:    [[TMP4:%.*]] = fmul fast float [[TMP3]], [[TMP3]]
; CHECK-NEXT:    [[TMP5:%.*]] = fmul fast float [[TMP1]], [[TMP4]]
; CHECK-NEXT:    [[TMP6:%.*]] = fmul fast float [[TMP5]], [[X]]
; CHECK-NEXT:    [[TMP7:%.*]] = fdiv fast float 1.000000e+00, [[TMP6]]
; CHECK-NEXT:    ret float [[TMP7]]
;
  %1 = call fast float @llvm.pow.f32(float %x, float -1.900000e+01)
  ret float %1
}

; pow(x, 11.23)
define double @test_simplify_11_23(double %x) {
; CHECK-LABEL: @test_simplify_11_23(
; CHECK-NEXT:    [[TMP1:%.*]] = call fast double @llvm.pow.f64(double [[X:%.*]], double 1.123000e+01)
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = call fast double @llvm.pow.f64(double %x, double 1.123000e+01)
  ret double %1
}

; powf(x, 32.0)
define float @test_simplify_32(float %x) {
; CHECK-LABEL: @test_simplify_32(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul fast float [[X:%.*]], [[X]]
; CHECK-NEXT:    [[TMP2:%.*]] = fmul fast float [[TMP1]], [[TMP1]]
; CHECK-NEXT:    [[TMP3:%.*]] = fmul fast float [[TMP2]], [[TMP2]]
; CHECK-NEXT:    [[TMP4:%.*]] = fmul fast float [[TMP3]], [[TMP3]]
; CHECK-NEXT:    [[TMP5:%.*]] = fmul fast float [[TMP4]], [[TMP4]]
; CHECK-NEXT:    ret float [[TMP5]]
;
  %1 = call fast float @llvm.pow.f32(float %x, float 3.200000e+01)
  ret float %1
}

; pow(x, 33.0)
define double @test_simplify_33(double %x) {
; CHECK-LABEL: @test_simplify_33(
; CHECK-NEXT:    [[TMP1:%.*]] = call fast double @llvm.pow.f64(double [[X:%.*]], double 3.300000e+01)
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = call fast double @llvm.pow.f64(double %x, double 3.300000e+01)
  ret double %1
}
