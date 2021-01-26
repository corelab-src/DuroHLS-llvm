; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu | FileCheck %s

@var_3 = external global i16, align 2
@var_13 = external global i16, align 2
@var_212 = external global i64, align 8

define void @pr34127() {
; CHECK-LABEL: pr34127:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    movzwl {{.*}}(%rip), %eax
; CHECK-NEXT:    movzwl {{.*}}(%rip), %ecx
; CHECK-NEXT:    andl %eax, %ecx
; CHECK-NEXT:    andl %eax, %ecx
; CHECK-NEXT:    movzwl %cx, %ecx
; CHECK-NEXT:    movl %ecx, -{{[0-9]+}}(%rsp)
; CHECK-NEXT:    xorl %edx, %edx
; CHECK-NEXT:    testw %cx, %cx
; CHECK-NEXT:    sete %dl
; CHECK-NEXT:    andl %eax, %edx
; CHECK-NEXT:    movq %rdx, {{.*}}(%rip)
; CHECK-NEXT:    movw $0, (%rax)
; CHECK-NEXT:    retq
entry:
  %a = alloca i32, align 4
  %0 = load i16, i16* @var_3, align 2
  %conv = zext i16 %0 to i32
  %1 = load i16, i16* @var_3, align 2
  %conv1 = zext i16 %1 to i32
  %2 = load i16, i16* @var_13, align 2
  %conv2 = zext i16 %2 to i32
  %and = and i32 %conv1, %conv2
  %and3 = and i32 %conv, %and
  store i32 %and3, i32* %a, align 4
  %3 = load i16, i16* @var_3, align 2
  %conv4 = zext i16 %3 to i32
  %4 = load i16, i16* @var_3, align 2
  %conv5 = zext i16 %4 to i32
  %5 = load i16, i16* @var_13, align 2
  %conv6 = zext i16 %5 to i32
  %and7 = and i32 %conv5, %conv6
  %and8 = and i32 %conv4, %and7
  %tobool = icmp ne i32 %and8, 0
  %lnot = xor i1 %tobool, true
  %conv9 = zext i1 %lnot to i32
  %6 = load i16, i16* @var_3, align 2
  %conv10 = zext i16 %6 to i32
  %and11 = and i32 %conv9, %conv10
  %conv12 = sext i32 %and11 to i64
  store i64 %conv12, i64* @var_212, align 8
  %conv14 = zext i1 undef to i16
  store i16 %conv14, i16* undef, align 2
  ret void
}
