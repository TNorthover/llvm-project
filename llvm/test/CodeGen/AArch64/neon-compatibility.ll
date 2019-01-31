; RUN: llc -mtriple=arm64_32-apple-ios7.0 -o - %s -aarch64-watch-bitcode-compatibility | FileCheck %s

target datalayout = "e-m:o-p:32:32-i64:64-a:0:32-n32-S128"

%struct.uint8x16x2_t = type { [2 x <16 x i8>] }
%struct.uint16x8x2_t = type { [2 x <8 x i16>] }
%struct.uint32x4x2_t = type { [2 x <4 x i32>] }
%struct.int8x16x2_t = type { [2 x <16 x i8>] }
%struct.int16x8x2_t = type { [2 x <8 x i16>] }
%struct.int32x4x2_t = type { [2 x <4 x i32>] }
%struct.float16x8x2_t = type { [2 x <8 x i16>] }
%struct.float32x4x2_t = type { [2 x <4 x float>] }
%struct.poly8x16x2_t = type { [2 x <16 x i8>] }
%struct.poly16x8x2_t = type { [2 x <8 x i16>] }
%struct.uint8x8x2_t = type { [2 x <8 x i8>] }
%struct.uint16x4x2_t = type { [2 x <4 x i16>] }
%struct.uint32x2x2_t = type { [2 x <2 x i32>] }
%struct.uint64x1x2_t = type { [2 x <1 x i64>] }
%struct.int8x8x2_t = type { [2 x <8 x i8>] }
%struct.int16x4x2_t = type { [2 x <4 x i16>] }
%struct.int32x2x2_t = type { [2 x <2 x i32>] }
%struct.int64x1x2_t = type { [2 x <1 x i64>] }
%struct.float16x4x2_t = type { [2 x <4 x i16>] }
%struct.float32x2x2_t = type { [2 x <2 x float>] }
%struct.poly8x8x2_t = type { [2 x <8 x i8>] }
%struct.poly16x4x2_t = type { [2 x <4 x i16>] }
%struct.uint8x16x3_t = type { [3 x <16 x i8>] }
%struct.uint16x8x3_t = type { [3 x <8 x i16>] }
%struct.uint32x4x3_t = type { [3 x <4 x i32>] }
%struct.int8x16x3_t = type { [3 x <16 x i8>] }
%struct.int16x8x3_t = type { [3 x <8 x i16>] }
%struct.int32x4x3_t = type { [3 x <4 x i32>] }
%struct.float16x8x3_t = type { [3 x <8 x i16>] }
%struct.float32x4x3_t = type { [3 x <4 x float>] }
%struct.poly8x16x3_t = type { [3 x <16 x i8>] }
%struct.poly16x8x3_t = type { [3 x <8 x i16>] }
%struct.uint8x8x3_t = type { [3 x <8 x i8>] }
%struct.uint16x4x3_t = type { [3 x <4 x i16>] }
%struct.uint32x2x3_t = type { [3 x <2 x i32>] }
%struct.uint64x1x3_t = type { [3 x <1 x i64>] }
%struct.int8x8x3_t = type { [3 x <8 x i8>] }
%struct.int16x4x3_t = type { [3 x <4 x i16>] }
%struct.int32x2x3_t = type { [3 x <2 x i32>] }
%struct.int64x1x3_t = type { [3 x <1 x i64>] }
%struct.float16x4x3_t = type { [3 x <4 x i16>] }
%struct.float32x2x3_t = type { [3 x <2 x float>] }
%struct.poly8x8x3_t = type { [3 x <8 x i8>] }
%struct.poly16x4x3_t = type { [3 x <4 x i16>] }
%struct.uint8x16x4_t = type { [4 x <16 x i8>] }
%struct.uint16x8x4_t = type { [4 x <8 x i16>] }
%struct.uint32x4x4_t = type { [4 x <4 x i32>] }
%struct.int8x16x4_t = type { [4 x <16 x i8>] }
%struct.int16x8x4_t = type { [4 x <8 x i16>] }
%struct.int32x4x4_t = type { [4 x <4 x i32>] }
%struct.float16x8x4_t = type { [4 x <8 x i16>] }
%struct.float32x4x4_t = type { [4 x <4 x float>] }
%struct.poly8x16x4_t = type { [4 x <16 x i8>] }
%struct.poly16x8x4_t = type { [4 x <8 x i16>] }
%struct.uint8x8x4_t = type { [4 x <8 x i8>] }
%struct.uint16x4x4_t = type { [4 x <4 x i16>] }
%struct.uint32x2x4_t = type { [4 x <2 x i32>] }
%struct.uint64x1x4_t = type { [4 x <1 x i64>] }
%struct.int8x8x4_t = type { [4 x <8 x i8>] }
%struct.int16x4x4_t = type { [4 x <4 x i16>] }
%struct.int32x2x4_t = type { [4 x <2 x i32>] }
%struct.int64x1x4_t = type { [4 x <1 x i64>] }
%struct.float16x4x4_t = type { [4 x <4 x i16>] }
%struct.float32x2x4_t = type { [4 x <2 x float>] }
%struct.poly8x8x4_t = type { [4 x <8 x i8>] }
%struct.poly16x4x4_t = type { [4 x <4 x i16>] }


define <8 x i8> @test_vaba_s8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vaba_s8:
; CHECK: saba.8b v0, v1, v2
  %vabd_v.i.i = tail call <8 x i8> @llvm.arm.neon.vabds.v8i8(<8 x i8> %b, <8 x i8> %c) #5
  %add.i = add <8 x i8> %vabd_v.i.i, %a
  ret <8 x i8> %add.i
}

define <4 x i16> @test_vaba_s16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vaba_s16:
; CHECK: saba.4h v0, v1, v2
  %vabd_v2.i.i = tail call <4 x i16> @llvm.arm.neon.vabds.v4i16(<4 x i16> %b, <4 x i16> %c) #5
  %add.i = add <4 x i16> %vabd_v2.i.i, %a
  ret <4 x i16> %add.i
}

define <2 x i32> @test_vaba_s32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vaba_s32:
; CHECK: saba.2s v0, v1, v2
  %vabd_v2.i.i = tail call <2 x i32> @llvm.arm.neon.vabds.v2i32(<2 x i32> %b, <2 x i32> %c) #5
  %add.i = add <2 x i32> %vabd_v2.i.i, %a
  ret <2 x i32> %add.i
}

define <8 x i8> @test_vaba_u8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vaba_u8:
; CHECK: uaba.8b v0, v1, v2
  %vabd_v.i.i = tail call <8 x i8> @llvm.arm.neon.vabdu.v8i8(<8 x i8> %b, <8 x i8> %c) #5
  %add.i = add <8 x i8> %vabd_v.i.i, %a
  ret <8 x i8> %add.i
}

define <4 x i16> @test_vaba_u16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vaba_u16:
; CHECK: uaba.4h v0, v1, v2
  %vabd_v2.i.i = tail call <4 x i16> @llvm.arm.neon.vabdu.v4i16(<4 x i16> %b, <4 x i16> %c) #5
  %add.i = add <4 x i16> %vabd_v2.i.i, %a
  ret <4 x i16> %add.i
}

define <2 x i32> @test_vaba_u32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vaba_u32:
; CHECK: uaba.2s v0, v1, v2
  %vabd_v2.i.i = tail call <2 x i32> @llvm.arm.neon.vabdu.v2i32(<2 x i32> %b, <2 x i32> %c) #5
  %add.i = add <2 x i32> %vabd_v2.i.i, %a
  ret <2 x i32> %add.i
}

define <16 x i8> @test_vabaq_s8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vabaq_s8:
; CHECK: saba.16b v0, v1, v2
  %vabdq_v.i.i = tail call <16 x i8> @llvm.arm.neon.vabds.v16i8(<16 x i8> %b, <16 x i8> %c) #5
  %add.i = add <16 x i8> %vabdq_v.i.i, %a
  ret <16 x i8> %add.i
}

define <8 x i16> @test_vabaq_s16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vabaq_s16:
; CHECK: saba.8h v0, v1, v2
  %vabdq_v2.i.i = tail call <8 x i16> @llvm.arm.neon.vabds.v8i16(<8 x i16> %b, <8 x i16> %c) #5
  %add.i = add <8 x i16> %vabdq_v2.i.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vabaq_s32(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) #0 {
; CHECK-LABEL: test_vabaq_s32:
; CHECK: saba.4s v0, v1, v2
  %vabdq_v2.i.i = tail call <4 x i32> @llvm.arm.neon.vabds.v4i32(<4 x i32> %b, <4 x i32> %c) #5
  %add.i = add <4 x i32> %vabdq_v2.i.i, %a
  ret <4 x i32> %add.i
}

define <16 x i8> @test_vabaq_u8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vabaq_u8:
; CHECK: uaba.16b v0, v1, v2
  %vabdq_v.i.i = tail call <16 x i8> @llvm.arm.neon.vabdu.v16i8(<16 x i8> %b, <16 x i8> %c) #5
  %add.i = add <16 x i8> %vabdq_v.i.i, %a
  ret <16 x i8> %add.i
}

define <8 x i16> @test_vabaq_u16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vabaq_u16:
; CHECK: uaba.8h v0, v1, v2
  %vabdq_v2.i.i = tail call <8 x i16> @llvm.arm.neon.vabdu.v8i16(<8 x i16> %b, <8 x i16> %c) #5
  %add.i = add <8 x i16> %vabdq_v2.i.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vabaq_u32(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) #0 {
; CHECK-LABEL: test_vabaq_u32:
; CHECK: uaba.4s v0, v1, v2
  %vabdq_v2.i.i = tail call <4 x i32> @llvm.arm.neon.vabdu.v4i32(<4 x i32> %b, <4 x i32> %c) #5
  %add.i = add <4 x i32> %vabdq_v2.i.i, %a
  ret <4 x i32> %add.i
}

define <8 x i16> @test_vabal_s8(<8 x i16> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vabal_s8:
; CHECK: sabal.8h v0, v1, v2
  %vabd_v.i.i.i = tail call <8 x i8> @llvm.arm.neon.vabds.v8i8(<8 x i8> %b, <8 x i8> %c) #5
  %vmovl.i.i.i = zext <8 x i8> %vabd_v.i.i.i to <8 x i16>
  %add.i = add <8 x i16> %vmovl.i.i.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vabal_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vabal_s16:
; CHECK: sabal.4s v0, v1, v2
  %vabd_v2.i.i.i = tail call <4 x i16> @llvm.arm.neon.vabds.v4i16(<4 x i16> %b, <4 x i16> %c) #5
  %vmovl.i.i.i = zext <4 x i16> %vabd_v2.i.i.i to <4 x i32>
  %add.i = add <4 x i32> %vmovl.i.i.i, %a
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vabal_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vabal_s32:
; CHECK: sabal.2d v0, v1, v2
  %vabd_v2.i.i.i = tail call <2 x i32> @llvm.arm.neon.vabds.v2i32(<2 x i32> %b, <2 x i32> %c) #5
  %vmovl.i.i.i = zext <2 x i32> %vabd_v2.i.i.i to <2 x i64>
  %add.i = add <2 x i64> %vmovl.i.i.i, %a
  ret <2 x i64> %add.i
}

define <8 x i16> @test_vabal_u8(<8 x i16> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vabal_u8:
; CHECK: uabal.8h v0, v1, v2
  %vabd_v.i.i.i = tail call <8 x i8> @llvm.arm.neon.vabdu.v8i8(<8 x i8> %b, <8 x i8> %c) #5
  %vmovl.i.i.i = zext <8 x i8> %vabd_v.i.i.i to <8 x i16>
  %add.i = add <8 x i16> %vmovl.i.i.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vabal_u16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vabal_u16:
; CHECK: uabal.4s v0, v1, v2
  %vabd_v2.i.i.i = tail call <4 x i16> @llvm.arm.neon.vabdu.v4i16(<4 x i16> %b, <4 x i16> %c) #5
  %vmovl.i.i.i = zext <4 x i16> %vabd_v2.i.i.i to <4 x i32>
  %add.i = add <4 x i32> %vmovl.i.i.i, %a
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vabal_u32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vabal_u32:
; CHECK: uabal.2d v0, v1, v2
  %vabd_v2.i.i.i = tail call <2 x i32> @llvm.arm.neon.vabdu.v2i32(<2 x i32> %b, <2 x i32> %c) #5
  %vmovl.i.i.i = zext <2 x i32> %vabd_v2.i.i.i to <2 x i64>
  %add.i = add <2 x i64> %vmovl.i.i.i, %a
  ret <2 x i64> %add.i
}

define <8 x i8> @test_vabd_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vabd_s8:
; CHECK: sabd.8b v0, v0, v1
  %vabd_v.i = tail call <8 x i8> @llvm.arm.neon.vabds.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vabd_v.i
}

define <4 x i16> @test_vabd_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vabd_s16:
; CHECK: sabd.4h v0, v0, v1
  %vabd_v2.i = tail call <4 x i16> @llvm.arm.neon.vabds.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vabd_v2.i
}

define <2 x i32> @test_vabd_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vabd_s32:
; CHECK: sabd.2s v0, v0, v1
  %vabd_v2.i = tail call <2 x i32> @llvm.arm.neon.vabds.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vabd_v2.i
}

define <8 x i8> @test_vabd_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vabd_u8:
; CHECK: uabd.8b v0, v0, v1
  %vabd_v.i = tail call <8 x i8> @llvm.arm.neon.vabdu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vabd_v.i
}

define <4 x i16> @test_vabd_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vabd_u16:
; CHECK: uabd.4h v0, v0, v1
  %vabd_v2.i = tail call <4 x i16> @llvm.arm.neon.vabdu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vabd_v2.i
}

define <2 x i32> @test_vabd_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vabd_u32:
; CHECK: uabd.2s v0, v0, v1
  %vabd_v2.i = tail call <2 x i32> @llvm.arm.neon.vabdu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vabd_v2.i
}

define <2 x float> @test_vabd_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vabd_f32:
; CHECK: fabd.2s v0, v0, v1
  %vabd_v2.i = tail call <2 x float> @llvm.arm.neon.vabds.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x float> %vabd_v2.i
}

define <16 x i8> @test_vabdq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vabdq_s8:
; CHECK: sabd.16b v0, v0, v1
  %vabdq_v.i = tail call <16 x i8> @llvm.arm.neon.vabds.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vabdq_v.i
}

define <8 x i16> @test_vabdq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vabdq_s16:
; CHECK: sabd.8h v0, v0, v1
  %vabdq_v2.i = tail call <8 x i16> @llvm.arm.neon.vabds.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vabdq_v2.i
}

define <4 x i32> @test_vabdq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vabdq_s32:
; CHECK: sabd.4s v0, v0, v1
  %vabdq_v2.i = tail call <4 x i32> @llvm.arm.neon.vabds.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vabdq_v2.i
}

define <16 x i8> @test_vabdq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vabdq_u8:
; CHECK: uabd.16b v0, v0, v1
  %vabdq_v.i = tail call <16 x i8> @llvm.arm.neon.vabdu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vabdq_v.i
}

define <8 x i16> @test_vabdq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vabdq_u16:
; CHECK: uabd.8h v0, v0, v1
  %vabdq_v2.i = tail call <8 x i16> @llvm.arm.neon.vabdu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vabdq_v2.i
}

define <4 x i32> @test_vabdq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vabdq_u32:
; CHECK: uabd.4s v0, v0, v1
  %vabdq_v2.i = tail call <4 x i32> @llvm.arm.neon.vabdu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vabdq_v2.i
}

define <4 x float> @test_vabdq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vabdq_f32:
; CHECK: fabd.4s v0, v0, v1
  %vabdq_v2.i = tail call <4 x float> @llvm.arm.neon.vabds.v4f32(<4 x float> %a, <4 x float> %b) #5
  ret <4 x float> %vabdq_v2.i
}

define <8 x i16> @test_vabdl_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vabdl_s8:
; CHECK: sabdl.8h v0, v0, v1
  %vabd_v.i.i = tail call <8 x i8> @llvm.arm.neon.vabds.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  %vmovl.i.i = zext <8 x i8> %vabd_v.i.i to <8 x i16>
  ret <8 x i16> %vmovl.i.i
}

define <4 x i32> @test_vabdl_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vabdl_s16:
; CHECK: sabdl.4s v0, v0, v1
  %vabd_v2.i.i = tail call <4 x i16> @llvm.arm.neon.vabds.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  %vmovl.i.i = zext <4 x i16> %vabd_v2.i.i to <4 x i32>
  ret <4 x i32> %vmovl.i.i
}

define <2 x i64> @test_vabdl_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vabdl_s32:
; CHECK: sabdl.2d v0, v0, v1
  %vabd_v2.i.i = tail call <2 x i32> @llvm.arm.neon.vabds.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  %vmovl.i.i = zext <2 x i32> %vabd_v2.i.i to <2 x i64>
  ret <2 x i64> %vmovl.i.i
}

define <8 x i16> @test_vabdl_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vabdl_u8:
; CHECK: uabdl.8h v0, v0, v1
  %vabd_v.i.i = tail call <8 x i8> @llvm.arm.neon.vabdu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  %vmovl.i.i = zext <8 x i8> %vabd_v.i.i to <8 x i16>
  ret <8 x i16> %vmovl.i.i
}

define <4 x i32> @test_vabdl_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vabdl_u16:
; CHECK: uabdl.4s v0, v0, v1
  %vabd_v2.i.i = tail call <4 x i16> @llvm.arm.neon.vabdu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  %vmovl.i.i = zext <4 x i16> %vabd_v2.i.i to <4 x i32>
  ret <4 x i32> %vmovl.i.i
}

define <2 x i64> @test_vabdl_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vabdl_u32:
; CHECK: uabdl.2d v0, v0, v1
  %vabd_v2.i.i = tail call <2 x i32> @llvm.arm.neon.vabdu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  %vmovl.i.i = zext <2 x i32> %vabd_v2.i.i to <2 x i64>
  ret <2 x i64> %vmovl.i.i
}

define <8 x i8> @test_vabs_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vabs_s8:
; CHECK: abs.8b v0, v0
  %vabs.i = tail call <8 x i8> @llvm.arm.neon.vabs.v8i8(<8 x i8> %a) #5
  ret <8 x i8> %vabs.i
}

define <4 x i16> @test_vabs_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vabs_s16:
; CHECK: abs.4h v0, v0
  %vabs1.i = tail call <4 x i16> @llvm.arm.neon.vabs.v4i16(<4 x i16> %a) #5
  ret <4 x i16> %vabs1.i
}

define <2 x i32> @test_vabs_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vabs_s32:
; CHECK: abs.2s v0, v0
  %vabs1.i = tail call <2 x i32> @llvm.arm.neon.vabs.v2i32(<2 x i32> %a) #5
  ret <2 x i32> %vabs1.i
}

define <2 x float> @test_vabs_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vabs_f32:
; CHECK: fabs.2s v0, v0
  %vabs1.i = tail call <2 x float> @llvm.fabs.v2f32(<2 x float> %a) #5
  ret <2 x float> %vabs1.i
}

define <16 x i8> @test_vabsq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vabsq_s8:
; CHECK: abs.16b v0, v0
  %vabs.i = tail call <16 x i8> @llvm.arm.neon.vabs.v16i8(<16 x i8> %a) #5
  ret <16 x i8> %vabs.i
}

define <8 x i16> @test_vabsq_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vabsq_s16:
; CHECK: abs.8h v0, v0
  %vabs1.i = tail call <8 x i16> @llvm.arm.neon.vabs.v8i16(<8 x i16> %a) #5
  ret <8 x i16> %vabs1.i
}

define <4 x i32> @test_vabsq_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vabsq_s32:
; CHECK: abs.4s v0, v0
  %vabs1.i = tail call <4 x i32> @llvm.arm.neon.vabs.v4i32(<4 x i32> %a) #5
  ret <4 x i32> %vabs1.i
}

define <4 x float> @test_vabsq_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vabsq_f32:
; CHECK: fabs.4s v0, v0
  %vabs1.i = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %a) #5
  ret <4 x float> %vabs1.i
}

define <8 x i8> @test_vadd_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vadd_s8:
; CHECK: add.8b v0, v0, v1
  %add.i = add <8 x i8> %a, %b
  ret <8 x i8> %add.i
}

define <4 x i16> @test_vadd_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vadd_s16:
; CHECK: add.4h v0, v0, v1
  %add.i = add <4 x i16> %a, %b
  ret <4 x i16> %add.i
}

define <2 x i32> @test_vadd_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vadd_s32:
; CHECK: add.2s v0, v0, v1
  %add.i = add <2 x i32> %a, %b
  ret <2 x i32> %add.i
}

define <1 x i64> @test_vadd_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vadd_s64:
; CHECK: add d0, d0, d1
  %add.i = add <1 x i64> %a, %b
  ret <1 x i64> %add.i
}

define <2 x float> @test_vadd_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vadd_f32:
; CHECK: fadd.2s v0, v0, v1
  %add.i = fadd <2 x float> %a, %b
  ret <2 x float> %add.i
}

define <8 x i8> @test_vadd_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vadd_u8:
; CHECK: add.8b v0, v0, v1
  %add.i = add <8 x i8> %a, %b
  ret <8 x i8> %add.i
}

define <4 x i16> @test_vadd_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vadd_u16:
; CHECK: add.4h v0, v0, v1
  %add.i = add <4 x i16> %a, %b
  ret <4 x i16> %add.i
}

define <2 x i32> @test_vadd_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vadd_u32:
; CHECK: add.2s v0, v0, v1
  %add.i = add <2 x i32> %a, %b
  ret <2 x i32> %add.i
}

define <1 x i64> @test_vadd_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vadd_u64:
; CHECK: add d0, d0, d1
  %add.i = add <1 x i64> %a, %b
  ret <1 x i64> %add.i
}

define <16 x i8> @test_vaddq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vaddq_s8:
; CHECK: add.16b v0, v0, v1
  %add.i = add <16 x i8> %a, %b
  ret <16 x i8> %add.i
}

define <8 x i16> @test_vaddq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vaddq_s16:
; CHECK: add.8h v0, v0, v1
  %add.i = add <8 x i16> %a, %b
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vaddq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vaddq_s32:
; CHECK: add.4s v0, v0, v1
  %add.i = add <4 x i32> %a, %b
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vaddq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vaddq_s64:
; CHECK: add.2d v0, v0, v1
  %add.i = add <2 x i64> %a, %b
  ret <2 x i64> %add.i
}

define <4 x float> @test_vaddq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vaddq_f32:
; CHECK: fadd.4s v0, v0, v1
  %add.i = fadd <4 x float> %a, %b
  ret <4 x float> %add.i
}

define <16 x i8> @test_vaddq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vaddq_u8:
; CHECK: add.16b v0, v0, v1
  %add.i = add <16 x i8> %a, %b
  ret <16 x i8> %add.i
}

define <8 x i16> @test_vaddq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vaddq_u16:
; CHECK: add.8h v0, v0, v1
  %add.i = add <8 x i16> %a, %b
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vaddq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vaddq_u32:
; CHECK: add.4s v0, v0, v1
  %add.i = add <4 x i32> %a, %b
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vaddq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vaddq_u64:
; CHECK: add.2d v0, v0, v1
  %add.i = add <2 x i64> %a, %b
  ret <2 x i64> %add.i
}

define <8 x i8> @test_vaddhn_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vaddhn_s16:
; CHECK: addhn.8b v0, v0, v1
  %vaddhn.i = add <8 x i16> %a, %b
  %vaddhn1.i = lshr <8 x i16> %vaddhn.i, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %vaddhn2.i = trunc <8 x i16> %vaddhn1.i to <8 x i8>
  ret <8 x i8> %vaddhn2.i
}

define <4 x i16> @test_vaddhn_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vaddhn_s32:
; CHECK: addhn.4h v0, v0, v1
  %vaddhn.i = add <4 x i32> %a, %b
  %vaddhn1.i = lshr <4 x i32> %vaddhn.i, <i32 16, i32 16, i32 16, i32 16>
  %vaddhn2.i = trunc <4 x i32> %vaddhn1.i to <4 x i16>
  ret <4 x i16> %vaddhn2.i
}

define <2 x i32> @test_vaddhn_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vaddhn_s64:
; CHECK: addhn.2s v0, v0, v1
  %vaddhn.i = add <2 x i64> %a, %b
  %vaddhn1.i = lshr <2 x i64> %vaddhn.i, <i64 32, i64 32>
  %vaddhn2.i = trunc <2 x i64> %vaddhn1.i to <2 x i32>
  ret <2 x i32> %vaddhn2.i
}

define <8 x i8> @test_vaddhn_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vaddhn_u16:
; CHECK: addhn.8b v0, v0, v1
  %vaddhn.i = add <8 x i16> %a, %b
  %vaddhn1.i = lshr <8 x i16> %vaddhn.i, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %vaddhn2.i = trunc <8 x i16> %vaddhn1.i to <8 x i8>
  ret <8 x i8> %vaddhn2.i
}

define <4 x i16> @test_vaddhn_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vaddhn_u32:
; CHECK: addhn.4h v0, v0, v1
  %vaddhn.i = add <4 x i32> %a, %b
  %vaddhn1.i = lshr <4 x i32> %vaddhn.i, <i32 16, i32 16, i32 16, i32 16>
  %vaddhn2.i = trunc <4 x i32> %vaddhn1.i to <4 x i16>
  ret <4 x i16> %vaddhn2.i
}

define <2 x i32> @test_vaddhn_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vaddhn_u64:
; CHECK: addhn.2s v0, v0, v1
  %vaddhn.i = add <2 x i64> %a, %b
  %vaddhn1.i = lshr <2 x i64> %vaddhn.i, <i64 32, i64 32>
  %vaddhn2.i = trunc <2 x i64> %vaddhn1.i to <2 x i32>
  ret <2 x i32> %vaddhn2.i
}

define <8 x i16> @test_vaddl_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vaddl_s8:
; CHECK: saddl.8h v0, v0, v1
  %vmovl.i.i = sext <8 x i8> %a to <8 x i16>
  %vmovl.i2.i = sext <8 x i8> %b to <8 x i16>
  %add.i = add nsw <8 x i16> %vmovl.i.i, %vmovl.i2.i
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vaddl_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vaddl_s16:
; CHECK: saddl.4s v0, v0, v1
  %vmovl.i.i = sext <4 x i16> %a to <4 x i32>
  %vmovl.i2.i = sext <4 x i16> %b to <4 x i32>
  %add.i = add nsw <4 x i32> %vmovl.i.i, %vmovl.i2.i
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vaddl_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vaddl_s32:
; CHECK: saddl.2d v0, v0, v1
  %vmovl.i.i = sext <2 x i32> %a to <2 x i64>
  %vmovl.i2.i = sext <2 x i32> %b to <2 x i64>
  %add.i = add nsw <2 x i64> %vmovl.i.i, %vmovl.i2.i
  ret <2 x i64> %add.i
}

define <8 x i16> @test_vaddl_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vaddl_u8:
; CHECK: uaddl.8h v0, v0, v1
  %vmovl.i.i = zext <8 x i8> %a to <8 x i16>
  %vmovl.i2.i = zext <8 x i8> %b to <8 x i16>
  %add.i = add nuw nsw <8 x i16> %vmovl.i.i, %vmovl.i2.i
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vaddl_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vaddl_u16:
; CHECK: uaddl.4s v0, v0, v1
  %vmovl.i.i = zext <4 x i16> %a to <4 x i32>
  %vmovl.i2.i = zext <4 x i16> %b to <4 x i32>
  %add.i = add nuw nsw <4 x i32> %vmovl.i.i, %vmovl.i2.i
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vaddl_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vaddl_u32:
; CHECK: uaddl.2d v0, v0, v1
  %vmovl.i.i = zext <2 x i32> %a to <2 x i64>
  %vmovl.i2.i = zext <2 x i32> %b to <2 x i64>
  %add.i = add nuw nsw <2 x i64> %vmovl.i.i, %vmovl.i2.i
  ret <2 x i64> %add.i
}

define <8 x i16> @test_vaddw_s8(<8 x i16> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vaddw_s8:
; CHECK: saddw.8h v0, v0, v1
  %vmovl.i.i = sext <8 x i8> %b to <8 x i16>
  %add.i = add <8 x i16> %vmovl.i.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vaddw_s16(<4 x i32> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vaddw_s16:
; CHECK: saddw.4s v0, v0, v1
  %vmovl.i.i = sext <4 x i16> %b to <4 x i32>
  %add.i = add <4 x i32> %vmovl.i.i, %a
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vaddw_s32(<2 x i64> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vaddw_s32:
; CHECK: saddw.2d v0, v0, v1
  %vmovl.i.i = sext <2 x i32> %b to <2 x i64>
  %add.i = add <2 x i64> %vmovl.i.i, %a
  ret <2 x i64> %add.i
}

define <8 x i16> @test_vaddw_u8(<8 x i16> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vaddw_u8:
; CHECK: uaddw.8h v0, v0, v1
  %vmovl.i.i = zext <8 x i8> %b to <8 x i16>
  %add.i = add <8 x i16> %vmovl.i.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vaddw_u16(<4 x i32> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vaddw_u16:
; CHECK: uaddw.4s v0, v0, v1
  %vmovl.i.i = zext <4 x i16> %b to <4 x i32>
  %add.i = add <4 x i32> %vmovl.i.i, %a
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vaddw_u32(<2 x i64> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vaddw_u32:
; CHECK: uaddw.2d v0, v0, v1
  %vmovl.i.i = zext <2 x i32> %b to <2 x i64>
  %add.i = add <2 x i64> %vmovl.i.i, %a
  ret <2 x i64> %add.i
}

define <8 x i8> @test_vand_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vand_s8:
; CHECK: and.8b v0, v0, v1
  %and.i = and <8 x i8> %a, %b
  ret <8 x i8> %and.i
}

define <4 x i16> @test_vand_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vand_s16:
; CHECK: and.8b v0, v0, v1
  %and.i = and <4 x i16> %a, %b
  ret <4 x i16> %and.i
}

define <2 x i32> @test_vand_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vand_s32:
; CHECK: and.8b v0, v0, v1
  %and.i = and <2 x i32> %a, %b
  ret <2 x i32> %and.i
}

define <1 x i64> @test_vand_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vand_s64:
; CHECK: and.8b v0, v0, v1
  %and.i = and <1 x i64> %a, %b
  ret <1 x i64> %and.i
}

define <8 x i8> @test_vand_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vand_u8:
; CHECK: and.8b v0, v0, v1
  %and.i = and <8 x i8> %a, %b
  ret <8 x i8> %and.i
}

define <4 x i16> @test_vand_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vand_u16:
; CHECK: and.8b v0, v0, v1
  %and.i = and <4 x i16> %a, %b
  ret <4 x i16> %and.i
}

define <2 x i32> @test_vand_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vand_u32:
; CHECK: and.8b v0, v0, v1
  %and.i = and <2 x i32> %a, %b
  ret <2 x i32> %and.i
}

define <1 x i64> @test_vand_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vand_u64:
; CHECK: and.8b v0, v0, v1
  %and.i = and <1 x i64> %a, %b
  ret <1 x i64> %and.i
}

define <16 x i8> @test_vandq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vandq_s8:
; CHECK: and.16b v0, v0, v1
  %and.i = and <16 x i8> %a, %b
  ret <16 x i8> %and.i
}

define <8 x i16> @test_vandq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vandq_s16:
; CHECK: and.16b v0, v0, v1
  %and.i = and <8 x i16> %a, %b
  ret <8 x i16> %and.i
}

define <4 x i32> @test_vandq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vandq_s32:
; CHECK: and.16b v0, v0, v1
  %and.i = and <4 x i32> %a, %b
  ret <4 x i32> %and.i
}

define <2 x i64> @test_vandq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vandq_s64:
; CHECK: and.16b v0, v0, v1
  %and.i = and <2 x i64> %a, %b
  ret <2 x i64> %and.i
}

define <16 x i8> @test_vandq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vandq_u8:
; CHECK: and.16b v0, v0, v1
  %and.i = and <16 x i8> %a, %b
  ret <16 x i8> %and.i
}

define <8 x i16> @test_vandq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vandq_u16:
; CHECK: and.16b v0, v0, v1
  %and.i = and <8 x i16> %a, %b
  ret <8 x i16> %and.i
}

define <4 x i32> @test_vandq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vandq_u32:
; CHECK: and.16b v0, v0, v1
  %and.i = and <4 x i32> %a, %b
  ret <4 x i32> %and.i
}

define <2 x i64> @test_vandq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vandq_u64:
; CHECK: and.16b v0, v0, v1
  %and.i = and <2 x i64> %a, %b
  ret <2 x i64> %and.i
}

define <8 x i8> @test_vbic_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vbic_s8:
; CHECK: bic.8b v0, v0, v1
  %neg.i = xor <8 x i8> %b, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %and.i = and <8 x i8> %a, %neg.i
  ret <8 x i8> %and.i
}

define <4 x i16> @test_vbic_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vbic_s16:
; CHECK: bic.8b v0, v0, v1
  %neg.i = xor <4 x i16> %b, <i16 -1, i16 -1, i16 -1, i16 -1>
  %and.i = and <4 x i16> %a, %neg.i
  ret <4 x i16> %and.i
}

define <2 x i32> @test_vbic_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vbic_s32:
; CHECK: bic.8b v0, v0, v1
  %neg.i = xor <2 x i32> %b, <i32 -1, i32 -1>
  %and.i = and <2 x i32> %a, %neg.i
  ret <2 x i32> %and.i
}

define <1 x i64> @test_vbic_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vbic_s64:
; CHECK: bic.8b v0, v0, v1
  %neg.i = xor <1 x i64> %b, <i64 -1>
  %and.i = and <1 x i64> %a, %neg.i
  ret <1 x i64> %and.i
}

define <8 x i8> @test_vbic_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vbic_u8:
; CHECK: bic.8b v0, v0, v1
  %neg.i = xor <8 x i8> %b, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %and.i = and <8 x i8> %a, %neg.i
  ret <8 x i8> %and.i
}

define <4 x i16> @test_vbic_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vbic_u16:
; CHECK: bic.8b v0, v0, v1
  %neg.i = xor <4 x i16> %b, <i16 -1, i16 -1, i16 -1, i16 -1>
  %and.i = and <4 x i16> %a, %neg.i
  ret <4 x i16> %and.i
}

define <2 x i32> @test_vbic_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vbic_u32:
; CHECK: bic.8b v0, v0, v1
  %neg.i = xor <2 x i32> %b, <i32 -1, i32 -1>
  %and.i = and <2 x i32> %a, %neg.i
  ret <2 x i32> %and.i
}

define <1 x i64> @test_vbic_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vbic_u64:
; CHECK: bic.8b v0, v0, v1
  %neg.i = xor <1 x i64> %b, <i64 -1>
  %and.i = and <1 x i64> %a, %neg.i
  ret <1 x i64> %and.i
}

define <16 x i8> @test_vbicq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vbicq_s8:
; CHECK: bic.16b v0, v0, v1
  %neg.i = xor <16 x i8> %b, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %and.i = and <16 x i8> %a, %neg.i
  ret <16 x i8> %and.i
}

define <8 x i16> @test_vbicq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vbicq_s16:
; CHECK: bic.16b v0, v0, v1
  %neg.i = xor <8 x i16> %b, <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>
  %and.i = and <8 x i16> %a, %neg.i
  ret <8 x i16> %and.i
}

define <4 x i32> @test_vbicq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vbicq_s32:
; CHECK: bic.16b v0, v0, v1
  %neg.i = xor <4 x i32> %b, <i32 -1, i32 -1, i32 -1, i32 -1>
  %and.i = and <4 x i32> %a, %neg.i
  ret <4 x i32> %and.i
}

define <2 x i64> @test_vbicq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vbicq_s64:
; CHECK: bic.16b v0, v0, v1
  %neg.i = xor <2 x i64> %b, <i64 -1, i64 -1>
  %and.i = and <2 x i64> %a, %neg.i
  ret <2 x i64> %and.i
}

define <16 x i8> @test_vbicq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vbicq_u8:
; CHECK: bic.16b v0, v0, v1
  %neg.i = xor <16 x i8> %b, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %and.i = and <16 x i8> %a, %neg.i
  ret <16 x i8> %and.i
}

define <8 x i16> @test_vbicq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vbicq_u16:
; CHECK: bic.16b v0, v0, v1
  %neg.i = xor <8 x i16> %b, <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>
  %and.i = and <8 x i16> %a, %neg.i
  ret <8 x i16> %and.i
}

define <4 x i32> @test_vbicq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vbicq_u32:
; CHECK: bic.16b v0, v0, v1
  %neg.i = xor <4 x i32> %b, <i32 -1, i32 -1, i32 -1, i32 -1>
  %and.i = and <4 x i32> %a, %neg.i
  ret <4 x i32> %and.i
}

define <2 x i64> @test_vbicq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vbicq_u64:
; CHECK: bic.16b v0, v0, v1
  %neg.i = xor <2 x i64> %b, <i64 -1, i64 -1>
  %and.i = and <2 x i64> %a, %neg.i
  ret <2 x i64> %and.i
}

define <8 x i8> @test_vbsl_s8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vbsl_s8:
; CHECK: bsl.8b v0, v1, v2
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #5
  ret <8 x i8> %vbsl_v.i
}

; FIXME: AArch64 Codegen should be improved here
define <4 x i16> @test_vbsl_s16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vbsl_s16:
; CHECK: and.8b v1, v0, v1
; CHECK: bic.8b v0, v2, v0
; CHECK: orr.8b v0, v1, v0
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  %t1 = bitcast <4 x i16> %b to <8 x i8>
  %t2 = bitcast <4 x i16> %c to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t0, <8 x i8> %t1, <8 x i8> %t2) #5
  %t3 = bitcast <8 x i8> %vbsl_v.i to <4 x i16>
  ret <4 x i16> %t3
}

define <2 x i32> @test_vbsl_s32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vbsl_s32:
; CHECK: and.8b v1, v0, v1
; CHECK: bic.8b v0, v2, v0
; CHECK: orr.8b v0, v1, v0
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  %t1 = bitcast <2 x i32> %b to <8 x i8>
  %t2 = bitcast <2 x i32> %c to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t0, <8 x i8> %t1, <8 x i8> %t2) #5
  %t3 = bitcast <8 x i8> %vbsl_v.i to <2 x i32>
  ret <2 x i32> %t3
}

define <1 x i64> @test_vbsl_s64(<1 x i64> %a, <1 x i64> %b, <1 x i64> %c) #0 {
; CHECK-LABEL: test_vbsl_s64:
; CHECK: and.8b v1, v0, v1
; CHECK: bic.8b v0, v2, v0
; CHECK: orr.8b v0, v1, v0
  %t0 = bitcast <1 x i64> %a to <8 x i8>
  %t1 = bitcast <1 x i64> %b to <8 x i8>
  %t2 = bitcast <1 x i64> %c to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t0, <8 x i8> %t1, <8 x i8> %t2) #5
  %t3 = bitcast <8 x i8> %vbsl_v.i to <1 x i64>
  ret <1 x i64> %t3
}

define <8 x i8> @test_vbsl_u8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vbsl_u8:
; CHECK: bsl.8b v0, v1, v2
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #5
  ret <8 x i8> %vbsl_v.i
}

define <4 x i16> @test_vbsl_u16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vbsl_u16:
; CHECK: and.8b v1, v0, v1
; CHECK: bic.8b v0, v2, v0
; CHECK: orr.8b v0, v1, v0
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  %t1 = bitcast <4 x i16> %b to <8 x i8>
  %t2 = bitcast <4 x i16> %c to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t0, <8 x i8> %t1, <8 x i8> %t2) #5
  %t3 = bitcast <8 x i8> %vbsl_v.i to <4 x i16>
  ret <4 x i16> %t3
}

define <2 x i32> @test_vbsl_u32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vbsl_u32:
; CHECK: and.8b v1, v0, v1
; CHECK: bic.8b v0, v2, v0
; CHECK: orr.8b v0, v1, v0
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  %t1 = bitcast <2 x i32> %b to <8 x i8>
  %t2 = bitcast <2 x i32> %c to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t0, <8 x i8> %t1, <8 x i8> %t2) #5
  %t3 = bitcast <8 x i8> %vbsl_v.i to <2 x i32>
  ret <2 x i32> %t3
}

define <1 x i64> @test_vbsl_u64(<1 x i64> %a, <1 x i64> %b, <1 x i64> %c) #0 {
; CHECK-LABEL: test_vbsl_u64:
; CHECK: and.8b v1, v0, v1
; CHECK: bic.8b v0, v2, v0
; CHECK: orr.8b v0, v1, v0
  %t0 = bitcast <1 x i64> %a to <8 x i8>
  %t1 = bitcast <1 x i64> %b to <8 x i8>
  %t2 = bitcast <1 x i64> %c to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t0, <8 x i8> %t1, <8 x i8> %t2) #5
  %t3 = bitcast <8 x i8> %vbsl_v.i to <1 x i64>
  ret <1 x i64> %t3
}

define <2 x float> @test_vbsl_f32(<2 x i32> %a, <2 x float> %b, <2 x float> %c) #0 {
; CHECK-LABEL: test_vbsl_f32:
; CHECK: and.8b v1, v0, v1
; CHECK: bic.8b v0, v2, v0
; CHECK: orr.8b v0, v1, v0
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  %t1 = bitcast <2 x float> %b to <8 x i8>
  %t2 = bitcast <2 x float> %c to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t0, <8 x i8> %t1, <8 x i8> %t2) #5
  %t3 = bitcast <8 x i8> %vbsl_v.i to <2 x float>
  ret <2 x float> %t3
}

define <8 x i8> @test_vbsl_p8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vbsl_p8:
; CHECK: bsl.8b v0, v1, v2
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #5
  ret <8 x i8> %vbsl_v.i
}

define <4 x i16> @test_vbsl_p16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vbsl_p16:
; CHECK: and.8b v1, v0, v1
; CHECK: bic.8b v0, v2, v0
; CHECK: orr.8b v0, v1, v0
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  %t1 = bitcast <4 x i16> %b to <8 x i8>
  %t2 = bitcast <4 x i16> %c to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t0, <8 x i8> %t1, <8 x i8> %t2) #5
  %t3 = bitcast <8 x i8> %vbsl_v.i to <4 x i16>
  ret <4 x i16> %t3
}

define <16 x i8> @test_vbslq_s8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vbslq_s8:
; CHECK: bsl.16b v0, v1, v2
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #5
  ret <16 x i8> %vbslq_v.i
}

define <8 x i16> @test_vbslq_s16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vbslq_s16:
; CHECK: and.16b v1, v0, v1
; CHECK: bic.16b v0, v2, v0
; CHECK: orr.16b v0, v1, v0
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  %t1 = bitcast <8 x i16> %b to <16 x i8>
  %t2 = bitcast <8 x i16> %c to <16 x i8>
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %t0, <16 x i8> %t1, <16 x i8> %t2) #5
  %t3 = bitcast <16 x i8> %vbslq_v.i to <8 x i16>
  ret <8 x i16> %t3
}

define <4 x i32> @test_vbslq_s32(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) #0 {
; CHECK-LABEL: test_vbslq_s32:
; CHECK: and.16b v1, v0, v1
; CHECK: bic.16b v0, v2, v0
; CHECK: orr.16b v0, v1, v0
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  %t1 = bitcast <4 x i32> %b to <16 x i8>
  %t2 = bitcast <4 x i32> %c to <16 x i8>
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %t0, <16 x i8> %t1, <16 x i8> %t2) #5
  %t3 = bitcast <16 x i8> %vbslq_v.i to <4 x i32>
  ret <4 x i32> %t3
}

define <2 x i64> @test_vbslq_s64(<2 x i64> %a, <2 x i64> %b, <2 x i64> %c) #0 {
; CHECK-LABEL: test_vbslq_s64:
; CHECK: and.16b v1, v0, v1
; CHECK: bic.16b v0, v2, v0
; CHECK: orr.16b v0, v1, v0
  %t0 = bitcast <2 x i64> %a to <16 x i8>
  %t1 = bitcast <2 x i64> %b to <16 x i8>
  %t2 = bitcast <2 x i64> %c to <16 x i8>
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %t0, <16 x i8> %t1, <16 x i8> %t2) #5
  %t3 = bitcast <16 x i8> %vbslq_v.i to <2 x i64>
  ret <2 x i64> %t3
}

define <16 x i8> @test_vbslq_u8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vbslq_u8:
; CHECK: bsl.16b v0, v1, v2
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #5
  ret <16 x i8> %vbslq_v.i
}

define <8 x i16> @test_vbslq_u16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vbslq_u16:
; CHECK: and.16b v1, v0, v1
; CHECK: bic.16b v0, v2, v0
; CHECK: orr.16b v0, v1, v0
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  %t1 = bitcast <8 x i16> %b to <16 x i8>
  %t2 = bitcast <8 x i16> %c to <16 x i8>
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %t0, <16 x i8> %t1, <16 x i8> %t2) #5
  %t3 = bitcast <16 x i8> %vbslq_v.i to <8 x i16>
  ret <8 x i16> %t3
}

define <4 x i32> @test_vbslq_u32(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) #0 {
; CHECK-LABEL: test_vbslq_u32:
; CHECK: and.16b v1, v0, v1
; CHECK: bic.16b v0, v2, v0
; CHECK: orr.16b v0, v1, v0
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  %t1 = bitcast <4 x i32> %b to <16 x i8>
  %t2 = bitcast <4 x i32> %c to <16 x i8>
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %t0, <16 x i8> %t1, <16 x i8> %t2) #5
  %t3 = bitcast <16 x i8> %vbslq_v.i to <4 x i32>
  ret <4 x i32> %t3
}

define <2 x i64> @test_vbslq_u64(<2 x i64> %a, <2 x i64> %b, <2 x i64> %c) #0 {
; CHECK-LABEL: test_vbslq_u64:
; CHECK: and.16b v1, v0, v1
; CHECK: bic.16b v0, v2, v0
; CHECK: orr.16b v0, v1, v0
  %t0 = bitcast <2 x i64> %a to <16 x i8>
  %t1 = bitcast <2 x i64> %b to <16 x i8>
  %t2 = bitcast <2 x i64> %c to <16 x i8>
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %t0, <16 x i8> %t1, <16 x i8> %t2) #5
  %t3 = bitcast <16 x i8> %vbslq_v.i to <2 x i64>
  ret <2 x i64> %t3
}

define <4 x float> @test_vbslq_f32(<4 x i32> %a, <4 x float> %b, <4 x float> %c) #0 {
; CHECK-LABEL: test_vbslq_f32:
; CHECK: bsl.16b v0, v1, v2
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  %t1 = bitcast <4 x float> %b to <16 x i8>
  %t2 = bitcast <4 x float> %c to <16 x i8>
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %t0, <16 x i8> %t1, <16 x i8> %t2) #5
  %t3 = bitcast <16 x i8> %vbslq_v.i to <4 x float>
  ret <4 x float> %t3
}

define <16 x i8> @test_vbslq_p8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vbslq_p8:
; CHECK: bsl.16b v0, v1, v2
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #5
  ret <16 x i8> %vbslq_v.i
}

define <8 x i16> @test_vbslq_p16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vbslq_p16:
; CHECK: and.16b v1, v0, v1
; CHECK: bic.16b v0, v2, v0
; CHECK: orr.16b v0, v1, v0
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  %t1 = bitcast <8 x i16> %b to <16 x i8>
  %t2 = bitcast <8 x i16> %c to <16 x i8>
  %vbslq_v.i = tail call <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8> %t0, <16 x i8> %t1, <16 x i8> %t2) #5
  %t3 = bitcast <16 x i8> %vbslq_v.i to <8 x i16>
  ret <8 x i16> %t3
}

define <2 x i32> @test_vcage_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vcage_f32:
; CHECK: facge.2s v0, v0, v1
  %vcage_v2.i = tail call <2 x i32> @llvm.arm.neon.vacge.v2i32.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x i32> %vcage_v2.i
}

define <4 x i32> @test_vcageq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vcageq_f32:
; CHECK: facge.4s v0, v0, v1
  %vcageq_v2.i = tail call <4 x i32> @llvm.arm.neon.vacge.v4i32.v4f32(<4 x float> %a, <4 x float> %b) #5
  ret <4 x i32> %vcageq_v2.i
}

define <2 x i32> @test_vcagt_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vcagt_f32:
; CHECK: facgt.2s v0, v0, v1
  %vcagt_v2.i = tail call <2 x i32> @llvm.arm.neon.vacgt.v2i32.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x i32> %vcagt_v2.i
}

define <4 x i32> @test_vcagtq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vcagtq_f32:
; CHECK: facgt.4s v0, v0, v1
  %vcagtq_v2.i = tail call <4 x i32> @llvm.arm.neon.vacgt.v4i32.v4f32(<4 x float> %a, <4 x float> %b) #5
  ret <4 x i32> %vcagtq_v2.i
}

define <2 x i32> @test_vcale_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vcale_f32:
; CHECK: facge.2s v0, v1, v0
  %vcale_v2.i = tail call <2 x i32> @llvm.arm.neon.vacge.v2i32.v2f32(<2 x float> %b, <2 x float> %a) #5
  ret <2 x i32> %vcale_v2.i
}

define <4 x i32> @test_vcaleq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vcaleq_f32:
; CHECK: facge.4s v0, v1, v0
  %vcaleq_v2.i = tail call <4 x i32> @llvm.arm.neon.vacge.v4i32.v4f32(<4 x float> %b, <4 x float> %a) #5
  ret <4 x i32> %vcaleq_v2.i
}

define <2 x i32> @test_vcalt_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vcalt_f32:
; CHECK: facgt.2s v0, v1, v0
  %vcalt_v2.i = tail call <2 x i32> @llvm.arm.neon.vacgt.v2i32.v2f32(<2 x float> %b, <2 x float> %a) #5
  ret <2 x i32> %vcalt_v2.i
}

define <4 x i32> @test_vcaltq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vcaltq_f32:
; CHECK: facgt.4s v0, v1, v0
  %vcaltq_v2.i = tail call <4 x i32> @llvm.arm.neon.vacgt.v4i32.v4f32(<4 x float> %b, <4 x float> %a) #5
  ret <4 x i32> %vcaltq_v2.i
}

define <8 x i8> @test_vceq_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vceq_s8:
; CHECK: cmeq.8b v0, v0, v1
  %cmp.i = icmp eq <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vceq_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vceq_s16:
; CHECK: cmeq.4h v0, v0, v1
  %cmp.i = icmp eq <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vceq_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vceq_s32:
; CHECK: cmeq.2s v0, v0, v1
  %cmp.i = icmp eq <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <2 x i32> @test_vceq_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vceq_f32:
; CHECK: fcmeq.2s v0, v0, v1
  %cmp.i = fcmp oeq <2 x float> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <8 x i8> @test_vceq_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vceq_u8:
; CHECK: cmeq.8b v0, v0, v1
  %cmp.i = icmp eq <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vceq_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vceq_u16:
; CHECK: cmeq.4h v0, v0, v1
  %cmp.i = icmp eq <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vceq_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vceq_u32:
; CHECK: cmeq.2s v0, v0, v1
  %cmp.i = icmp eq <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <8 x i8> @test_vceq_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vceq_p8:
; CHECK: cmeq.8b v0, v0, v1
  %cmp.i = icmp eq <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <16 x i8> @test_vceqq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vceqq_s8:
; CHECK: cmeq.16b v0, v0, v1
  %cmp.i = icmp eq <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vceqq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vceqq_s16:
; CHECK: cmeq.8h v0, v0, v1
  %cmp.i = icmp eq <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vceqq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vceqq_s32:
; CHECK: cmeq.4s v0, v0, v1
  %cmp.i = icmp eq <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <4 x i32> @test_vceqq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vceqq_f32:
; CHECK: fcmeq.4s v0, v0, v1
  %cmp.i = fcmp oeq <4 x float> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <16 x i8> @test_vceqq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vceqq_u8:
; CHECK: cmeq.16b v0, v0, v1
  %cmp.i = icmp eq <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vceqq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vceqq_u16:
; CHECK: cmeq.8h v0, v0, v1
  %cmp.i = icmp eq <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vceqq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vceqq_u32:
; CHECK: cmeq.4s v0, v0, v1
  %cmp.i = icmp eq <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <16 x i8> @test_vceqq_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vceqq_p8:
; CHECK: cmeq.16b v0, v0, v1
  %cmp.i = icmp eq <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i8> @test_vcge_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcge_s8:
; CHECK: cmge.8b v0, v0, v1
  %cmp.i = icmp sge <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vcge_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcge_s16:
; CHECK: cmge.4h v0, v0, v1
  %cmp.i = icmp sge <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vcge_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vcge_s32:
; CHECK: cmge.2s v0, v0, v1
  %cmp.i = icmp sge <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <2 x i32> @test_vcge_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vcge_f32:
; CHECK: fcmge.2s v0, v0, v1
  %cmp.i = fcmp oge <2 x float> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <8 x i8> @test_vcge_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcge_u8:
; CHECK: cmhs.8b v0, v0, v1
  %cmp.i = icmp uge <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vcge_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcge_u16:
; CHECK: cmhs.4h v0, v0, v1
  %cmp.i = icmp uge <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vcge_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vcge_u32:
; CHECK: cmhs.2s v0, v0, v1
  %cmp.i = icmp uge <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <16 x i8> @test_vcgeq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vcgeq_s8:
; CHECK: cmge.16b v0, v0, v1
  %cmp.i = icmp sge <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vcgeq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vcgeq_s16:
; CHECK: cmge.8h v0, v0, v1
  %cmp.i = icmp sge <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vcgeq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vcgeq_s32:
; CHECK: cmge.4s v0, v0, v1
  %cmp.i = icmp sge <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <4 x i32> @test_vcgeq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vcgeq_f32:
; CHECK: fcmge.4s v0, v0, v1
  %cmp.i = fcmp oge <4 x float> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <16 x i8> @test_vcgeq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vcgeq_u8:
; CHECK: cmhs.16b v0, v0, v1
  %cmp.i = icmp uge <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vcgeq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vcgeq_u16:
; CHECK: cmhs.8h v0, v0, v1
  %cmp.i = icmp uge <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vcgeq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vcgeq_u32:
; CHECK: cmhs.4s v0, v0, v1
  %cmp.i = icmp uge <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <8 x i8> @test_vcgt_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcgt_s8:
; CHECK: cmgt.8b v0, v0, v1
  %cmp.i = icmp sgt <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vcgt_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcgt_s16:
; CHECK: cmgt.4h v0, v0, v1
  %cmp.i = icmp sgt <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vcgt_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vcgt_s32:
; CHECK: cmgt.2s v0, v0, v1
  %cmp.i = icmp sgt <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <2 x i32> @test_vcgt_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vcgt_f32:
; CHECK: fcmgt.2s v0, v0, v1
  %cmp.i = fcmp ogt <2 x float> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <8 x i8> @test_vcgt_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcgt_u8:
; CHECK: cmhi.8b v0, v0, v1
  %cmp.i = icmp ugt <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vcgt_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcgt_u16:
; CHECK: cmhi.4h v0, v0, v1
  %cmp.i = icmp ugt <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vcgt_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vcgt_u32:
; CHECK: cmhi.2s v0, v0, v1
  %cmp.i = icmp ugt <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <16 x i8> @test_vcgtq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vcgtq_s8:
; CHECK: cmgt.16b v0, v0, v1
  %cmp.i = icmp sgt <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vcgtq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vcgtq_s16:
; CHECK: cmgt.8h v0, v0, v1
  %cmp.i = icmp sgt <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vcgtq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vcgtq_s32:
; CHECK: cmgt.4s v0, v0, v1
  %cmp.i = icmp sgt <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <4 x i32> @test_vcgtq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vcgtq_f32:
; CHECK: fcmgt.4s v0, v0, v1
  %cmp.i = fcmp ogt <4 x float> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <16 x i8> @test_vcgtq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vcgtq_u8:
; CHECK: cmhi.16b v0, v0, v1
  %cmp.i = icmp ugt <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vcgtq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vcgtq_u16:
; CHECK: cmhi.8h v0, v0, v1
  %cmp.i = icmp ugt <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vcgtq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vcgtq_u32:
; CHECK: cmhi.4s v0, v0, v1
  %cmp.i = icmp ugt <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <8 x i8> @test_vcle_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcle_s8:
; CHECK: cmge.8b v0, v1, v0
  %cmp.i = icmp sle <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vcle_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcle_s16:
; CHECK: cmge.4h v0, v1, v0
  %cmp.i = icmp sle <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vcle_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vcle_s32:
; CHECK: cmge.2s v0, v1, v0
  %cmp.i = icmp sle <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <2 x i32> @test_vcle_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vcle_f32:
; CHECK: fcmge.2s v0, v1, v0
  %cmp.i = fcmp ole <2 x float> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <8 x i8> @test_vcle_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcle_u8:
; CHECK: cmhs.8b v0, v1, v0
  %cmp.i = icmp ule <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vcle_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcle_u16:
; CHECK: cmhs.4h v0, v1, v0
  %cmp.i = icmp ule <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vcle_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vcle_u32:
; CHECK: cmhs.2s v0, v1, v0
  %cmp.i = icmp ule <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <16 x i8> @test_vcleq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vcleq_s8:
; CHECK: cmge.16b v0, v1, v0
  %cmp.i = icmp sle <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vcleq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vcleq_s16:
; CHECK: cmge.8h v0, v1, v0
  %cmp.i = icmp sle <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vcleq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vcleq_s32:
; CHECK: cmge.4s v0, v1, v0
  %cmp.i = icmp sle <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <4 x i32> @test_vcleq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vcleq_f32:
; CHECK: fcmge.4s v0, v1, v0
  %cmp.i = fcmp ole <4 x float> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <16 x i8> @test_vcleq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vcleq_u8:
; CHECK: cmhs.16b v0, v1, v0
  %cmp.i = icmp ule <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vcleq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vcleq_u16:
; CHECK: cmhs.8h v0, v1, v0
  %cmp.i = icmp ule <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vcleq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vcleq_u32:
; CHECK: cmhs.4s v0, v1, v0
  %cmp.i = icmp ule <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <8 x i8> @test_vcls_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vcls_s8:
; CHECK: cls.8b v0, v0
  %vcls_v.i = tail call <8 x i8> @llvm.arm.neon.vcls.v8i8(<8 x i8> %a) #5
  ret <8 x i8> %vcls_v.i
}

define <4 x i16> @test_vcls_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vcls_s16:
; CHECK: cls.4h v0, v0
  %vcls_v1.i = tail call <4 x i16> @llvm.arm.neon.vcls.v4i16(<4 x i16> %a) #5
  ret <4 x i16> %vcls_v1.i
}

define <2 x i32> @test_vcls_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vcls_s32:
; CHECK: cls.2s v0, v0
  %vcls_v1.i = tail call <2 x i32> @llvm.arm.neon.vcls.v2i32(<2 x i32> %a) #5
  ret <2 x i32> %vcls_v1.i
}

define <16 x i8> @test_vclsq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vclsq_s8:
; CHECK: cls.16b v0, v0
  %vclsq_v.i = tail call <16 x i8> @llvm.arm.neon.vcls.v16i8(<16 x i8> %a) #5
  ret <16 x i8> %vclsq_v.i
}

define <8 x i16> @test_vclsq_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vclsq_s16:
; CHECK: cls.8h v0, v0
  %vclsq_v1.i = tail call <8 x i16> @llvm.arm.neon.vcls.v8i16(<8 x i16> %a) #5
  ret <8 x i16> %vclsq_v1.i
}

define <4 x i32> @test_vclsq_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vclsq_s32:
; CHECK: cls.4s v0, v0
  %vclsq_v1.i = tail call <4 x i32> @llvm.arm.neon.vcls.v4i32(<4 x i32> %a) #5
  ret <4 x i32> %vclsq_v1.i
}

define <8 x i8> @test_vclt_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vclt_s8:
; CHECK: cmgt.8b v0, v1, v0
  %cmp.i = icmp slt <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vclt_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vclt_s16:
; CHECK: cmgt.4h v0, v1, v0
  %cmp.i = icmp slt <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vclt_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vclt_s32:
; CHECK: cmgt.2s v0, v1, v0
  %cmp.i = icmp slt <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <2 x i32> @test_vclt_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vclt_f32:
; CHECK: fcmgt.2s v0, v1, v0
  %cmp.i = fcmp olt <2 x float> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <8 x i8> @test_vclt_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vclt_u8:
; CHECK: cmhi.8b v0, v1, v0
  %cmp.i = icmp ult <8 x i8> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i8>
  ret <8 x i8> %sext.i
}

define <4 x i16> @test_vclt_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vclt_u16:
; CHECK: cmhi.4h v0, v1, v0
  %cmp.i = icmp ult <4 x i16> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i16>
  ret <4 x i16> %sext.i
}

define <2 x i32> @test_vclt_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vclt_u32:
; CHECK: cmhi.2s v0, v1, v0
  %cmp.i = icmp ult <2 x i32> %a, %b
  %sext.i = sext <2 x i1> %cmp.i to <2 x i32>
  ret <2 x i32> %sext.i
}

define <16 x i8> @test_vcltq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vcltq_s8:
; CHECK: cmgt.16b v0, v1, v0
  %cmp.i = icmp slt <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vcltq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vcltq_s16:
; CHECK: cmgt.8h v0, v1, v0
  %cmp.i = icmp slt <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vcltq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vcltq_s32:
; CHECK: cmgt.4s v0, v1, v0
  %cmp.i = icmp slt <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <4 x i32> @test_vcltq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vcltq_f32:
; CHECK: fcmgt.4s v0, v1, v0
  %cmp.i = fcmp olt <4 x float> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <16 x i8> @test_vcltq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vcltq_u8:
; CHECK: cmhi.16b v0, v1, v0
  %cmp.i = icmp ult <16 x i8> %a, %b
  %sext.i = sext <16 x i1> %cmp.i to <16 x i8>
  ret <16 x i8> %sext.i
}

define <8 x i16> @test_vcltq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vcltq_u16:
; CHECK: cmhi.8h v0, v1, v0
  %cmp.i = icmp ult <8 x i16> %a, %b
  %sext.i = sext <8 x i1> %cmp.i to <8 x i16>
  ret <8 x i16> %sext.i
}

define <4 x i32> @test_vcltq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vcltq_u32:
; CHECK: cmhi.4s v0, v1, v0
  %cmp.i = icmp ult <4 x i32> %a, %b
  %sext.i = sext <4 x i1> %cmp.i to <4 x i32>
  ret <4 x i32> %sext.i
}

define <8 x i8> @test_vclz_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vclz_s8:
; CHECK: clz.8b v0, v0
  %vclz_v.i = tail call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %a, i1 false) #5
  ret <8 x i8> %vclz_v.i
}

define <4 x i16> @test_vclz_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vclz_s16:
; CHECK: clz.4h v0, v0
  %vclz_v1.i = tail call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %a, i1 false) #5
  ret <4 x i16> %vclz_v1.i
}

define <2 x i32> @test_vclz_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vclz_s32:
; CHECK: clz.2s v0, v0
  %vclz_v1.i = tail call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %a, i1 false) #5
  ret <2 x i32> %vclz_v1.i
}

define <8 x i8> @test_vclz_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vclz_u8:
; CHECK: clz.8b v0, v0
  %vclz_v.i = tail call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %a, i1 false) #5
  ret <8 x i8> %vclz_v.i
}

define <4 x i16> @test_vclz_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vclz_u16:
; CHECK: clz.4h v0, v0
  %vclz_v1.i = tail call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %a, i1 false) #5
  ret <4 x i16> %vclz_v1.i
}

define <2 x i32> @test_vclz_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vclz_u32:
; CHECK: clz.2s v0, v0
  %vclz_v1.i = tail call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %a, i1 false) #5
  ret <2 x i32> %vclz_v1.i
}

define <16 x i8> @test_vclzq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vclzq_s8:
; CHECK: clz.16b v0, v0
  %vclzq_v.i = tail call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %a, i1 false) #5
  ret <16 x i8> %vclzq_v.i
}

define <8 x i16> @test_vclzq_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vclzq_s16:
; CHECK: clz.8h v0, v0
  %vclzq_v1.i = tail call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %a, i1 false) #5
  ret <8 x i16> %vclzq_v1.i
}

define <4 x i32> @test_vclzq_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vclzq_s32:
; CHECK: clz.4s v0, v0
  %vclzq_v1.i = tail call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %a, i1 false) #5
  ret <4 x i32> %vclzq_v1.i
}

define <16 x i8> @test_vclzq_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vclzq_u8:
; CHECK: clz.16b v0, v0
  %vclzq_v.i = tail call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %a, i1 false) #5
  ret <16 x i8> %vclzq_v.i
}

define <8 x i16> @test_vclzq_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vclzq_u16:
; CHECK: clz.8h v0, v0
  %vclzq_v1.i = tail call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %a, i1 false) #5
  ret <8 x i16> %vclzq_v1.i
}

define <4 x i32> @test_vclzq_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vclzq_u32:
; CHECK: clz.4s v0, v0
  %vclzq_v1.i = tail call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %a, i1 false) #5
  ret <4 x i32> %vclzq_v1.i
}

define <8 x i8> @test_vcnt_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vcnt_u8:
; CHECK: cnt.8b v0, v0
  %vcnt_v.i = tail call <8 x i8> @llvm.ctpop.v8i8(<8 x i8> %a) #5
  ret <8 x i8> %vcnt_v.i
}

define <8 x i8> @test_vcnt_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vcnt_s8:
; CHECK: cnt.8b v0, v0
  %vcnt_v.i = tail call <8 x i8> @llvm.ctpop.v8i8(<8 x i8> %a) #5
  ret <8 x i8> %vcnt_v.i
}

define <8 x i8> @test_vcnt_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vcnt_p8:
; CHECK: cnt.8b v0, v0
  %vcnt_v.i = tail call <8 x i8> @llvm.ctpop.v8i8(<8 x i8> %a) #5
  ret <8 x i8> %vcnt_v.i
}

define <16 x i8> @test_vcntq_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vcntq_u8:
; CHECK: cnt.16b v0, v0
  %vcntq_v.i = tail call <16 x i8> @llvm.ctpop.v16i8(<16 x i8> %a) #5
  ret <16 x i8> %vcntq_v.i
}

define <16 x i8> @test_vcntq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vcntq_s8:
; CHECK: cnt.16b v0, v0
  %vcntq_v.i = tail call <16 x i8> @llvm.ctpop.v16i8(<16 x i8> %a) #5
  ret <16 x i8> %vcntq_v.i
}

define <16 x i8> @test_vcntq_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vcntq_p8:
; CHECK: cnt.16b v0, v0
  %vcntq_v.i = tail call <16 x i8> @llvm.ctpop.v16i8(<16 x i8> %a) #5
  ret <16 x i8> %vcntq_v.i
}

define <16 x i8> @test_vcombine_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcombine_s8:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> %b, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vcombine_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcombine_s16:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> %b, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i16> %shuffle.i
}

define <4 x i32> @test_vcombine_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vcombine_s32:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <2 x i32> %a, <2 x i32> %b, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i32> %shuffle.i
}

define <2 x i64> @test_vcombine_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vcombine_s64:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <1 x i64> %a, <1 x i64> %b, <2 x i32> <i32 0, i32 1>
  ret <2 x i64> %shuffle.i
}

define <8 x i16> @test_vcombine_f16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcombine_f16:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> %b, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i16> %shuffle.i
}

define <4 x float> @test_vcombine_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vcombine_f32:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <2 x float> %a, <2 x float> %b, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x float> %shuffle.i
}

define <16 x i8> @test_vcombine_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcombine_u8:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> %b, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vcombine_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcombine_u16:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> %b, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i16> %shuffle.i
}

define <4 x i32> @test_vcombine_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vcombine_u32:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <2 x i32> %a, <2 x i32> %b, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i32> %shuffle.i
}

define <2 x i64> @test_vcombine_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vcombine_u64:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <1 x i64> %a, <1 x i64> %b, <2 x i32> <i32 0, i32 1>
  ret <2 x i64> %shuffle.i
}

define <16 x i8> @test_vcombine_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vcombine_p8:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> %b, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vcombine_p16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vcombine_p16:
; CHECK: mov.d v0[1], v1[0]
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> %b, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i16> %shuffle.i
}

define <8 x i8> @test_vcreate_s8(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_s8:
; CHECK: fmov d0, x0
; CHECK: clz.8b v0, v0
  %t0 = bitcast i64 %a to <8 x i8>
  %vclz_v.i = tail call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %t0, i1 false) #5
  ret <8 x i8> %vclz_v.i
}

define <4 x i16> @test_vcreate_s16(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_s16:
; CHECK: fmov d0, x0
; CHECK: clz.4h v0, v0
  %t0 = bitcast i64 %a to <4 x i16>
  %vclz_v1.i = tail call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %t0, i1 false) #5
  ret <4 x i16> %vclz_v1.i
}

define <2 x i32> @test_vcreate_s32(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_s32:
; CHECK: fmov d0, x0
; CHECK: clz.2s v0, v0
  %t0 = bitcast i64 %a to <2 x i32>
  %vclz_v1.i = tail call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %t0, i1 false) #5
  ret <2 x i32> %vclz_v1.i
}

define <4 x i16> @test_vcreate_f16(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_f16:
; CHECK: fmov d0, x0
  %t0 = bitcast i64 %a to <4 x i16>
  ret <4 x i16> %t0
}

define <2 x float> @test_vcreate_f32(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_f32:
; CHECK: fmov d0, x0
  %t0 = bitcast i64 %a to <2 x float>
  ret <2 x float> %t0
}

define <8 x i8> @test_vcreate_u8(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_u8:
; CHECK: fmov d0, x0
; CHECK: clz.8b v0, v0
  %t0 = bitcast i64 %a to <8 x i8>
  %vclz_v.i = tail call <8 x i8> @llvm.ctlz.v8i8(<8 x i8> %t0, i1 false) #5
  ret <8 x i8> %vclz_v.i
}

define <4 x i16> @test_vcreate_u16(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_u16:
; CHECK: fmov d0, x0
; CHECK: clz.4h v0, v0
  %t0 = bitcast i64 %a to <4 x i16>
  %vclz_v1.i = tail call <4 x i16> @llvm.ctlz.v4i16(<4 x i16> %t0, i1 false) #5
  ret <4 x i16> %vclz_v1.i
}

define <2 x i32> @test_vcreate_u32(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_u32:
; CHECK: fmov d0, x0
; CHECK: clz.2s v0, v0
  %t0 = bitcast i64 %a to <2 x i32>
  %vclz_v1.i = tail call <2 x i32> @llvm.ctlz.v2i32(<2 x i32> %t0, i1 false) #5
  ret <2 x i32> %vclz_v1.i
}

define <1 x i64> @test_vcreate_u64(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_u64:
; CHECK: fmov d0, x0
; CHECK: shl d0, d0, #1
  %t0 = insertelement <1 x i64> undef, i64 %a, i32 0
  %add.i = shl <1 x i64> %t0, <i64 1>
  ret <1 x i64> %add.i
}

define <8 x i8> @test_vcreate_p8(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_p8:
; CHECK: fmov d0, x0
; CHECK: cnt.8b v0, v0
  %t0 = bitcast i64 %a to <8 x i8>
  %vcnt_v.i = tail call <8 x i8> @llvm.ctpop.v8i8(<8 x i8> %t0) #5
  ret <8 x i8> %vcnt_v.i
}

define <4 x i16> @test_vcreate_p16(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_p16:
; CHECK: fmov d0, x0
; CHECK: orn.8b v1, v0, v0
; CHECK: and.8b v0, v1, v0
  %t0 = bitcast i64 %a to <4 x i16>
  %t1 = bitcast <4 x i16> %t0 to <8 x i8>
  %vbsl_v.i = tail call <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8> %t1, <8 x i8> %t1, <8 x i8> %t1) #5
  %t2 = bitcast <8 x i8> %vbsl_v.i to <4 x i16>
  ret <4 x i16> %t2
}

define <1 x i64> @test_vcreate_s64(i64 %a) #0 {
; CHECK-LABEL: test_vcreate_s64:
; CHECK: fmov d0, x0
; CHECK: shl d0, d0, #1
  %t0 = insertelement <1 x i64> undef, i64 %a, i32 0
  %add.i = shl <1 x i64> %t0, <i64 1>
  ret <1 x i64> %add.i
}

define <4 x i16> @test_vcvt_f16_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vcvt_f16_f32:
; CHECK: fcvtn v0.4h, v0.4s
  %vcvt_f16_v1.i = tail call <4 x i16> @llvm.arm.neon.vcvtfp2hf(<4 x float> %a) #5
  ret <4 x i16> %vcvt_f16_v1.i
}

define <2 x float> @test_vcvt_f32_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vcvt_f32_s32:
; CHECK: scvtf.2s v0, v0
  %vcvt.i = sitofp <2 x i32> %a to <2 x float>
  ret <2 x float> %vcvt.i
}

define <2 x float> @test_vcvt_f32_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vcvt_f32_u32:
; CHECK: ucvtf.2s v0, v0
  %vcvt.i = uitofp <2 x i32> %a to <2 x float>
  ret <2 x float> %vcvt.i
}

define <4 x float> @test_vcvtq_f32_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vcvtq_f32_s32:
; CHECK: scvtf.4s v0, v0
  %vcvt.i = sitofp <4 x i32> %a to <4 x float>
  ret <4 x float> %vcvt.i
}

define <4 x float> @test_vcvtq_f32_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vcvtq_f32_u32:
; CHECK: ucvtf.4s v0, v0
  %vcvt.i = uitofp <4 x i32> %a to <4 x float>
  ret <4 x float> %vcvt.i
}

define <4 x float> @test_vcvt_f32_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vcvt_f32_f16:
; CHECK: fcvtl v0.4s, v0.4h
  %vcvt_f32_f161.i = tail call <4 x float> @llvm.arm.neon.vcvthf2fp(<4 x i16> %a) #5
  ret <4 x float> %vcvt_f32_f161.i
}

define <2 x float> @test_vcvt_n_f32_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vcvt_n_f32_s32:
; CHECK: scvtf.2s v0, v0, #1
  %vcvt_n1 = tail call <2 x float> @llvm.arm.neon.vcvtfxs2fp.v2f32.v2i32(<2 x i32> %a, i32 1)
  ret <2 x float> %vcvt_n1
}

declare <2 x float> @llvm.arm.neon.vcvtfxs2fp.v2f32.v2i32(<2 x i32>, i32) #1

define <2 x float> @test_vcvt_n_f32_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vcvt_n_f32_u32:
; CHECK: ucvtf.2s v0, v0, #1
  %vcvt_n1 = tail call <2 x float> @llvm.arm.neon.vcvtfxu2fp.v2f32.v2i32(<2 x i32> %a, i32 1)
  ret <2 x float> %vcvt_n1
}

declare <2 x float> @llvm.arm.neon.vcvtfxu2fp.v2f32.v2i32(<2 x i32>, i32) #1

define <4 x float> @test_vcvtq_n_f32_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vcvtq_n_f32_s32:
; CHECK: scvtf.4s v0, v0, #3
  %vcvt_n1 = tail call <4 x float> @llvm.arm.neon.vcvtfxs2fp.v4f32.v4i32(<4 x i32> %a, i32 3)
  ret <4 x float> %vcvt_n1
}

declare <4 x float> @llvm.arm.neon.vcvtfxs2fp.v4f32.v4i32(<4 x i32>, i32) #1

define <4 x float> @test_vcvtq_n_f32_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vcvtq_n_f32_u32:
; CHECK: ucvtf.4s v0, v0, #3
  %vcvt_n1 = tail call <4 x float> @llvm.arm.neon.vcvtfxu2fp.v4f32.v4i32(<4 x i32> %a, i32 3)
  ret <4 x float> %vcvt_n1
}

declare <4 x float> @llvm.arm.neon.vcvtfxu2fp.v4f32.v4i32(<4 x i32>, i32) #1

define <2 x i32> @test_vcvt_n_s32_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vcvt_n_s32_f32:
; CHECK: fcvtzs.2s v0, v0, #1
  %vcvt_n1 = tail call <2 x i32> @llvm.arm.neon.vcvtfp2fxs.v2i32.v2f32(<2 x float> %a, i32 1)
  ret <2 x i32> %vcvt_n1
}

declare <2 x i32> @llvm.arm.neon.vcvtfp2fxs.v2i32.v2f32(<2 x float>, i32) #1

define <4 x i32> @test_vcvtq_n_s32_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vcvtq_n_s32_f32:
; CHECK: fcvtzs.4s v0, v0, #3
  %vcvt_n1 = tail call <4 x i32> @llvm.arm.neon.vcvtfp2fxs.v4i32.v4f32(<4 x float> %a, i32 3)
  ret <4 x i32> %vcvt_n1
}

declare <4 x i32> @llvm.arm.neon.vcvtfp2fxs.v4i32.v4f32(<4 x float>, i32) #1

define <2 x i32> @test_vcvt_n_u32_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vcvt_n_u32_f32:
; CHECK: fcvtzu.2s v0, v0, #1
  %vcvt_n1 = tail call <2 x i32> @llvm.arm.neon.vcvtfp2fxu.v2i32.v2f32(<2 x float> %a, i32 1)
  ret <2 x i32> %vcvt_n1
}

declare <2 x i32> @llvm.arm.neon.vcvtfp2fxu.v2i32.v2f32(<2 x float>, i32) #1

define <4 x i32> @test_vcvtq_n_u32_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vcvtq_n_u32_f32:
; CHECK: fcvtzu.4s v0, v0, #3
  %vcvt_n1 = tail call <4 x i32> @llvm.arm.neon.vcvtfp2fxu.v4i32.v4f32(<4 x float> %a, i32 3)
  ret <4 x i32> %vcvt_n1
}

declare <4 x i32> @llvm.arm.neon.vcvtfp2fxu.v4i32.v4f32(<4 x float>, i32) #1

define <2 x i32> @test_vcvt_s32_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vcvt_s32_f32:
; CHECK: fcvtzs.2s v0, v0
  %vcvt.i = fptosi <2 x float> %a to <2 x i32>
  ret <2 x i32> %vcvt.i
}

define <4 x i32> @test_vcvtq_s32_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vcvtq_s32_f32:
; CHECK: fcvtzs.4s v0, v0
  %vcvt.i = fptosi <4 x float> %a to <4 x i32>
  ret <4 x i32> %vcvt.i
}

define <2 x i32> @test_vcvt_u32_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vcvt_u32_f32:
; CHECK: fcvtzu.2s v0, v0
  %vcvt.i = fptoui <2 x float> %a to <2 x i32>
  ret <2 x i32> %vcvt.i
}

define <4 x i32> @test_vcvtq_u32_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vcvtq_u32_f32:
; CHECK: fcvtzu.4s v0, v0
  %vcvt.i = fptoui <4 x float> %a to <4 x i32>
  ret <4 x i32> %vcvt.i
}

define <8 x i8> @test_vdup_lane_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vdup_lane_u8:
; CHECK: dup.8b v0, v0[7]
  %shuffle = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  ret <8 x i8> %shuffle
}

define <4 x i16> @test_vdup_lane_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vdup_lane_u16:
; CHECK: dup.4h v0, v0[3]
  %shuffle = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  ret <4 x i16> %shuffle
}

define <2 x i32> @test_vdup_lane_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vdup_lane_u32:
; CHECK: dup.2s v0, v0[1]
  %shuffle = shufflevector <2 x i32> %a, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  ret <2 x i32> %shuffle
}

define <8 x i8> @test_vdup_lane_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vdup_lane_s8:
; CHECK: dup.8b v0, v0[7]
  %shuffle = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  ret <8 x i8> %shuffle
}

define <4 x i16> @test_vdup_lane_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vdup_lane_s16:
; CHECK: dup.4h v0, v0[3]
  %shuffle = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  ret <4 x i16> %shuffle
}

define <2 x i32> @test_vdup_lane_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vdup_lane_s32:
; CHECK: dup.2s v0, v0[1]
  %shuffle = shufflevector <2 x i32> %a, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  ret <2 x i32> %shuffle
}

define <8 x i8> @test_vdup_lane_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vdup_lane_p8:
; CHECK: dup.8b v0, v0[7]
  %shuffle = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  ret <8 x i8> %shuffle
}

define <4 x i16> @test_vdup_lane_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vdup_lane_p16:
; CHECK: dup.4h v0, v0[3]
  %shuffle = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  ret <4 x i16> %shuffle
}

define <2 x float> @test_vdup_lane_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vdup_lane_f32:
; CHECK: dup.2s v0, v0[1]
  %shuffle = shufflevector <2 x float> %a, <2 x float> undef, <2 x i32> <i32 1, i32 1>
  ret <2 x float> %shuffle
}

define <16 x i8> @test_vdupq_lane_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_u8:
; CHECK: dup.16b v0, v0[7]
  %shuffle = shufflevector <8 x i8> %a, <8 x i8> undef, <16 x i32> <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  ret <16 x i8> %shuffle
}

define <8 x i16> @test_vdupq_lane_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_u16:
; CHECK: dup.8h v0, v0[3]
  %shuffle = shufflevector <4 x i16> %a, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  ret <8 x i16> %shuffle
}

define <4 x i32> @test_vdupq_lane_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_u32:
; CHECK: dup.4s v0, v0[1]
  %shuffle = shufflevector <2 x i32> %a, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %shuffle
}

define <16 x i8> @test_vdupq_lane_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_s8:
; CHECK: dup.16b v0, v0[7]
  %shuffle = shufflevector <8 x i8> %a, <8 x i8> undef, <16 x i32> <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  ret <16 x i8> %shuffle
}

define <8 x i16> @test_vdupq_lane_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_s16:
; CHECK: dup.8h v0, v0[3]
  %shuffle = shufflevector <4 x i16> %a, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  ret <8 x i16> %shuffle
}

define <4 x i32> @test_vdupq_lane_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_s32:
; CHECK: dup.4s v0, v0[1]
  %shuffle = shufflevector <2 x i32> %a, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %shuffle
}

define <16 x i8> @test_vdupq_lane_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_p8:
; CHECK: dup.16b v0, v0[7]
  %shuffle = shufflevector <8 x i8> %a, <8 x i8> undef, <16 x i32> <i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7, i32 7>
  ret <16 x i8> %shuffle
}

define <8 x i16> @test_vdupq_lane_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_p16:
; CHECK: dup.8h v0, v0[3]
  %shuffle = shufflevector <4 x i16> %a, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  ret <8 x i16> %shuffle
}

define <4 x float> @test_vdupq_lane_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_f32:
; CHECK: dup.4s v0, v0[1]
  %shuffle = shufflevector <2 x float> %a, <2 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  ret <4 x float> %shuffle
}

define <1 x i64> @test_vdup_lane_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vdup_lane_s64:
  ret <1 x i64> %a
}

define <1 x i64> @test_vdup_lane_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vdup_lane_u64:
  ret <1 x i64> %a
}

define <2 x i64> @test_vdupq_lane_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_s64:
; CHECK: dup.2d v0, v0[0]
  %shuffle = shufflevector <1 x i64> %a, <1 x i64> undef, <2 x i32> zeroinitializer
  ret <2 x i64> %shuffle
}

define <2 x i64> @test_vdupq_lane_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vdupq_lane_u64:
; CHECK: dup.2d v0, v0[0]
  %shuffle = shufflevector <1 x i64> %a, <1 x i64> undef, <2 x i32> zeroinitializer
  ret <2 x i64> %shuffle
}

define <8 x i8> @test_vdup_n_u8(i8 zeroext %a) #0 {
; CHECK-LABEL: test_vdup_n_u8:
; CHECK: dup.8b v0, w0
  %vecinit.i = insertelement <8 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <8 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <8 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <8 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <8 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <8 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <8 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <8 x i8> %vecinit6.i, i8 %a, i32 7
  ret <8 x i8> %vecinit7.i
}

define <4 x i16> @test_vdup_n_u16(i16 zeroext %a) #0 {
; CHECK-LABEL: test_vdup_n_u16:
; CHECK: dup.4h v0, w0
  %vecinit.i = insertelement <4 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %a, i32 3
  ret <4 x i16> %vecinit3.i
}

define <2 x i32> @test_vdup_n_u32(i32 %a) #0 {
; CHECK-LABEL: test_vdup_n_u32:
; CHECK: dup.2s v0, w0
  %vecinit.i = insertelement <2 x i32> undef, i32 %a, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %a, i32 1
  ret <2 x i32> %vecinit1.i
}

define <8 x i8> @test_vdup_n_s8(i8 signext %a) #0 {
; CHECK-LABEL: test_vdup_n_s8:
; CHECK: dup.8b v0, w0
  %vecinit.i = insertelement <8 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <8 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <8 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <8 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <8 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <8 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <8 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <8 x i8> %vecinit6.i, i8 %a, i32 7
  ret <8 x i8> %vecinit7.i
}

define <4 x i16> @test_vdup_n_s16(i16 signext %a) #0 {
; CHECK-LABEL: test_vdup_n_s16:
; CHECK: dup.4h v0, w0
  %vecinit.i = insertelement <4 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %a, i32 3
  ret <4 x i16> %vecinit3.i
}

define <2 x i32> @test_vdup_n_s32(i32 %a) #0 {
; CHECK-LABEL: test_vdup_n_s32:
; CHECK: dup.2s v0, w0
  %vecinit.i = insertelement <2 x i32> undef, i32 %a, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %a, i32 1
  ret <2 x i32> %vecinit1.i
}

define <8 x i8> @test_vdup_n_p8(i8 signext %a) #0 {
; CHECK-LABEL: test_vdup_n_p8:
; CHECK: dup.8b v0, w0
  %vecinit.i = insertelement <8 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <8 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <8 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <8 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <8 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <8 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <8 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <8 x i8> %vecinit6.i, i8 %a, i32 7
  ret <8 x i8> %vecinit7.i
}

define <4 x i16> @test_vdup_n_p16(i16 signext %a) #0 {
; CHECK-LABEL: test_vdup_n_p16:
; CHECK: dup.4h v0, w0
  %vecinit.i = insertelement <4 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %a, i32 3
  ret <4 x i16> %vecinit3.i
}

define <4 x i16> @test_vdup_n_f16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vdup_n_f16:
; CHECK: ld1r.4h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %vecinit = insertelement <4 x i16> undef, i16 %t0, i32 0
  %vecinit1 = insertelement <4 x i16> %vecinit, i16 %t0, i32 1
  %vecinit2 = insertelement <4 x i16> %vecinit1, i16 %t0, i32 2
  %vecinit3 = insertelement <4 x i16> %vecinit2, i16 %t0, i32 3
  ret <4 x i16> %vecinit3
}

define <2 x float> @test_vdup_n_f32(float %a) #0 {
; CHECK-LABEL: test_vdup_n_f32:
; CHECK: dup.2s v0, v0[0]
  %vecinit.i = insertelement <2 x float> undef, float %a, i32 0
  %vecinit1.i = insertelement <2 x float> %vecinit.i, float %a, i32 1
  ret <2 x float> %vecinit1.i
}

define <16 x i8> @test_vdupq_n_u8(i8 zeroext %a) #0 {
; CHECK-LABEL: test_vdupq_n_u8:
; CHECK: dup.16b v0, w0
  %vecinit.i = insertelement <16 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <16 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <16 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <16 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <16 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <16 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <16 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <16 x i8> %vecinit6.i, i8 %a, i32 7
  %vecinit8.i = insertelement <16 x i8> %vecinit7.i, i8 %a, i32 8
  %vecinit9.i = insertelement <16 x i8> %vecinit8.i, i8 %a, i32 9
  %vecinit10.i = insertelement <16 x i8> %vecinit9.i, i8 %a, i32 10
  %vecinit11.i = insertelement <16 x i8> %vecinit10.i, i8 %a, i32 11
  %vecinit12.i = insertelement <16 x i8> %vecinit11.i, i8 %a, i32 12
  %vecinit13.i = insertelement <16 x i8> %vecinit12.i, i8 %a, i32 13
  %vecinit14.i = insertelement <16 x i8> %vecinit13.i, i8 %a, i32 14
  %vecinit15.i = insertelement <16 x i8> %vecinit14.i, i8 %a, i32 15
  ret <16 x i8> %vecinit15.i
}

define <8 x i16> @test_vdupq_n_u16(i16 zeroext %a) #0 {
; CHECK-LABEL: test_vdupq_n_u16:
; CHECK: dup.8h v0, w0
  %vecinit.i = insertelement <8 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %a, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %a, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %a, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %a, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %a, i32 7
  ret <8 x i16> %vecinit7.i
}

define <4 x i32> @test_vdupq_n_u32(i32 %a) #0 {
; CHECK-LABEL: test_vdupq_n_u32:
; CHECK: dup.4s v0, w0
  %vecinit.i = insertelement <4 x i32> undef, i32 %a, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %a, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %a, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %a, i32 3
  ret <4 x i32> %vecinit3.i
}

define <16 x i8> @test_vdupq_n_s8(i8 signext %a) #0 {
; CHECK-LABEL: test_vdupq_n_s8:
; CHECK: dup.16b v0, w0
  %vecinit.i = insertelement <16 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <16 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <16 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <16 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <16 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <16 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <16 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <16 x i8> %vecinit6.i, i8 %a, i32 7
  %vecinit8.i = insertelement <16 x i8> %vecinit7.i, i8 %a, i32 8
  %vecinit9.i = insertelement <16 x i8> %vecinit8.i, i8 %a, i32 9
  %vecinit10.i = insertelement <16 x i8> %vecinit9.i, i8 %a, i32 10
  %vecinit11.i = insertelement <16 x i8> %vecinit10.i, i8 %a, i32 11
  %vecinit12.i = insertelement <16 x i8> %vecinit11.i, i8 %a, i32 12
  %vecinit13.i = insertelement <16 x i8> %vecinit12.i, i8 %a, i32 13
  %vecinit14.i = insertelement <16 x i8> %vecinit13.i, i8 %a, i32 14
  %vecinit15.i = insertelement <16 x i8> %vecinit14.i, i8 %a, i32 15
  ret <16 x i8> %vecinit15.i
}

define <8 x i16> @test_vdupq_n_s16(i16 signext %a) #0 {
; CHECK-LABEL: test_vdupq_n_s16:
; CHECK: dup.8h v0, w0
  %vecinit.i = insertelement <8 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %a, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %a, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %a, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %a, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %a, i32 7
  ret <8 x i16> %vecinit7.i
}

define <4 x i32> @test_vdupq_n_s32(i32 %a) #0 {
; CHECK-LABEL: test_vdupq_n_s32:
; CHECK: dup.4s v0, w0
  %vecinit.i = insertelement <4 x i32> undef, i32 %a, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %a, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %a, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %a, i32 3
  ret <4 x i32> %vecinit3.i
}

define <16 x i8> @test_vdupq_n_p8(i8 signext %a) #0 {
; CHECK-LABEL: test_vdupq_n_p8:
; CHECK: dup.16b v0, w0
  %vecinit.i = insertelement <16 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <16 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <16 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <16 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <16 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <16 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <16 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <16 x i8> %vecinit6.i, i8 %a, i32 7
  %vecinit8.i = insertelement <16 x i8> %vecinit7.i, i8 %a, i32 8
  %vecinit9.i = insertelement <16 x i8> %vecinit8.i, i8 %a, i32 9
  %vecinit10.i = insertelement <16 x i8> %vecinit9.i, i8 %a, i32 10
  %vecinit11.i = insertelement <16 x i8> %vecinit10.i, i8 %a, i32 11
  %vecinit12.i = insertelement <16 x i8> %vecinit11.i, i8 %a, i32 12
  %vecinit13.i = insertelement <16 x i8> %vecinit12.i, i8 %a, i32 13
  %vecinit14.i = insertelement <16 x i8> %vecinit13.i, i8 %a, i32 14
  %vecinit15.i = insertelement <16 x i8> %vecinit14.i, i8 %a, i32 15
  ret <16 x i8> %vecinit15.i
}

define <8 x i16> @test_vdupq_n_p16(i16 signext %a) #0 {
; CHECK-LABEL: test_vdupq_n_p16:
; CHECK: dup.8h v0, w0
  %vecinit.i = insertelement <8 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %a, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %a, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %a, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %a, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %a, i32 7
  ret <8 x i16> %vecinit7.i
}

define <8 x i16> @test_vdupq_n_f16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vdupq_n_f16:
; CHECK: ld1r.8h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %vecinit = insertelement <8 x i16> undef, i16 %t0, i32 0
  %vecinit1 = insertelement <8 x i16> %vecinit, i16 %t0, i32 1
  %vecinit2 = insertelement <8 x i16> %vecinit1, i16 %t0, i32 2
  %vecinit3 = insertelement <8 x i16> %vecinit2, i16 %t0, i32 3
  %vecinit4 = insertelement <8 x i16> %vecinit3, i16 %t0, i32 4
  %vecinit5 = insertelement <8 x i16> %vecinit4, i16 %t0, i32 5
  %vecinit6 = insertelement <8 x i16> %vecinit5, i16 %t0, i32 6
  %vecinit7 = insertelement <8 x i16> %vecinit6, i16 %t0, i32 7
  ret <8 x i16> %vecinit7
}

define <4 x float> @test_vdupq_n_f32(float %a) #0 {
; CHECK-LABEL: test_vdupq_n_f32:
; CHECK: dup.4s v0, v0[0]
  %vecinit.i = insertelement <4 x float> undef, float %a, i32 0
  %vecinit1.i = insertelement <4 x float> %vecinit.i, float %a, i32 1
  %vecinit2.i = insertelement <4 x float> %vecinit1.i, float %a, i32 2
  %vecinit3.i = insertelement <4 x float> %vecinit2.i, float %a, i32 3
  ret <4 x float> %vecinit3.i
}

define <1 x i64> @test_vdup_n_s64(i64 %a) #0 {
; CHECK-LABEL: test_vdup_n_s64:
; CHECK: fmov d0, x0
; CHECK: shl d0, d0, #1
  %vecinit.i = insertelement <1 x i64> undef, i64 %a, i32 0
  %add.i = shl <1 x i64> %vecinit.i, <i64 1>
  ret <1 x i64> %add.i
}

define <1 x i64> @test_vdup_n_u64(i64 %a) #0 {
; CHECK-LABEL: test_vdup_n_u64:
; CHECK: fmov d0, x0
; CHECK: shl d0, d0, #1
  %vecinit.i = insertelement <1 x i64> undef, i64 %a, i32 0
  %add.i = shl <1 x i64> %vecinit.i, <i64 1>
  ret <1 x i64> %add.i
}

define <2 x i64> @test_vdupq_n_s64(i64 %a) #0 {
; CHECK-LABEL: test_vdupq_n_s64:
; CHECK: dup.2d v0, x0
; CHECK: shl.2d v0, v0, #1
  %vecinit.i = insertelement <2 x i64> undef, i64 %a, i32 0
  %vecinit1.i = insertelement <2 x i64> %vecinit.i, i64 %a, i32 1
  %add.i = shl <2 x i64> %vecinit1.i, <i64 1, i64 1>
  ret <2 x i64> %add.i
}

define <2 x i64> @test_vdupq_n_u64(i64 %a) #0 {
; CHECK-LABEL: test_vdupq_n_u64:
; CHECK: dup.2d v0, x0
; CHECK: shl.2d v0, v0, #1
  %vecinit.i = insertelement <2 x i64> undef, i64 %a, i32 0
  %vecinit1.i = insertelement <2 x i64> %vecinit.i, i64 %a, i32 1
  %add.i = shl <2 x i64> %vecinit1.i, <i64 1, i64 1>
  ret <2 x i64> %add.i
}

define <8 x i8> @test_veor_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_veor_s8:
; CHECK: eor.8b v0, v0, v1
  %xor.i = xor <8 x i8> %a, %b
  ret <8 x i8> %xor.i
}

define <4 x i16> @test_veor_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_veor_s16:
; CHECK: eor.8b v0, v0, v1
  %xor.i = xor <4 x i16> %a, %b
  ret <4 x i16> %xor.i
}

define <2 x i32> @test_veor_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_veor_s32:
; CHECK: eor.8b v0, v0, v1
  %xor.i = xor <2 x i32> %a, %b
  ret <2 x i32> %xor.i
}

define <1 x i64> @test_veor_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_veor_s64:
; CHECK: eor.8b v0, v0, v1
  %xor.i = xor <1 x i64> %a, %b
  ret <1 x i64> %xor.i
}

define <8 x i8> @test_veor_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_veor_u8:
; CHECK: eor.8b v0, v0, v1
  %xor.i = xor <8 x i8> %a, %b
  ret <8 x i8> %xor.i
}

define <4 x i16> @test_veor_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_veor_u16:
; CHECK: eor.8b v0, v0, v1
  %xor.i = xor <4 x i16> %a, %b
  ret <4 x i16> %xor.i
}

define <2 x i32> @test_veor_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_veor_u32:
; CHECK: eor.8b v0, v0, v1
  %xor.i = xor <2 x i32> %a, %b
  ret <2 x i32> %xor.i
}

define <1 x i64> @test_veor_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_veor_u64:
; CHECK: eor.8b v0, v0, v1
  %xor.i = xor <1 x i64> %a, %b
  ret <1 x i64> %xor.i
}

define <16 x i8> @test_veorq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_veorq_s8:
; CHECK: eor.16b v0, v0, v1
  %xor.i = xor <16 x i8> %a, %b
  ret <16 x i8> %xor.i
}

define <8 x i16> @test_veorq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_veorq_s16:
; CHECK: eor.16b v0, v0, v1
  %xor.i = xor <8 x i16> %a, %b
  ret <8 x i16> %xor.i
}

define <4 x i32> @test_veorq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_veorq_s32:
; CHECK: eor.16b v0, v0, v1
  %xor.i = xor <4 x i32> %a, %b
  ret <4 x i32> %xor.i
}

define <2 x i64> @test_veorq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_veorq_s64:
; CHECK: eor.16b v0, v0, v1
  %xor.i = xor <2 x i64> %a, %b
  ret <2 x i64> %xor.i
}

define <16 x i8> @test_veorq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_veorq_u8:
; CHECK: eor.16b v0, v0, v1
  %xor.i = xor <16 x i8> %a, %b
  ret <16 x i8> %xor.i
}

define <8 x i16> @test_veorq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_veorq_u16:
; CHECK: eor.16b v0, v0, v1
  %xor.i = xor <8 x i16> %a, %b
  ret <8 x i16> %xor.i
}

define <4 x i32> @test_veorq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_veorq_u32:
; CHECK: eor.16b v0, v0, v1
  %xor.i = xor <4 x i32> %a, %b
  ret <4 x i32> %xor.i
}

define <2 x i64> @test_veorq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_veorq_u64:
; CHECK: eor.16b v0, v0, v1
  %xor.i = xor <2 x i64> %a, %b
  ret <2 x i64> %xor.i
}

define <8 x i8> @test_vext_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vext_s8:
; CHECK: ext.8b v0, v0, v1, #7
  %vext = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14>
  ret <8 x i8> %vext
}

define <8 x i8> @test_vext_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vext_u8:
; CHECK: ext.8b v0, v0, v1, #7
  %vext = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14>
  ret <8 x i8> %vext
}

define <8 x i8> @test_vext_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vext_p8:
; CHECK: ext.8b v0, v0, v1, #7
  %vext = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14>
  ret <8 x i8> %vext
}

define <4 x i16> @test_vext_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vext_s16:
; CHECK: ext.8b v0, v0, v1, #6
  %vext = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  ret <4 x i16> %vext
}

define <4 x i16> @test_vext_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vext_u16:
; CHECK: ext.8b v0, v0, v1, #6
  %vext = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  ret <4 x i16> %vext
}

define <4 x i16> @test_vext_p16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vext_p16:
; CHECK: ext.8b v0, v0, v1, #6
  %vext = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  ret <4 x i16> %vext
}

define <2 x i32> @test_vext_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vext_s32:
; CHECK: ext.8b v0, v0, v1, #4
  %vext = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 2>
  ret <2 x i32> %vext
}

define <2 x i32> @test_vext_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vext_u32:
; CHECK: ext.8b v0, v0, v1, #4
  %vext = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 2>
  ret <2 x i32> %vext
}

define <1 x i64> @test_vext_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vext_s64:
  ret <1 x i64> %a
}

define <1 x i64> @test_vext_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vext_u64:
  ret <1 x i64> %a
}

define <2 x float> @test_vext_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vext_f32:
; CHECK: ext.8b v0, v0, v1, #4
  %vext = shufflevector <2 x float> %a, <2 x float> %b, <2 x i32> <i32 1, i32 2>
  ret <2 x float> %vext
}

define <16 x i8> @test_vextq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vextq_s8:
; CHECK: ext.16b v0, v0, v1, #15
  %vext = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30>
  ret <16 x i8> %vext
}

define <16 x i8> @test_vextq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vextq_u8:
; CHECK: ext.16b v0, v0, v1, #15
  %vext = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30>
  ret <16 x i8> %vext
}

define <16 x i8> @test_vextq_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vextq_p8:
; CHECK: ext.16b v0, v0, v1, #15
  %vext = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30>
  ret <16 x i8> %vext
}

define <8 x i16> @test_vextq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vextq_s16:
; CHECK: ext.16b v0, v0, v1, #14
  %vext = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14>
  ret <8 x i16> %vext
}

define <8 x i16> @test_vextq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vextq_u16:
; CHECK: ext.16b v0, v0, v1, #14
  %vext = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14>
  ret <8 x i16> %vext
}

define <8 x i16> @test_vextq_p16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vextq_p16:
; CHECK: ext.16b v0, v0, v1, #14
  %vext = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14>
  ret <8 x i16> %vext
}

define <4 x i32> @test_vextq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vextq_s32:
; CHECK: ext.16b v0, v0, v1, #12
  %vext = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  ret <4 x i32> %vext
}

define <4 x i32> @test_vextq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vextq_u32:
; CHECK: ext.16b v0, v0, v1, #12
  %vext = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  ret <4 x i32> %vext
}

define <2 x i64> @test_vextq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vextq_s64:
; CHECK: ext.16b v0, v0, v1, #8
  %vext = shufflevector <2 x i64> %a, <2 x i64> %b, <2 x i32> <i32 1, i32 2>
  ret <2 x i64> %vext
}

define <2 x i64> @test_vextq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vextq_u64:
; CHECK: ext.16b v0, v0, v1, #8
  %vext = shufflevector <2 x i64> %a, <2 x i64> %b, <2 x i32> <i32 1, i32 2>
  ret <2 x i64> %vext
}

define <4 x float> @test_vextq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vextq_f32:
; CHECK: ext.16b v0, v0, v1, #12
  %vext = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  ret <4 x float> %vext
}

define <2 x float> @test_vfma_f32(<2 x float> %a, <2 x float> %b, <2 x float> %c) #0 {
; CHECK-LABEL: test_vfma_f32:
; CHECK: fmla.2s v0, v2, v1
  %t0 = tail call <2 x float> @llvm.fma.v2f32(<2 x float> %b, <2 x float> %c, <2 x float> %a) #5
  ret <2 x float> %t0
}

define <4 x float> @test_vfmaq_f32(<4 x float> %a, <4 x float> %b, <4 x float> %c) #0 {
; CHECK-LABEL: test_vfmaq_f32:
; CHECK: fmla.4s v0, v2, v1
  %t0 = tail call <4 x float> @llvm.fma.v4f32(<4 x float> %b, <4 x float> %c, <4 x float> %a) #5
  ret <4 x float> %t0
}

define <8 x i8> @test_vget_high_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vget_high_s8:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vget_high_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vget_high_s16:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  ret <4 x i16> %shuffle.i
}

define <2 x i32> @test_vget_high_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vget_high_s32:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <4 x i32> %a, <4 x i32> undef, <2 x i32> <i32 2, i32 3>
  ret <2 x i32> %shuffle.i
}

define <1 x i64> @test_vget_high_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vget_high_s64:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <2 x i64> %a, <2 x i64> undef, <1 x i32> <i32 1>
  ret <1 x i64> %shuffle.i
}

define <4 x i16> @test_vget_high_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vget_high_f16:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  ret <4 x i16> %shuffle.i
}

define <2 x float> @test_vget_high_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vget_high_f32:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <4 x float> %a, <4 x float> undef, <2 x i32> <i32 2, i32 3>
  ret <2 x float> %shuffle.i
}

define <8 x i8> @test_vget_high_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vget_high_u8:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vget_high_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vget_high_u16:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  ret <4 x i16> %shuffle.i
}

define <2 x i32> @test_vget_high_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vget_high_u32:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <4 x i32> %a, <4 x i32> undef, <2 x i32> <i32 2, i32 3>
  ret <2 x i32> %shuffle.i
}

define <1 x i64> @test_vget_high_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vget_high_u64:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <2 x i64> %a, <2 x i64> undef, <1 x i32> <i32 1>
  ret <1 x i64> %shuffle.i
}

define <8 x i8> @test_vget_high_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vget_high_p8:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vget_high_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vget_high_p16:
; CHECK: ext.16b v0, v0, v0, #8
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  ret <4 x i16> %shuffle.i
}

define zeroext i8 @test_vget_lane_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vget_lane_u8:
; CHECK: umov.b w0, v0[7]
  %vget_lane = extractelement <8 x i8> %a, i32 7
  ret i8 %vget_lane
}

define zeroext i16 @test_vget_lane_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vget_lane_u16:
; CHECK: umov.h w0, v0[3]
  %vget_lane = extractelement <4 x i16> %a, i32 3
  ret i16 %vget_lane
}

define i32 @test_vget_lane_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vget_lane_u32:
; CHECK: mov.s  w0, v0[1]
  %vget_lane = extractelement <2 x i32> %a, i32 1
  ret i32 %vget_lane
}

define signext i8 @test_vget_lane_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vget_lane_s8:
; CHECK: smov.b w0, v0[7]
  %vget_lane = extractelement <8 x i8> %a, i32 7
  ret i8 %vget_lane
}

define signext i16 @test_vget_lane_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vget_lane_s16:
; CHECK: smov.h w0, v0[3]
  %vget_lane = extractelement <4 x i16> %a, i32 3
  ret i16 %vget_lane
}

define i32 @test_vget_lane_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vget_lane_s32:
; CHECK: mov.s  w0, v0[1]
  %vget_lane = extractelement <2 x i32> %a, i32 1
  ret i32 %vget_lane
}

define signext i8 @test_vget_lane_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vget_lane_p8:
; CHECK: smov.b w0, v0[7]
  %vget_lane = extractelement <8 x i8> %a, i32 7
  ret i8 %vget_lane
}

define signext i16 @test_vget_lane_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vget_lane_p16:
; CHECK: smov.h w0, v0[3]
  %vget_lane = extractelement <4 x i16> %a, i32 3
  ret i16 %vget_lane
}

define float @test_vget_lane_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vget_lane_f32:
; CHECK: mov s0, v0[1]
  %vget_lane = extractelement <2 x float> %a, i32 1
  ret float %vget_lane
}

define zeroext i8 @test_vgetq_lane_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_u8:
; CHECK: umov.b w0, v0[15]
  %vget_lane = extractelement <16 x i8> %a, i32 15
  ret i8 %vget_lane
}

define zeroext i16 @test_vgetq_lane_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_u16:
; CHECK: umov.h w0, v0[7]
  %vget_lane = extractelement <8 x i16> %a, i32 7
  ret i16 %vget_lane
}

define i32 @test_vgetq_lane_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_u32:
; CHECK: mov.s  w0, v0[3]
  %vget_lane = extractelement <4 x i32> %a, i32 3
  ret i32 %vget_lane
}

define signext i8 @test_vgetq_lane_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_s8:
; CHECK: smov.b w0, v0[15]
  %vget_lane = extractelement <16 x i8> %a, i32 15
  ret i8 %vget_lane
}

define signext i16 @test_vgetq_lane_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_s16:
; CHECK: smov.h w0, v0[7]
  %vget_lane = extractelement <8 x i16> %a, i32 7
  ret i16 %vget_lane
}

define i32 @test_vgetq_lane_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_s32:
; CHECK: mov.s  w0, v0[3]
  %vget_lane = extractelement <4 x i32> %a, i32 3
  ret i32 %vget_lane
}

define signext i8 @test_vgetq_lane_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_p8:
; CHECK: smov.b w0, v0[15]
  %vget_lane = extractelement <16 x i8> %a, i32 15
  ret i8 %vget_lane
}

define signext i16 @test_vgetq_lane_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_p16:
; CHECK: smov.h w0, v0[7]
  %vget_lane = extractelement <8 x i16> %a, i32 7
  ret i16 %vget_lane
}

define float @test_vgetq_lane_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_f32:
; CHECK: mov s0, v0[3]
  %vget_lane = extractelement <4 x float> %a, i32 3
  ret float %vget_lane
}

define i64 @test_vget_lane_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vget_lane_s64:
; CHECK: fmov x0, d0
  %vget_lane = extractelement <1 x i64> %a, i32 0
  ret i64 %vget_lane
}

define i64 @test_vget_lane_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vget_lane_u64:
; CHECK: fmov x0, d0
  %vget_lane = extractelement <1 x i64> %a, i32 0
  ret i64 %vget_lane
}

define i64 @test_vgetq_lane_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_s64:
; CHECK: mov.d  x0, v0[1]
  %vget_lane = extractelement <2 x i64> %a, i32 1
  ret i64 %vget_lane
}

define i64 @test_vgetq_lane_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vgetq_lane_u64:
; CHECK: mov.d  x0, v0[1]
  %vget_lane = extractelement <2 x i64> %a, i32 1
  ret i64 %vget_lane
}

define <8 x i8> @test_vget_low_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vget_low_s8:
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vget_low_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vget_low_s16:
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i16> %shuffle.i
}

define <2 x i32> @test_vget_low_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vget_low_s32:
  %shuffle.i = shufflevector <4 x i32> %a, <4 x i32> undef, <2 x i32> <i32 0, i32 1>
  ret <2 x i32> %shuffle.i
}

define <1 x i64> @test_vget_low_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vget_low_s64:
  %shuffle.i = shufflevector <2 x i64> %a, <2 x i64> undef, <1 x i32> zeroinitializer
  ret <1 x i64> %shuffle.i
}

define <4 x i16> @test_vget_low_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vget_low_f16:
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i16> %shuffle.i
}

define <2 x float> @test_vget_low_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vget_low_f32:
  %shuffle.i = shufflevector <4 x float> %a, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  ret <2 x float> %shuffle.i
}

define <8 x i8> @test_vget_low_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vget_low_u8:
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vget_low_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vget_low_u16:
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i16> %shuffle.i
}

define <2 x i32> @test_vget_low_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vget_low_u32:
  %shuffle.i = shufflevector <4 x i32> %a, <4 x i32> undef, <2 x i32> <i32 0, i32 1>
  ret <2 x i32> %shuffle.i
}

define <1 x i64> @test_vget_low_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vget_low_u64:
  %shuffle.i = shufflevector <2 x i64> %a, <2 x i64> undef, <1 x i32> zeroinitializer
  ret <1 x i64> %shuffle.i
}

define <8 x i8> @test_vget_low_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vget_low_p8:
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vget_low_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vget_low_p16:
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x i16> %shuffle.i
}

define <8 x i8> @test_vhadd_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vhadd_s8:
; CHECK: shadd.8b v0, v0, v1
  %vhadd_v.i = tail call <8 x i8> @llvm.arm.neon.vhadds.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vhadd_v.i
}

define <4 x i16> @test_vhadd_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vhadd_s16:
; CHECK: shadd.4h v0, v0, v1
  %vhadd_v2.i = tail call <4 x i16> @llvm.arm.neon.vhadds.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vhadd_v2.i
}

define <2 x i32> @test_vhadd_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vhadd_s32:
; CHECK: shadd.2s v0, v0, v1
  %vhadd_v2.i = tail call <2 x i32> @llvm.arm.neon.vhadds.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vhadd_v2.i
}

define <8 x i8> @test_vhadd_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vhadd_u8:
; CHECK: uhadd.8b v0, v0, v1
  %vhadd_v.i = tail call <8 x i8> @llvm.arm.neon.vhaddu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vhadd_v.i
}

define <4 x i16> @test_vhadd_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vhadd_u16:
; CHECK: uhadd.4h v0, v0, v1
  %vhadd_v2.i = tail call <4 x i16> @llvm.arm.neon.vhaddu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vhadd_v2.i
}

define <2 x i32> @test_vhadd_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vhadd_u32:
; CHECK: uhadd.2s v0, v0, v1
  %vhadd_v2.i = tail call <2 x i32> @llvm.arm.neon.vhaddu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vhadd_v2.i
}

define <16 x i8> @test_vhaddq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vhaddq_s8:
; CHECK: shadd.16b v0, v0, v1
  %vhaddq_v.i = tail call <16 x i8> @llvm.arm.neon.vhadds.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vhaddq_v.i
}

define <8 x i16> @test_vhaddq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vhaddq_s16:
; CHECK: shadd.8h v0, v0, v1
  %vhaddq_v2.i = tail call <8 x i16> @llvm.arm.neon.vhadds.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vhaddq_v2.i
}

define <4 x i32> @test_vhaddq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vhaddq_s32:
; CHECK: shadd.4s v0, v0, v1
  %vhaddq_v2.i = tail call <4 x i32> @llvm.arm.neon.vhadds.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vhaddq_v2.i
}

define <16 x i8> @test_vhaddq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vhaddq_u8:
; CHECK: uhadd.16b v0, v0, v1
  %vhaddq_v.i = tail call <16 x i8> @llvm.arm.neon.vhaddu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vhaddq_v.i
}

define <8 x i16> @test_vhaddq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vhaddq_u16:
; CHECK: uhadd.8h v0, v0, v1
  %vhaddq_v2.i = tail call <8 x i16> @llvm.arm.neon.vhaddu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vhaddq_v2.i
}

define <4 x i32> @test_vhaddq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vhaddq_u32:
; CHECK: uhadd.4s v0, v0, v1
  %vhaddq_v2.i = tail call <4 x i32> @llvm.arm.neon.vhaddu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vhaddq_v2.i
}

define <8 x i8> @test_vhsub_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vhsub_s8:
; CHECK: shsub.8b v0, v0, v1
  %vhsub_v.i = tail call <8 x i8> @llvm.arm.neon.vhsubs.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vhsub_v.i
}

define <4 x i16> @test_vhsub_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vhsub_s16:
; CHECK: shsub.4h v0, v0, v1
  %vhsub_v2.i = tail call <4 x i16> @llvm.arm.neon.vhsubs.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vhsub_v2.i
}

define <2 x i32> @test_vhsub_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vhsub_s32:
; CHECK: shsub.2s v0, v0, v1
  %vhsub_v2.i = tail call <2 x i32> @llvm.arm.neon.vhsubs.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vhsub_v2.i
}

define <8 x i8> @test_vhsub_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vhsub_u8:
; CHECK: uhsub.8b v0, v0, v1
  %vhsub_v.i = tail call <8 x i8> @llvm.arm.neon.vhsubu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vhsub_v.i
}

define <4 x i16> @test_vhsub_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vhsub_u16:
; CHECK: uhsub.4h v0, v0, v1
  %vhsub_v2.i = tail call <4 x i16> @llvm.arm.neon.vhsubu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vhsub_v2.i
}

define <2 x i32> @test_vhsub_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vhsub_u32:
; CHECK: uhsub.2s v0, v0, v1
  %vhsub_v2.i = tail call <2 x i32> @llvm.arm.neon.vhsubu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vhsub_v2.i
}

define <16 x i8> @test_vhsubq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vhsubq_s8:
; CHECK: shsub.16b v0, v0, v1
  %vhsubq_v.i = tail call <16 x i8> @llvm.arm.neon.vhsubs.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vhsubq_v.i
}

define <8 x i16> @test_vhsubq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vhsubq_s16:
; CHECK: shsub.8h v0, v0, v1
  %vhsubq_v2.i = tail call <8 x i16> @llvm.arm.neon.vhsubs.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vhsubq_v2.i
}

define <4 x i32> @test_vhsubq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vhsubq_s32:
; CHECK: shsub.4s v0, v0, v1
  %vhsubq_v2.i = tail call <4 x i32> @llvm.arm.neon.vhsubs.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vhsubq_v2.i
}

define <16 x i8> @test_vhsubq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vhsubq_u8:
; CHECK: uhsub.16b v0, v0, v1
  %vhsubq_v.i = tail call <16 x i8> @llvm.arm.neon.vhsubu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vhsubq_v.i
}

define <8 x i16> @test_vhsubq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vhsubq_u16:
; CHECK: uhsub.8h v0, v0, v1
  %vhsubq_v2.i = tail call <8 x i16> @llvm.arm.neon.vhsubu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vhsubq_v2.i
}

define <4 x i32> @test_vhsubq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vhsubq_u32:
; CHECK: uhsub.4s v0, v0, v1
  %vhsubq_v2.i = tail call <4 x i32> @llvm.arm.neon.vhsubu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vhsubq_v2.i
}

define <16 x i8> @test_vld1q_u8(i8* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_u8:
; CHECK: ldr  q0, [x0]
  %vld1 = tail call <16 x i8> @llvm.arm.neon.vld1.v16i8(i8* %a, i32 1)
  ret <16 x i8> %vld1
}

declare <16 x i8> @llvm.arm.neon.vld1.v16i8(i8*, i32) #3

define <8 x i16> @test_vld1q_u16(i16* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_u16:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld1 = tail call <8 x i16> @llvm.arm.neon.vld1.v8i16(i8* %t0, i32 2)
  ret <8 x i16> %vld1
}

declare <8 x i16> @llvm.arm.neon.vld1.v8i16(i8*, i32) #3

define <4 x i32> @test_vld1q_u32(i32* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_u32:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld1 = tail call <4 x i32> @llvm.arm.neon.vld1.v4i32(i8* %t0, i32 4)
  ret <4 x i32> %vld1
}

declare <4 x i32> @llvm.arm.neon.vld1.v4i32(i8*, i32) #3

define <2 x i64> @test_vld1q_u64(i64* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_u64:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld1 = tail call <2 x i64> @llvm.arm.neon.vld1.v2i64(i8* %t0, i32 8)
  ret <2 x i64> %vld1
}

declare <2 x i64> @llvm.arm.neon.vld1.v2i64(i8*, i32) #3

define <16 x i8> @test_vld1q_s8(i8* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_s8:
; CHECK: ldr  q0, [x0]
  %vld1 = tail call <16 x i8> @llvm.arm.neon.vld1.v16i8(i8* %a, i32 1)
  ret <16 x i8> %vld1
}

define <8 x i16> @test_vld1q_s16(i16* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_s16:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld1 = tail call <8 x i16> @llvm.arm.neon.vld1.v8i16(i8* %t0, i32 2)
  ret <8 x i16> %vld1
}

define <4 x i32> @test_vld1q_s32(i32* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_s32:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld1 = tail call <4 x i32> @llvm.arm.neon.vld1.v4i32(i8* %t0, i32 4)
  ret <4 x i32> %vld1
}

define <2 x i64> @test_vld1q_s64(i64* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_s64:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld1 = tail call <2 x i64> @llvm.arm.neon.vld1.v2i64(i8* %t0, i32 8)
  ret <2 x i64> %vld1
}

define <8 x i16> @test_vld1q_f16(i16* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_f16:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld1 = tail call <8 x i16> @llvm.arm.neon.vld1.v8i16(i8* %t0, i32 2)
  ret <8 x i16> %vld1
}

define <4 x float> @test_vld1q_f32(float* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_f32:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast float* %a to i8*
  %vld1 = tail call <4 x float> @llvm.arm.neon.vld1.v4f32(i8* %t0, i32 4)
  ret <4 x float> %vld1
}

declare <4 x float> @llvm.arm.neon.vld1.v4f32(i8*, i32) #3

define <16 x i8> @test_vld1q_p8(i8* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_p8:
; CHECK: ldr  q0, [x0]
  %vld1 = tail call <16 x i8> @llvm.arm.neon.vld1.v16i8(i8* %a, i32 1)
  ret <16 x i8> %vld1
}

define <8 x i16> @test_vld1q_p16(i16* readonly %a) #2 {
; CHECK-LABEL: test_vld1q_p16:
; CHECK: ldr  q0, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld1 = tail call <8 x i16> @llvm.arm.neon.vld1.v8i16(i8* %t0, i32 2)
  ret <8 x i16> %vld1
}

define <8 x i8> @test_vld1_u8(i8* readonly %a) #2 {
; CHECK-LABEL: test_vld1_u8:
; CHECK: ldr  d0, [x0]
  %vld1 = tail call <8 x i8> @llvm.arm.neon.vld1.v8i8(i8* %a, i32 1)
  ret <8 x i8> %vld1
}

declare <8 x i8> @llvm.arm.neon.vld1.v8i8(i8*, i32) #3

define <4 x i16> @test_vld1_u16(i16* readonly %a) #2 {
; CHECK-LABEL: test_vld1_u16:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld1 = tail call <4 x i16> @llvm.arm.neon.vld1.v4i16(i8* %t0, i32 2)
  ret <4 x i16> %vld1
}

declare <4 x i16> @llvm.arm.neon.vld1.v4i16(i8*, i32) #3

define <2 x i32> @test_vld1_u32(i32* readonly %a) #2 {
; CHECK-LABEL: test_vld1_u32:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld1 = tail call <2 x i32> @llvm.arm.neon.vld1.v2i32(i8* %t0, i32 4)
  ret <2 x i32> %vld1
}

declare <2 x i32> @llvm.arm.neon.vld1.v2i32(i8*, i32) #3

define <1 x i64> @test_vld1_u64(i64* readonly %a) #2 {
; CHECK-LABEL: test_vld1_u64:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld1 = tail call <1 x i64> @llvm.arm.neon.vld1.v1i64(i8* %t0, i32 8)
  ret <1 x i64> %vld1
}

declare <1 x i64> @llvm.arm.neon.vld1.v1i64(i8*, i32) #3

define <8 x i8> @test_vld1_s8(i8* readonly %a) #2 {
; CHECK-LABEL: test_vld1_s8:
; CHECK: ldr  d0, [x0]
  %vld1 = tail call <8 x i8> @llvm.arm.neon.vld1.v8i8(i8* %a, i32 1)
  ret <8 x i8> %vld1
}

define <4 x i16> @test_vld1_s16(i16* readonly %a) #2 {
; CHECK-LABEL: test_vld1_s16:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld1 = tail call <4 x i16> @llvm.arm.neon.vld1.v4i16(i8* %t0, i32 2)
  ret <4 x i16> %vld1
}

define <2 x i32> @test_vld1_s32(i32* readonly %a) #2 {
; CHECK-LABEL: test_vld1_s32:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld1 = tail call <2 x i32> @llvm.arm.neon.vld1.v2i32(i8* %t0, i32 4)
  ret <2 x i32> %vld1
}

define <1 x i64> @test_vld1_s64(i64* readonly %a) #2 {
; CHECK-LABEL: test_vld1_s64:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld1 = tail call <1 x i64> @llvm.arm.neon.vld1.v1i64(i8* %t0, i32 8)
  ret <1 x i64> %vld1
}

define <4 x i16> @test_vld1_f16(i16* readonly %a) #2 {
; CHECK-LABEL: test_vld1_f16:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld1 = tail call <4 x i16> @llvm.arm.neon.vld1.v4i16(i8* %t0, i32 2)
  ret <4 x i16> %vld1
}

define <2 x float> @test_vld1_f32(float* readonly %a) #2 {
; CHECK-LABEL: test_vld1_f32:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast float* %a to i8*
  %vld1 = tail call <2 x float> @llvm.arm.neon.vld1.v2f32(i8* %t0, i32 4)
  ret <2 x float> %vld1
}

declare <2 x float> @llvm.arm.neon.vld1.v2f32(i8*, i32) #3

define <8 x i8> @test_vld1_p8(i8* readonly %a) #2 {
; CHECK-LABEL: test_vld1_p8:
; CHECK: ldr  d0, [x0]
  %vld1 = tail call <8 x i8> @llvm.arm.neon.vld1.v8i8(i8* %a, i32 1)
  ret <8 x i8> %vld1
}

define <4 x i16> @test_vld1_p16(i16* readonly %a) #2 {
; CHECK-LABEL: test_vld1_p16:
; CHECK: ldr  d0, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld1 = tail call <4 x i16> @llvm.arm.neon.vld1.v4i16(i8* %t0, i32 2)
  ret <4 x i16> %vld1
}

define <16 x i8> @test_vld1q_dup_u8(i8* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_u8:
; CHECK: ld1r.16b { v0 }, [x0]
  %t0 = load i8, i8* %a, align 1
  %t1 = insertelement <16 x i8> undef, i8 %t0, i32 0
  %lane = shufflevector <16 x i8> %t1, <16 x i8> undef, <16 x i32> zeroinitializer
  ret <16 x i8> %lane
}

define <8 x i16> @test_vld1q_dup_u16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_u16:
; CHECK: ld1r.8h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %t1 = insertelement <8 x i16> undef, i16 %t0, i32 0
  %lane = shufflevector <8 x i16> %t1, <8 x i16> undef, <8 x i32> zeroinitializer
  ret <8 x i16> %lane
}

define <4 x i32> @test_vld1q_dup_u32(i32* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_u32:
; CHECK: ld1r.4s { v0 }, [x0]
  %t0 = load i32, i32* %a, align 4
  %t1 = insertelement <4 x i32> undef, i32 %t0, i32 0
  %lane = shufflevector <4 x i32> %t1, <4 x i32> undef, <4 x i32> zeroinitializer
  ret <4 x i32> %lane
}

define <2 x i64> @test_vld1q_dup_u64(i64* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_u64:
; CHECK: ld1r.2d { v0 }, [x0]
  %t0 = load i64, i64* %a, align 8
  %t1 = insertelement <2 x i64> undef, i64 %t0, i32 0
  %lane = shufflevector <2 x i64> %t1, <2 x i64> undef, <2 x i32> zeroinitializer
  ret <2 x i64> %lane
}

define <16 x i8> @test_vld1q_dup_s8(i8* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_s8:
; CHECK: ld1r.16b { v0 }, [x0]
  %t0 = load i8, i8* %a, align 1
  %t1 = insertelement <16 x i8> undef, i8 %t0, i32 0
  %lane = shufflevector <16 x i8> %t1, <16 x i8> undef, <16 x i32> zeroinitializer
  ret <16 x i8> %lane
}

define <8 x i16> @test_vld1q_dup_s16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_s16:
; CHECK: ld1r.8h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %t1 = insertelement <8 x i16> undef, i16 %t0, i32 0
  %lane = shufflevector <8 x i16> %t1, <8 x i16> undef, <8 x i32> zeroinitializer
  ret <8 x i16> %lane
}

define <4 x i32> @test_vld1q_dup_s32(i32* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_s32:
; CHECK: ld1r.4s { v0 }, [x0]
  %t0 = load i32, i32* %a, align 4
  %t1 = insertelement <4 x i32> undef, i32 %t0, i32 0
  %lane = shufflevector <4 x i32> %t1, <4 x i32> undef, <4 x i32> zeroinitializer
  ret <4 x i32> %lane
}

define <2 x i64> @test_vld1q_dup_s64(i64* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_s64:
; CHECK: ld1r.2d { v0 }, [x0]
  %t0 = load i64, i64* %a, align 8
  %t1 = insertelement <2 x i64> undef, i64 %t0, i32 0
  %lane = shufflevector <2 x i64> %t1, <2 x i64> undef, <2 x i32> zeroinitializer
  ret <2 x i64> %lane
}

define <8 x i16> @test_vld1q_dup_f16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_f16:
; CHECK: ld1r.8h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %t1 = insertelement <8 x i16> undef, i16 %t0, i32 0
  %lane = shufflevector <8 x i16> %t1, <8 x i16> undef, <8 x i32> zeroinitializer
  ret <8 x i16> %lane
}

define <4 x float> @test_vld1q_dup_f32(float* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_f32:
; CHECK: ld1r.4s { v0 }, [x0]
  %t0 = load float, float* %a, align 4
  %t1 = insertelement <4 x float> undef, float %t0, i32 0
  %lane = shufflevector <4 x float> %t1, <4 x float> undef, <4 x i32> zeroinitializer
  ret <4 x float> %lane
}

define <16 x i8> @test_vld1q_dup_p8(i8* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_p8:
; CHECK: ld1r.16b { v0 }, [x0]
  %t0 = load i8, i8* %a, align 1
  %t1 = insertelement <16 x i8> undef, i8 %t0, i32 0
  %lane = shufflevector <16 x i8> %t1, <16 x i8> undef, <16 x i32> zeroinitializer
  ret <16 x i8> %lane
}

define <8 x i16> @test_vld1q_dup_p16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1q_dup_p16:
; CHECK: ld1r.8h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %t1 = insertelement <8 x i16> undef, i16 %t0, i32 0
  %lane = shufflevector <8 x i16> %t1, <8 x i16> undef, <8 x i32> zeroinitializer
  ret <8 x i16> %lane
}

define <8 x i8> @test_vld1_dup_u8(i8* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_u8:
; CHECK: ld1r.8b { v0 }, [x0]
  %t0 = load i8, i8* %a, align 1
  %t1 = insertelement <8 x i8> undef, i8 %t0, i32 0
  %lane = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  ret <8 x i8> %lane
}

define <4 x i16> @test_vld1_dup_u16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_u16:
; CHECK: ld1r.4h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %t1 = insertelement <4 x i16> undef, i16 %t0, i32 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  ret <4 x i16> %lane
}

define <2 x i32> @test_vld1_dup_u32(i32* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_u32:
; CHECK: ld1r.2s { v0 }, [x0]
  %t0 = load i32, i32* %a, align 4
  %t1 = insertelement <2 x i32> undef, i32 %t0, i32 0
  %lane = shufflevector <2 x i32> %t1, <2 x i32> undef, <2 x i32> zeroinitializer
  ret <2 x i32> %lane
}

define <1 x i64> @test_vld1_dup_u64(i64* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_u64:
; CHECK: ldr  d0, [x0]
  %t0 = load i64, i64* %a, align 8
  %t1 = insertelement <1 x i64> undef, i64 %t0, i32 0
  ret <1 x i64> %t1
}

define <8 x i8> @test_vld1_dup_s8(i8* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_s8:
; CHECK: ld1r.8b { v0 }, [x0]
  %t0 = load i8, i8* %a, align 1
  %t1 = insertelement <8 x i8> undef, i8 %t0, i32 0
  %lane = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  ret <8 x i8> %lane
}

define <4 x i16> @test_vld1_dup_s16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_s16:
; CHECK: ld1r.4h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %t1 = insertelement <4 x i16> undef, i16 %t0, i32 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  ret <4 x i16> %lane
}

define <2 x i32> @test_vld1_dup_s32(i32* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_s32:
; CHECK: ld1r.2s { v0 }, [x0]
  %t0 = load i32, i32* %a, align 4
  %t1 = insertelement <2 x i32> undef, i32 %t0, i32 0
  %lane = shufflevector <2 x i32> %t1, <2 x i32> undef, <2 x i32> zeroinitializer
  ret <2 x i32> %lane
}

define <1 x i64> @test_vld1_dup_s64(i64* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_s64:
; CHECK: ldr  d0, [x0]
  %t0 = load i64, i64* %a, align 8
  %t1 = insertelement <1 x i64> undef, i64 %t0, i32 0
  ret <1 x i64> %t1
}

define <4 x i16> @test_vld1_dup_f16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_f16:
; CHECK: ld1r.4h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %t1 = insertelement <4 x i16> undef, i16 %t0, i32 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  ret <4 x i16> %lane
}

define <2 x float> @test_vld1_dup_f32(float* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_f32:
; CHECK: ld1r.2s { v0 }, [x0]
  %t0 = load float, float* %a, align 4
  %t1 = insertelement <2 x float> undef, float %t0, i32 0
  %lane = shufflevector <2 x float> %t1, <2 x float> undef, <2 x i32> zeroinitializer
  ret <2 x float> %lane
}

define <8 x i8> @test_vld1_dup_p8(i8* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_p8:
; CHECK: ld1r.8b { v0 }, [x0]
  %t0 = load i8, i8* %a, align 1
  %t1 = insertelement <8 x i8> undef, i8 %t0, i32 0
  %lane = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  ret <8 x i8> %lane
}

define <4 x i16> @test_vld1_dup_p16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vld1_dup_p16:
; CHECK: ld1r.4h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %t1 = insertelement <4 x i16> undef, i16 %t0, i32 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  ret <4 x i16> %lane
}

define <16 x i8> @test_vld1q_lane_u8(i8* nocapture readonly %a, <16 x i8> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_u8:
; CHECK: ld1.b { v0 }[15], [x0]
  %t0 = load i8, i8* %a, align 1
  %vld1_lane = insertelement <16 x i8> %b, i8 %t0, i32 15
  ret <16 x i8> %vld1_lane
}

define <8 x i16> @test_vld1q_lane_u16(i16* nocapture readonly %a, <8 x i16> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_u16:
; CHECK: ld1.h { v0 }[7], [x0]
  %t0 = load i16, i16* %a, align 2
  %vld1_lane = insertelement <8 x i16> %b, i16 %t0, i32 7
  ret <8 x i16> %vld1_lane
}

define <4 x i32> @test_vld1q_lane_u32(i32* nocapture readonly %a, <4 x i32> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_u32:
; CHECK: ld1.s { v0 }[3], [x0]
  %t0 = load i32, i32* %a, align 4
  %vld1_lane = insertelement <4 x i32> %b, i32 %t0, i32 3
  ret <4 x i32> %vld1_lane
}

define <2 x i64> @test_vld1q_lane_u64(i64* %a, <2 x i64> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_u64:
; CHECK: ldr  d1, [x0]
; CHECK: mov.d v0[1], v1[0]
  %t0 = bitcast i64* %a to i8*
  %t1 = shufflevector <2 x i64> %b, <2 x i64> undef, <1 x i32> zeroinitializer
  %t2 = tail call <1 x i64> @llvm.arm.neon.vld1.v1i64(i8* %t0, i32 8)
  %vld1q_lane = shufflevector <1 x i64> %t1, <1 x i64> %t2, <2 x i32> <i32 0, i32 1>
  ret <2 x i64> %vld1q_lane
}

define <16 x i8> @test_vld1q_lane_s8(i8* nocapture readonly %a, <16 x i8> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_s8:
; CHECK: ld1.b { v0 }[15], [x0]
  %t0 = load i8, i8* %a, align 1
  %vld1_lane = insertelement <16 x i8> %b, i8 %t0, i32 15
  ret <16 x i8> %vld1_lane
}

define <8 x i16> @test_vld1q_lane_s16(i16* nocapture readonly %a, <8 x i16> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_s16:
; CHECK: ld1.h { v0 }[7], [x0]
  %t0 = load i16, i16* %a, align 2
  %vld1_lane = insertelement <8 x i16> %b, i16 %t0, i32 7
  ret <8 x i16> %vld1_lane
}

define <4 x i32> @test_vld1q_lane_s32(i32* nocapture readonly %a, <4 x i32> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_s32:
; CHECK: ld1.s { v0 }[3], [x0]
  %t0 = load i32, i32* %a, align 4
  %vld1_lane = insertelement <4 x i32> %b, i32 %t0, i32 3
  ret <4 x i32> %vld1_lane
}

define <2 x i64> @test_vld1q_lane_s64(i64* %a, <2 x i64> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_s64:
; CHECK: mov.d v0[1], v1[0]
  %t0 = bitcast i64* %a to i8*
  %t1 = shufflevector <2 x i64> %b, <2 x i64> undef, <1 x i32> zeroinitializer
  %t2 = tail call <1 x i64> @llvm.arm.neon.vld1.v1i64(i8* %t0, i32 8)
  %vld1q_lane = shufflevector <1 x i64> %t1, <1 x i64> %t2, <2 x i32> <i32 0, i32 1>
  ret <2 x i64> %vld1q_lane
}

define <8 x i16> @test_vld1q_lane_f16(i16* nocapture readonly %a, <8 x i16> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_f16:
; CHECK: ld1.h { v0 }[7], [x0]
  %t0 = load i16, i16* %a, align 2
  %vld1_lane = insertelement <8 x i16> %b, i16 %t0, i32 7
  ret <8 x i16> %vld1_lane
}

define <4 x float> @test_vld1q_lane_f32(float* nocapture readonly %a, <4 x float> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_f32:
; CHECK: ld1.s { v0 }[3], [x0]
  %t0 = load float, float* %a, align 4
  %vld1_lane = insertelement <4 x float> %b, float %t0, i32 3
  ret <4 x float> %vld1_lane
}

define <16 x i8> @test_vld1q_lane_p8(i8* nocapture readonly %a, <16 x i8> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_p8:
; CHECK: ld1.b { v0 }[15], [x0]
  %t0 = load i8, i8* %a, align 1
  %vld1_lane = insertelement <16 x i8> %b, i8 %t0, i32 15
  ret <16 x i8> %vld1_lane
}

define <8 x i16> @test_vld1q_lane_p16(i16* nocapture readonly %a, <8 x i16> %b) #2 {
; CHECK-LABEL: test_vld1q_lane_p16:
; CHECK: ld1.h { v0 }[7], [x0]
  %t0 = load i16, i16* %a, align 2
  %vld1_lane = insertelement <8 x i16> %b, i16 %t0, i32 7
  ret <8 x i16> %vld1_lane
}

define <8 x i8> @test_vld1_lane_u8(i8* nocapture readonly %a, <8 x i8> %b) #2 {
; CHECK-LABEL: test_vld1_lane_u8:
; CHECK: ld1.b { v0 }[7], [x0]
  %t0 = load i8, i8* %a, align 1
  %vld1_lane = insertelement <8 x i8> %b, i8 %t0, i32 7
  ret <8 x i8> %vld1_lane
}

define <4 x i16> @test_vld1_lane_u16(i16* nocapture readonly %a, <4 x i16> %b) #2 {
; CHECK-LABEL: test_vld1_lane_u16:
; CHECK: ld1.h { v0 }[3], [x0]
  %t0 = load i16, i16* %a, align 2
  %vld1_lane = insertelement <4 x i16> %b, i16 %t0, i32 3
  ret <4 x i16> %vld1_lane
}

define <2 x i32> @test_vld1_lane_u32(i32* nocapture readonly %a, <2 x i32> %b) #2 {
; CHECK-LABEL: test_vld1_lane_u32:
; CHECK: ld1.s { v0 }[1], [x0]
  %t0 = load i32, i32* %a, align 4
  %vld1_lane = insertelement <2 x i32> %b, i32 %t0, i32 1
  ret <2 x i32> %vld1_lane
}

define <1 x i64> @test_vld1_lane_u64(i64* nocapture readonly %a, <1 x i64> %b) #2 {
; CHECK-LABEL: test_vld1_lane_u64:
; CHECK: ldr  d0, [x0]
  %t0 = load i64, i64* %a, align 8
  %vld1_lane = insertelement <1 x i64> undef, i64 %t0, i32 0
  ret <1 x i64> %vld1_lane
}

define <8 x i8> @test_vld1_lane_s8(i8* nocapture readonly %a, <8 x i8> %b) #2 {
; CHECK-LABEL: test_vld1_lane_s8:
; CHECK: ld1.b { v0 }[7], [x0]
  %t0 = load i8, i8* %a, align 1
  %vld1_lane = insertelement <8 x i8> %b, i8 %t0, i32 7
  ret <8 x i8> %vld1_lane
}

define <4 x i16> @test_vld1_lane_s16(i16* nocapture readonly %a, <4 x i16> %b) #2 {
; CHECK-LABEL: test_vld1_lane_s16:
; CHECK: ld1.h { v0 }[3], [x0]
  %t0 = load i16, i16* %a, align 2
  %vld1_lane = insertelement <4 x i16> %b, i16 %t0, i32 3
  ret <4 x i16> %vld1_lane
}

define <2 x i32> @test_vld1_lane_s32(i32* nocapture readonly %a, <2 x i32> %b) #2 {
; CHECK-LABEL: test_vld1_lane_s32:
; CHECK: ld1.s { v0 }[1], [x0]
  %t0 = load i32, i32* %a, align 4
  %vld1_lane = insertelement <2 x i32> %b, i32 %t0, i32 1
  ret <2 x i32> %vld1_lane
}

define <1 x i64> @test_vld1_lane_s64(i64* nocapture readonly %a, <1 x i64> %b) #2 {
; CHECK-LABEL: test_vld1_lane_s64:
; CHECK: ldr  d0, [x0]
  %t0 = load i64, i64* %a, align 8
  %vld1_lane = insertelement <1 x i64> undef, i64 %t0, i32 0
  ret <1 x i64> %vld1_lane
}

define <4 x i16> @test_vld1_lane_f16(i16* nocapture readonly %a, <4 x i16> %b) #2 {
; CHECK-LABEL: test_vld1_lane_f16:
; CHECK: ld1.h { v0 }[3], [x0]
  %t0 = load i16, i16* %a, align 2
  %vld1_lane = insertelement <4 x i16> %b, i16 %t0, i32 3
  ret <4 x i16> %vld1_lane
}

define <2 x float> @test_vld1_lane_f32(float* nocapture readonly %a, <2 x float> %b) #2 {
; CHECK-LABEL: test_vld1_lane_f32:
; CHECK: ld1.s { v0 }[1], [x0]
  %t0 = load float, float* %a, align 4
  %vld1_lane = insertelement <2 x float> %b, float %t0, i32 1
  ret <2 x float> %vld1_lane
}

define <8 x i8> @test_vld1_lane_p8(i8* nocapture readonly %a, <8 x i8> %b) #2 {
; CHECK-LABEL: test_vld1_lane_p8:
; CHECK: ld1.b  { v0 }[7], [x0]
  %t0 = load i8, i8* %a, align 1
  %vld1_lane = insertelement <8 x i8> %b, i8 %t0, i32 7
  ret <8 x i8> %vld1_lane
}

define <4 x i16> @test_vld1_lane_p16(i16* nocapture readonly %a, <4 x i16> %b) #2 {
; CHECK-LABEL: test_vld1_lane_p16:
; CHECK: ld1.h { v0 }[3], [x0]
  %t0 = load i16, i16* %a, align 2
  %vld1_lane = insertelement <4 x i16> %b, i16 %t0, i32 3
  ret <4 x i16> %vld1_lane
}

define %struct.uint8x16x2_t @test_vld2q_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld2q_u8:
; CHECK: ld2.16b { v0, v1 }, [x0]
  %vld2q_v = tail call { <16 x i8>, <16 x i8> } @llvm.arm.neon.vld2.v16i8(i8* %a, i32 1)
  %vld2q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint8x16x2_t undef, <16 x i8> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x16x2_t %.fca.0.0.insert, <16 x i8> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.uint8x16x2_t %.fca.0.1.insert
}

declare { <16 x i8>, <16 x i8> } @llvm.arm.neon.vld2.v16i8(i8*, i32) #3

define %struct.uint16x8x2_t @test_vld2q_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld2q_u16:
; CHECK: ld2.8h { v0, v1 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld2q_v = tail call { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2.v8i16(i8* %t0, i32 2)
  %vld2q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint16x8x2_t undef, <8 x i16> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x2_t %.fca.0.0.insert, <8 x i16> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.uint16x8x2_t %.fca.0.1.insert
}

declare { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2.v8i16(i8*, i32) #3

define %struct.uint32x4x2_t @test_vld2q_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld2q_u32:
; CHECK: ld2.4s { v0, v1 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld2q_v = tail call { <4 x i32>, <4 x i32> } @llvm.arm.neon.vld2.v4i32(i8* %t0, i32 4)
  %vld2q_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint32x4x2_t undef, <4 x i32> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x2_t %.fca.0.0.insert, <4 x i32> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.uint32x4x2_t %.fca.0.1.insert
}

declare { <4 x i32>, <4 x i32> } @llvm.arm.neon.vld2.v4i32(i8*, i32) #3

define %struct.int8x16x2_t @test_vld2q_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld2q_s8:
; CHECK: ld2.16b { v0, v1 }, [x0]
  %vld2q_v = tail call { <16 x i8>, <16 x i8> } @llvm.arm.neon.vld2.v16i8(i8* %a, i32 1)
  %vld2q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.int8x16x2_t undef, <16 x i8> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x16x2_t %.fca.0.0.insert, <16 x i8> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.int8x16x2_t %.fca.0.1.insert
}

define %struct.int16x8x2_t @test_vld2q_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld2q_s16:
; CHECK: ld2.8h { v0, v1 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld2q_v = tail call { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2.v8i16(i8* %t0, i32 2)
  %vld2q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.int16x8x2_t undef, <8 x i16> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x2_t %.fca.0.0.insert, <8 x i16> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.int16x8x2_t %.fca.0.1.insert
}

define %struct.int32x4x2_t @test_vld2q_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld2q_s32:
; CHECK: ld2.4s { v0, v1 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld2q_v = tail call { <4 x i32>, <4 x i32> } @llvm.arm.neon.vld2.v4i32(i8* %t0, i32 4)
  %vld2q_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.int32x4x2_t undef, <4 x i32> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x2_t %.fca.0.0.insert, <4 x i32> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.int32x4x2_t %.fca.0.1.insert
}

define %struct.float16x8x2_t @test_vld2q_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld2q_f16:
; CHECK: ld2.8h { v0, v1 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld2q_v = tail call { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2.v8i16(i8* %t0, i32 2)
  %vld2q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.float16x8x2_t undef, <8 x i16> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x8x2_t %.fca.0.0.insert, <8 x i16> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.float16x8x2_t %.fca.0.1.insert
}

define %struct.float32x4x2_t @test_vld2q_f32(float* %a) #2 {
; CHECK-LABEL: test_vld2q_f32:
; CHECK: ld2.4s { v0, v1 }, [x0]
  %t0 = bitcast float* %a to i8*
  %vld2q_v = tail call { <4 x float>, <4 x float> } @llvm.arm.neon.vld2.v4f32(i8* %t0, i32 4)
  %vld2q_v.fca.0.extract = extractvalue { <4 x float>, <4 x float> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <4 x float>, <4 x float> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.float32x4x2_t undef, <4 x float> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x2_t %.fca.0.0.insert, <4 x float> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.float32x4x2_t %.fca.0.1.insert
}

declare { <4 x float>, <4 x float> } @llvm.arm.neon.vld2.v4f32(i8*, i32) #3

define %struct.poly8x16x2_t @test_vld2q_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld2q_p8:
; CHECK: ld2.16b { v0, v1 }, [x0]
  %vld2q_v = tail call { <16 x i8>, <16 x i8> } @llvm.arm.neon.vld2.v16i8(i8* %a, i32 1)
  %vld2q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.poly8x16x2_t undef, <16 x i8> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x16x2_t %.fca.0.0.insert, <16 x i8> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.poly8x16x2_t %.fca.0.1.insert
}

define %struct.poly16x8x2_t @test_vld2q_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld2q_p16:
; CHECK: ld2.8h { v0, v1 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld2q_v = tail call { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2.v8i16(i8* %t0, i32 2)
  %vld2q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_v, 0
  %vld2q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_v, 1
  %.fca.0.0.insert = insertvalue %struct.poly16x8x2_t undef, <8 x i16> %vld2q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x2_t %.fca.0.0.insert, <8 x i16> %vld2q_v.fca.1.extract, 0, 1
  ret %struct.poly16x8x2_t %.fca.0.1.insert
}

define %struct.uint8x8x2_t @test_vld2_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld2_u8:
; CHECK: ld2.8b { v0, v1 }, [x0]
  %vld2_v = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2.v8i8(i8* %a, i32 1)
  %vld2_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint8x8x2_t undef, <8 x i8> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x2_t %.fca.0.0.insert, <8 x i8> %vld2_v.fca.1.extract, 0, 1
  ret %struct.uint8x8x2_t %.fca.0.1.insert
}

declare { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2.v8i8(i8*, i32) #3

define %struct.uint16x4x2_t @test_vld2_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld2_u16:
; CHECK: ld2.4h { v0, v1 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld2_v = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2.v4i16(i8* %t0, i32 2)
  %vld2_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint16x4x2_t undef, <4 x i16> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x2_t %.fca.0.0.insert, <4 x i16> %vld2_v.fca.1.extract, 0, 1
  ret %struct.uint16x4x2_t %.fca.0.1.insert
}

declare { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2.v4i16(i8*, i32) #3

define %struct.uint32x2x2_t @test_vld2_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld2_u32:
; CHECK: ld2.2s { v0, v1 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld2_v = tail call { <2 x i32>, <2 x i32> } @llvm.arm.neon.vld2.v2i32(i8* %t0, i32 4)
  %vld2_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint32x2x2_t undef, <2 x i32> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x2_t %.fca.0.0.insert, <2 x i32> %vld2_v.fca.1.extract, 0, 1
  ret %struct.uint32x2x2_t %.fca.0.1.insert
}

declare { <2 x i32>, <2 x i32> } @llvm.arm.neon.vld2.v2i32(i8*, i32) #3

define %struct.uint64x1x2_t @test_vld2_u64(i64* %a) #2 {
; CHECK-LABEL: test_vld2_u64:
; CHECK: ld1.1d { v0, v1 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld2_v = tail call { <1 x i64>, <1 x i64> } @llvm.arm.neon.vld2.v1i64(i8* %t0, i32 8)
  %vld2_v.fca.0.extract = extractvalue { <1 x i64>, <1 x i64> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <1 x i64>, <1 x i64> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint64x1x2_t undef, <1 x i64> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint64x1x2_t %.fca.0.0.insert, <1 x i64> %vld2_v.fca.1.extract, 0, 1
  ret %struct.uint64x1x2_t %.fca.0.1.insert
}

declare { <1 x i64>, <1 x i64> } @llvm.arm.neon.vld2.v1i64(i8*, i32) #3

define %struct.int8x8x2_t @test_vld2_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld2_s8:
; CHECK: ld2.8b { v0, v1 }, [x0]
  %vld2_v = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2.v8i8(i8* %a, i32 1)
  %vld2_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.int8x8x2_t undef, <8 x i8> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x2_t %.fca.0.0.insert, <8 x i8> %vld2_v.fca.1.extract, 0, 1
  ret %struct.int8x8x2_t %.fca.0.1.insert
}

define %struct.int16x4x2_t @test_vld2_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld2_s16:
; CHECK: ld2.4h { v0, v1 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld2_v = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2.v4i16(i8* %t0, i32 2)
  %vld2_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.int16x4x2_t undef, <4 x i16> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x2_t %.fca.0.0.insert, <4 x i16> %vld2_v.fca.1.extract, 0, 1
  ret %struct.int16x4x2_t %.fca.0.1.insert
}

define %struct.int32x2x2_t @test_vld2_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld2_s32:
; CHECK: ld2.2s { v0, v1 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld2_v = tail call { <2 x i32>, <2 x i32> } @llvm.arm.neon.vld2.v2i32(i8* %t0, i32 4)
  %vld2_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.int32x2x2_t undef, <2 x i32> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x2_t %.fca.0.0.insert, <2 x i32> %vld2_v.fca.1.extract, 0, 1
  ret %struct.int32x2x2_t %.fca.0.1.insert
}

define %struct.int64x1x2_t @test_vld2_s64(i64* %a) #2 {
; CHECK-LABEL: test_vld2_s64:
; CHECK: ld1.1d { v0, v1 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld2_v = tail call { <1 x i64>, <1 x i64> } @llvm.arm.neon.vld2.v1i64(i8* %t0, i32 8)
  %vld2_v.fca.0.extract = extractvalue { <1 x i64>, <1 x i64> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <1 x i64>, <1 x i64> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.int64x1x2_t undef, <1 x i64> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int64x1x2_t %.fca.0.0.insert, <1 x i64> %vld2_v.fca.1.extract, 0, 1
  ret %struct.int64x1x2_t %.fca.0.1.insert
}

define %struct.float16x4x2_t @test_vld2_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld2_f16:
; CHECK: ld2.4h { v0, v1 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld2_v = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2.v4i16(i8* %t0, i32 2)
  %vld2_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.float16x4x2_t undef, <4 x i16> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x2_t %.fca.0.0.insert, <4 x i16> %vld2_v.fca.1.extract, 0, 1
  ret %struct.float16x4x2_t %.fca.0.1.insert
}

define %struct.float32x2x2_t @test_vld2_f32(float* %a) #2 {
; CHECK-LABEL: test_vld2_f32:
; CHECK: ld2.2s { v0, v1 }, [x0]
  %t0 = bitcast float* %a to i8*
  %vld2_v = tail call { <2 x float>, <2 x float> } @llvm.arm.neon.vld2.v2f32(i8* %t0, i32 4)
  %vld2_v.fca.0.extract = extractvalue { <2 x float>, <2 x float> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <2 x float>, <2 x float> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.float32x2x2_t undef, <2 x float> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x2_t %.fca.0.0.insert, <2 x float> %vld2_v.fca.1.extract, 0, 1
  ret %struct.float32x2x2_t %.fca.0.1.insert
}

declare { <2 x float>, <2 x float> } @llvm.arm.neon.vld2.v2f32(i8*, i32) #3

define %struct.poly8x8x2_t @test_vld2_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld2_p8:
; CHECK: ld2.8b { v0, v1 }, [x0]
  %vld2_v = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2.v8i8(i8* %a, i32 1)
  %vld2_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.poly8x8x2_t undef, <8 x i8> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x2_t %.fca.0.0.insert, <8 x i8> %vld2_v.fca.1.extract, 0, 1
  ret %struct.poly8x8x2_t %.fca.0.1.insert
}

define %struct.poly16x4x2_t @test_vld2_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld2_p16:
; CHECK: ld2.4h { v0, v1 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld2_v = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2.v4i16(i8* %t0, i32 2)
  %vld2_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_v, 0
  %vld2_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_v, 1
  %.fca.0.0.insert = insertvalue %struct.poly16x4x2_t undef, <4 x i16> %vld2_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x2_t %.fca.0.0.insert, <4 x i16> %vld2_v.fca.1.extract, 0, 1
  ret %struct.poly16x4x2_t %.fca.0.1.insert
}

define %struct.uint8x8x2_t @test_vld2_dup_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld2_dup_u8:
; CHECK: ld2.b { v1, v2 }[0], [x0]
; CHECK: dup.8b v0, v1[0]
; CHECK: dup.8b v1, v2[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint8x8x2_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x2_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  ret %struct.uint8x8x2_t %.fca.0.1.insert
}

declare { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2lane.v8i8(i8*, <8 x i8>, <8 x i8>, i32, i32) #3

define %struct.uint16x4x2_t @test_vld2_dup_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld2_dup_u16:
; CHECK: ld2.h { v1, v2 }[0], [x0]
; CHECK: dup.4h v0, v1[0]
; CHECK: dup.4h v1, v2[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint16x4x2_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x2_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  ret %struct.uint16x4x2_t %.fca.0.1.insert
}

declare { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8*, <4 x i16>, <4 x i16>, i32, i32) #3

define %struct.uint32x2x2_t @test_vld2_dup_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld2_dup_u32:
; CHECK: ld2.s { v1, v2 }[0], [x0]
; CHECK: dup.2s v0, v1[0]
; CHECK: dup.2s v1, v2[0]
  %t0 = bitcast i32* %a to i8*
  %vld_dup = tail call { <2 x i32>, <2 x i32> } @llvm.arm.neon.vld2lane.v2i32(i8* %t0, <2 x i32> undef, <2 x i32> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x i32>, <2 x i32> } %vld_dup, 0
  %lane = shufflevector <2 x i32> %t1, <2 x i32> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x i32>, <2 x i32> } %vld_dup, 1
  %lane1 = shufflevector <2 x i32> %t2, <2 x i32> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint32x2x2_t undef, <2 x i32> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x2_t %.fca.0.0.insert, <2 x i32> %lane1, 0, 1
  ret %struct.uint32x2x2_t %.fca.0.1.insert
}

declare { <2 x i32>, <2 x i32> } @llvm.arm.neon.vld2lane.v2i32(i8*, <2 x i32>, <2 x i32>, i32, i32) #3

define %struct.uint64x1x2_t @test_vld2_dup_u64(i64* %a) #2 {
; CHECK-LABEL: test_vld2_dup_u64:
; CHECK: ld1.1d { v0, v1 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld_dup = tail call { <1 x i64>, <1 x i64> } @llvm.arm.neon.vld2.v1i64(i8* %t0, i32 8)
  %vld_dup.fca.0.extract = extractvalue { <1 x i64>, <1 x i64> } %vld_dup, 0
  %vld_dup.fca.1.extract = extractvalue { <1 x i64>, <1 x i64> } %vld_dup, 1
  %.fca.0.0.insert = insertvalue %struct.uint64x1x2_t undef, <1 x i64> %vld_dup.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint64x1x2_t %.fca.0.0.insert, <1 x i64> %vld_dup.fca.1.extract, 0, 1
  ret %struct.uint64x1x2_t %.fca.0.1.insert
}

define %struct.int8x8x2_t @test_vld2_dup_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld2_dup_s8:
; CHECK: ld2.b { v1, v2 }[0], [x0]
; CHECK: dup.8b v0, v1[0]
; CHECK: dup.8b v1, v2[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int8x8x2_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x2_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  ret %struct.int8x8x2_t %.fca.0.1.insert
}

define %struct.int16x4x2_t @test_vld2_dup_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld2_dup_s16:
; CHECK: ld2.h { v1, v2 }[0], [x0]
; CHECK: dup.4h v0, v1[0]
; CHECK: dup.4h v1, v2[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int16x4x2_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x2_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  ret %struct.int16x4x2_t %.fca.0.1.insert
}

define %struct.int32x2x2_t @test_vld2_dup_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld2_dup_s32:
; CHECK: ld2.s { v1, v2 }[0], [x0]
; CHECK: dup.2s v0, v1[0]
; CHECK: dup.2s v1, v2[0]
  %t0 = bitcast i32* %a to i8*
  %vld_dup = tail call { <2 x i32>, <2 x i32> } @llvm.arm.neon.vld2lane.v2i32(i8* %t0, <2 x i32> undef, <2 x i32> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x i32>, <2 x i32> } %vld_dup, 0
  %lane = shufflevector <2 x i32> %t1, <2 x i32> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x i32>, <2 x i32> } %vld_dup, 1
  %lane1 = shufflevector <2 x i32> %t2, <2 x i32> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int32x2x2_t undef, <2 x i32> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x2_t %.fca.0.0.insert, <2 x i32> %lane1, 0, 1
  ret %struct.int32x2x2_t %.fca.0.1.insert
}

define %struct.int64x1x2_t @test_vld2_dup_s64(i64* %a) #2 {
; CHECK-LABEL: test_vld2_dup_s64:
; CHECK: ld1.1d { v0, v1 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld_dup = tail call { <1 x i64>, <1 x i64> } @llvm.arm.neon.vld2.v1i64(i8* %t0, i32 8)
  %vld_dup.fca.0.extract = extractvalue { <1 x i64>, <1 x i64> } %vld_dup, 0
  %vld_dup.fca.1.extract = extractvalue { <1 x i64>, <1 x i64> } %vld_dup, 1
  %.fca.0.0.insert = insertvalue %struct.int64x1x2_t undef, <1 x i64> %vld_dup.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int64x1x2_t %.fca.0.0.insert, <1 x i64> %vld_dup.fca.1.extract, 0, 1
  ret %struct.int64x1x2_t %.fca.0.1.insert
}

define %struct.float16x4x2_t @test_vld2_dup_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld2_dup_f16:
; CHECK: ld2.h { v1, v2 }[0], [x0]
; CHECK: dup.4h v0, v1[0]
; CHECK: dup.4h v1, v2[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.float16x4x2_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x2_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  ret %struct.float16x4x2_t %.fca.0.1.insert
}

define %struct.float32x2x2_t @test_vld2_dup_f32(float* %a) #2 {
; CHECK-LABEL: test_vld2_dup_f32:
; CHECK: ld2.s { v1, v2 }[0], [x0]
; CHECK: dup.2s v0, v1[0]
; CHECK: dup.2s v1, v2[0]
  %t0 = bitcast float* %a to i8*
  %vld_dup = tail call { <2 x float>, <2 x float> } @llvm.arm.neon.vld2lane.v2f32(i8* %t0, <2 x float> undef, <2 x float> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x float>, <2 x float> } %vld_dup, 0
  %lane = shufflevector <2 x float> %t1, <2 x float> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x float>, <2 x float> } %vld_dup, 1
  %lane1 = shufflevector <2 x float> %t2, <2 x float> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.float32x2x2_t undef, <2 x float> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x2_t %.fca.0.0.insert, <2 x float> %lane1, 0, 1
  ret %struct.float32x2x2_t %.fca.0.1.insert
}

declare { <2 x float>, <2 x float> } @llvm.arm.neon.vld2lane.v2f32(i8*, <2 x float>, <2 x float>, i32, i32) #3

define %struct.poly8x8x2_t @test_vld2_dup_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld2_dup_p8:
; CHECK: ld2.b { v1, v2 }[0], [x0]
; CHECK: dup.8b v0, v1[0]
; CHECK: dup.8b v1, v2[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.poly8x8x2_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x2_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  ret %struct.poly8x8x2_t %.fca.0.1.insert
}

define %struct.poly16x4x2_t @test_vld2_dup_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld2_dup_p16:
; CHECK: ld2.h { v1, v2 }[0], [x0]
; CHECK: dup.4h v0, v1[0]
; CHECK: dup.4h v1, v2[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.poly16x4x2_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x2_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  ret %struct.poly16x4x2_t %.fca.0.1.insert
}

define %struct.uint16x8x2_t @test_vld2q_lane_u16(i16* %a, [2 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2q_lane_u16:
; CHECK: ld2.h { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  %vld2q_lane_v = tail call { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 7, i32 2)
  %vld2q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_lane_v, 0
  %vld2q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint16x8x2_t undef, <8 x i16> %vld2q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x2_t %.fca.0.0.insert, <8 x i16> %vld2q_lane_v.fca.1.extract, 0, 1
  ret %struct.uint16x8x2_t %.fca.0.1.insert
}

declare { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2lane.v8i16(i8*, <8 x i16>, <8 x i16>, i32, i32) #3

define %struct.uint32x4x2_t @test_vld2q_lane_u32(i32* %a, [2 x <4 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2q_lane_u32:
; CHECK: ld2.s { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  %vld2q_lane_v = tail call { <4 x i32>, <4 x i32> } @llvm.arm.neon.vld2lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, i32 3, i32 4)
  %vld2q_lane_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32> } %vld2q_lane_v, 0
  %vld2q_lane_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32> } %vld2q_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint32x4x2_t undef, <4 x i32> %vld2q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x2_t %.fca.0.0.insert, <4 x i32> %vld2q_lane_v.fca.1.extract, 0, 1
  ret %struct.uint32x4x2_t %.fca.0.1.insert
}

declare { <4 x i32>, <4 x i32> } @llvm.arm.neon.vld2lane.v4i32(i8*, <4 x i32>, <4 x i32>, i32, i32) #3

define %struct.int16x8x2_t @test_vld2q_lane_s16(i16* %a, [2 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2q_lane_s16:
; CHECK: ld2.h { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  %vld2q_lane_v = tail call { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 7, i32 2)
  %vld2q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_lane_v, 0
  %vld2q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.int16x8x2_t undef, <8 x i16> %vld2q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x2_t %.fca.0.0.insert, <8 x i16> %vld2q_lane_v.fca.1.extract, 0, 1
  ret %struct.int16x8x2_t %.fca.0.1.insert
}

define %struct.int32x4x2_t @test_vld2q_lane_s32(i32* %a, [2 x <4 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2q_lane_s32:
; CHECK: ld2.s { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  %vld2q_lane_v = tail call { <4 x i32>, <4 x i32> } @llvm.arm.neon.vld2lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, i32 3, i32 4)
  %vld2q_lane_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32> } %vld2q_lane_v, 0
  %vld2q_lane_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32> } %vld2q_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.int32x4x2_t undef, <4 x i32> %vld2q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x2_t %.fca.0.0.insert, <4 x i32> %vld2q_lane_v.fca.1.extract, 0, 1
  ret %struct.int32x4x2_t %.fca.0.1.insert
}

define %struct.float16x8x2_t @test_vld2q_lane_f16(i16* %a, [2 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2q_lane_f16:
; CHECK: ld2.h { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  %vld2q_lane_v = tail call { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 7, i32 2)
  %vld2q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_lane_v, 0
  %vld2q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.float16x8x2_t undef, <8 x i16> %vld2q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x8x2_t %.fca.0.0.insert, <8 x i16> %vld2q_lane_v.fca.1.extract, 0, 1
  ret %struct.float16x8x2_t %.fca.0.1.insert
}

define %struct.float32x4x2_t @test_vld2q_lane_f32(float* %a, [2 x <4 x float>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2q_lane_f32:
; CHECK: ld2.s { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x float>] %b.coerce, 1
  %t0 = bitcast float* %a to i8*
  %vld2q_lane_v = tail call { <4 x float>, <4 x float> } @llvm.arm.neon.vld2lane.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, i32 3, i32 4)
  %vld2q_lane_v.fca.0.extract = extractvalue { <4 x float>, <4 x float> } %vld2q_lane_v, 0
  %vld2q_lane_v.fca.1.extract = extractvalue { <4 x float>, <4 x float> } %vld2q_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.float32x4x2_t undef, <4 x float> %vld2q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x2_t %.fca.0.0.insert, <4 x float> %vld2q_lane_v.fca.1.extract, 0, 1
  ret %struct.float32x4x2_t %.fca.0.1.insert
}

declare { <4 x float>, <4 x float> } @llvm.arm.neon.vld2lane.v4f32(i8*, <4 x float>, <4 x float>, i32, i32) #3

define %struct.poly16x8x2_t @test_vld2q_lane_p16(i16* %a, [2 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2q_lane_p16:
; CHECK: ld2.h { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  %vld2q_lane_v = tail call { <8 x i16>, <8 x i16> } @llvm.arm.neon.vld2lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 7, i32 2)
  %vld2q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_lane_v, 0
  %vld2q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16> } %vld2q_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.poly16x8x2_t undef, <8 x i16> %vld2q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x2_t %.fca.0.0.insert, <8 x i16> %vld2q_lane_v.fca.1.extract, 0, 1
  ret %struct.poly16x8x2_t %.fca.0.1.insert
}

define %struct.uint8x8x2_t @test_vld2_lane_u8(i8* %a, [2 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_u8:
; CHECK: ld2.b { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  %vld2_lane_v = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 7, i32 1)
  %vld2_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint8x8x2_t undef, <8 x i8> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x2_t %.fca.0.0.insert, <8 x i8> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.uint8x8x2_t %.fca.0.1.insert
}

define %struct.uint16x4x2_t @test_vld2_lane_u16(i16* %a, [2 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_u16:
; CHECK: ld2.h { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  %vld2_lane_v = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 3, i32 2)
  %vld2_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint16x4x2_t undef, <4 x i16> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x2_t %.fca.0.0.insert, <4 x i16> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.uint16x4x2_t %.fca.0.1.insert
}

define %struct.uint32x2x2_t @test_vld2_lane_u32(i32* %a, [2 x <2 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_u32:
; CHECK: ld2.s { v0, v1 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  %vld2_lane_v = tail call { <2 x i32>, <2 x i32> } @llvm.arm.neon.vld2lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, i32 1, i32 4)
  %vld2_lane_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.uint32x2x2_t undef, <2 x i32> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x2_t %.fca.0.0.insert, <2 x i32> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.uint32x2x2_t %.fca.0.1.insert
}

define %struct.int8x8x2_t @test_vld2_lane_s8(i8* %a, [2 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_s8:
; CHECK: ld2.b { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  %vld2_lane_v = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 7, i32 1)
  %vld2_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.int8x8x2_t undef, <8 x i8> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x2_t %.fca.0.0.insert, <8 x i8> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.int8x8x2_t %.fca.0.1.insert
}

define %struct.int16x4x2_t @test_vld2_lane_s16(i16* %a, [2 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_s16:
; CHECK: ld2.h { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  %vld2_lane_v = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 3, i32 2)
  %vld2_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.int16x4x2_t undef, <4 x i16> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x2_t %.fca.0.0.insert, <4 x i16> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.int16x4x2_t %.fca.0.1.insert
}

define %struct.int32x2x2_t @test_vld2_lane_s32(i32* %a, [2 x <2 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_s32:
; CHECK: ld2.s { v0, v1 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  %vld2_lane_v = tail call { <2 x i32>, <2 x i32> } @llvm.arm.neon.vld2lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, i32 1, i32 4)
  %vld2_lane_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.int32x2x2_t undef, <2 x i32> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x2_t %.fca.0.0.insert, <2 x i32> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.int32x2x2_t %.fca.0.1.insert
}

define %struct.float16x4x2_t @test_vld2_lane_f16(i16* %a, [2 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_f16:
; CHECK: ld2.h { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  %vld2_lane_v = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 3, i32 2)
  %vld2_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.float16x4x2_t undef, <4 x i16> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x2_t %.fca.0.0.insert, <4 x i16> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.float16x4x2_t %.fca.0.1.insert
}

define %struct.float32x2x2_t @test_vld2_lane_f32(float* %a, [2 x <2 x float>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_f32:
; CHECK: ld2.s { v0, v1 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x float>] %b.coerce, 1
  %t0 = bitcast float* %a to i8*
  %vld2_lane_v = tail call { <2 x float>, <2 x float> } @llvm.arm.neon.vld2lane.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, i32 1, i32 4)
  %vld2_lane_v.fca.0.extract = extractvalue { <2 x float>, <2 x float> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <2 x float>, <2 x float> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.float32x2x2_t undef, <2 x float> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x2_t %.fca.0.0.insert, <2 x float> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.float32x2x2_t %.fca.0.1.insert
}

define %struct.poly8x8x2_t @test_vld2_lane_p8(i8* %a, [2 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_p8:
; CHECK: ld2.b { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  %vld2_lane_v = tail call { <8 x i8>, <8 x i8> } @llvm.arm.neon.vld2lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 7, i32 1)
  %vld2_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.poly8x8x2_t undef, <8 x i8> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x2_t %.fca.0.0.insert, <8 x i8> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.poly8x8x2_t %.fca.0.1.insert
}

define %struct.poly16x4x2_t @test_vld2_lane_p16(i16* %a, [2 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld2_lane_p16:
; CHECK: ld2.h { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  %vld2_lane_v = tail call { <4 x i16>, <4 x i16> } @llvm.arm.neon.vld2lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 3, i32 2)
  %vld2_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_lane_v, 0
  %vld2_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16> } %vld2_lane_v, 1
  %.fca.0.0.insert = insertvalue %struct.poly16x4x2_t undef, <4 x i16> %vld2_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x2_t %.fca.0.0.insert, <4 x i16> %vld2_lane_v.fca.1.extract, 0, 1
  ret %struct.poly16x4x2_t %.fca.0.1.insert
}

define %struct.uint8x16x3_t @test_vld3q_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld3q_u8:
; CHECK: ld3.16b { v0, v1, v2 }, [x0]
  %vld3q_v = tail call { <16 x i8>, <16 x i8>, <16 x i8> } @llvm.arm.neon.vld3.v16i8(i8* %a, i32 1)
  %vld3q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint8x16x3_t undef, <16 x i8> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x16x3_t %.fca.0.0.insert, <16 x i8> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint8x16x3_t %.fca.0.1.insert, <16 x i8> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.uint8x16x3_t %.fca.0.2.insert
}

declare { <16 x i8>, <16 x i8>, <16 x i8> } @llvm.arm.neon.vld3.v16i8(i8*, i32) #3

define %struct.uint16x8x3_t @test_vld3q_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld3q_u16:
; CHECK: ld3.8h { v0, v1, v2 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld3q_v = tail call { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3.v8i16(i8* %t0, i32 2)
  %vld3q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint16x8x3_t undef, <8 x i16> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x3_t %.fca.0.0.insert, <8 x i16> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x8x3_t %.fca.0.1.insert, <8 x i16> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.uint16x8x3_t %.fca.0.2.insert
}

declare { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3.v8i16(i8*, i32) #3

define %struct.uint32x4x3_t @test_vld3q_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld3q_u32:
; CHECK: ld3.4s { v0, v1, v2 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld3q_v = tail call { <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld3.v4i32(i8* %t0, i32 4)
  %vld3q_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint32x4x3_t undef, <4 x i32> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x3_t %.fca.0.0.insert, <4 x i32> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x4x3_t %.fca.0.1.insert, <4 x i32> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.uint32x4x3_t %.fca.0.2.insert
}

declare { <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld3.v4i32(i8*, i32) #3

define %struct.int8x16x3_t @test_vld3q_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld3q_s8:
; CHECK: ld3.16b { v0, v1, v2 }, [x0]
  %vld3q_v = tail call { <16 x i8>, <16 x i8>, <16 x i8> } @llvm.arm.neon.vld3.v16i8(i8* %a, i32 1)
  %vld3q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.int8x16x3_t undef, <16 x i8> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x16x3_t %.fca.0.0.insert, <16 x i8> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int8x16x3_t %.fca.0.1.insert, <16 x i8> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.int8x16x3_t %.fca.0.2.insert
}

define %struct.int16x8x3_t @test_vld3q_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld3q_s16:
; CHECK: ld3.8h { v0, v1, v2 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld3q_v = tail call { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3.v8i16(i8* %t0, i32 2)
  %vld3q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.int16x8x3_t undef, <8 x i16> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x3_t %.fca.0.0.insert, <8 x i16> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x8x3_t %.fca.0.1.insert, <8 x i16> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.int16x8x3_t %.fca.0.2.insert
}

define %struct.int32x4x3_t @test_vld3q_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld3q_s32:
; CHECK: ld3.4s { v0, v1, v2 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld3q_v = tail call { <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld3.v4i32(i8* %t0, i32 4)
  %vld3q_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.int32x4x3_t undef, <4 x i32> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x3_t %.fca.0.0.insert, <4 x i32> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x4x3_t %.fca.0.1.insert, <4 x i32> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.int32x4x3_t %.fca.0.2.insert
}

define %struct.float16x8x3_t @test_vld3q_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld3q_f16:
; CHECK: ld3.8h { v0, v1, v2 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld3q_v = tail call { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3.v8i16(i8* %t0, i32 2)
  %vld3q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.float16x8x3_t undef, <8 x i16> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x8x3_t %.fca.0.0.insert, <8 x i16> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x8x3_t %.fca.0.1.insert, <8 x i16> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.float16x8x3_t %.fca.0.2.insert
}

define %struct.float32x4x3_t @test_vld3q_f32(float* %a) #2 {
; CHECK-LABEL: test_vld3q_f32:
; CHECK: ld3.4s { v0, v1, v2 }, [x0]
  %t0 = bitcast float* %a to i8*
  %vld3q_v = tail call { <4 x float>, <4 x float>, <4 x float> } @llvm.arm.neon.vld3.v4f32(i8* %t0, i32 4)
  %vld3q_v.fca.0.extract = extractvalue { <4 x float>, <4 x float>, <4 x float> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <4 x float>, <4 x float>, <4 x float> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <4 x float>, <4 x float>, <4 x float> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.float32x4x3_t undef, <4 x float> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x3_t %.fca.0.0.insert, <4 x float> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x4x3_t %.fca.0.1.insert, <4 x float> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.float32x4x3_t %.fca.0.2.insert
}

declare { <4 x float>, <4 x float>, <4 x float> } @llvm.arm.neon.vld3.v4f32(i8*, i32) #3

define %struct.poly8x16x3_t @test_vld3q_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld3q_p8:
; CHECK: ld3.16b { v0, v1, v2 }, [x0]
  %vld3q_v = tail call { <16 x i8>, <16 x i8>, <16 x i8> } @llvm.arm.neon.vld3.v16i8(i8* %a, i32 1)
  %vld3q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.poly8x16x3_t undef, <16 x i8> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x16x3_t %.fca.0.0.insert, <16 x i8> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly8x16x3_t %.fca.0.1.insert, <16 x i8> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.poly8x16x3_t %.fca.0.2.insert
}

define %struct.poly16x8x3_t @test_vld3q_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld3q_p16:
; CHECK: ld3.8h { v0, v1, v2 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld3q_v = tail call { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3.v8i16(i8* %t0, i32 2)
  %vld3q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 0
  %vld3q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 1
  %vld3q_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_v, 2
  %.fca.0.0.insert = insertvalue %struct.poly16x8x3_t undef, <8 x i16> %vld3q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x3_t %.fca.0.0.insert, <8 x i16> %vld3q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x8x3_t %.fca.0.1.insert, <8 x i16> %vld3q_v.fca.2.extract, 0, 2
  ret %struct.poly16x8x3_t %.fca.0.2.insert
}

define %struct.uint8x8x3_t @test_vld3_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld3_u8:
; CHECK: ld3.8b { v0, v1, v2 }, [x0]
  %vld3_v = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3.v8i8(i8* %a, i32 1)
  %vld3_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint8x8x3_t undef, <8 x i8> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x3_t %.fca.0.0.insert, <8 x i8> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint8x8x3_t %.fca.0.1.insert, <8 x i8> %vld3_v.fca.2.extract, 0, 2
  ret %struct.uint8x8x3_t %.fca.0.2.insert
}

declare { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3.v8i8(i8*, i32) #3

define %struct.uint16x4x3_t @test_vld3_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld3_u16:
; CHECK: ld3.4h { v0, v1, v2 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld3_v = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3.v4i16(i8* %t0, i32 2)
  %vld3_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint16x4x3_t undef, <4 x i16> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x3_t %.fca.0.0.insert, <4 x i16> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x4x3_t %.fca.0.1.insert, <4 x i16> %vld3_v.fca.2.extract, 0, 2
  ret %struct.uint16x4x3_t %.fca.0.2.insert
}

declare { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3.v4i16(i8*, i32) #3

define %struct.uint32x2x3_t @test_vld3_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld3_u32:
; CHECK: ld3.2s { v0, v1, v2 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld3_v = tail call { <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld3.v2i32(i8* %t0, i32 4)
  %vld3_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint32x2x3_t undef, <2 x i32> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x3_t %.fca.0.0.insert, <2 x i32> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x2x3_t %.fca.0.1.insert, <2 x i32> %vld3_v.fca.2.extract, 0, 2
  ret %struct.uint32x2x3_t %.fca.0.2.insert
}

declare { <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld3.v2i32(i8*, i32) #3

define %struct.uint64x1x3_t @test_vld3_u64(i64* %a) #2 {
; CHECK-LABEL: test_vld3_u64:
; CHECK: ld1.1d { v0, v1, v2 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld3_v = tail call { <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld3.v1i64(i8* %t0, i32 8)
  %vld3_v.fca.0.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint64x1x3_t undef, <1 x i64> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint64x1x3_t %.fca.0.0.insert, <1 x i64> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint64x1x3_t %.fca.0.1.insert, <1 x i64> %vld3_v.fca.2.extract, 0, 2
  ret %struct.uint64x1x3_t %.fca.0.2.insert
}

declare { <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld3.v1i64(i8*, i32) #3

define %struct.int8x8x3_t @test_vld3_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld3_s8:
; CHECK: ld3.8b { v0, v1, v2 }, [x0]
  %vld3_v = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3.v8i8(i8* %a, i32 1)
  %vld3_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.int8x8x3_t undef, <8 x i8> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x3_t %.fca.0.0.insert, <8 x i8> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int8x8x3_t %.fca.0.1.insert, <8 x i8> %vld3_v.fca.2.extract, 0, 2
  ret %struct.int8x8x3_t %.fca.0.2.insert
}

define %struct.int16x4x3_t @test_vld3_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld3_s16:
; CHECK: ld3.4h { v0, v1, v2 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld3_v = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3.v4i16(i8* %t0, i32 2)
  %vld3_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.int16x4x3_t undef, <4 x i16> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x3_t %.fca.0.0.insert, <4 x i16> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x4x3_t %.fca.0.1.insert, <4 x i16> %vld3_v.fca.2.extract, 0, 2
  ret %struct.int16x4x3_t %.fca.0.2.insert
}

define %struct.int32x2x3_t @test_vld3_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld3_s32:
; CHECK: ld3.2s { v0, v1, v2 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld3_v = tail call { <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld3.v2i32(i8* %t0, i32 4)
  %vld3_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.int32x2x3_t undef, <2 x i32> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x3_t %.fca.0.0.insert, <2 x i32> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x2x3_t %.fca.0.1.insert, <2 x i32> %vld3_v.fca.2.extract, 0, 2
  ret %struct.int32x2x3_t %.fca.0.2.insert
}

define %struct.int64x1x3_t @test_vld3_s64(i64* %a) #2 {
; CHECK-LABEL: test_vld3_s64:
; CHECK: ld1.1d { v0, v1, v2 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld3_v = tail call { <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld3.v1i64(i8* %t0, i32 8)
  %vld3_v.fca.0.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.int64x1x3_t undef, <1 x i64> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int64x1x3_t %.fca.0.0.insert, <1 x i64> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int64x1x3_t %.fca.0.1.insert, <1 x i64> %vld3_v.fca.2.extract, 0, 2
  ret %struct.int64x1x3_t %.fca.0.2.insert
}

define %struct.float16x4x3_t @test_vld3_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld3_f16:
; CHECK: ld3.4h { v0, v1, v2 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld3_v = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3.v4i16(i8* %t0, i32 2)
  %vld3_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.float16x4x3_t undef, <4 x i16> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x3_t %.fca.0.0.insert, <4 x i16> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x4x3_t %.fca.0.1.insert, <4 x i16> %vld3_v.fca.2.extract, 0, 2
  ret %struct.float16x4x3_t %.fca.0.2.insert
}

define %struct.float32x2x3_t @test_vld3_f32(float* %a) #2 {
; CHECK-LABEL: test_vld3_f32:
; CHECK: ld3.2s { v0, v1, v2 }, [x0]
  %t0 = bitcast float* %a to i8*
  %vld3_v = tail call { <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld3.v2f32(i8* %t0, i32 4)
  %vld3_v.fca.0.extract = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.float32x2x3_t undef, <2 x float> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x3_t %.fca.0.0.insert, <2 x float> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x2x3_t %.fca.0.1.insert, <2 x float> %vld3_v.fca.2.extract, 0, 2
  ret %struct.float32x2x3_t %.fca.0.2.insert
}

declare { <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld3.v2f32(i8*, i32) #3

define %struct.poly8x8x3_t @test_vld3_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld3_p8:
; CHECK: ld3.8b { v0, v1, v2 }, [x0]
  %vld3_v = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3.v8i8(i8* %a, i32 1)
  %vld3_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.poly8x8x3_t undef, <8 x i8> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x3_t %.fca.0.0.insert, <8 x i8> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly8x8x3_t %.fca.0.1.insert, <8 x i8> %vld3_v.fca.2.extract, 0, 2
  ret %struct.poly8x8x3_t %.fca.0.2.insert
}

define %struct.poly16x4x3_t @test_vld3_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld3_p16:
; CHECK: ld3.4h { v0, v1, v2 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld3_v = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3.v4i16(i8* %t0, i32 2)
  %vld3_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 0
  %vld3_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 1
  %vld3_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_v, 2
  %.fca.0.0.insert = insertvalue %struct.poly16x4x3_t undef, <4 x i16> %vld3_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x3_t %.fca.0.0.insert, <4 x i16> %vld3_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x4x3_t %.fca.0.1.insert, <4 x i16> %vld3_v.fca.2.extract, 0, 2
  ret %struct.poly16x4x3_t %.fca.0.2.insert
}

; FIXME: ARM codegen here is a bit weird, so the AArch64 output is
; sub-optimal. Correct as far as I can tell though.
define %struct.uint8x8x3_t @test_vld3_dup_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld3_dup_u8:
; CHECK: ld3.b { v2, v3, v4 }[0], [x0]
; CHECK: dup.8b v0, v2[0]
; CHECK: dup.8b v1, v3[0]
; CHECK: dup.8b v2, v4[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %t2 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 2
  %lane2 = shufflevector <8 x i8> %t2, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint8x8x3_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x3_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint8x8x3_t %.fca.0.1.insert, <8 x i8> %lane2, 0, 2
  ret %struct.uint8x8x3_t %.fca.0.2.insert
}

declare { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3lane.v8i8(i8*, <8 x i8>, <8 x i8>, <8 x i8>, i32, i32) #3

define %struct.uint16x4x3_t @test_vld3_dup_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld3_dup_u16:
; CHECK: ld3.h { v2, v3, v4 }[0], [x0]
; CHECK: dup.4h v0, v2[0]
; CHECK: dup.4h v1, v3[0]
; CHECK: dup.4h v2, v4[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %t3 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 2
  %lane2 = shufflevector <4 x i16> %t3, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint16x4x3_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x3_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x4x3_t %.fca.0.1.insert, <4 x i16> %lane2, 0, 2
  ret %struct.uint16x4x3_t %.fca.0.2.insert
}

declare { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8*, <4 x i16>, <4 x i16>, <4 x i16>, i32, i32) #3

define %struct.uint32x2x3_t @test_vld3_dup_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld3_dup_u32:
; CHECK: ld3.s { v2, v3, v4 }[0], [x0]
; CHECK: dup.2s v0, v2[0]
; CHECK: dup.2s v1, v3[0]
; CHECK: dup.2s v2, v4[0]
  %t0 = bitcast i32* %a to i8*
  %vld_dup = tail call { <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld3lane.v2i32(i8* %t0, <2 x i32> undef, <2 x i32> undef, <2 x i32> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 0
  %lane = shufflevector <2 x i32> %t1, <2 x i32> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 1
  %lane1 = shufflevector <2 x i32> %t2, <2 x i32> undef, <2 x i32> zeroinitializer
  %t3 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 2
  %lane2 = shufflevector <2 x i32> %t3, <2 x i32> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint32x2x3_t undef, <2 x i32> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x3_t %.fca.0.0.insert, <2 x i32> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x2x3_t %.fca.0.1.insert, <2 x i32> %lane2, 0, 2
  ret %struct.uint32x2x3_t %.fca.0.2.insert
}

declare { <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld3lane.v2i32(i8*, <2 x i32>, <2 x i32>, <2 x i32>, i32, i32) #3

define %struct.uint64x1x3_t @test_vld3_dup_u64(i64* %a) #2 {
; CHECK-LABEL: test_vld3_dup_u64:
; CHECK: ld1.1d { v0, v1, v2 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld_dup = tail call { <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld3.v1i64(i8* %t0, i32 8)
  %vld_dup.fca.0.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 0
  %vld_dup.fca.1.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 1
  %vld_dup.fca.2.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 2
  %.fca.0.0.insert = insertvalue %struct.uint64x1x3_t undef, <1 x i64> %vld_dup.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint64x1x3_t %.fca.0.0.insert, <1 x i64> %vld_dup.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint64x1x3_t %.fca.0.1.insert, <1 x i64> %vld_dup.fca.2.extract, 0, 2
  ret %struct.uint64x1x3_t %.fca.0.2.insert
}

define %struct.int8x8x3_t @test_vld3_dup_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld3_dup_s8:
; CHECK: ld3.b { v2, v3, v4 }[0], [x0]
; CHECK: dup.8b v0, v2[0]
; CHECK: dup.8b v1, v3[0]
; CHECK: dup.8b v2, v4[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %t2 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 2
  %lane2 = shufflevector <8 x i8> %t2, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int8x8x3_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x3_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int8x8x3_t %.fca.0.1.insert, <8 x i8> %lane2, 0, 2
  ret %struct.int8x8x3_t %.fca.0.2.insert
}

define %struct.int16x4x3_t @test_vld3_dup_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld3_dup_s16:
; CHECK: ld3.h { v2, v3, v4 }[0], [x0]
; CHECK: dup.4h v0, v2[0]
; CHECK: dup.4h v1, v3[0]
; CHECK: dup.4h v2, v4[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %t3 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 2
  %lane2 = shufflevector <4 x i16> %t3, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int16x4x3_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x3_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x4x3_t %.fca.0.1.insert, <4 x i16> %lane2, 0, 2
  ret %struct.int16x4x3_t %.fca.0.2.insert
}

define %struct.int32x2x3_t @test_vld3_dup_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld3_dup_s32:
; CHECK: ld3.s { v2, v3, v4 }[0], [x0]
; CHECK: dup.2s v0, v2[0]
; CHECK: dup.2s v1, v3[0]
; CHECK: dup.2s v2, v4[0]
  %t0 = bitcast i32* %a to i8*
  %vld_dup = tail call { <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld3lane.v2i32(i8* %t0, <2 x i32> undef, <2 x i32> undef, <2 x i32> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 0
  %lane = shufflevector <2 x i32> %t1, <2 x i32> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 1
  %lane1 = shufflevector <2 x i32> %t2, <2 x i32> undef, <2 x i32> zeroinitializer
  %t3 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 2
  %lane2 = shufflevector <2 x i32> %t3, <2 x i32> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int32x2x3_t undef, <2 x i32> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x3_t %.fca.0.0.insert, <2 x i32> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x2x3_t %.fca.0.1.insert, <2 x i32> %lane2, 0, 2
  ret %struct.int32x2x3_t %.fca.0.2.insert
}

define %struct.int64x1x3_t @test_vld3_dup_s64(i64* %a) #2 {
; CHECK-LABEL: test_vld3_dup_s64:
; CHECK: ld1.1d { v0, v1, v2 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld_dup = tail call { <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld3.v1i64(i8* %t0, i32 8)
  %vld_dup.fca.0.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 0
  %vld_dup.fca.1.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 1
  %vld_dup.fca.2.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 2
  %.fca.0.0.insert = insertvalue %struct.int64x1x3_t undef, <1 x i64> %vld_dup.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int64x1x3_t %.fca.0.0.insert, <1 x i64> %vld_dup.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int64x1x3_t %.fca.0.1.insert, <1 x i64> %vld_dup.fca.2.extract, 0, 2
  ret %struct.int64x1x3_t %.fca.0.2.insert
}

define %struct.float16x4x3_t @test_vld3_dup_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld3_dup_f16:
; CHECK: ld3.h { v2, v3, v4 }[0], [x0]
; CHECK: dup.4h v0, v2[0]
; CHECK: dup.4h v1, v3[0]
; CHECK: dup.4h v2, v4[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %t3 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 2
  %lane2 = shufflevector <4 x i16> %t3, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.float16x4x3_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x3_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x4x3_t %.fca.0.1.insert, <4 x i16> %lane2, 0, 2
  ret %struct.float16x4x3_t %.fca.0.2.insert
}

define %struct.float32x2x3_t @test_vld3_dup_f32(float* %a) #2 {
; CHECK-LABEL: test_vld3_dup_f32:
; CHECK: ld3.s { v2, v3, v4 }[0], [x0]
; CHECK: dup.2s v0, v2[0]
; CHECK: dup.2s v1, v3[0]
; CHECK: dup.2s v2, v4[0]
  %t0 = bitcast float* %a to i8*
  %vld_dup = tail call { <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld3lane.v2f32(i8* %t0, <2 x float> undef, <2 x float> undef, <2 x float> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld_dup, 0
  %lane = shufflevector <2 x float> %t1, <2 x float> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld_dup, 1
  %lane1 = shufflevector <2 x float> %t2, <2 x float> undef, <2 x i32> zeroinitializer
  %t3 = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld_dup, 2
  %lane2 = shufflevector <2 x float> %t3, <2 x float> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.float32x2x3_t undef, <2 x float> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x3_t %.fca.0.0.insert, <2 x float> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x2x3_t %.fca.0.1.insert, <2 x float> %lane2, 0, 2
  ret %struct.float32x2x3_t %.fca.0.2.insert
}

declare { <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld3lane.v2f32(i8*, <2 x float>, <2 x float>, <2 x float>, i32, i32) #3

define %struct.poly8x8x3_t @test_vld3_dup_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld3_dup_p8:
; CHECK: ld3.b { v2, v3, v4 }[0], [x0]
; CHECK: dup.8b v0, v2[0]
; CHECK: dup.8b v1, v3[0]
; CHECK: dup.8b v2, v4[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %t2 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 2
  %lane2 = shufflevector <8 x i8> %t2, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.poly8x8x3_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x3_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly8x8x3_t %.fca.0.1.insert, <8 x i8> %lane2, 0, 2
  ret %struct.poly8x8x3_t %.fca.0.2.insert
}

define %struct.poly16x4x3_t @test_vld3_dup_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld3_dup_p16:
; CHECK: ld3.h { v2, v3, v4 }[0], [x0]
; CHECK: dup.4h v0, v2[0]
; CHECK: dup.4h v1, v3[0]
; CHECK: dup.4h v2, v4[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %t3 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 2
  %lane2 = shufflevector <4 x i16> %t3, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.poly16x4x3_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x3_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x4x3_t %.fca.0.1.insert, <4 x i16> %lane2, 0, 2
  ret %struct.poly16x4x3_t %.fca.0.2.insert
}

define %struct.uint16x8x3_t @test_vld3q_lane_u16(i16* %a, [3 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3q_lane_u16:
; CHECK: ld3.h { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  %vld3q_lane_v = tail call { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 7, i32 2)
  %vld3q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 0
  %vld3q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 1
  %vld3q_lane_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint16x8x3_t undef, <8 x i16> %vld3q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x3_t %.fca.0.0.insert, <8 x i16> %vld3q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x8x3_t %.fca.0.1.insert, <8 x i16> %vld3q_lane_v.fca.2.extract, 0, 2
  ret %struct.uint16x8x3_t %.fca.0.2.insert
}

declare { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3lane.v8i16(i8*, <8 x i16>, <8 x i16>, <8 x i16>, i32, i32) #3

define %struct.uint32x4x3_t @test_vld3q_lane_u32(i32* %a, [3 x <4 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3q_lane_u32:
; CHECK: ld3.s { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  %vld3q_lane_v = tail call { <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld3lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, i32 3, i32 4)
  %vld3q_lane_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_lane_v, 0
  %vld3q_lane_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_lane_v, 1
  %vld3q_lane_v.fca.2.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint32x4x3_t undef, <4 x i32> %vld3q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x3_t %.fca.0.0.insert, <4 x i32> %vld3q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x4x3_t %.fca.0.1.insert, <4 x i32> %vld3q_lane_v.fca.2.extract, 0, 2
  ret %struct.uint32x4x3_t %.fca.0.2.insert
}

declare { <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld3lane.v4i32(i8*, <4 x i32>, <4 x i32>, <4 x i32>, i32, i32) #3

define %struct.int16x8x3_t @test_vld3q_lane_s16(i16* %a, [3 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3q_lane_s16:
; CHECK: ld3.h { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  %vld3q_lane_v = tail call { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 7, i32 2)
  %vld3q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 0
  %vld3q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 1
  %vld3q_lane_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.int16x8x3_t undef, <8 x i16> %vld3q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x3_t %.fca.0.0.insert, <8 x i16> %vld3q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x8x3_t %.fca.0.1.insert, <8 x i16> %vld3q_lane_v.fca.2.extract, 0, 2
  ret %struct.int16x8x3_t %.fca.0.2.insert
}

define %struct.int32x4x3_t @test_vld3q_lane_s32(i32* %a, [3 x <4 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3q_lane_s32:
; CHECK: ld3.s { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  %vld3q_lane_v = tail call { <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld3lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, i32 3, i32 4)
  %vld3q_lane_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_lane_v, 0
  %vld3q_lane_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_lane_v, 1
  %vld3q_lane_v.fca.2.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32> } %vld3q_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.int32x4x3_t undef, <4 x i32> %vld3q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x3_t %.fca.0.0.insert, <4 x i32> %vld3q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x4x3_t %.fca.0.1.insert, <4 x i32> %vld3q_lane_v.fca.2.extract, 0, 2
  ret %struct.int32x4x3_t %.fca.0.2.insert
}

define %struct.float16x8x3_t @test_vld3q_lane_f16(i16* %a, [3 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3q_lane_f16:
; CHECK: ld3.h { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  %vld3q_lane_v = tail call { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 7, i32 2)
  %vld3q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 0
  %vld3q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 1
  %vld3q_lane_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.float16x8x3_t undef, <8 x i16> %vld3q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x8x3_t %.fca.0.0.insert, <8 x i16> %vld3q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x8x3_t %.fca.0.1.insert, <8 x i16> %vld3q_lane_v.fca.2.extract, 0, 2
  ret %struct.float16x8x3_t %.fca.0.2.insert
}

define %struct.float32x4x3_t @test_vld3q_lane_f32(float* %a, [3 x <4 x float>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3q_lane_f32:
; CHECK: ld3.s { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x float>] %b.coerce, 2
  %t0 = bitcast float* %a to i8*
  %vld3q_lane_v = tail call { <4 x float>, <4 x float>, <4 x float> } @llvm.arm.neon.vld3lane.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, <4 x float> %b.coerce.fca.2.extract, i32 3, i32 4)
  %vld3q_lane_v.fca.0.extract = extractvalue { <4 x float>, <4 x float>, <4 x float> } %vld3q_lane_v, 0
  %vld3q_lane_v.fca.1.extract = extractvalue { <4 x float>, <4 x float>, <4 x float> } %vld3q_lane_v, 1
  %vld3q_lane_v.fca.2.extract = extractvalue { <4 x float>, <4 x float>, <4 x float> } %vld3q_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.float32x4x3_t undef, <4 x float> %vld3q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x3_t %.fca.0.0.insert, <4 x float> %vld3q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x4x3_t %.fca.0.1.insert, <4 x float> %vld3q_lane_v.fca.2.extract, 0, 2
  ret %struct.float32x4x3_t %.fca.0.2.insert
}

declare { <4 x float>, <4 x float>, <4 x float> } @llvm.arm.neon.vld3lane.v4f32(i8*, <4 x float>, <4 x float>, <4 x float>, i32, i32) #3

define %struct.poly16x8x3_t @test_vld3q_lane_p16(i16* %a, [3 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3q_lane_p16:
; CHECK: ld3.h { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  %vld3q_lane_v = tail call { <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld3lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 7, i32 2)
  %vld3q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 0
  %vld3q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 1
  %vld3q_lane_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16> } %vld3q_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.poly16x8x3_t undef, <8 x i16> %vld3q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x3_t %.fca.0.0.insert, <8 x i16> %vld3q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x8x3_t %.fca.0.1.insert, <8 x i16> %vld3q_lane_v.fca.2.extract, 0, 2
  ret %struct.poly16x8x3_t %.fca.0.2.insert
}

define %struct.uint8x8x3_t @test_vld3_lane_u8(i8* %a, [3 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_u8:
; CHECK: ld3.b { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  %vld3_lane_v = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 7, i32 1)
  %vld3_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint8x8x3_t undef, <8 x i8> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x3_t %.fca.0.0.insert, <8 x i8> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint8x8x3_t %.fca.0.1.insert, <8 x i8> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.uint8x8x3_t %.fca.0.2.insert
}

define %struct.uint16x4x3_t @test_vld3_lane_u16(i16* %a, [3 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_u16:
; CHECK: ld3.h { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  %vld3_lane_v = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 3, i32 2)
  %vld3_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint16x4x3_t undef, <4 x i16> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x3_t %.fca.0.0.insert, <4 x i16> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x4x3_t %.fca.0.1.insert, <4 x i16> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.uint16x4x3_t %.fca.0.2.insert
}

define %struct.uint32x2x3_t @test_vld3_lane_u32(i32* %a, [3 x <2 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_u32:
; CHECK: ld3.s { v0, v1, v2 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  %vld3_lane_v = tail call { <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld3lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, i32 1, i32 4)
  %vld3_lane_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.uint32x2x3_t undef, <2 x i32> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x3_t %.fca.0.0.insert, <2 x i32> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x2x3_t %.fca.0.1.insert, <2 x i32> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.uint32x2x3_t %.fca.0.2.insert
}

define %struct.int8x8x3_t @test_vld3_lane_s8(i8* %a, [3 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_s8:
; CHECK: ld3.b { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  %vld3_lane_v = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 7, i32 1)
  %vld3_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.int8x8x3_t undef, <8 x i8> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x3_t %.fca.0.0.insert, <8 x i8> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int8x8x3_t %.fca.0.1.insert, <8 x i8> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.int8x8x3_t %.fca.0.2.insert
}

define %struct.int16x4x3_t @test_vld3_lane_s16(i16* %a, [3 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_s16:
; CHECK: ld3.h { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  %vld3_lane_v = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 3, i32 2)
  %vld3_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.int16x4x3_t undef, <4 x i16> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x3_t %.fca.0.0.insert, <4 x i16> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x4x3_t %.fca.0.1.insert, <4 x i16> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.int16x4x3_t %.fca.0.2.insert
}

define %struct.int32x2x3_t @test_vld3_lane_s32(i32* %a, [3 x <2 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_s32:
; CHECK: ld3.s { v0, v1, v2 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  %vld3_lane_v = tail call { <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld3lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, i32 1, i32 4)
  %vld3_lane_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.int32x2x3_t undef, <2 x i32> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x3_t %.fca.0.0.insert, <2 x i32> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x2x3_t %.fca.0.1.insert, <2 x i32> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.int32x2x3_t %.fca.0.2.insert
}

define %struct.float16x4x3_t @test_vld3_lane_f16(i16* %a, [3 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_f16:
; CHECK: ld3.h { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  %vld3_lane_v = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 3, i32 2)
  %vld3_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.float16x4x3_t undef, <4 x i16> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x3_t %.fca.0.0.insert, <4 x i16> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x4x3_t %.fca.0.1.insert, <4 x i16> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.float16x4x3_t %.fca.0.2.insert
}

define %struct.float32x2x3_t @test_vld3_lane_f32(float* %a, [3 x <2 x float>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_f32:
; CHECK: ld3.s { v0, v1, v2 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x float>] %b.coerce, 2
  %t0 = bitcast float* %a to i8*
  %vld3_lane_v = tail call { <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld3lane.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, <2 x float> %b.coerce.fca.2.extract, i32 1, i32 4)
  %vld3_lane_v.fca.0.extract = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <2 x float>, <2 x float>, <2 x float> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.float32x2x3_t undef, <2 x float> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x3_t %.fca.0.0.insert, <2 x float> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x2x3_t %.fca.0.1.insert, <2 x float> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.float32x2x3_t %.fca.0.2.insert
}

define %struct.poly8x8x3_t @test_vld3_lane_p8(i8* %a, [3 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_p8:
; CHECK: ld3.b { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  %vld3_lane_v = tail call { <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld3lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 7, i32 1)
  %vld3_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.poly8x8x3_t undef, <8 x i8> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x3_t %.fca.0.0.insert, <8 x i8> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly8x8x3_t %.fca.0.1.insert, <8 x i8> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.poly8x8x3_t %.fca.0.2.insert
}

define %struct.poly16x4x3_t @test_vld3_lane_p16(i16* %a, [3 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld3_lane_p16:
; CHECK: ld3.h { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  %vld3_lane_v = tail call { <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld3lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 3, i32 2)
  %vld3_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 0
  %vld3_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 1
  %vld3_lane_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16> } %vld3_lane_v, 2
  %.fca.0.0.insert = insertvalue %struct.poly16x4x3_t undef, <4 x i16> %vld3_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x3_t %.fca.0.0.insert, <4 x i16> %vld3_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x4x3_t %.fca.0.1.insert, <4 x i16> %vld3_lane_v.fca.2.extract, 0, 2
  ret %struct.poly16x4x3_t %.fca.0.2.insert
}

define %struct.uint8x16x4_t @test_vld4q_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld4q_u8:
; CHECK: ld4.16b { v0, v1, v2, v3 }, [x0]
  %vld4q_v = tail call { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } @llvm.arm.neon.vld4.v16i8(i8* %a, i32 1)
  %vld4q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint8x16x4_t undef, <16 x i8> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x16x4_t %.fca.0.0.insert, <16 x i8> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint8x16x4_t %.fca.0.1.insert, <16 x i8> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint8x16x4_t %.fca.0.2.insert, <16 x i8> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.uint8x16x4_t %.fca.0.3.insert
}

declare { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } @llvm.arm.neon.vld4.v16i8(i8*, i32) #3

define %struct.uint16x8x4_t @test_vld4q_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld4q_u16:
; CHECK: ld4.8h { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld4q_v = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4.v8i16(i8* %t0, i32 2)
  %vld4q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint16x8x4_t undef, <8 x i16> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x4_t %.fca.0.0.insert, <8 x i16> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x8x4_t %.fca.0.1.insert, <8 x i16> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint16x8x4_t %.fca.0.2.insert, <8 x i16> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.uint16x8x4_t %.fca.0.3.insert
}

declare { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4.v8i16(i8*, i32) #3

define %struct.uint32x4x4_t @test_vld4q_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld4q_u32:
; CHECK: ld4.4s { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld4q_v = tail call { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld4.v4i32(i8* %t0, i32 4)
  %vld4q_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint32x4x4_t undef, <4 x i32> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x4_t %.fca.0.0.insert, <4 x i32> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x4x4_t %.fca.0.1.insert, <4 x i32> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint32x4x4_t %.fca.0.2.insert, <4 x i32> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.uint32x4x4_t %.fca.0.3.insert
}

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld4.v4i32(i8*, i32) #3

define %struct.int8x16x4_t @test_vld4q_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld4q_s8:
; CHECK: ld4.16b { v0, v1, v2, v3 }, [x0]
  %vld4q_v = tail call { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } @llvm.arm.neon.vld4.v16i8(i8* %a, i32 1)
  %vld4q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.int8x16x4_t undef, <16 x i8> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x16x4_t %.fca.0.0.insert, <16 x i8> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int8x16x4_t %.fca.0.1.insert, <16 x i8> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int8x16x4_t %.fca.0.2.insert, <16 x i8> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.int8x16x4_t %.fca.0.3.insert
}

define %struct.int16x8x4_t @test_vld4q_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld4q_s16:
; CHECK: ld4.8h { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld4q_v = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4.v8i16(i8* %t0, i32 2)
  %vld4q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.int16x8x4_t undef, <8 x i16> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x4_t %.fca.0.0.insert, <8 x i16> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x8x4_t %.fca.0.1.insert, <8 x i16> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int16x8x4_t %.fca.0.2.insert, <8 x i16> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.int16x8x4_t %.fca.0.3.insert
}

define %struct.int32x4x4_t @test_vld4q_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld4q_s32:
; CHECK: ld4.4s { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld4q_v = tail call { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld4.v4i32(i8* %t0, i32 4)
  %vld4q_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.int32x4x4_t undef, <4 x i32> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x4_t %.fca.0.0.insert, <4 x i32> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x4x4_t %.fca.0.1.insert, <4 x i32> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int32x4x4_t %.fca.0.2.insert, <4 x i32> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.int32x4x4_t %.fca.0.3.insert
}

define %struct.float16x8x4_t @test_vld4q_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld4q_f16:
; CHECK: ld4.8h { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld4q_v = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4.v8i16(i8* %t0, i32 2)
  %vld4q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.float16x8x4_t undef, <8 x i16> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x8x4_t %.fca.0.0.insert, <8 x i16> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x8x4_t %.fca.0.1.insert, <8 x i16> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float16x8x4_t %.fca.0.2.insert, <8 x i16> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.float16x8x4_t %.fca.0.3.insert
}

define %struct.float32x4x4_t @test_vld4q_f32(float* %a) #2 {
; CHECK-LABEL: test_vld4q_f32:
; CHECK: ld4.4s { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast float* %a to i8*
  %vld4q_v = tail call { <4 x float>, <4 x float>, <4 x float>, <4 x float> } @llvm.arm.neon.vld4.v4f32(i8* %t0, i32 4)
  %vld4q_v.fca.0.extract = extractvalue { <4 x float>, <4 x float>, <4 x float>, <4 x float> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <4 x float>, <4 x float>, <4 x float>, <4 x float> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <4 x float>, <4 x float>, <4 x float>, <4 x float> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <4 x float>, <4 x float>, <4 x float>, <4 x float> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.float32x4x4_t undef, <4 x float> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x4_t %.fca.0.0.insert, <4 x float> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x4x4_t %.fca.0.1.insert, <4 x float> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float32x4x4_t %.fca.0.2.insert, <4 x float> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.float32x4x4_t %.fca.0.3.insert
}

declare { <4 x float>, <4 x float>, <4 x float>, <4 x float> } @llvm.arm.neon.vld4.v4f32(i8*, i32) #3

define %struct.poly8x16x4_t @test_vld4q_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld4q_p8:
; CHECK: ld4.16b { v0, v1, v2, v3 }, [x0]
  %vld4q_v = tail call { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } @llvm.arm.neon.vld4.v16i8(i8* %a, i32 1)
  %vld4q_v.fca.0.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.poly8x16x4_t undef, <16 x i8> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x16x4_t %.fca.0.0.insert, <16 x i8> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly8x16x4_t %.fca.0.1.insert, <16 x i8> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly8x16x4_t %.fca.0.2.insert, <16 x i8> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.poly8x16x4_t %.fca.0.3.insert
}

define %struct.poly16x8x4_t @test_vld4q_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld4q_p16:
; CHECK: ld4.8h { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld4q_v = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4.v8i16(i8* %t0, i32 2)
  %vld4q_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 0
  %vld4q_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 1
  %vld4q_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 2
  %vld4q_v.fca.3.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_v, 3
  %.fca.0.0.insert = insertvalue %struct.poly16x8x4_t undef, <8 x i16> %vld4q_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x4_t %.fca.0.0.insert, <8 x i16> %vld4q_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x8x4_t %.fca.0.1.insert, <8 x i16> %vld4q_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly16x8x4_t %.fca.0.2.insert, <8 x i16> %vld4q_v.fca.3.extract, 0, 3
  ret %struct.poly16x8x4_t %.fca.0.3.insert
}

define %struct.uint8x8x4_t @test_vld4_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld4_u8:
; CHECK: ld4.8b { v0, v1, v2, v3 }, [x0]
  %vld4_v = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4.v8i8(i8* %a, i32 1)
  %vld4_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint8x8x4_t undef, <8 x i8> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x4_t %.fca.0.0.insert, <8 x i8> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint8x8x4_t %.fca.0.1.insert, <8 x i8> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint8x8x4_t %.fca.0.2.insert, <8 x i8> %vld4_v.fca.3.extract, 0, 3
  ret %struct.uint8x8x4_t %.fca.0.3.insert
}

declare { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4.v8i8(i8*, i32) #3

define %struct.uint16x4x4_t @test_vld4_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld4_u16:
; CHECK: ld4.4h { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld4_v = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4.v4i16(i8* %t0, i32 2)
  %vld4_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint16x4x4_t undef, <4 x i16> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x4_t %.fca.0.0.insert, <4 x i16> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x4x4_t %.fca.0.1.insert, <4 x i16> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint16x4x4_t %.fca.0.2.insert, <4 x i16> %vld4_v.fca.3.extract, 0, 3
  ret %struct.uint16x4x4_t %.fca.0.3.insert
}

declare { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4.v4i16(i8*, i32) #3

define %struct.uint32x2x4_t @test_vld4_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld4_u32:
; CHECK: ld4.2s { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld4_v = tail call { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld4.v2i32(i8* %t0, i32 4)
  %vld4_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint32x2x4_t undef, <2 x i32> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x4_t %.fca.0.0.insert, <2 x i32> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x2x4_t %.fca.0.1.insert, <2 x i32> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint32x2x4_t %.fca.0.2.insert, <2 x i32> %vld4_v.fca.3.extract, 0, 3
  ret %struct.uint32x2x4_t %.fca.0.3.insert
}

declare { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld4.v2i32(i8*, i32) #3

define %struct.uint64x1x4_t @test_vld4_u64(i64* %a) #2 {
; CHECK-LABEL: test_vld4_u64:
; CHECK: ld1.1d { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld4_v = tail call { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld4.v1i64(i8* %t0, i32 8)
  %vld4_v.fca.0.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint64x1x4_t undef, <1 x i64> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint64x1x4_t %.fca.0.0.insert, <1 x i64> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint64x1x4_t %.fca.0.1.insert, <1 x i64> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint64x1x4_t %.fca.0.2.insert, <1 x i64> %vld4_v.fca.3.extract, 0, 3
  ret %struct.uint64x1x4_t %.fca.0.3.insert
}

declare { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld4.v1i64(i8*, i32) #3

define %struct.int8x8x4_t @test_vld4_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld4_s8:
; CHECK: ld4.8b { v0, v1, v2, v3 }, [x0]
  %vld4_v = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4.v8i8(i8* %a, i32 1)
  %vld4_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.int8x8x4_t undef, <8 x i8> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x4_t %.fca.0.0.insert, <8 x i8> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int8x8x4_t %.fca.0.1.insert, <8 x i8> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int8x8x4_t %.fca.0.2.insert, <8 x i8> %vld4_v.fca.3.extract, 0, 3
  ret %struct.int8x8x4_t %.fca.0.3.insert
}

define %struct.int16x4x4_t @test_vld4_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld4_s16:
; CHECK: ld4.4h { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld4_v = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4.v4i16(i8* %t0, i32 2)
  %vld4_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.int16x4x4_t undef, <4 x i16> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x4_t %.fca.0.0.insert, <4 x i16> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x4x4_t %.fca.0.1.insert, <4 x i16> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int16x4x4_t %.fca.0.2.insert, <4 x i16> %vld4_v.fca.3.extract, 0, 3
  ret %struct.int16x4x4_t %.fca.0.3.insert
}

define %struct.int32x2x4_t @test_vld4_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld4_s32:
; CHECK: ld4.2s { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i32* %a to i8*
  %vld4_v = tail call { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld4.v2i32(i8* %t0, i32 4)
  %vld4_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.int32x2x4_t undef, <2 x i32> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x4_t %.fca.0.0.insert, <2 x i32> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x2x4_t %.fca.0.1.insert, <2 x i32> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int32x2x4_t %.fca.0.2.insert, <2 x i32> %vld4_v.fca.3.extract, 0, 3
  ret %struct.int32x2x4_t %.fca.0.3.insert
}

define %struct.int64x1x4_t @test_vld4_s64(i64* %a) #2 {
; CHECK-LABEL: test_vld4_s64:
; CHECK: ld1.1d { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld4_v = tail call { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld4.v1i64(i8* %t0, i32 8)
  %vld4_v.fca.0.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.int64x1x4_t undef, <1 x i64> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int64x1x4_t %.fca.0.0.insert, <1 x i64> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int64x1x4_t %.fca.0.1.insert, <1 x i64> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int64x1x4_t %.fca.0.2.insert, <1 x i64> %vld4_v.fca.3.extract, 0, 3
  ret %struct.int64x1x4_t %.fca.0.3.insert
}

define %struct.float16x4x4_t @test_vld4_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld4_f16:
; CHECK: ld4.4h { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld4_v = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4.v4i16(i8* %t0, i32 2)
  %vld4_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.float16x4x4_t undef, <4 x i16> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x4_t %.fca.0.0.insert, <4 x i16> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x4x4_t %.fca.0.1.insert, <4 x i16> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float16x4x4_t %.fca.0.2.insert, <4 x i16> %vld4_v.fca.3.extract, 0, 3
  ret %struct.float16x4x4_t %.fca.0.3.insert
}

define %struct.float32x2x4_t @test_vld4_f32(float* %a) #2 {
; CHECK-LABEL: test_vld4_f32:
; CHECK: ld4.2s { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast float* %a to i8*
  %vld4_v = tail call { <2 x float>, <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld4.v2f32(i8* %t0, i32 4)
  %vld4_v.fca.0.extract = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.float32x2x4_t undef, <2 x float> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x4_t %.fca.0.0.insert, <2 x float> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x2x4_t %.fca.0.1.insert, <2 x float> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float32x2x4_t %.fca.0.2.insert, <2 x float> %vld4_v.fca.3.extract, 0, 3
  ret %struct.float32x2x4_t %.fca.0.3.insert
}

declare { <2 x float>, <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld4.v2f32(i8*, i32) #3

define %struct.poly8x8x4_t @test_vld4_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld4_p8:
; CHECK: ld4.8b { v0, v1, v2, v3 }, [x0]
  %vld4_v = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4.v8i8(i8* %a, i32 1)
  %vld4_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.poly8x8x4_t undef, <8 x i8> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x4_t %.fca.0.0.insert, <8 x i8> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly8x8x4_t %.fca.0.1.insert, <8 x i8> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly8x8x4_t %.fca.0.2.insert, <8 x i8> %vld4_v.fca.3.extract, 0, 3
  ret %struct.poly8x8x4_t %.fca.0.3.insert
}

define %struct.poly16x4x4_t @test_vld4_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld4_p16:
; CHECK: ld4.4h { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i16* %a to i8*
  %vld4_v = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4.v4i16(i8* %t0, i32 2)
  %vld4_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 0
  %vld4_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 1
  %vld4_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 2
  %vld4_v.fca.3.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_v, 3
  %.fca.0.0.insert = insertvalue %struct.poly16x4x4_t undef, <4 x i16> %vld4_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x4_t %.fca.0.0.insert, <4 x i16> %vld4_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x4x4_t %.fca.0.1.insert, <4 x i16> %vld4_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly16x4x4_t %.fca.0.2.insert, <4 x i16> %vld4_v.fca.3.extract, 0, 3
  ret %struct.poly16x4x4_t %.fca.0.3.insert
}

define %struct.uint8x8x4_t @test_vld4_dup_u8(i8* %a) #2 {
; CHECK-LABEL: test_vld4_dup_u8:
; CHECK: ld4.b { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.8b v0, v3[0]
; CHECK: dup.8b v1, v4[0]
; CHECK: dup.8b v2, v5[0]
; CHECK: dup.8b v3, v6[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %t2 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 2
  %lane2 = shufflevector <8 x i8> %t2, <8 x i8> undef, <8 x i32> zeroinitializer
  %t3 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 3
  %lane3 = shufflevector <8 x i8> %t3, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint8x8x4_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x4_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint8x8x4_t %.fca.0.1.insert, <8 x i8> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint8x8x4_t %.fca.0.2.insert, <8 x i8> %lane3, 0, 3
  ret %struct.uint8x8x4_t %.fca.0.3.insert
}

declare { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4lane.v8i8(i8*, <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>, i32, i32) #3

define %struct.uint16x4x4_t @test_vld4_dup_u16(i16* %a) #2 {
; CHECK-LABEL: test_vld4_dup_u16:
; CHECK: ld4.h { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.4h v0, v3[0]
; CHECK: dup.4h v1, v4[0]
; CHECK: dup.4h v2, v5[0]
; CHECK: dup.4h v3, v6[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %t3 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 2
  %lane2 = shufflevector <4 x i16> %t3, <4 x i16> undef, <4 x i32> zeroinitializer
  %t4 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 3
  %lane3 = shufflevector <4 x i16> %t4, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint16x4x4_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x4_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x4x4_t %.fca.0.1.insert, <4 x i16> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint16x4x4_t %.fca.0.2.insert, <4 x i16> %lane3, 0, 3
  ret %struct.uint16x4x4_t %.fca.0.3.insert
}

declare { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8*, <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16>, i32, i32) #3

define %struct.uint32x2x4_t @test_vld4_dup_u32(i32* %a) #2 {
; CHECK-LABEL: test_vld4_dup_u32:
; CHECK: ld4.s { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.2s v0, v3[0]
; CHECK: dup.2s v1, v4[0]
; CHECK: dup.2s v2, v5[0]
; CHECK: dup.2s v3, v6[0]
  %t0 = bitcast i32* %a to i8*
  %vld_dup = tail call { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld4lane.v2i32(i8* %t0, <2 x i32> undef, <2 x i32> undef, <2 x i32> undef, <2 x i32> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 0
  %lane = shufflevector <2 x i32> %t1, <2 x i32> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 1
  %lane1 = shufflevector <2 x i32> %t2, <2 x i32> undef, <2 x i32> zeroinitializer
  %t3 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 2
  %lane2 = shufflevector <2 x i32> %t3, <2 x i32> undef, <2 x i32> zeroinitializer
  %t4 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 3
  %lane3 = shufflevector <2 x i32> %t4, <2 x i32> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.uint32x2x4_t undef, <2 x i32> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x4_t %.fca.0.0.insert, <2 x i32> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x2x4_t %.fca.0.1.insert, <2 x i32> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint32x2x4_t %.fca.0.2.insert, <2 x i32> %lane3, 0, 3
  ret %struct.uint32x2x4_t %.fca.0.3.insert
}

declare { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld4lane.v2i32(i8*, <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32>, i32, i32) #3

define %struct.uint64x1x4_t @test_vld4_dup_u64(i64* %a) #2 {
; CHECK-LABEL: test_vld4_dup_u64:
; CHECK: ld1.1d { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld_dup = tail call { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld4.v1i64(i8* %t0, i32 8)
  %vld_dup.fca.0.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 0
  %vld_dup.fca.1.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 1
  %vld_dup.fca.2.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 2
  %vld_dup.fca.3.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 3
  %.fca.0.0.insert = insertvalue %struct.uint64x1x4_t undef, <1 x i64> %vld_dup.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint64x1x4_t %.fca.0.0.insert, <1 x i64> %vld_dup.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint64x1x4_t %.fca.0.1.insert, <1 x i64> %vld_dup.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint64x1x4_t %.fca.0.2.insert, <1 x i64> %vld_dup.fca.3.extract, 0, 3
  ret %struct.uint64x1x4_t %.fca.0.3.insert
}

define %struct.int8x8x4_t @test_vld4_dup_s8(i8* %a) #2 {
; CHECK-LABEL: test_vld4_dup_s8:
; CHECK: ld4.b { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.8b v0, v3[0]
; CHECK: dup.8b v1, v4[0]
; CHECK: dup.8b v2, v5[0]
; CHECK: dup.8b v3, v6[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %t2 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 2
  %lane2 = shufflevector <8 x i8> %t2, <8 x i8> undef, <8 x i32> zeroinitializer
  %t3 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 3
  %lane3 = shufflevector <8 x i8> %t3, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int8x8x4_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x4_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int8x8x4_t %.fca.0.1.insert, <8 x i8> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int8x8x4_t %.fca.0.2.insert, <8 x i8> %lane3, 0, 3
  ret %struct.int8x8x4_t %.fca.0.3.insert
}

define %struct.int16x4x4_t @test_vld4_dup_s16(i16* %a) #2 {
; CHECK-LABEL: test_vld4_dup_s16:
; CHECK: ld4.h { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.4h v0, v3[0]
; CHECK: dup.4h v1, v4[0]
; CHECK: dup.4h v2, v5[0]
; CHECK: dup.4h v3, v6[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %t3 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 2
  %lane2 = shufflevector <4 x i16> %t3, <4 x i16> undef, <4 x i32> zeroinitializer
  %t4 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 3
  %lane3 = shufflevector <4 x i16> %t4, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int16x4x4_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x4_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x4x4_t %.fca.0.1.insert, <4 x i16> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int16x4x4_t %.fca.0.2.insert, <4 x i16> %lane3, 0, 3
  ret %struct.int16x4x4_t %.fca.0.3.insert
}

define %struct.int32x2x4_t @test_vld4_dup_s32(i32* %a) #2 {
; CHECK-LABEL: test_vld4_dup_s32:
; CHECK: ld4.s { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.2s v0, v3[0]
; CHECK: dup.2s v1, v4[0]
; CHECK: dup.2s v2, v5[0]
; CHECK: dup.2s v3, v6[0]
  %t0 = bitcast i32* %a to i8*
  %vld_dup = tail call { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld4lane.v2i32(i8* %t0, <2 x i32> undef, <2 x i32> undef, <2 x i32> undef, <2 x i32> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 0
  %lane = shufflevector <2 x i32> %t1, <2 x i32> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 1
  %lane1 = shufflevector <2 x i32> %t2, <2 x i32> undef, <2 x i32> zeroinitializer
  %t3 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 2
  %lane2 = shufflevector <2 x i32> %t3, <2 x i32> undef, <2 x i32> zeroinitializer
  %t4 = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld_dup, 3
  %lane3 = shufflevector <2 x i32> %t4, <2 x i32> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.int32x2x4_t undef, <2 x i32> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x4_t %.fca.0.0.insert, <2 x i32> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x2x4_t %.fca.0.1.insert, <2 x i32> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int32x2x4_t %.fca.0.2.insert, <2 x i32> %lane3, 0, 3
  ret %struct.int32x2x4_t %.fca.0.3.insert
}

define %struct.int64x1x4_t @test_vld4_dup_s64(i64* %a) #2 {
; CHECK-LABEL: test_vld4_dup_s64:
; CHECK: ld1.1d { v0, v1, v2, v3 }, [x0]
  %t0 = bitcast i64* %a to i8*
  %vld_dup = tail call { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } @llvm.arm.neon.vld4.v1i64(i8* %t0, i32 8)
  %vld_dup.fca.0.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 0
  %vld_dup.fca.1.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 1
  %vld_dup.fca.2.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 2
  %vld_dup.fca.3.extract = extractvalue { <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64> } %vld_dup, 3
  %.fca.0.0.insert = insertvalue %struct.int64x1x4_t undef, <1 x i64> %vld_dup.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int64x1x4_t %.fca.0.0.insert, <1 x i64> %vld_dup.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int64x1x4_t %.fca.0.1.insert, <1 x i64> %vld_dup.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int64x1x4_t %.fca.0.2.insert, <1 x i64> %vld_dup.fca.3.extract, 0, 3
  ret %struct.int64x1x4_t %.fca.0.3.insert
}

define %struct.float16x4x4_t @test_vld4_dup_f16(i16* %a) #2 {
; CHECK-LABEL: test_vld4_dup_f16:
; CHECK: ld4.h { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.4h v0, v3[0]
; CHECK: dup.4h v1, v4[0]
; CHECK: dup.4h v2, v5[0]
; CHECK: dup.4h v3, v6[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %t3 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 2
  %lane2 = shufflevector <4 x i16> %t3, <4 x i16> undef, <4 x i32> zeroinitializer
  %t4 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 3
  %lane3 = shufflevector <4 x i16> %t4, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.float16x4x4_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x4_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x4x4_t %.fca.0.1.insert, <4 x i16> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float16x4x4_t %.fca.0.2.insert, <4 x i16> %lane3, 0, 3
  ret %struct.float16x4x4_t %.fca.0.3.insert
}

define %struct.float32x2x4_t @test_vld4_dup_f32(float* %a) #2 {
; CHECK-LABEL: test_vld4_dup_f32:
; CHECK: ld4.s { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.2s v0, v3[0]
; CHECK: dup.2s v1, v4[0]
; CHECK: dup.2s v2, v5[0]
; CHECK: dup.2s v3, v6[0]
  %t0 = bitcast float* %a to i8*
  %vld_dup = tail call { <2 x float>, <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld4lane.v2f32(i8* %t0, <2 x float> undef, <2 x float> undef, <2 x float> undef, <2 x float> undef, i32 0, i32 4)
  %t1 = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld_dup, 0
  %lane = shufflevector <2 x float> %t1, <2 x float> undef, <2 x i32> zeroinitializer
  %t2 = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld_dup, 1
  %lane1 = shufflevector <2 x float> %t2, <2 x float> undef, <2 x i32> zeroinitializer
  %t3 = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld_dup, 2
  %lane2 = shufflevector <2 x float> %t3, <2 x float> undef, <2 x i32> zeroinitializer
  %t4 = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld_dup, 3
  %lane3 = shufflevector <2 x float> %t4, <2 x float> undef, <2 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.float32x2x4_t undef, <2 x float> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x4_t %.fca.0.0.insert, <2 x float> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x2x4_t %.fca.0.1.insert, <2 x float> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float32x2x4_t %.fca.0.2.insert, <2 x float> %lane3, 0, 3
  ret %struct.float32x2x4_t %.fca.0.3.insert
}

declare { <2 x float>, <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld4lane.v2f32(i8*, <2 x float>, <2 x float>, <2 x float>, <2 x float>, i32, i32) #3

define %struct.poly8x8x4_t @test_vld4_dup_p8(i8* %a) #2 {
; CHECK-LABEL: test_vld4_dup_p8:
; CHECK: ld4.b { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.8b v0, v3[0]
; CHECK: dup.8b v1, v4[0]
; CHECK: dup.8b v2, v5[0]
; CHECK: dup.8b v3, v6[0]
  %vld_dup = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4lane.v8i8(i8* %a, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, <8 x i8> undef, i32 0, i32 1)
  %t0 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 0
  %lane = shufflevector <8 x i8> %t0, <8 x i8> undef, <8 x i32> zeroinitializer
  %t1 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 1
  %lane1 = shufflevector <8 x i8> %t1, <8 x i8> undef, <8 x i32> zeroinitializer
  %t2 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 2
  %lane2 = shufflevector <8 x i8> %t2, <8 x i8> undef, <8 x i32> zeroinitializer
  %t3 = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld_dup, 3
  %lane3 = shufflevector <8 x i8> %t3, <8 x i8> undef, <8 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.poly8x8x4_t undef, <8 x i8> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x4_t %.fca.0.0.insert, <8 x i8> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly8x8x4_t %.fca.0.1.insert, <8 x i8> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly8x8x4_t %.fca.0.2.insert, <8 x i8> %lane3, 0, 3
  ret %struct.poly8x8x4_t %.fca.0.3.insert
}

define %struct.poly16x4x4_t @test_vld4_dup_p16(i16* %a) #2 {
; CHECK-LABEL: test_vld4_dup_p16:
; CHECK: ld4.h { v3, v4, v5, v6 }[0], [x0]
; CHECK: dup.4h v0, v3[0]
; CHECK: dup.4h v1, v4[0]
; CHECK: dup.4h v2, v5[0]
; CHECK: dup.4h v3, v6[0]
  %t0 = bitcast i16* %a to i8*
  %vld_dup = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8* %t0, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, <4 x i16> undef, i32 0, i32 2)
  %t1 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 0
  %lane = shufflevector <4 x i16> %t1, <4 x i16> undef, <4 x i32> zeroinitializer
  %t2 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 1
  %lane1 = shufflevector <4 x i16> %t2, <4 x i16> undef, <4 x i32> zeroinitializer
  %t3 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 2
  %lane2 = shufflevector <4 x i16> %t3, <4 x i16> undef, <4 x i32> zeroinitializer
  %t4 = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld_dup, 3
  %lane3 = shufflevector <4 x i16> %t4, <4 x i16> undef, <4 x i32> zeroinitializer
  %.fca.0.0.insert = insertvalue %struct.poly16x4x4_t undef, <4 x i16> %lane, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x4_t %.fca.0.0.insert, <4 x i16> %lane1, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x4x4_t %.fca.0.1.insert, <4 x i16> %lane2, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly16x4x4_t %.fca.0.2.insert, <4 x i16> %lane3, 0, 3
  ret %struct.poly16x4x4_t %.fca.0.3.insert
}

define %struct.uint16x8x4_t @test_vld4q_lane_u16(i16* %a, [4 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4q_lane_u16:
; CHECK: ld4.h { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  %vld4q_lane_v = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 7, i32 2)
  %vld4q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 0
  %vld4q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 1
  %vld4q_lane_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 2
  %vld4q_lane_v.fca.3.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint16x8x4_t undef, <8 x i16> %vld4q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x4_t %.fca.0.0.insert, <8 x i16> %vld4q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x8x4_t %.fca.0.1.insert, <8 x i16> %vld4q_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint16x8x4_t %.fca.0.2.insert, <8 x i16> %vld4q_lane_v.fca.3.extract, 0, 3
  ret %struct.uint16x8x4_t %.fca.0.3.insert
}

declare { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4lane.v8i16(i8*, <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16>, i32, i32) #3

define %struct.uint32x4x4_t @test_vld4q_lane_u32(i32* %a, [4 x <4 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4q_lane_u32:
; CHECK: ld4.s { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  %vld4q_lane_v = tail call { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld4lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, <4 x i32> %b.coerce.fca.3.extract, i32 3, i32 4)
  %vld4q_lane_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_lane_v, 0
  %vld4q_lane_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_lane_v, 1
  %vld4q_lane_v.fca.2.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_lane_v, 2
  %vld4q_lane_v.fca.3.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint32x4x4_t undef, <4 x i32> %vld4q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x4_t %.fca.0.0.insert, <4 x i32> %vld4q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x4x4_t %.fca.0.1.insert, <4 x i32> %vld4q_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint32x4x4_t %.fca.0.2.insert, <4 x i32> %vld4q_lane_v.fca.3.extract, 0, 3
  ret %struct.uint32x4x4_t %.fca.0.3.insert
}

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld4lane.v4i32(i8*, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, i32, i32) #3

define %struct.int16x8x4_t @test_vld4q_lane_s16(i16* %a, [4 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4q_lane_s16:
; CHECK: ld4.h { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  %vld4q_lane_v = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 7, i32 2)
  %vld4q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 0
  %vld4q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 1
  %vld4q_lane_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 2
  %vld4q_lane_v.fca.3.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.int16x8x4_t undef, <8 x i16> %vld4q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x4_t %.fca.0.0.insert, <8 x i16> %vld4q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x8x4_t %.fca.0.1.insert, <8 x i16> %vld4q_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int16x8x4_t %.fca.0.2.insert, <8 x i16> %vld4q_lane_v.fca.3.extract, 0, 3
  ret %struct.int16x8x4_t %.fca.0.3.insert
}

define %struct.int32x4x4_t @test_vld4q_lane_s32(i32* %a, [4 x <4 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4q_lane_s32:
; CHECK: ld4.s { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  %vld4q_lane_v = tail call { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @llvm.arm.neon.vld4lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, <4 x i32> %b.coerce.fca.3.extract, i32 3, i32 4)
  %vld4q_lane_v.fca.0.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_lane_v, 0
  %vld4q_lane_v.fca.1.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_lane_v, 1
  %vld4q_lane_v.fca.2.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_lane_v, 2
  %vld4q_lane_v.fca.3.extract = extractvalue { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } %vld4q_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.int32x4x4_t undef, <4 x i32> %vld4q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x4_t %.fca.0.0.insert, <4 x i32> %vld4q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x4x4_t %.fca.0.1.insert, <4 x i32> %vld4q_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int32x4x4_t %.fca.0.2.insert, <4 x i32> %vld4q_lane_v.fca.3.extract, 0, 3
  ret %struct.int32x4x4_t %.fca.0.3.insert
}

define %struct.float16x8x4_t @test_vld4q_lane_f16(i16* %a, [4 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4q_lane_f16:
; CHECK: ld4.h { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  %vld4q_lane_v = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 7, i32 2)
  %vld4q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 0
  %vld4q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 1
  %vld4q_lane_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 2
  %vld4q_lane_v.fca.3.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.float16x8x4_t undef, <8 x i16> %vld4q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x8x4_t %.fca.0.0.insert, <8 x i16> %vld4q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x8x4_t %.fca.0.1.insert, <8 x i16> %vld4q_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float16x8x4_t %.fca.0.2.insert, <8 x i16> %vld4q_lane_v.fca.3.extract, 0, 3
  ret %struct.float16x8x4_t %.fca.0.3.insert
}

define %struct.float32x4x4_t @test_vld4q_lane_f32(float* %a, [4 x <4 x float>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4q_lane_f32:
; CHECK: ld4.s { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x float>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x float>] %b.coerce, 3
  %t0 = bitcast float* %a to i8*
  %vld4q_lane_v = tail call { <4 x float>, <4 x float>, <4 x float>, <4 x float> } @llvm.arm.neon.vld4lane.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, <4 x float> %b.coerce.fca.2.extract, <4 x float> %b.coerce.fca.3.extract, i32 3, i32 4)
  %vld4q_lane_v.fca.0.extract = extractvalue { <4 x float>, <4 x float>, <4 x float>, <4 x float> } %vld4q_lane_v, 0
  %vld4q_lane_v.fca.1.extract = extractvalue { <4 x float>, <4 x float>, <4 x float>, <4 x float> } %vld4q_lane_v, 1
  %vld4q_lane_v.fca.2.extract = extractvalue { <4 x float>, <4 x float>, <4 x float>, <4 x float> } %vld4q_lane_v, 2
  %vld4q_lane_v.fca.3.extract = extractvalue { <4 x float>, <4 x float>, <4 x float>, <4 x float> } %vld4q_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.float32x4x4_t undef, <4 x float> %vld4q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x4_t %.fca.0.0.insert, <4 x float> %vld4q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x4x4_t %.fca.0.1.insert, <4 x float> %vld4q_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float32x4x4_t %.fca.0.2.insert, <4 x float> %vld4q_lane_v.fca.3.extract, 0, 3
  ret %struct.float32x4x4_t %.fca.0.3.insert
}

declare { <4 x float>, <4 x float>, <4 x float>, <4 x float> } @llvm.arm.neon.vld4lane.v4f32(i8*, <4 x float>, <4 x float>, <4 x float>, <4 x float>, i32, i32) #3

define %struct.poly16x8x4_t @test_vld4q_lane_p16(i16* %a, [4 x <8 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4q_lane_p16:
; CHECK: ld4.h { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  %vld4q_lane_v = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.arm.neon.vld4lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 7, i32 2)
  %vld4q_lane_v.fca.0.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 0
  %vld4q_lane_v.fca.1.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 1
  %vld4q_lane_v.fca.2.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 2
  %vld4q_lane_v.fca.3.extract = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %vld4q_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.poly16x8x4_t undef, <8 x i16> %vld4q_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x4_t %.fca.0.0.insert, <8 x i16> %vld4q_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x8x4_t %.fca.0.1.insert, <8 x i16> %vld4q_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly16x8x4_t %.fca.0.2.insert, <8 x i16> %vld4q_lane_v.fca.3.extract, 0, 3
  ret %struct.poly16x8x4_t %.fca.0.3.insert
}

define %struct.uint8x8x4_t @test_vld4_lane_u8(i8* %a, [4 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_u8:
; CHECK: ld4.b { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  %vld4_lane_v = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 7, i32 1)
  %vld4_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint8x8x4_t undef, <8 x i8> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x4_t %.fca.0.0.insert, <8 x i8> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint8x8x4_t %.fca.0.1.insert, <8 x i8> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint8x8x4_t %.fca.0.2.insert, <8 x i8> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.uint8x8x4_t %.fca.0.3.insert
}

define %struct.uint16x4x4_t @test_vld4_lane_u16(i16* %a, [4 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_u16:
; CHECK: ld4.h { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  %vld4_lane_v = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 3, i32 2)
  %vld4_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint16x4x4_t undef, <4 x i16> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x4_t %.fca.0.0.insert, <4 x i16> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint16x4x4_t %.fca.0.1.insert, <4 x i16> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint16x4x4_t %.fca.0.2.insert, <4 x i16> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.uint16x4x4_t %.fca.0.3.insert
}

define %struct.uint32x2x4_t @test_vld4_lane_u32(i32* %a, [4 x <2 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_u32:
; CHECK: ld4.s { v0, v1, v2, v3 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  %vld4_lane_v = tail call { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld4lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, <2 x i32> %b.coerce.fca.3.extract, i32 1, i32 4)
  %vld4_lane_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.uint32x2x4_t undef, <2 x i32> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x4_t %.fca.0.0.insert, <2 x i32> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.uint32x2x4_t %.fca.0.1.insert, <2 x i32> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.uint32x2x4_t %.fca.0.2.insert, <2 x i32> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.uint32x2x4_t %.fca.0.3.insert
}

define %struct.int8x8x4_t @test_vld4_lane_s8(i8* %a, [4 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_s8:
; CHECK: ld4.b { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  %vld4_lane_v = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 7, i32 1)
  %vld4_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.int8x8x4_t undef, <8 x i8> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x4_t %.fca.0.0.insert, <8 x i8> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int8x8x4_t %.fca.0.1.insert, <8 x i8> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int8x8x4_t %.fca.0.2.insert, <8 x i8> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.int8x8x4_t %.fca.0.3.insert
}

define %struct.int16x4x4_t @test_vld4_lane_s16(i16* %a, [4 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_s16:
; CHECK: ld4.h { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  %vld4_lane_v = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 3, i32 2)
  %vld4_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.int16x4x4_t undef, <4 x i16> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x4_t %.fca.0.0.insert, <4 x i16> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int16x4x4_t %.fca.0.1.insert, <4 x i16> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int16x4x4_t %.fca.0.2.insert, <4 x i16> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.int16x4x4_t %.fca.0.3.insert
}

define %struct.int32x2x4_t @test_vld4_lane_s32(i32* %a, [4 x <2 x i32>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_s32:
; CHECK: ld4.s { v0, v1, v2, v3 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  %vld4_lane_v = tail call { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.arm.neon.vld4lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, <2 x i32> %b.coerce.fca.3.extract, i32 1, i32 4)
  %vld4_lane_v.fca.0.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.int32x2x4_t undef, <2 x i32> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x4_t %.fca.0.0.insert, <2 x i32> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.int32x2x4_t %.fca.0.1.insert, <2 x i32> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.int32x2x4_t %.fca.0.2.insert, <2 x i32> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.int32x2x4_t %.fca.0.3.insert
}

define %struct.float16x4x4_t @test_vld4_lane_f16(i16* %a, [4 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_f16:
; CHECK: ld4.h { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  %vld4_lane_v = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 3, i32 2)
  %vld4_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.float16x4x4_t undef, <4 x i16> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float16x4x4_t %.fca.0.0.insert, <4 x i16> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float16x4x4_t %.fca.0.1.insert, <4 x i16> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float16x4x4_t %.fca.0.2.insert, <4 x i16> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.float16x4x4_t %.fca.0.3.insert
}

define %struct.float32x2x4_t @test_vld4_lane_f32(float* %a, [4 x <2 x float>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_f32:
; CHECK: ld4.s { v0, v1, v2, v3 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x float>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x float>] %b.coerce, 3
  %t0 = bitcast float* %a to i8*
  %vld4_lane_v = tail call { <2 x float>, <2 x float>, <2 x float>, <2 x float> } @llvm.arm.neon.vld4lane.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, <2 x float> %b.coerce.fca.2.extract, <2 x float> %b.coerce.fca.3.extract, i32 1, i32 4)
  %vld4_lane_v.fca.0.extract = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <2 x float>, <2 x float>, <2 x float>, <2 x float> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.float32x2x4_t undef, <2 x float> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x4_t %.fca.0.0.insert, <2 x float> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.float32x2x4_t %.fca.0.1.insert, <2 x float> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.float32x2x4_t %.fca.0.2.insert, <2 x float> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.float32x2x4_t %.fca.0.3.insert
}

define %struct.poly8x8x4_t @test_vld4_lane_p8(i8* %a, [4 x <8 x i8>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_p8:
; CHECK: ld4.b { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  %vld4_lane_v = tail call { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } @llvm.arm.neon.vld4lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 7, i32 1)
  %vld4_lane_v.fca.0.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.poly8x8x4_t undef, <8 x i8> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x4_t %.fca.0.0.insert, <8 x i8> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly8x8x4_t %.fca.0.1.insert, <8 x i8> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly8x8x4_t %.fca.0.2.insert, <8 x i8> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.poly8x8x4_t %.fca.0.3.insert
}

define %struct.poly16x4x4_t @test_vld4_lane_p16(i16* %a, [4 x <4 x i16>] %b.coerce) #2 {
; CHECK-LABEL: test_vld4_lane_p16:
; CHECK: ld4.h { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  %vld4_lane_v = tail call { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } @llvm.arm.neon.vld4lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 3, i32 2)
  %vld4_lane_v.fca.0.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 0
  %vld4_lane_v.fca.1.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 1
  %vld4_lane_v.fca.2.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 2
  %vld4_lane_v.fca.3.extract = extractvalue { <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16> } %vld4_lane_v, 3
  %.fca.0.0.insert = insertvalue %struct.poly16x4x4_t undef, <4 x i16> %vld4_lane_v.fca.0.extract, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x4_t %.fca.0.0.insert, <4 x i16> %vld4_lane_v.fca.1.extract, 0, 1
  %.fca.0.2.insert = insertvalue %struct.poly16x4x4_t %.fca.0.1.insert, <4 x i16> %vld4_lane_v.fca.2.extract, 0, 2
  %.fca.0.3.insert = insertvalue %struct.poly16x4x4_t %.fca.0.2.insert, <4 x i16> %vld4_lane_v.fca.3.extract, 0, 3
  ret %struct.poly16x4x4_t %.fca.0.3.insert
}

define <8 x i8> @test_vmax_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmax_s8:
; CHECK: smax.8b v0, v0, v1
  %vmax_v.i = tail call <8 x i8> @llvm.arm.neon.vmaxs.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vmax_v.i
}

define <4 x i16> @test_vmax_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmax_s16:
; CHECK: smax.4h v0, v0, v1
  %vmax_v2.i = tail call <4 x i16> @llvm.arm.neon.vmaxs.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vmax_v2.i
}

define <2 x i32> @test_vmax_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmax_s32:
; CHECK: smax.2s v0, v0, v1
  %vmax_v2.i = tail call <2 x i32> @llvm.arm.neon.vmaxs.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vmax_v2.i
}

define <8 x i8> @test_vmax_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmax_u8:
; CHECK: umax.8b v0, v0, v1
  %vmax_v.i = tail call <8 x i8> @llvm.arm.neon.vmaxu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vmax_v.i
}

define <4 x i16> @test_vmax_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmax_u16:
; CHECK: umax.4h v0, v0, v1
  %vmax_v2.i = tail call <4 x i16> @llvm.arm.neon.vmaxu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vmax_v2.i
}

define <2 x i32> @test_vmax_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmax_u32:
; CHECK: umax.2s v0, v0, v1
  %vmax_v2.i = tail call <2 x i32> @llvm.arm.neon.vmaxu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vmax_v2.i
}

define <2 x float> @test_vmax_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vmax_f32:
; CHECK: fmax.2s v0, v0, v1
  %vmax_v2.i = tail call <2 x float> @llvm.arm.neon.vmaxs.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x float> %vmax_v2.i
}

define <16 x i8> @test_vmaxq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vmaxq_s8:
; CHECK: smax.16b v0, v0, v1
  %vmaxq_v.i = tail call <16 x i8> @llvm.arm.neon.vmaxs.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vmaxq_v.i
}

define <8 x i16> @test_vmaxq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vmaxq_s16:
; CHECK: smax.8h v0, v0, v1
  %vmaxq_v2.i = tail call <8 x i16> @llvm.arm.neon.vmaxs.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vmaxq_v2.i
}

define <4 x i32> @test_vmaxq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vmaxq_s32:
; CHECK: smax.4s v0, v0, v1
  %vmaxq_v2.i = tail call <4 x i32> @llvm.arm.neon.vmaxs.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vmaxq_v2.i
}

define <16 x i8> @test_vmaxq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vmaxq_u8:
; CHECK: umax.16b v0, v0, v1
  %vmaxq_v.i = tail call <16 x i8> @llvm.arm.neon.vmaxu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vmaxq_v.i
}

define <8 x i16> @test_vmaxq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vmaxq_u16:
; CHECK: umax.8h v0, v0, v1
  %vmaxq_v2.i = tail call <8 x i16> @llvm.arm.neon.vmaxu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vmaxq_v2.i
}

define <4 x i32> @test_vmaxq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vmaxq_u32:
; CHECK: umax.4s v0, v0, v1
  %vmaxq_v2.i = tail call <4 x i32> @llvm.arm.neon.vmaxu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vmaxq_v2.i
}

define <4 x float> @test_vmaxq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vmaxq_f32:
; CHECK: fmax.4s v0, v0, v1
  %vmaxq_v2.i = tail call <4 x float> @llvm.arm.neon.vmaxs.v4f32(<4 x float> %a, <4 x float> %b) #5
  ret <4 x float> %vmaxq_v2.i
}

define <8 x i8> @test_vmin_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmin_s8:
; CHECK: smin.8b v0, v0, v1
  %vmin_v.i = tail call <8 x i8> @llvm.arm.neon.vmins.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vmin_v.i
}

define <4 x i16> @test_vmin_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmin_s16:
; CHECK: smin.4h v0, v0, v1
  %vmin_v2.i = tail call <4 x i16> @llvm.arm.neon.vmins.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vmin_v2.i
}

define <2 x i32> @test_vmin_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmin_s32:
; CHECK: smin.2s v0, v0, v1
  %vmin_v2.i = tail call <2 x i32> @llvm.arm.neon.vmins.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vmin_v2.i
}

define <8 x i8> @test_vmin_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmin_u8:
; CHECK: umin.8b v0, v0, v1
  %vmin_v.i = tail call <8 x i8> @llvm.arm.neon.vminu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vmin_v.i
}

define <4 x i16> @test_vmin_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmin_u16:
; CHECK: umin.4h v0, v0, v1
  %vmin_v2.i = tail call <4 x i16> @llvm.arm.neon.vminu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vmin_v2.i
}

define <2 x i32> @test_vmin_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmin_u32:
; CHECK: umin.2s v0, v0, v1
  %vmin_v2.i = tail call <2 x i32> @llvm.arm.neon.vminu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vmin_v2.i
}

define <2 x float> @test_vmin_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vmin_f32:
; CHECK: fmin.2s v0, v0, v1
  %vmin_v2.i = tail call <2 x float> @llvm.arm.neon.vmins.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x float> %vmin_v2.i
}

define <16 x i8> @test_vminq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vminq_s8:
; CHECK: smin.16b v0, v0, v1
  %vminq_v.i = tail call <16 x i8> @llvm.arm.neon.vmins.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vminq_v.i
}

define <8 x i16> @test_vminq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vminq_s16:
; CHECK: smin.8h v0, v0, v1
  %vminq_v2.i = tail call <8 x i16> @llvm.arm.neon.vmins.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vminq_v2.i
}

define <4 x i32> @test_vminq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vminq_s32:
; CHECK: smin.4s v0, v0, v1
  %vminq_v2.i = tail call <4 x i32> @llvm.arm.neon.vmins.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vminq_v2.i
}

define <16 x i8> @test_vminq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vminq_u8:
; CHECK: umin.16b v0, v0, v1
  %vminq_v.i = tail call <16 x i8> @llvm.arm.neon.vminu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vminq_v.i
}

define <8 x i16> @test_vminq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vminq_u16:
; CHECK: umin.8h v0, v0, v1
  %vminq_v2.i = tail call <8 x i16> @llvm.arm.neon.vminu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vminq_v2.i
}

define <4 x i32> @test_vminq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vminq_u32:
; CHECK: umin.4s v0, v0, v1
  %vminq_v2.i = tail call <4 x i32> @llvm.arm.neon.vminu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vminq_v2.i
}

define <4 x float> @test_vminq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vminq_f32:
; CHECK: fmin.4s v0, v0, v1
  %vminq_v2.i = tail call <4 x float> @llvm.arm.neon.vmins.v4f32(<4 x float> %a, <4 x float> %b) #5
  ret <4 x float> %vminq_v2.i
}

define <8 x i8> @test_vmla_s8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vmla_s8:
; CHECK: mla.8b v0, v1, v2
  %mul.i = mul <8 x i8> %b, %c
  %add.i = add <8 x i8> %mul.i, %a
  ret <8 x i8> %add.i
}

define <4 x i16> @test_vmla_s16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmla_s16:
; CHECK: mla.4h v0, v1, v2
  %mul.i = mul <4 x i16> %b, %c
  %add.i = add <4 x i16> %mul.i, %a
  ret <4 x i16> %add.i
}

define <2 x i32> @test_vmla_s32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmla_s32:
; CHECK: mla.2s v0, v1, v2
  %mul.i = mul <2 x i32> %b, %c
  %add.i = add <2 x i32> %mul.i, %a
  ret <2 x i32> %add.i
}

define <2 x float> @test_vmla_f32(<2 x float> %a, <2 x float> %b, <2 x float> %c) #0 {
; CHECK-LABEL: test_vmla_f32:
; CHECK: fmul.2s v1, v1, v2
; CHECK: fadd.2s v0, v1, v0
  %mul.i = fmul <2 x float> %b, %c
  %add.i = fadd <2 x float> %mul.i, %a
  ret <2 x float> %add.i
}

define <8 x i8> @test_vmla_u8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vmla_u8:
; CHECK: mla.8b v0, v1, v2
  %mul.i = mul <8 x i8> %b, %c
  %add.i = add <8 x i8> %mul.i, %a
  ret <8 x i8> %add.i
}

define <4 x i16> @test_vmla_u16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmla_u16:
; CHECK: mla.4h v0, v1, v2
  %mul.i = mul <4 x i16> %b, %c
  %add.i = add <4 x i16> %mul.i, %a
  ret <4 x i16> %add.i
}

define <2 x i32> @test_vmla_u32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmla_u32:
; CHECK: mla.2s v0, v1, v2
  %mul.i = mul <2 x i32> %b, %c
  %add.i = add <2 x i32> %mul.i, %a
  ret <2 x i32> %add.i
}

define <16 x i8> @test_vmlaq_s8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vmlaq_s8:
; CHECK: mla.16b v0, v1, v2
  %mul.i = mul <16 x i8> %b, %c
  %add.i = add <16 x i8> %mul.i, %a
  ret <16 x i8> %add.i
}

define <8 x i16> @test_vmlaq_s16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vmlaq_s16:
; CHECK: mla.8h v0, v1, v2
  %mul.i = mul <8 x i16> %b, %c
  %add.i = add <8 x i16> %mul.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vmlaq_s32(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) #0 {
; CHECK-LABEL: test_vmlaq_s32:
; CHECK: mla.4s v0, v1, v2
  %mul.i = mul <4 x i32> %b, %c
  %add.i = add <4 x i32> %mul.i, %a
  ret <4 x i32> %add.i
}

define <4 x float> @test_vmlaq_f32(<4 x float> %a, <4 x float> %b, <4 x float> %c) #0 {
; CHECK-LABEL: test_vmlaq_f32:
; CHECK: fmul.4s v1, v1, v2
; CHECK: fadd.4s v0, v1, v0
  %mul.i = fmul <4 x float> %b, %c
  %add.i = fadd <4 x float> %mul.i, %a
  ret <4 x float> %add.i
}

define <16 x i8> @test_vmlaq_u8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vmlaq_u8:
; CHECK: mla.16b v0, v1, v2
  %mul.i = mul <16 x i8> %b, %c
  %add.i = add <16 x i8> %mul.i, %a
  ret <16 x i8> %add.i
}

define <8 x i16> @test_vmlaq_u16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vmlaq_u16:
; CHECK: mla.8h v0, v1, v2
  %mul.i = mul <8 x i16> %b, %c
  %add.i = add <8 x i16> %mul.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vmlaq_u32(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) #0 {
; CHECK-LABEL: test_vmlaq_u32:
; CHECK: mla.4s v0, v1, v2
  %mul.i = mul <4 x i32> %b, %c
  %add.i = add <4 x i32> %mul.i, %a
  ret <4 x i32> %add.i
}

define <8 x i16> @test_vmlal_s8(<8 x i16> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vmlal_s8:
; CHECK: smlal.8h v0, v1, v2
  %vmull.i.i = tail call <8 x i16> @llvm.arm.neon.vmulls.v8i16(<8 x i8> %b, <8 x i8> %c) #5
  %add.i = add <8 x i16> %vmull.i.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vmlal_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlal_s16:
; CHECK: smlal.4s v0, v1, v2
  %vmull2.i.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %b, <4 x i16> %c) #5
  %add.i = add <4 x i32> %vmull2.i.i, %a
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vmlal_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlal_s32:
; CHECK: smlal.2d v0, v1, v2
  %vmull2.i.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %b, <2 x i32> %c) #5
  %add.i = add <2 x i64> %vmull2.i.i, %a
  ret <2 x i64> %add.i
}

define <8 x i16> @test_vmlal_u8(<8 x i16> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vmlal_u8:
; CHECK: umlal.8h v0, v1, v2
  %vmull.i.i = tail call <8 x i16> @llvm.arm.neon.vmullu.v8i16(<8 x i8> %b, <8 x i8> %c) #5
  %add.i = add <8 x i16> %vmull.i.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vmlal_u16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlal_u16:
; CHECK: umlal.4s v0, v1, v2
  %vmull2.i.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %b, <4 x i16> %c) #5
  %add.i = add <4 x i32> %vmull2.i.i, %a
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vmlal_u32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlal_u32:
; CHECK: umlal.2d v0, v1, v2
  %vmull2.i.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %b, <2 x i32> %c) #5
  %add.i = add <2 x i64> %vmull2.i.i, %a
  ret <2 x i64> %add.i
}

define <4 x i32> @test_vmlal_lane_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlal_lane_s16:
; CHECK: smlal.4s v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vmull2.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %b, <4 x i16> %shuffle) #5
  %add = add <4 x i32> %vmull2.i, %a
  ret <4 x i32> %add
}

define <2 x i64> @test_vmlal_lane_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlal_lane_s32:
; CHECK: smlal.2d v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vmull2.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %b, <2 x i32> %shuffle) #5
  %add = add <2 x i64> %vmull2.i, %a
  ret <2 x i64> %add
}

define <4 x i32> @test_vmlal_lane_u16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlal_lane_u16:
; CHECK: umlal.4s v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vmull2.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %b, <4 x i16> %shuffle) #5
  %add = add <4 x i32> %vmull2.i, %a
  ret <4 x i32> %add
}

define <2 x i64> @test_vmlal_lane_u32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlal_lane_u32:
; CHECK: umlal.2d v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vmull2.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %b, <2 x i32> %shuffle) #5
  %add = add <2 x i64> %vmull2.i, %a
  ret <2 x i64> %add
}

define <4 x i32> @test_vmlal_n_s16(<4 x i32> %a, <4 x i16> %b, i16 signext %c) #0 {
; CHECK-LABEL: test_vmlal_n_s16:
; CHECK: dup.4h v2, w0
; CHECK: smlal.4s v0, v1, v2
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %vmull2.i.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %b, <4 x i16> %vecinit3.i) #5
  %add.i = add <4 x i32> %vmull2.i.i, %a
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vmlal_n_s32(<2 x i64> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmlal_n_s32:
; CHECK: dup.2s v2, w0
; CHECK: smlal.2d v0, v1, v2
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %vmull2.i.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %b, <2 x i32> %vecinit1.i) #5
  %add.i = add <2 x i64> %vmull2.i.i, %a
  ret <2 x i64> %add.i
}

define <4 x i32> @test_vmlal_n_u16(<4 x i32> %a, <4 x i16> %b, i16 zeroext %c) #0 {
; CHECK-LABEL: test_vmlal_n_u16:
; CHECK: dup.4h v2, w0
; CHECK: umlal.4s v0, v1, v2
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %vmull2.i.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %b, <4 x i16> %vecinit3.i) #5
  %add.i = add <4 x i32> %vmull2.i.i, %a
  ret <4 x i32> %add.i
}

define <2 x i64> @test_vmlal_n_u32(<2 x i64> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmlal_n_u32:
; CHECK: dup.2s v2, w0
; CHECK: umlal.2d v0, v1, v2
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %vmull2.i.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %b, <2 x i32> %vecinit1.i) #5
  %add.i = add <2 x i64> %vmull2.i.i, %a
  ret <2 x i64> %add.i
}

define <4 x i16> @test_vmla_lane_s16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmla_lane_s16:
; CHECK: mla.4h v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %mul = mul <4 x i16> %shuffle, %b
  %add = add <4 x i16> %mul, %a
  ret <4 x i16> %add
}

define <2 x i32> @test_vmla_lane_s32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmla_lane_s32:
; CHECK: mla.2s v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %mul = mul <2 x i32> %shuffle, %b
  %add = add <2 x i32> %mul, %a
  ret <2 x i32> %add
}

define <4 x i16> @test_vmla_lane_u16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmla_lane_u16:
; CHECK: mla.4h v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %mul = mul <4 x i16> %shuffle, %b
  %add = add <4 x i16> %mul, %a
  ret <4 x i16> %add
}

define <2 x i32> @test_vmla_lane_u32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmla_lane_u32:
; CHECK: mla.2s v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %mul = mul <2 x i32> %shuffle, %b
  %add = add <2 x i32> %mul, %a
  ret <2 x i32> %add
}

define <2 x float> @test_vmla_lane_f32(<2 x float> %a, <2 x float> %b, <2 x float> %c) #0 {
; CHECK-LABEL: test_vmla_lane_f32:
; CHECK: fmul.2s v1, v1, v2[1]
; CHECK: fadd.2s v0, v1, v0
  %shuffle = shufflevector <2 x float> %c, <2 x float> undef, <2 x i32> <i32 1, i32 1>
  %mul = fmul <2 x float> %shuffle, %b
  %add = fadd <2 x float> %mul, %a
  ret <2 x float> %add
}

define <8 x i16> @test_vmlaq_lane_s16(<8 x i16> %a, <8 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlaq_lane_s16:
; CHECK: mla.8h v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %mul = mul <8 x i16> %shuffle, %b
  %add = add <8 x i16> %mul, %a
  ret <8 x i16> %add
}

define <4 x i32> @test_vmlaq_lane_s32(<4 x i32> %a, <4 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlaq_lane_s32:
; CHECK: mla.4s v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = mul <4 x i32> %shuffle, %b
  %add = add <4 x i32> %mul, %a
  ret <4 x i32> %add
}

define <8 x i16> @test_vmlaq_lane_u16(<8 x i16> %a, <8 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlaq_lane_u16:
; CHECK: mla.8h v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %mul = mul <8 x i16> %shuffle, %b
  %add = add <8 x i16> %mul, %a
  ret <8 x i16> %add
}

define <4 x i32> @test_vmlaq_lane_u32(<4 x i32> %a, <4 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlaq_lane_u32:
; CHECK: mla.4s v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = mul <4 x i32> %shuffle, %b
  %add = add <4 x i32> %mul, %a
  ret <4 x i32> %add
}

define <4 x float> @test_vmlaq_lane_f32(<4 x float> %a, <4 x float> %b, <2 x float> %c) #0 {
; CHECK-LABEL: test_vmlaq_lane_f32:
; CHECK: fmul.4s v1, v1, v2[1]
; CHECK: fadd.4s v0, v1, v0
  %shuffle = shufflevector <2 x float> %c, <2 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = fmul <4 x float> %shuffle, %b
  %add = fadd <4 x float> %mul, %a
  ret <4 x float> %add
}

define <4 x i16> @test_vmla_n_s16(<4 x i16> %a, <4 x i16> %b, i16 signext %c) #0 {
; CHECK-LABEL: test_vmla_n_s16:
; CHECK: dup.4h v2, w0
; CHECK: mla.4h v0, v2, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %mul.i = mul <4 x i16> %vecinit3.i, %b
  %add.i = add <4 x i16> %mul.i, %a
  ret <4 x i16> %add.i
}

define <2 x i32> @test_vmla_n_s32(<2 x i32> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmla_n_s32:
; CHECK: dup.2s v2, w0
; CHECK: mla.2s v0, v2, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %mul.i = mul <2 x i32> %vecinit1.i, %b
  %add.i = add <2 x i32> %mul.i, %a
  ret <2 x i32> %add.i
}

define <4 x i16> @test_vmla_n_u16(<4 x i16> %a, <4 x i16> %b, i16 zeroext %c) #0 {
; CHECK-LABEL: test_vmla_n_u16:
; CHECK: dup.4h v2, w0
; CHECK: mla.4h v0, v2, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %mul.i = mul <4 x i16> %vecinit3.i, %b
  %add.i = add <4 x i16> %mul.i, %a
  ret <4 x i16> %add.i
}

define <2 x i32> @test_vmla_n_u32(<2 x i32> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmla_n_u32:
; CHECK: dup.2s v2, w0
; CHECK: mla.2s v0, v2, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %mul.i = mul <2 x i32> %vecinit1.i, %b
  %add.i = add <2 x i32> %mul.i, %a
  ret <2 x i32> %add.i
}

define <2 x float> @test_vmla_n_f32(<2 x float> %a, <2 x float> %b, float %c) #0 {
; CHECK-LABEL: test_vmla_n_f32:
; CHECK: fmul.2s v1, v1, v2[0]
; CHECK: fadd.2s v0, v1, v0
  %vecinit.i = insertelement <2 x float> undef, float %c, i32 0
  %vecinit1.i = insertelement <2 x float> %vecinit.i, float %c, i32 1
  %mul.i = fmul <2 x float> %vecinit1.i, %b
  %add.i = fadd <2 x float> %mul.i, %a
  ret <2 x float> %add.i
}

define <8 x i16> @test_vmlaq_n_s16(<8 x i16> %a, <8 x i16> %b, i16 signext %c) #0 {
; CHECK-LABEL: test_vmlaq_n_s16:
; CHECK: dup.8h v2, w0
; CHECK: mla.8h v0, v2, v1
  %vecinit.i = insertelement <8 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %c, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %c, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %c, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %c, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %c, i32 7
  %mul.i = mul <8 x i16> %vecinit7.i, %b
  %add.i = add <8 x i16> %mul.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vmlaq_n_s32(<4 x i32> %a, <4 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmlaq_n_s32:
; CHECK: dup.4s v2, w0
; CHECK: mla.4s v0, v2, v1
  %vecinit.i = insertelement <4 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %c, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %c, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %c, i32 3
  %mul.i = mul <4 x i32> %vecinit3.i, %b
  %add.i = add <4 x i32> %mul.i, %a
  ret <4 x i32> %add.i
}

define <8 x i16> @test_vmlaq_n_u16(<8 x i16> %a, <8 x i16> %b, i16 zeroext %c) #0 {
; CHECK-LABEL: test_vmlaq_n_u16:
; CHECK: dup.8h v2, w0
; CHECK: mla.8h v0, v2, v1
  %vecinit.i = insertelement <8 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %c, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %c, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %c, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %c, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %c, i32 7
  %mul.i = mul <8 x i16> %vecinit7.i, %b
  %add.i = add <8 x i16> %mul.i, %a
  ret <8 x i16> %add.i
}

define <4 x i32> @test_vmlaq_n_u32(<4 x i32> %a, <4 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmlaq_n_u32:
; CHECK: dup.4s v2, w0
; CHECK: mla.4s v0, v2, v1
  %vecinit.i = insertelement <4 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %c, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %c, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %c, i32 3
  %mul.i = mul <4 x i32> %vecinit3.i, %b
  %add.i = add <4 x i32> %mul.i, %a
  ret <4 x i32> %add.i
}

define <4 x float> @test_vmlaq_n_f32(<4 x float> %a, <4 x float> %b, float %c) #0 {
; CHECK-LABEL: test_vmlaq_n_f32:
; CHECK: fmul.4s v1, v1, v2[0]
; CHECK: fadd.4s v0, v1, v0
  %vecinit.i = insertelement <4 x float> undef, float %c, i32 0
  %vecinit1.i = insertelement <4 x float> %vecinit.i, float %c, i32 1
  %vecinit2.i = insertelement <4 x float> %vecinit1.i, float %c, i32 2
  %vecinit3.i = insertelement <4 x float> %vecinit2.i, float %c, i32 3
  %mul.i = fmul <4 x float> %vecinit3.i, %b
  %add.i = fadd <4 x float> %mul.i, %a
  ret <4 x float> %add.i
}

define <8 x i8> @test_vmls_s8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vmls_s8:
; CHECK: mls.8b v0, v1, v2
  %mul.i = mul <8 x i8> %b, %c
  %sub.i = sub <8 x i8> %a, %mul.i
  ret <8 x i8> %sub.i
}

define <4 x i16> @test_vmls_s16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmls_s16:
; CHECK: mls.4h v0, v1, v2
  %mul.i = mul <4 x i16> %b, %c
  %sub.i = sub <4 x i16> %a, %mul.i
  ret <4 x i16> %sub.i
}

define <2 x i32> @test_vmls_s32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmls_s32:
; CHECK: mls.2s v0, v1, v2
  %mul.i = mul <2 x i32> %b, %c
  %sub.i = sub <2 x i32> %a, %mul.i
  ret <2 x i32> %sub.i
}

define <2 x float> @test_vmls_f32(<2 x float> %a, <2 x float> %b, <2 x float> %c) #0 {
; CHECK-LABEL: test_vmls_f32:
; CHECK: fmul.2s v1, v1, v2
; CHECK: fsub.2s v0, v0, v1
  %mul.i = fmul <2 x float> %b, %c
  %sub.i = fsub <2 x float> %a, %mul.i
  ret <2 x float> %sub.i
}

define <8 x i8> @test_vmls_u8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vmls_u8:
; CHECK: mls.8b v0, v1, v2
  %mul.i = mul <8 x i8> %b, %c
  %sub.i = sub <8 x i8> %a, %mul.i
  ret <8 x i8> %sub.i
}

define <4 x i16> @test_vmls_u16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmls_u16:
; CHECK: mls.4h v0, v1, v2
  %mul.i = mul <4 x i16> %b, %c
  %sub.i = sub <4 x i16> %a, %mul.i
  ret <4 x i16> %sub.i
}

define <2 x i32> @test_vmls_u32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmls_u32:
; CHECK: mls.2s v0, v1, v2
  %mul.i = mul <2 x i32> %b, %c
  %sub.i = sub <2 x i32> %a, %mul.i
  ret <2 x i32> %sub.i
}

define <16 x i8> @test_vmlsq_s8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vmlsq_s8:
; CHECK: mls.16b v0, v1, v2
  %mul.i = mul <16 x i8> %b, %c
  %sub.i = sub <16 x i8> %a, %mul.i
  ret <16 x i8> %sub.i
}

define <8 x i16> @test_vmlsq_s16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vmlsq_s16:
; CHECK: mls.8h v0, v1, v2
  %mul.i = mul <8 x i16> %b, %c
  %sub.i = sub <8 x i16> %a, %mul.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vmlsq_s32(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) #0 {
; CHECK-LABEL: test_vmlsq_s32:
; CHECK: mls.4s v0, v1, v2
  %mul.i = mul <4 x i32> %b, %c
  %sub.i = sub <4 x i32> %a, %mul.i
  ret <4 x i32> %sub.i
}

define <4 x float> @test_vmlsq_f32(<4 x float> %a, <4 x float> %b, <4 x float> %c) #0 {
; CHECK-LABEL: test_vmlsq_f32:
; CHECK: fmul.4s v1, v1, v2
; CHECK: fsub.4s v0, v0, v1
  %mul.i = fmul <4 x float> %b, %c
  %sub.i = fsub <4 x float> %a, %mul.i
  ret <4 x float> %sub.i
}

define <16 x i8> @test_vmlsq_u8(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) #0 {
; CHECK-LABEL: test_vmlsq_u8:
; CHECK: mls.16b v0, v1, v2
  %mul.i = mul <16 x i8> %b, %c
  %sub.i = sub <16 x i8> %a, %mul.i
  ret <16 x i8> %sub.i
}

define <8 x i16> @test_vmlsq_u16(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) #0 {
; CHECK-LABEL: test_vmlsq_u16:
; CHECK: mls.8h v0, v1, v2
  %mul.i = mul <8 x i16> %b, %c
  %sub.i = sub <8 x i16> %a, %mul.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vmlsq_u32(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) #0 {
; CHECK-LABEL: test_vmlsq_u32:
; CHECK: mls.4s v0, v1, v2
  %mul.i = mul <4 x i32> %b, %c
  %sub.i = sub <4 x i32> %a, %mul.i
  ret <4 x i32> %sub.i
}

define <8 x i16> @test_vmlsl_s8(<8 x i16> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vmlsl_s8:
; CHECK: smlsl.8h v0, v1, v2
  %vmull.i.i = tail call <8 x i16> @llvm.arm.neon.vmulls.v8i16(<8 x i8> %b, <8 x i8> %c) #5
  %sub.i = sub <8 x i16> %a, %vmull.i.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vmlsl_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlsl_s16:
; CHECK: smlsl.4s v0, v1, v2
  %vmull2.i.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %b, <4 x i16> %c) #5
  %sub.i = sub <4 x i32> %a, %vmull2.i.i
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vmlsl_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlsl_s32:
; CHECK: smlsl.2d v0, v1, v2
  %vmull2.i.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %b, <2 x i32> %c) #5
  %sub.i = sub <2 x i64> %a, %vmull2.i.i
  ret <2 x i64> %sub.i
}

define <8 x i16> @test_vmlsl_u8(<8 x i16> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vmlsl_u8:
; CHECK: umlsl.8h v0, v1, v2
  %vmull.i.i = tail call <8 x i16> @llvm.arm.neon.vmullu.v8i16(<8 x i8> %b, <8 x i8> %c) #5
  %sub.i = sub <8 x i16> %a, %vmull.i.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vmlsl_u16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlsl_u16:
; CHECK: umlsl.4s v0, v1, v2
  %vmull2.i.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %b, <4 x i16> %c) #5
  %sub.i = sub <4 x i32> %a, %vmull2.i.i
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vmlsl_u32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlsl_u32:
; CHECK: umlsl.2d v0, v1, v2
  %vmull2.i.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %b, <2 x i32> %c) #5
  %sub.i = sub <2 x i64> %a, %vmull2.i.i
  ret <2 x i64> %sub.i
}

define <4 x i32> @test_vmlsl_lane_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlsl_lane_s16:
; CHECK: smlsl.4s v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vmull2.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %b, <4 x i16> %shuffle) #5
  %sub = sub <4 x i32> %a, %vmull2.i
  ret <4 x i32> %sub
}

define <2 x i64> @test_vmlsl_lane_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlsl_lane_s32:
; CHECK: smlsl.2d v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vmull2.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %b, <2 x i32> %shuffle) #5
  %sub = sub <2 x i64> %a, %vmull2.i
  ret <2 x i64> %sub
}

define <4 x i32> @test_vmlsl_lane_u16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlsl_lane_u16:
; CHECK: umlsl.4s v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vmull2.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %b, <4 x i16> %shuffle) #5
  %sub = sub <4 x i32> %a, %vmull2.i
  ret <4 x i32> %sub
}

define <2 x i64> @test_vmlsl_lane_u32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlsl_lane_u32:
; CHECK: umlsl.2d v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vmull2.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %b, <2 x i32> %shuffle) #5
  %sub = sub <2 x i64> %a, %vmull2.i
  ret <2 x i64> %sub
}

; FIXME: AArch64 codegen missing a corner case again. It has lane-using
; instructions available.
define <4 x i32> @test_vmlsl_n_s16(<4 x i32> %a, <4 x i16> %b, i16 signext %c) #0 {
; CHECK-LABEL: test_vmlsl_n_s16:
; CHECK: dup.4h v2, w0
; CHECK: smlsl.4s v0, v1, v2
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %vmull2.i.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %b, <4 x i16> %vecinit3.i) #5
  %sub.i = sub <4 x i32> %a, %vmull2.i.i
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vmlsl_n_s32(<2 x i64> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmlsl_n_s32:
; CHECK: dup.2s v2, w0
; CHECK: smlsl.2d v0, v1, v2
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %vmull2.i.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %b, <2 x i32> %vecinit1.i) #5
  %sub.i = sub <2 x i64> %a, %vmull2.i.i
  ret <2 x i64> %sub.i
}

define <4 x i32> @test_vmlsl_n_u16(<4 x i32> %a, <4 x i16> %b, i16 zeroext %c) #0 {
; CHECK-LABEL: test_vmlsl_n_u16:
; CHECK: dup.4h v2, w0
; CHECK: umlsl.4s v0, v1, v2
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %vmull2.i.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %b, <4 x i16> %vecinit3.i) #5
  %sub.i = sub <4 x i32> %a, %vmull2.i.i
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vmlsl_n_u32(<2 x i64> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmlsl_n_u32:
; CHECK: dup.2s v2, w0
; CHECK: umlsl.2d v0, v1, v2
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %vmull2.i.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %b, <2 x i32> %vecinit1.i) #5
  %sub.i = sub <2 x i64> %a, %vmull2.i.i
  ret <2 x i64> %sub.i
}

define <4 x i16> @test_vmls_lane_s16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmls_lane_s16:
; CHECK: mls.4h v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %mul = mul <4 x i16> %shuffle, %b
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @test_vmls_lane_s32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmls_lane_s32:
; CHECK: mls.2s v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %mul = mul <2 x i32> %shuffle, %b
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <4 x i16> @test_vmls_lane_u16(<4 x i16> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmls_lane_u16:
; CHECK: mls.4h v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %mul = mul <4 x i16> %shuffle, %b
  %sub = sub <4 x i16> %a, %mul
  ret <4 x i16> %sub
}

define <2 x i32> @test_vmls_lane_u32(<2 x i32> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmls_lane_u32:
; CHECK: mls.2s v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %mul = mul <2 x i32> %shuffle, %b
  %sub = sub <2 x i32> %a, %mul
  ret <2 x i32> %sub
}

define <2 x float> @test_vmls_lane_f32(<2 x float> %a, <2 x float> %b, <2 x float> %c) #0 {
; CHECK-LABEL: test_vmls_lane_f32:
; CHECK: fmul.2s v1, v1, v2[1]
; CHECK: fsub.2s v0, v0, v1
  %shuffle = shufflevector <2 x float> %c, <2 x float> undef, <2 x i32> <i32 1, i32 1>
  %mul = fmul <2 x float> %shuffle, %b
  %sub = fsub <2 x float> %a, %mul
  ret <2 x float> %sub
}

define <8 x i16> @test_vmlsq_lane_s16(<8 x i16> %a, <8 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlsq_lane_s16:
; CHECK: mls.8h v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %mul = mul <8 x i16> %shuffle, %b
  %sub = sub <8 x i16> %a, %mul
  ret <8 x i16> %sub
}

define <4 x i32> @test_vmlsq_lane_s32(<4 x i32> %a, <4 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlsq_lane_s32:
; CHECK: mls.4s v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = mul <4 x i32> %shuffle, %b
  %sub = sub <4 x i32> %a, %mul
  ret <4 x i32> %sub
}

define <8 x i16> @test_vmlsq_lane_u16(<8 x i16> %a, <8 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vmlsq_lane_u16:
; CHECK: mls.8h v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %mul = mul <8 x i16> %shuffle, %b
  %sub = sub <8 x i16> %a, %mul
  ret <8 x i16> %sub
}

define <4 x i32> @test_vmlsq_lane_u32(<4 x i32> %a, <4 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vmlsq_lane_u32:
; CHECK: mls.4s v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = mul <4 x i32> %shuffle, %b
  %sub = sub <4 x i32> %a, %mul
  ret <4 x i32> %sub
}

define <4 x float> @test_vmlsq_lane_f32(<4 x float> %a, <4 x float> %b, <2 x float> %c) #0 {
; CHECK-LABEL: test_vmlsq_lane_f32:
; CHECK: fmul.4s v1, v1, v2[1]
; CHECK: fsub.4s v0, v0, v1
  %shuffle = shufflevector <2 x float> %c, <2 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = fmul <4 x float> %shuffle, %b
  %sub = fsub <4 x float> %a, %mul
  ret <4 x float> %sub
}

define <4 x i16> @test_vmls_n_s16(<4 x i16> %a, <4 x i16> %b, i16 signext %c) #0 {
; CHECK-LABEL: test_vmls_n_s16:
; CHECK: dup.4h v2, w0
; CHECK: mls.4h v0, v2, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %mul.i = mul <4 x i16> %vecinit3.i, %b
  %sub.i = sub <4 x i16> %a, %mul.i
  ret <4 x i16> %sub.i
}

define <2 x i32> @test_vmls_n_s32(<2 x i32> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmls_n_s32:
; CHECK: dup.2s v2, w0
; CHECK: mls.2s v0, v2, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %mul.i = mul <2 x i32> %vecinit1.i, %b
  %sub.i = sub <2 x i32> %a, %mul.i
  ret <2 x i32> %sub.i
}

define <4 x i16> @test_vmls_n_u16(<4 x i16> %a, <4 x i16> %b, i16 zeroext %c) #0 {
; CHECK-LABEL: test_vmls_n_u16:
; CHECK: dup.4h v2, w0
; CHECK: mls.4h v0, v2, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %mul.i = mul <4 x i16> %vecinit3.i, %b
  %sub.i = sub <4 x i16> %a, %mul.i
  ret <4 x i16> %sub.i
}

define <2 x i32> @test_vmls_n_u32(<2 x i32> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmls_n_u32:
; CHECK: dup.2s v2, w0
; CHECK: mls.2s v0, v2, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %mul.i = mul <2 x i32> %vecinit1.i, %b
  %sub.i = sub <2 x i32> %a, %mul.i
  ret <2 x i32> %sub.i
}

define <2 x float> @test_vmls_n_f32(<2 x float> %a, <2 x float> %b, float %c) #0 {
; CHECK-LABEL: test_vmls_n_f32:
; CHECK: fmul.2s v1, v1, v2[0]
; CHECK: fsub.2s v0, v0, v1
  %vecinit.i = insertelement <2 x float> undef, float %c, i32 0
  %vecinit1.i = insertelement <2 x float> %vecinit.i, float %c, i32 1
  %mul.i = fmul <2 x float> %vecinit1.i, %b
  %sub.i = fsub <2 x float> %a, %mul.i
  ret <2 x float> %sub.i
}

define <8 x i16> @test_vmlsq_n_s16(<8 x i16> %a, <8 x i16> %b, i16 signext %c) #0 {
; CHECK-LABEL: test_vmlsq_n_s16:
; CHECK: dup.8h v2, w0
; CHECK: mls.8h v0, v2, v1
  %vecinit.i = insertelement <8 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %c, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %c, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %c, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %c, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %c, i32 7
  %mul.i = mul <8 x i16> %vecinit7.i, %b
  %sub.i = sub <8 x i16> %a, %mul.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vmlsq_n_s32(<4 x i32> %a, <4 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmlsq_n_s32:
; CHECK: dup.4s v2, w0
; CHECK: mls.4s v0, v2, v1
  %vecinit.i = insertelement <4 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %c, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %c, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %c, i32 3
  %mul.i = mul <4 x i32> %vecinit3.i, %b
  %sub.i = sub <4 x i32> %a, %mul.i
  ret <4 x i32> %sub.i
}

define <8 x i16> @test_vmlsq_n_u16(<8 x i16> %a, <8 x i16> %b, i16 zeroext %c) #0 {
; CHECK-LABEL: test_vmlsq_n_u16:
; CHECK: dup.8h v2, w0
; CHECK: mls.8h v0, v2, v1
  %vecinit.i = insertelement <8 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %c, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %c, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %c, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %c, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %c, i32 7
  %mul.i = mul <8 x i16> %vecinit7.i, %b
  %sub.i = sub <8 x i16> %a, %mul.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vmlsq_n_u32(<4 x i32> %a, <4 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vmlsq_n_u32:
; CHECK: dup.4s v2, w0
; CHECK: mls.4s v0, v2, v1
  %vecinit.i = insertelement <4 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %c, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %c, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %c, i32 3
  %mul.i = mul <4 x i32> %vecinit3.i, %b
  %sub.i = sub <4 x i32> %a, %mul.i
  ret <4 x i32> %sub.i
}

define <4 x float> @test_vmlsq_n_f32(<4 x float> %a, <4 x float> %b, float %c) #0 {
; CHECK-LABEL: test_vmlsq_n_f32:
; CHECK: fmul.4s v1, v1, v2[0]
; CHECK: fsub.4s v0, v0, v1
  %vecinit.i = insertelement <4 x float> undef, float %c, i32 0
  %vecinit1.i = insertelement <4 x float> %vecinit.i, float %c, i32 1
  %vecinit2.i = insertelement <4 x float> %vecinit1.i, float %c, i32 2
  %vecinit3.i = insertelement <4 x float> %vecinit2.i, float %c, i32 3
  %mul.i = fmul <4 x float> %vecinit3.i, %b
  %sub.i = fsub <4 x float> %a, %mul.i
  ret <4 x float> %sub.i
}

define <8 x i16> @test_vmovl_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vmovl_s8:
; CHECK: sshll.8h v0, v0, #0
  %vmovl.i = sext <8 x i8> %a to <8 x i16>
  ret <8 x i16> %vmovl.i
}

define <4 x i32> @test_vmovl_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vmovl_s16:
; CHECK: sshll.4s v0, v0, #0
  %vmovl.i = sext <4 x i16> %a to <4 x i32>
  ret <4 x i32> %vmovl.i
}

define <2 x i64> @test_vmovl_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vmovl_s32:
; CHECK: sshll.2d v0, v0, #0
  %vmovl.i = sext <2 x i32> %a to <2 x i64>
  ret <2 x i64> %vmovl.i
}

define <8 x i16> @test_vmovl_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vmovl_u8:
; CHECK: ushll.8h v0, v0, #0
  %vmovl.i = zext <8 x i8> %a to <8 x i16>
  ret <8 x i16> %vmovl.i
}

define <4 x i32> @test_vmovl_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vmovl_u16:
; CHECK: ushll.4s v0, v0, #0
  %vmovl.i = zext <4 x i16> %a to <4 x i32>
  ret <4 x i32> %vmovl.i
}

define <2 x i64> @test_vmovl_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vmovl_u32:
; CHECK: ushll.2d v0, v0, #0
  %vmovl.i = zext <2 x i32> %a to <2 x i64>
  ret <2 x i64> %vmovl.i
}

define <8 x i8> @test_vmovn_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vmovn_s16:
; CHECK: xtn.8b v0, v0
  %vmovn.i = trunc <8 x i16> %a to <8 x i8>
  ret <8 x i8> %vmovn.i
}

define <4 x i16> @test_vmovn_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vmovn_s32:
; CHECK: xtn.4h v0, v0
  %vmovn.i = trunc <4 x i32> %a to <4 x i16>
  ret <4 x i16> %vmovn.i
}

define <2 x i32> @test_vmovn_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vmovn_s64:
; CHECK: xtn.2s v0, v0
  %vmovn.i = trunc <2 x i64> %a to <2 x i32>
  ret <2 x i32> %vmovn.i
}

define <8 x i8> @test_vmovn_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vmovn_u16:
; CHECK: xtn.8b v0, v0
  %vmovn.i = trunc <8 x i16> %a to <8 x i8>
  ret <8 x i8> %vmovn.i
}

define <4 x i16> @test_vmovn_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vmovn_u32:
; CHECK: xtn.4h v0, v0
  %vmovn.i = trunc <4 x i32> %a to <4 x i16>
  ret <4 x i16> %vmovn.i
}

define <2 x i32> @test_vmovn_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vmovn_u64:
; CHECK: xtn.2s v0, v0
  %vmovn.i = trunc <2 x i64> %a to <2 x i32>
  ret <2 x i32> %vmovn.i
}

define <8 x i8> @test_vmov_n_u8(i8 zeroext %a) #0 {
; CHECK-LABEL: test_vmov_n_u8:
; CHECK: dup.8b v0, w0
  %vecinit.i = insertelement <8 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <8 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <8 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <8 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <8 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <8 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <8 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <8 x i8> %vecinit6.i, i8 %a, i32 7
  ret <8 x i8> %vecinit7.i
}

define <4 x i16> @test_vmov_n_u16(i16 zeroext %a) #0 {
; CHECK-LABEL: test_vmov_n_u16:
; CHECK: dup.4h v0, w0
  %vecinit.i = insertelement <4 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %a, i32 3
  ret <4 x i16> %vecinit3.i
}

define <2 x i32> @test_vmov_n_u32(i32 %a) #0 {
; CHECK-LABEL: test_vmov_n_u32:
; CHECK: dup.2s v0, w0
  %vecinit.i = insertelement <2 x i32> undef, i32 %a, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %a, i32 1
  ret <2 x i32> %vecinit1.i
}

define <8 x i8> @test_vmov_n_s8(i8 signext %a) #0 {
; CHECK-LABEL: test_vmov_n_s8:
; CHECK: dup.8b v0, w0
  %vecinit.i = insertelement <8 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <8 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <8 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <8 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <8 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <8 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <8 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <8 x i8> %vecinit6.i, i8 %a, i32 7
  ret <8 x i8> %vecinit7.i
}

define <4 x i16> @test_vmov_n_s16(i16 signext %a) #0 {
; CHECK-LABEL: test_vmov_n_s16:
; CHECK: dup.4h v0, w0
  %vecinit.i = insertelement <4 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %a, i32 3
  ret <4 x i16> %vecinit3.i
}

define <2 x i32> @test_vmov_n_s32(i32 %a) #0 {
; CHECK-LABEL: test_vmov_n_s32:
; CHECK: dup.2s v0, w0
  %vecinit.i = insertelement <2 x i32> undef, i32 %a, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %a, i32 1
  ret <2 x i32> %vecinit1.i
}

define <8 x i8> @test_vmov_n_p8(i8 signext %a) #0 {
; CHECK-LABEL: test_vmov_n_p8:
; CHECK: dup.8b v0, w0
  %vecinit.i = insertelement <8 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <8 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <8 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <8 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <8 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <8 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <8 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <8 x i8> %vecinit6.i, i8 %a, i32 7
  ret <8 x i8> %vecinit7.i
}

define <4 x i16> @test_vmov_n_p16(i16 signext %a) #0 {
; CHECK-LABEL: test_vmov_n_p16:
; CHECK: dup.4h v0, w0
  %vecinit.i = insertelement <4 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %a, i32 3
  ret <4 x i16> %vecinit3.i
}

define <4 x i16> @test_vmov_n_f16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vmov_n_f16:
; CHECK: ld1r.4h  { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %vecinit = insertelement <4 x i16> undef, i16 %t0, i32 0
  %vecinit1 = insertelement <4 x i16> %vecinit, i16 %t0, i32 1
  %vecinit2 = insertelement <4 x i16> %vecinit1, i16 %t0, i32 2
  %vecinit3 = insertelement <4 x i16> %vecinit2, i16 %t0, i32 3
  ret <4 x i16> %vecinit3
}

define <2 x float> @test_vmov_n_f32(float %a) #0 {
; CHECK-LABEL: test_vmov_n_f32:
; CHECK: dup.2s v0, v0[0]
  %vecinit.i = insertelement <2 x float> undef, float %a, i32 0
  %vecinit1.i = insertelement <2 x float> %vecinit.i, float %a, i32 1
  ret <2 x float> %vecinit1.i
}

define <16 x i8> @test_vmovq_n_u8(i8 zeroext %a) #0 {
; CHECK-LABEL: test_vmovq_n_u8:
; CHECK: dup.16b v0, w0
  %vecinit.i = insertelement <16 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <16 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <16 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <16 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <16 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <16 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <16 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <16 x i8> %vecinit6.i, i8 %a, i32 7
  %vecinit8.i = insertelement <16 x i8> %vecinit7.i, i8 %a, i32 8
  %vecinit9.i = insertelement <16 x i8> %vecinit8.i, i8 %a, i32 9
  %vecinit10.i = insertelement <16 x i8> %vecinit9.i, i8 %a, i32 10
  %vecinit11.i = insertelement <16 x i8> %vecinit10.i, i8 %a, i32 11
  %vecinit12.i = insertelement <16 x i8> %vecinit11.i, i8 %a, i32 12
  %vecinit13.i = insertelement <16 x i8> %vecinit12.i, i8 %a, i32 13
  %vecinit14.i = insertelement <16 x i8> %vecinit13.i, i8 %a, i32 14
  %vecinit15.i = insertelement <16 x i8> %vecinit14.i, i8 %a, i32 15
  ret <16 x i8> %vecinit15.i
}

define <8 x i16> @test_vmovq_n_u16(i16 zeroext %a) #0 {
; CHECK-LABEL: test_vmovq_n_u16:
; CHECK: dup.8h v0, w0
  %vecinit.i = insertelement <8 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %a, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %a, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %a, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %a, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %a, i32 7
  ret <8 x i16> %vecinit7.i
}

define <4 x i32> @test_vmovq_n_u32(i32 %a) #0 {
; CHECK-LABEL: test_vmovq_n_u32:
; CHECK: dup.4s v0, w0
  %vecinit.i = insertelement <4 x i32> undef, i32 %a, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %a, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %a, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %a, i32 3
  ret <4 x i32> %vecinit3.i
}

define <16 x i8> @test_vmovq_n_s8(i8 signext %a) #0 {
; CHECK-LABEL: test_vmovq_n_s8:
; CHECK: dup.16b v0, w0
  %vecinit.i = insertelement <16 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <16 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <16 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <16 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <16 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <16 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <16 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <16 x i8> %vecinit6.i, i8 %a, i32 7
  %vecinit8.i = insertelement <16 x i8> %vecinit7.i, i8 %a, i32 8
  %vecinit9.i = insertelement <16 x i8> %vecinit8.i, i8 %a, i32 9
  %vecinit10.i = insertelement <16 x i8> %vecinit9.i, i8 %a, i32 10
  %vecinit11.i = insertelement <16 x i8> %vecinit10.i, i8 %a, i32 11
  %vecinit12.i = insertelement <16 x i8> %vecinit11.i, i8 %a, i32 12
  %vecinit13.i = insertelement <16 x i8> %vecinit12.i, i8 %a, i32 13
  %vecinit14.i = insertelement <16 x i8> %vecinit13.i, i8 %a, i32 14
  %vecinit15.i = insertelement <16 x i8> %vecinit14.i, i8 %a, i32 15
  ret <16 x i8> %vecinit15.i
}

define <8 x i16> @test_vmovq_n_s16(i16 signext %a) #0 {
; CHECK-LABEL: test_vmovq_n_s16:
; CHECK: dup.8h v0, w0
  %vecinit.i = insertelement <8 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %a, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %a, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %a, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %a, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %a, i32 7
  ret <8 x i16> %vecinit7.i
}

define <4 x i32> @test_vmovq_n_s32(i32 %a) #0 {
; CHECK-LABEL: test_vmovq_n_s32:
; CHECK: dup.4s v0, w0
  %vecinit.i = insertelement <4 x i32> undef, i32 %a, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %a, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %a, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %a, i32 3
  ret <4 x i32> %vecinit3.i
}

define <16 x i8> @test_vmovq_n_p8(i8 signext %a) #0 {
; CHECK-LABEL: test_vmovq_n_p8:
; CHECK: dup.16b v0, w0
  %vecinit.i = insertelement <16 x i8> undef, i8 %a, i32 0
  %vecinit1.i = insertelement <16 x i8> %vecinit.i, i8 %a, i32 1
  %vecinit2.i = insertelement <16 x i8> %vecinit1.i, i8 %a, i32 2
  %vecinit3.i = insertelement <16 x i8> %vecinit2.i, i8 %a, i32 3
  %vecinit4.i = insertelement <16 x i8> %vecinit3.i, i8 %a, i32 4
  %vecinit5.i = insertelement <16 x i8> %vecinit4.i, i8 %a, i32 5
  %vecinit6.i = insertelement <16 x i8> %vecinit5.i, i8 %a, i32 6
  %vecinit7.i = insertelement <16 x i8> %vecinit6.i, i8 %a, i32 7
  %vecinit8.i = insertelement <16 x i8> %vecinit7.i, i8 %a, i32 8
  %vecinit9.i = insertelement <16 x i8> %vecinit8.i, i8 %a, i32 9
  %vecinit10.i = insertelement <16 x i8> %vecinit9.i, i8 %a, i32 10
  %vecinit11.i = insertelement <16 x i8> %vecinit10.i, i8 %a, i32 11
  %vecinit12.i = insertelement <16 x i8> %vecinit11.i, i8 %a, i32 12
  %vecinit13.i = insertelement <16 x i8> %vecinit12.i, i8 %a, i32 13
  %vecinit14.i = insertelement <16 x i8> %vecinit13.i, i8 %a, i32 14
  %vecinit15.i = insertelement <16 x i8> %vecinit14.i, i8 %a, i32 15
  ret <16 x i8> %vecinit15.i
}

define <8 x i16> @test_vmovq_n_p16(i16 signext %a) #0 {
; CHECK-LABEL: test_vmovq_n_p16:
; CHECK: dup.8h v0, w0
  %vecinit.i = insertelement <8 x i16> undef, i16 %a, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %a, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %a, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %a, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %a, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %a, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %a, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %a, i32 7
  ret <8 x i16> %vecinit7.i
}

define <8 x i16> @test_vmovq_n_f16(i16* nocapture readonly %a) #2 {
; CHECK-LABEL: test_vmovq_n_f16:
; CHECK: ld1r.8h { v0 }, [x0]
  %t0 = load i16, i16* %a, align 2
  %vecinit = insertelement <8 x i16> undef, i16 %t0, i32 0
  %vecinit1 = insertelement <8 x i16> %vecinit, i16 %t0, i32 1
  %vecinit2 = insertelement <8 x i16> %vecinit1, i16 %t0, i32 2
  %vecinit3 = insertelement <8 x i16> %vecinit2, i16 %t0, i32 3
  %vecinit4 = insertelement <8 x i16> %vecinit3, i16 %t0, i32 4
  %vecinit5 = insertelement <8 x i16> %vecinit4, i16 %t0, i32 5
  %vecinit6 = insertelement <8 x i16> %vecinit5, i16 %t0, i32 6
  %vecinit7 = insertelement <8 x i16> %vecinit6, i16 %t0, i32 7
  ret <8 x i16> %vecinit7
}

define <4 x float> @test_vmovq_n_f32(float %a) #0 {
; CHECK-LABEL: test_vmovq_n_f32:
; CHECK: dup.4s v0, v0[0]
  %vecinit.i = insertelement <4 x float> undef, float %a, i32 0
  %vecinit1.i = insertelement <4 x float> %vecinit.i, float %a, i32 1
  %vecinit2.i = insertelement <4 x float> %vecinit1.i, float %a, i32 2
  %vecinit3.i = insertelement <4 x float> %vecinit2.i, float %a, i32 3
  ret <4 x float> %vecinit3.i
}

define <1 x i64> @test_vmov_n_s64(i64 %a) #0 {
; CHECK-LABEL: test_vmov_n_s64:
; CHECK: fmov d0, x0
; CHECK: shl d0, d0, #1
  %vecinit.i = insertelement <1 x i64> undef, i64 %a, i32 0
  %add.i = shl <1 x i64> %vecinit.i, <i64 1>
  ret <1 x i64> %add.i
}

define <1 x i64> @test_vmov_n_u64(i64 %a) #0 {
; CHECK-LABEL: test_vmov_n_u64:
; CHECK: fmov d0, x0
; CHECK: shl d0, d0, #1
  %vecinit.i = insertelement <1 x i64> undef, i64 %a, i32 0
  %add.i = shl <1 x i64> %vecinit.i, <i64 1>
  ret <1 x i64> %add.i
}

define <2 x i64> @test_vmovq_n_s64(i64 %a) #0 {
; CHECK-LABEL: test_vmovq_n_s64:
; CHECK: dup.2d v0, x0
  %vecinit.i = insertelement <2 x i64> undef, i64 %a, i32 0
  %vecinit1.i = insertelement <2 x i64> %vecinit.i, i64 %a, i32 1
  ret <2 x i64> %vecinit1.i
}

define <2 x i64> @test_vmovq_n_u64(i64 %a) #0 {
; CHECK-LABEL: test_vmovq_n_u64:
; CHECK: dup.2d v0, x0
  %vecinit.i = insertelement <2 x i64> undef, i64 %a, i32 0
  %vecinit1.i = insertelement <2 x i64> %vecinit.i, i64 %a, i32 1
  ret <2 x i64> %vecinit1.i
}

define <8 x i8> @test_vmul_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmul_s8:
; CHECK: mul.8b v0, v0, v1
  %mul.i = mul <8 x i8> %a, %b
  ret <8 x i8> %mul.i
}

define <4 x i16> @test_vmul_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmul_s16:
; CHECK: mul.4h v0, v0, v1
  %mul.i = mul <4 x i16> %a, %b
  ret <4 x i16> %mul.i
}

define <2 x i32> @test_vmul_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmul_s32:
; CHECK: mul.2s v0, v0, v1
  %mul.i = mul <2 x i32> %a, %b
  ret <2 x i32> %mul.i
}

define <2 x float> @test_vmul_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vmul_f32:
; CHECK: fmul.2s v0, v0, v1
  %mul.i = fmul <2 x float> %a, %b
  ret <2 x float> %mul.i
}

define <8 x i8> @test_vmul_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmul_u8:
; CHECK: mul.8b v0, v0, v1
  %mul.i = mul <8 x i8> %a, %b
  ret <8 x i8> %mul.i
}

define <4 x i16> @test_vmul_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmul_u16:
; CHECK: mul.4h v0, v0, v1
  %mul.i = mul <4 x i16> %a, %b
  ret <4 x i16> %mul.i
}

define <2 x i32> @test_vmul_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmul_u32:
; CHECK: mul.2s v0, v0, v1
  %mul.i = mul <2 x i32> %a, %b
  ret <2 x i32> %mul.i
}

define <16 x i8> @test_vmulq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vmulq_s8:
; CHECK: mul.16b v0, v0, v1
  %mul.i = mul <16 x i8> %a, %b
  ret <16 x i8> %mul.i
}

define <8 x i16> @test_vmulq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vmulq_s16:
; CHECK: mul.8h v0, v0, v1
  %mul.i = mul <8 x i16> %a, %b
  ret <8 x i16> %mul.i
}

define <4 x i32> @test_vmulq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vmulq_s32:
; CHECK: mul.4s v0, v0, v1
  %mul.i = mul <4 x i32> %a, %b
  ret <4 x i32> %mul.i
}

define <4 x float> @test_vmulq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vmulq_f32:
; CHECK: fmul.4s v0, v0, v1
  %mul.i = fmul <4 x float> %a, %b
  ret <4 x float> %mul.i
}

define <16 x i8> @test_vmulq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vmulq_u8:
; CHECK: mul.16b v0, v0, v1
  %mul.i = mul <16 x i8> %a, %b
  ret <16 x i8> %mul.i
}

define <8 x i16> @test_vmulq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vmulq_u16:
; CHECK: mul.8h v0, v0, v1
  %mul.i = mul <8 x i16> %a, %b
  ret <8 x i16> %mul.i
}

define <4 x i32> @test_vmulq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vmulq_u32:
; CHECK: mul.4s v0, v0, v1
  %mul.i = mul <4 x i32> %a, %b
  ret <4 x i32> %mul.i
}

define <8 x i16> @test_vmull_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmull_s8:
; CHECK: smull.8h v0, v0, v1
  %vmull.i = tail call <8 x i16> @llvm.arm.neon.vmulls.v8i16(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i16> %vmull.i
}

define <4 x i32> @test_vmull_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmull_s16:
; CHECK: smull.4s v0, v0, v1
  %vmull2.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i32> %vmull2.i
}

define <2 x i64> @test_vmull_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmull_s32:
; CHECK: smull.2d v0, v0, v1
  %vmull2.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i64> %vmull2.i
}

define <8 x i16> @test_vmull_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmull_u8:
; CHECK: umull.8h v0, v0, v1
  %vmull.i = tail call <8 x i16> @llvm.arm.neon.vmullu.v8i16(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i16> %vmull.i
}

define <4 x i32> @test_vmull_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmull_u16:
; CHECK: umull.4s v0, v0, v1
  %vmull2.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i32> %vmull2.i
}

define <2 x i64> @test_vmull_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmull_u32:
; CHECK: umull.2d v0, v0, v1
  %vmull2.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i64> %vmull2.i
}

define <8 x i16> @test_vmull_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmull_p8:
; CHECK: pmull.8h v0, v0, v1
  %vmull.i = tail call <8 x i16> @llvm.arm.neon.vmullp.v8i16(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i16> %vmull.i
}

define <4 x i32> @test_vmull_lane_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmull_lane_s16:
; CHECK: smull.4s v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vmull2.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %a, <4 x i16> %shuffle) #5
  ret <4 x i32> %vmull2.i
}

define <2 x i64> @test_vmull_lane_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmull_lane_s32:
; CHECK: smull.2d v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vmull2.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %a, <2 x i32> %shuffle) #5
  ret <2 x i64> %vmull2.i
}

define <4 x i32> @test_vmull_lane_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmull_lane_u16:
; CHECK: umull.4s v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vmull2.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %a, <4 x i16> %shuffle) #5
  ret <4 x i32> %vmull2.i
}

define <2 x i64> @test_vmull_lane_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmull_lane_u32:
; CHECK: umull.2d v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vmull2.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %a, <2 x i32> %shuffle) #5
  ret <2 x i64> %vmull2.i
}

define <4 x i32> @test_vmull_n_s16(<4 x i16> %a, i16 signext %b) #0 {
; CHECK-LABEL: test_vmull_n_s16:
; CHECK: dup.4h v1, w0
; CHECK: smull.4s v0, v0, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %b, i32 3
  %vmull5.i = tail call <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16> %a, <4 x i16> %vecinit3.i) #5
  ret <4 x i32> %vmull5.i
}

define <2 x i64> @test_vmull_n_s32(<2 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vmull_n_s32:
; CHECK: dup.2s v1, w0
; CHECK: smull.2d v0, v0, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %b, i32 1
  %vmull3.i = tail call <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32> %a, <2 x i32> %vecinit1.i) #5
  ret <2 x i64> %vmull3.i
}

define <4 x i32> @test_vmull_n_u16(<4 x i16> %a, i16 zeroext %b) #0 {
; CHECK-LABEL: test_vmull_n_u16:
; CHECK: dup.4h v1, w0
; CHECK: umull.4s v0, v0, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %b, i32 3
  %vmull5.i = tail call <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16> %a, <4 x i16> %vecinit3.i) #5
  ret <4 x i32> %vmull5.i
}

define <2 x i64> @test_vmull_n_u32(<2 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vmull_n_u32:
; CHECK: dup.2s v1, w0
; CHECK: umull.2d v0, v0, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %b, i32 1
  %vmull3.i = tail call <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32> %a, <2 x i32> %vecinit1.i) #5
  ret <2 x i64> %vmull3.i
}

define <8 x i8> @test_vmul_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vmul_p8:
; CHECK: pmul.8b v0, v0, v1
  %vmul_v.i = tail call <8 x i8> @llvm.arm.neon.vmulp.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vmul_v.i
}

define <16 x i8> @test_vmulq_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vmulq_p8:
; CHECK: pmul.16b v0, v0, v1
  %vmulq_v.i = tail call <16 x i8> @llvm.arm.neon.vmulp.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vmulq_v.i
}

define <4 x i16> @test_vmul_lane_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmul_lane_s16:
; CHECK: mul.4h v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %mul = mul <4 x i16> %shuffle, %a
  ret <4 x i16> %mul
}

define <2 x i32> @test_vmul_lane_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmul_lane_s32:
; CHECK: mul.2s v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %mul = mul <2 x i32> %shuffle, %a
  ret <2 x i32> %mul
}

define <2 x float> @test_vmul_lane_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vmul_lane_f32:
; CHECK: fmul.2s v0, v0, v1[1]
  %shuffle = shufflevector <2 x float> %b, <2 x float> undef, <2 x i32> <i32 1, i32 1>
  %mul = fmul <2 x float> %shuffle, %a
  ret <2 x float> %mul
}

define <4 x i16> @test_vmul_lane_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmul_lane_u16:
; CHECK: mul.4h v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %mul = mul <4 x i16> %shuffle, %a
  ret <4 x i16> %mul
}

define <2 x i32> @test_vmul_lane_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmul_lane_u32:
; CHECK: mul.2s v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %mul = mul <2 x i32> %shuffle, %a
  ret <2 x i32> %mul
}

define <8 x i16> @test_vmulq_lane_s16(<8 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmulq_lane_s16:
; CHECK: mul.8h v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %mul = mul <8 x i16> %shuffle, %a
  ret <8 x i16> %mul
}

define <4 x i32> @test_vmulq_lane_s32(<4 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmulq_lane_s32:
; CHECK: mul.4s v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = mul <4 x i32> %shuffle, %a
  ret <4 x i32> %mul
}

define <4 x float> @test_vmulq_lane_f32(<4 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vmulq_lane_f32:
; CHECK: fmul.4s v0, v0, v1[1]
  %shuffle = shufflevector <2 x float> %b, <2 x float> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = fmul <4 x float> %shuffle, %a
  ret <4 x float> %mul
}

define <8 x i16> @test_vmulq_lane_u16(<8 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vmulq_lane_u16:
; CHECK: mul.8h v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %mul = mul <8 x i16> %shuffle, %a
  ret <8 x i16> %mul
}

define <4 x i32> @test_vmulq_lane_u32(<4 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vmulq_lane_u32:
; CHECK: mul.4s v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %mul = mul <4 x i32> %shuffle, %a
  ret <4 x i32> %mul
}

define <4 x i16> @test_vmul_n_s16(<4 x i16> %a, i16 signext %b) #0 {
; CHECK-LABEL: test_vmul_n_s16:
; CHECK: dup.4h v1, w0
; CHECK: mul.4h v0, v1, v0
  %vecinit.i = insertelement <4 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %b, i32 3
  %mul.i = mul <4 x i16> %vecinit3.i, %a
  ret <4 x i16> %mul.i
}

define <2 x i32> @test_vmul_n_s32(<2 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vmul_n_s32:
; CHECK: dup.2s v1, w0
; CHECK: mul.2s v0, v1, v0
  %vecinit.i = insertelement <2 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %b, i32 1
  %mul.i = mul <2 x i32> %vecinit1.i, %a
  ret <2 x i32> %mul.i
}

define <2 x float> @test_vmul_n_f32(<2 x float> %a, float %b) #0 {
; CHECK-LABEL: test_vmul_n_f32:
; CHECK: fmul.2s v0, v0, v1[0]
  %vecinit.i = insertelement <2 x float> undef, float %b, i32 0
  %vecinit1.i = insertelement <2 x float> %vecinit.i, float %b, i32 1
  %mul.i = fmul <2 x float> %vecinit1.i, %a
  ret <2 x float> %mul.i
}

define <4 x i16> @test_vmul_n_u16(<4 x i16> %a, i16 zeroext %b) #0 {
; CHECK-LABEL: test_vmul_n_u16:
; CHECK: dup.4h v1, w0
; CHECK: mul.4h v0, v1, v0
  %vecinit.i = insertelement <4 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %b, i32 3
  %mul.i = mul <4 x i16> %vecinit3.i, %a
  ret <4 x i16> %mul.i
}

define <2 x i32> @test_vmul_n_u32(<2 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vmul_n_u32:
; CHECK: dup.2s v1, w0
; CHECK: mul.2s v0, v1, v0
  %vecinit.i = insertelement <2 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %b, i32 1
  %mul.i = mul <2 x i32> %vecinit1.i, %a
  ret <2 x i32> %mul.i
}

define <8 x i16> @test_vmulq_n_s16(<8 x i16> %a, i16 signext %b) #0 {
; CHECK-LABEL: test_vmulq_n_s16:
; CHECK: dup.8h v1, w0
; CHECK: mul.8h v0, v1, v0
  %vecinit.i = insertelement <8 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %b, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %b, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %b, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %b, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %b, i32 7
  %mul.i = mul <8 x i16> %vecinit7.i, %a
  ret <8 x i16> %mul.i
}

define <4 x i32> @test_vmulq_n_s32(<4 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vmulq_n_s32:
; CHECK: dup.4s v1, w0
; CHECK: mul.4s v0, v1, v0
  %vecinit.i = insertelement <4 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %b, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %b, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %b, i32 3
  %mul.i = mul <4 x i32> %vecinit3.i, %a
  ret <4 x i32> %mul.i
}

define <4 x float> @test_vmulq_n_f32(<4 x float> %a, float %b) #0 {
; CHECK-LABEL: test_vmulq_n_f32:
; CHECK: fmul.4s v0, v0, v1[0]
  %vecinit.i = insertelement <4 x float> undef, float %b, i32 0
  %vecinit1.i = insertelement <4 x float> %vecinit.i, float %b, i32 1
  %vecinit2.i = insertelement <4 x float> %vecinit1.i, float %b, i32 2
  %vecinit3.i = insertelement <4 x float> %vecinit2.i, float %b, i32 3
  %mul.i = fmul <4 x float> %vecinit3.i, %a
  ret <4 x float> %mul.i
}

define <8 x i16> @test_vmulq_n_u16(<8 x i16> %a, i16 zeroext %b) #0 {
; CHECK-LABEL: test_vmulq_n_u16:
; CHECK: dup.8h v1, w0
; CHECK: mul.8h v0, v1, v0
  %vecinit.i = insertelement <8 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %b, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %b, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %b, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %b, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %b, i32 7
  %mul.i = mul <8 x i16> %vecinit7.i, %a
  ret <8 x i16> %mul.i
}

define <4 x i32> @test_vmulq_n_u32(<4 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vmulq_n_u32:
; CHECK: dup.4s v1, w0
; CHECK: mul.4s v0, v1, v0
  %vecinit.i = insertelement <4 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %b, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %b, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %b, i32 3
  %mul.i = mul <4 x i32> %vecinit3.i, %a
  ret <4 x i32> %mul.i
}

define <8 x i8> @test_vmvn_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vmvn_s8:
; CHECK: mvn.8b  v0, v0
  %neg.i = xor <8 x i8> %a, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  ret <8 x i8> %neg.i
}

define <4 x i16> @test_vmvn_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vmvn_s16:
; CHECK: mvn.8b  v0, v0
  %neg.i = xor <4 x i16> %a, <i16 -1, i16 -1, i16 -1, i16 -1>
  ret <4 x i16> %neg.i
}

define <2 x i32> @test_vmvn_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vmvn_s32:
; CHECK: mvn.8b  v0, v0
  %neg.i = xor <2 x i32> %a, <i32 -1, i32 -1>
  ret <2 x i32> %neg.i
}

define <8 x i8> @test_vmvn_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vmvn_u8:
; CHECK: mvn.8b  v0, v0
  %neg.i = xor <8 x i8> %a, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  ret <8 x i8> %neg.i
}

define <4 x i16> @test_vmvn_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vmvn_u16:
; CHECK: mvn.8b  v0, v0
  %neg.i = xor <4 x i16> %a, <i16 -1, i16 -1, i16 -1, i16 -1>
  ret <4 x i16> %neg.i
}

define <2 x i32> @test_vmvn_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vmvn_u32:
; CHECK: mvn.8b  v0, v0
  %neg.i = xor <2 x i32> %a, <i32 -1, i32 -1>
  ret <2 x i32> %neg.i
}

define <8 x i8> @test_vmvn_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vmvn_p8:
; CHECK: mvn.8b  v0, v0
  %neg.i = xor <8 x i8> %a, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  ret <8 x i8> %neg.i
}

define <16 x i8> @test_vmvnq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vmvnq_s8:
; CHECK: mvn.16b  v0, v0
  %neg.i = xor <16 x i8> %a, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  ret <16 x i8> %neg.i
}

define <8 x i16> @test_vmvnq_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vmvnq_s16:
; CHECK: mvn.16b  v0, v0
  %neg.i = xor <8 x i16> %a, <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>
  ret <8 x i16> %neg.i
}

define <4 x i32> @test_vmvnq_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vmvnq_s32:
; CHECK: mvn.16b  v0, v0
  %neg.i = xor <4 x i32> %a, <i32 -1, i32 -1, i32 -1, i32 -1>
  ret <4 x i32> %neg.i
}

define <16 x i8> @test_vmvnq_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vmvnq_u8:
; CHECK: mvn.16b  v0, v0
  %neg.i = xor <16 x i8> %a, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  ret <16 x i8> %neg.i
}

define <8 x i16> @test_vmvnq_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vmvnq_u16:
; CHECK: mvn.16b  v0, v0
  %neg.i = xor <8 x i16> %a, <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>
  ret <8 x i16> %neg.i
}

define <4 x i32> @test_vmvnq_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vmvnq_u32:
; CHECK: mvn.16b  v0, v0
  %neg.i = xor <4 x i32> %a, <i32 -1, i32 -1, i32 -1, i32 -1>
  ret <4 x i32> %neg.i
}

define <16 x i8> @test_vmvnq_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vmvnq_p8:
; CHECK: mvn.16b  v0, v0
  %neg.i = xor <16 x i8> %a, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  ret <16 x i8> %neg.i
}

define <8 x i8> @test_vneg_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vneg_s8:
; CHECK: neg.8b v0, v0
  %sub.i = sub <8 x i8> zeroinitializer, %a
  ret <8 x i8> %sub.i
}

define <4 x i16> @test_vneg_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vneg_s16:
; CHECK: neg.4h v0, v0
  %sub.i = sub <4 x i16> zeroinitializer, %a
  ret <4 x i16> %sub.i
}

define <2 x i32> @test_vneg_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vneg_s32:
; CHECK: neg.2s v0, v0
  %sub.i = sub <2 x i32> zeroinitializer, %a
  ret <2 x i32> %sub.i
}

define <2 x float> @test_vneg_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vneg_f32:
; CHECK: fneg.2s v0, v0
  %sub.i = fsub <2 x float> <float -0.000000e+00, float -0.000000e+00>, %a
  ret <2 x float> %sub.i
}

define <16 x i8> @test_vnegq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vnegq_s8:
; CHECK: neg.16b v0, v0
  %sub.i = sub <16 x i8> zeroinitializer, %a
  ret <16 x i8> %sub.i
}

define <8 x i16> @test_vnegq_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vnegq_s16:
; CHECK: neg.8h v0, v0
  %sub.i = sub <8 x i16> zeroinitializer, %a
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vnegq_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vnegq_s32:
; CHECK: neg.4s v0, v0
  %sub.i = sub <4 x i32> zeroinitializer, %a
  ret <4 x i32> %sub.i
}

define <4 x float> @test_vnegq_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vnegq_f32:
; CHECK: fneg.4s v0, v0
  %sub.i = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a
  ret <4 x float> %sub.i
}

define <8 x i8> @test_vorn_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vorn_s8:
; CHECK: orn.8b v0, v0, v1
  %neg.i = xor <8 x i8> %b, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %or.i = or <8 x i8> %a, %neg.i
  ret <8 x i8> %or.i
}

define <4 x i16> @test_vorn_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vorn_s16:
; CHECK: orn.8b v0, v0, v1
  %neg.i = xor <4 x i16> %b, <i16 -1, i16 -1, i16 -1, i16 -1>
  %or.i = or <4 x i16> %a, %neg.i
  ret <4 x i16> %or.i
}

define <2 x i32> @test_vorn_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vorn_s32:
; CHECK: orn.8b v0, v0, v1
  %neg.i = xor <2 x i32> %b, <i32 -1, i32 -1>
  %or.i = or <2 x i32> %a, %neg.i
  ret <2 x i32> %or.i
}

define <1 x i64> @test_vorn_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vorn_s64:
; CHECK: orn.8b v0, v0, v1
  %neg.i = xor <1 x i64> %b, <i64 -1>
  %or.i = or <1 x i64> %a, %neg.i
  ret <1 x i64> %or.i
}

define <8 x i8> @test_vorn_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vorn_u8:
; CHECK: orn.8b v0, v0, v1
  %neg.i = xor <8 x i8> %b, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %or.i = or <8 x i8> %a, %neg.i
  ret <8 x i8> %or.i
}

define <4 x i16> @test_vorn_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vorn_u16:
; CHECK: orn.8b v0, v0, v1
  %neg.i = xor <4 x i16> %b, <i16 -1, i16 -1, i16 -1, i16 -1>
  %or.i = or <4 x i16> %a, %neg.i
  ret <4 x i16> %or.i
}

define <2 x i32> @test_vorn_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vorn_u32:
; CHECK: orn.8b v0, v0, v1
  %neg.i = xor <2 x i32> %b, <i32 -1, i32 -1>
  %or.i = or <2 x i32> %a, %neg.i
  ret <2 x i32> %or.i
}

define <1 x i64> @test_vorn_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vorn_u64:
; CHECK: orn.8b v0, v0, v1
  %neg.i = xor <1 x i64> %b, <i64 -1>
  %or.i = or <1 x i64> %a, %neg.i
  ret <1 x i64> %or.i
}

define <16 x i8> @test_vornq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vornq_s8:
; CHECK: orn.16b v0, v0, v1
  %neg.i = xor <16 x i8> %b, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %or.i = or <16 x i8> %a, %neg.i
  ret <16 x i8> %or.i
}

define <8 x i16> @test_vornq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vornq_s16:
; CHECK: orn.16b v0, v0, v1
  %neg.i = xor <8 x i16> %b, <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>
  %or.i = or <8 x i16> %a, %neg.i
  ret <8 x i16> %or.i
}

define <4 x i32> @test_vornq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vornq_s32:
; CHECK: orn.16b v0, v0, v1
  %neg.i = xor <4 x i32> %b, <i32 -1, i32 -1, i32 -1, i32 -1>
  %or.i = or <4 x i32> %a, %neg.i
  ret <4 x i32> %or.i
}

define <2 x i64> @test_vornq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vornq_s64:
; CHECK: orn.16b v0, v0, v1
  %neg.i = xor <2 x i64> %b, <i64 -1, i64 -1>
  %or.i = or <2 x i64> %a, %neg.i
  ret <2 x i64> %or.i
}

define <16 x i8> @test_vornq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vornq_u8:
; CHECK: orn.16b v0, v0, v1
  %neg.i = xor <16 x i8> %b, <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>
  %or.i = or <16 x i8> %a, %neg.i
  ret <16 x i8> %or.i
}

define <8 x i16> @test_vornq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vornq_u16:
; CHECK: orn.16b v0, v0, v1
  %neg.i = xor <8 x i16> %b, <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>
  %or.i = or <8 x i16> %a, %neg.i
  ret <8 x i16> %or.i
}

define <4 x i32> @test_vornq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vornq_u32:
; CHECK: orn.16b v0, v0, v1
  %neg.i = xor <4 x i32> %b, <i32 -1, i32 -1, i32 -1, i32 -1>
  %or.i = or <4 x i32> %a, %neg.i
  ret <4 x i32> %or.i
}

define <2 x i64> @test_vornq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vornq_u64:
; CHECK: orn.16b v0, v0, v1
  %neg.i = xor <2 x i64> %b, <i64 -1, i64 -1>
  %or.i = or <2 x i64> %a, %neg.i
  ret <2 x i64> %or.i
}

define <8 x i8> @test_vorr_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vorr_s8:
; CHECK: orr.8b v0, v0, v1
  %or.i = or <8 x i8> %a, %b
  ret <8 x i8> %or.i
}

define <4 x i16> @test_vorr_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vorr_s16:
; CHECK: orr.8b v0, v0, v1
  %or.i = or <4 x i16> %a, %b
  ret <4 x i16> %or.i
}

define <2 x i32> @test_vorr_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vorr_s32:
; CHECK: orr.8b v0, v0, v1
  %or.i = or <2 x i32> %a, %b
  ret <2 x i32> %or.i
}

define <1 x i64> @test_vorr_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vorr_s64:
; CHECK: orr.8b v0, v0, v1
  %or.i = or <1 x i64> %a, %b
  ret <1 x i64> %or.i
}

define <8 x i8> @test_vorr_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vorr_u8:
; CHECK: orr.8b v0, v0, v1
  %or.i = or <8 x i8> %a, %b
  ret <8 x i8> %or.i
}

define <4 x i16> @test_vorr_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vorr_u16:
; CHECK: orr.8b v0, v0, v1
  %or.i = or <4 x i16> %a, %b
  ret <4 x i16> %or.i
}

define <2 x i32> @test_vorr_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vorr_u32:
; CHECK: orr.8b v0, v0, v1
  %or.i = or <2 x i32> %a, %b
  ret <2 x i32> %or.i
}

define <1 x i64> @test_vorr_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vorr_u64:
; CHECK: orr.8b v0, v0, v1
  %or.i = or <1 x i64> %a, %b
  ret <1 x i64> %or.i
}

define <16 x i8> @test_vorrq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vorrq_s8:
; CHECK: orr.16b v0, v0, v1
  %or.i = or <16 x i8> %a, %b
  ret <16 x i8> %or.i
}

define <8 x i16> @test_vorrq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vorrq_s16:
; CHECK: orr.16b v0, v0, v1
  %or.i = or <8 x i16> %a, %b
  ret <8 x i16> %or.i
}

define <4 x i32> @test_vorrq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vorrq_s32:
; CHECK: orr.16b v0, v0, v1
  %or.i = or <4 x i32> %a, %b
  ret <4 x i32> %or.i
}

define <2 x i64> @test_vorrq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vorrq_s64:
; CHECK: orr.16b v0, v0, v1
  %or.i = or <2 x i64> %a, %b
  ret <2 x i64> %or.i
}

define <16 x i8> @test_vorrq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vorrq_u8:
; CHECK: orr.16b v0, v0, v1
  %or.i = or <16 x i8> %a, %b
  ret <16 x i8> %or.i
}

define <8 x i16> @test_vorrq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vorrq_u16:
; CHECK: orr.16b v0, v0, v1
  %or.i = or <8 x i16> %a, %b
  ret <8 x i16> %or.i
}

define <4 x i32> @test_vorrq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vorrq_u32:
; CHECK: orr.16b v0, v0, v1
  %or.i = or <4 x i32> %a, %b
  ret <4 x i32> %or.i
}

define <2 x i64> @test_vorrq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vorrq_u64:
; CHECK: orr.16b v0, v0, v1
  %or.i = or <2 x i64> %a, %b
  ret <2 x i64> %or.i
}

define <4 x i16> @test_vpadal_s8(<4 x i16> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vpadal_s8:
; CHECK: sadalp.4h v0, v1
  %vpadal_v1.i = tail call <4 x i16> @llvm.arm.neon.vpadals.v4i16.v8i8(<4 x i16> %a, <8 x i8> %b) #5
  ret <4 x i16> %vpadal_v1.i
}

define <2 x i32> @test_vpadal_s16(<2 x i32> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vpadal_s16:
; CHECK: sadalp.2s v0, v1
  %vpadal_v2.i = tail call <2 x i32> @llvm.arm.neon.vpadals.v2i32.v4i16(<2 x i32> %a, <4 x i16> %b) #5
  ret <2 x i32> %vpadal_v2.i
}

define <1 x i64> @test_vpadal_s32(<1 x i64> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vpadal_s32:
; CHECK: sadalp.1d v0, v1
  %vpadal_v2.i = tail call <1 x i64> @llvm.arm.neon.vpadals.v1i64.v2i32(<1 x i64> %a, <2 x i32> %b) #5
  ret <1 x i64> %vpadal_v2.i
}

define <4 x i16> @test_vpadal_u8(<4 x i16> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vpadal_u8:
; CHECK: uadalp.4h v0, v1
  %vpadal_v1.i = tail call <4 x i16> @llvm.arm.neon.vpadalu.v4i16.v8i8(<4 x i16> %a, <8 x i8> %b) #5
  ret <4 x i16> %vpadal_v1.i
}

define <2 x i32> @test_vpadal_u16(<2 x i32> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vpadal_u16:
; CHECK: uadalp.2s v0, v1
  %vpadal_v2.i = tail call <2 x i32> @llvm.arm.neon.vpadalu.v2i32.v4i16(<2 x i32> %a, <4 x i16> %b) #5
  ret <2 x i32> %vpadal_v2.i
}

define <1 x i64> @test_vpadal_u32(<1 x i64> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vpadal_u32:
; CHECK: uadalp.1d v0, v1
  %vpadal_v2.i = tail call <1 x i64> @llvm.arm.neon.vpadalu.v1i64.v2i32(<1 x i64> %a, <2 x i32> %b) #5
  ret <1 x i64> %vpadal_v2.i
}

define <8 x i16> @test_vpadalq_s8(<8 x i16> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vpadalq_s8:
; CHECK: sadalp.8h v0, v1
  %vpadalq_v1.i = tail call <8 x i16> @llvm.arm.neon.vpadals.v8i16.v16i8(<8 x i16> %a, <16 x i8> %b) #5
  ret <8 x i16> %vpadalq_v1.i
}

define <4 x i32> @test_vpadalq_s16(<4 x i32> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vpadalq_s16:
; CHECK: sadalp.4s v0, v1
  %vpadalq_v2.i = tail call <4 x i32> @llvm.arm.neon.vpadals.v4i32.v8i16(<4 x i32> %a, <8 x i16> %b) #5
  ret <4 x i32> %vpadalq_v2.i
}

define <2 x i64> @test_vpadalq_s32(<2 x i64> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vpadalq_s32:
; CHECK: sadalp.2d v0, v1
  %vpadalq_v2.i = tail call <2 x i64> @llvm.arm.neon.vpadals.v2i64.v4i32(<2 x i64> %a, <4 x i32> %b) #5
  ret <2 x i64> %vpadalq_v2.i
}

define <8 x i16> @test_vpadalq_u8(<8 x i16> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vpadalq_u8:
; CHECK: uadalp.8h v0, v1
  %vpadalq_v1.i = tail call <8 x i16> @llvm.arm.neon.vpadalu.v8i16.v16i8(<8 x i16> %a, <16 x i8> %b) #5
  ret <8 x i16> %vpadalq_v1.i
}

define <4 x i32> @test_vpadalq_u16(<4 x i32> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vpadalq_u16:
; CHECK: uadalp.4s v0, v1
  %vpadalq_v2.i = tail call <4 x i32> @llvm.arm.neon.vpadalu.v4i32.v8i16(<4 x i32> %a, <8 x i16> %b) #5
  ret <4 x i32> %vpadalq_v2.i
}

define <2 x i64> @test_vpadalq_u32(<2 x i64> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vpadalq_u32:
; CHECK: uadalp.2d v0, v1
  %vpadalq_v2.i = tail call <2 x i64> @llvm.arm.neon.vpadalu.v2i64.v4i32(<2 x i64> %a, <4 x i32> %b) #5
  ret <2 x i64> %vpadalq_v2.i
}

define <8 x i8> @test_vpadd_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vpadd_s8:
; CHECK: addp.8b v0, v0, v1
  %vpadd_v.i = tail call <8 x i8> @llvm.arm.neon.vpadd.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vpadd_v.i
}

define <4 x i16> @test_vpadd_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vpadd_s16:
; CHECK: addp.4h v0, v0, v1
  %vpadd_v2.i = tail call <4 x i16> @llvm.arm.neon.vpadd.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vpadd_v2.i
}

define <2 x i32> @test_vpadd_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vpadd_s32:
; CHECK: addp.2s v0, v0, v1
  %vpadd_v2.i = tail call <2 x i32> @llvm.arm.neon.vpadd.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vpadd_v2.i
}

define <8 x i8> @test_vpadd_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vpadd_u8:
; CHECK: addp.8b v0, v0, v1
  %vpadd_v.i = tail call <8 x i8> @llvm.arm.neon.vpadd.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vpadd_v.i
}

define <4 x i16> @test_vpadd_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vpadd_u16:
; CHECK: addp.4h v0, v0, v1
  %vpadd_v2.i = tail call <4 x i16> @llvm.arm.neon.vpadd.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vpadd_v2.i
}

define <2 x i32> @test_vpadd_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vpadd_u32:
; CHECK: addp.2s v0, v0, v1
  %vpadd_v2.i = tail call <2 x i32> @llvm.arm.neon.vpadd.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vpadd_v2.i
}

define <2 x float> @test_vpadd_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vpadd_f32:
; CHECK: faddp.2s v0, v0, v1
  %vpadd_v2.i = tail call <2 x float> @llvm.arm.neon.vpadd.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x float> %vpadd_v2.i
}

define <4 x i16> @test_vpaddl_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vpaddl_s8:
; CHECK: saddlp.4h v0, v0
  %vpaddl.i = tail call <4 x i16> @llvm.arm.neon.vpaddls.v4i16.v8i8(<8 x i8> %a) #5
  ret <4 x i16> %vpaddl.i
}

define <2 x i32> @test_vpaddl_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vpaddl_s16:
; CHECK: saddlp.2s v0, v0
  %vpaddl1.i = tail call <2 x i32> @llvm.arm.neon.vpaddls.v2i32.v4i16(<4 x i16> %a) #5
  ret <2 x i32> %vpaddl1.i
}

define <1 x i64> @test_vpaddl_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vpaddl_s32:
; CHECK: saddlp.1d v0, v0
  %vpaddl1.i = tail call <1 x i64> @llvm.arm.neon.vpaddls.v1i64.v2i32(<2 x i32> %a) #5
  ret <1 x i64> %vpaddl1.i
}

define <4 x i16> @test_vpaddl_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vpaddl_u8:
; CHECK: uaddlp.4h v0, v0
  %vpaddl.i = tail call <4 x i16> @llvm.arm.neon.vpaddlu.v4i16.v8i8(<8 x i8> %a) #5
  ret <4 x i16> %vpaddl.i
}

define <2 x i32> @test_vpaddl_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vpaddl_u16:
; CHECK: uaddlp.2s v0, v0
  %vpaddl1.i = tail call <2 x i32> @llvm.arm.neon.vpaddlu.v2i32.v4i16(<4 x i16> %a) #5
  ret <2 x i32> %vpaddl1.i
}

define <1 x i64> @test_vpaddl_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vpaddl_u32:
; CHECK: uaddlp.1d v0, v0
  %vpaddl1.i = tail call <1 x i64> @llvm.arm.neon.vpaddlu.v1i64.v2i32(<2 x i32> %a) #5
  ret <1 x i64> %vpaddl1.i
}

define <8 x i16> @test_vpaddlq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vpaddlq_s8:
; CHECK: saddlp.8h v0, v0
  %vpaddl.i = tail call <8 x i16> @llvm.arm.neon.vpaddls.v8i16.v16i8(<16 x i8> %a) #5
  ret <8 x i16> %vpaddl.i
}

define <4 x i32> @test_vpaddlq_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vpaddlq_s16:
; CHECK: saddlp.4s v0, v0
  %vpaddl1.i = tail call <4 x i32> @llvm.arm.neon.vpaddls.v4i32.v8i16(<8 x i16> %a) #5
  ret <4 x i32> %vpaddl1.i
}

define <2 x i64> @test_vpaddlq_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vpaddlq_s32:
; CHECK: saddlp.2d v0, v0
  %vpaddl1.i = tail call <2 x i64> @llvm.arm.neon.vpaddls.v2i64.v4i32(<4 x i32> %a) #5
  ret <2 x i64> %vpaddl1.i
}

define <8 x i16> @test_vpaddlq_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vpaddlq_u8:
; CHECK: uaddlp.8h v0, v0
  %vpaddl.i = tail call <8 x i16> @llvm.arm.neon.vpaddlu.v8i16.v16i8(<16 x i8> %a) #5
  ret <8 x i16> %vpaddl.i
}

define <4 x i32> @test_vpaddlq_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vpaddlq_u16:
; CHECK: uaddlp.4s v0, v0
  %vpaddl1.i = tail call <4 x i32> @llvm.arm.neon.vpaddlu.v4i32.v8i16(<8 x i16> %a) #5
  ret <4 x i32> %vpaddl1.i
}

define <2 x i64> @test_vpaddlq_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vpaddlq_u32:
; CHECK: uaddlp.2d v0, v0
  %vpaddl1.i = tail call <2 x i64> @llvm.arm.neon.vpaddlu.v2i64.v4i32(<4 x i32> %a) #5
  ret <2 x i64> %vpaddl1.i
}

define <8 x i8> @test_vpmax_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vpmax_s8:
; CHECK: smaxp.8b v0, v0, v1
  %vpmax_v.i = tail call <8 x i8> @llvm.arm.neon.vpmaxs.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vpmax_v.i
}

define <4 x i16> @test_vpmax_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vpmax_s16:
; CHECK: smaxp.4h v0, v0, v1
  %vpmax_v2.i = tail call <4 x i16> @llvm.arm.neon.vpmaxs.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vpmax_v2.i
}

define <2 x i32> @test_vpmax_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vpmax_s32:
; CHECK: smaxp.2s v0, v0, v1
  %vpmax_v2.i = tail call <2 x i32> @llvm.arm.neon.vpmaxs.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vpmax_v2.i
}

define <8 x i8> @test_vpmax_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vpmax_u8:
; CHECK: umaxp.8b v0, v0, v1
  %vpmax_v.i = tail call <8 x i8> @llvm.arm.neon.vpmaxu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vpmax_v.i
}

define <4 x i16> @test_vpmax_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vpmax_u16:
; CHECK: umaxp.4h v0, v0, v1
  %vpmax_v2.i = tail call <4 x i16> @llvm.arm.neon.vpmaxu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vpmax_v2.i
}

define <2 x i32> @test_vpmax_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vpmax_u32:
; CHECK: umaxp.2s v0, v0, v1
  %vpmax_v2.i = tail call <2 x i32> @llvm.arm.neon.vpmaxu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vpmax_v2.i
}

define <2 x float> @test_vpmax_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vpmax_f32:
; CHECK: fmaxp.2s v0, v0, v1
  %vpmax_v2.i = tail call <2 x float> @llvm.arm.neon.vpmaxs.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x float> %vpmax_v2.i
}

define <8 x i8> @test_vpmin_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vpmin_s8:
; CHECK: sminp.8b v0, v0, v1
  %vpmin_v.i = tail call <8 x i8> @llvm.arm.neon.vpmins.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vpmin_v.i
}

define <4 x i16> @test_vpmin_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vpmin_s16:
; CHECK: sminp.4h v0, v0, v1
  %vpmin_v2.i = tail call <4 x i16> @llvm.arm.neon.vpmins.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vpmin_v2.i
}

define <2 x i32> @test_vpmin_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vpmin_s32:
; CHECK: sminp.2s v0, v0, v1
  %vpmin_v2.i = tail call <2 x i32> @llvm.arm.neon.vpmins.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vpmin_v2.i
}

define <8 x i8> @test_vpmin_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vpmin_u8:
; CHECK: uminp.8b v0, v0, v1
  %vpmin_v.i = tail call <8 x i8> @llvm.arm.neon.vpminu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vpmin_v.i
}

define <4 x i16> @test_vpmin_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vpmin_u16:
; CHECK: uminp.4h v0, v0, v1
  %vpmin_v2.i = tail call <4 x i16> @llvm.arm.neon.vpminu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vpmin_v2.i
}

define <2 x i32> @test_vpmin_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vpmin_u32:
; CHECK: uminp.2s v0, v0, v1
  %vpmin_v2.i = tail call <2 x i32> @llvm.arm.neon.vpminu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vpmin_v2.i
}

define <2 x float> @test_vpmin_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vpmin_f32:
; CHECK: fminp.2s v0, v0, v1
  %vpmin_v2.i = tail call <2 x float> @llvm.arm.neon.vpmins.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x float> %vpmin_v2.i
}

define <8 x i8> @test_vqabs_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vqabs_s8:
; CHECK: sqabs.8b v0, v0
  %vqabs_v.i = tail call <8 x i8> @llvm.arm.neon.vqabs.v8i8(<8 x i8> %a) #5
  ret <8 x i8> %vqabs_v.i
}

define <4 x i16> @test_vqabs_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vqabs_s16:
; CHECK: sqabs.4h v0, v0
  %vqabs_v1.i = tail call <4 x i16> @llvm.arm.neon.vqabs.v4i16(<4 x i16> %a) #5
  ret <4 x i16> %vqabs_v1.i
}

define <2 x i32> @test_vqabs_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vqabs_s32:
; CHECK: sqabs.2s v0, v0
  %vqabs_v1.i = tail call <2 x i32> @llvm.arm.neon.vqabs.v2i32(<2 x i32> %a) #5
  ret <2 x i32> %vqabs_v1.i
}

define <16 x i8> @test_vqabsq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vqabsq_s8:
; CHECK: sqabs.16b v0, v0
  %vqabsq_v.i = tail call <16 x i8> @llvm.arm.neon.vqabs.v16i8(<16 x i8> %a) #5
  ret <16 x i8> %vqabsq_v.i
}

define <8 x i16> @test_vqabsq_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqabsq_s16:
; CHECK: sqabs.8h v0, v0
  %vqabsq_v1.i = tail call <8 x i16> @llvm.arm.neon.vqabs.v8i16(<8 x i16> %a) #5
  ret <8 x i16> %vqabsq_v1.i
}

define <4 x i32> @test_vqabsq_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqabsq_s32:
; CHECK: sqabs.4s v0, v0
  %vqabsq_v1.i = tail call <4 x i32> @llvm.arm.neon.vqabs.v4i32(<4 x i32> %a) #5
  ret <4 x i32> %vqabsq_v1.i
}

define <8 x i8> @test_vqadd_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vqadd_s8:
; CHECK: sqadd.8b v0, v0, v1
  %vqadd_v.i = tail call <8 x i8> @llvm.arm.neon.vqadds.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vqadd_v.i
}

define <4 x i16> @test_vqadd_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqadd_s16:
; CHECK: sqadd.4h v0, v0, v1
  %vqadd_v2.i = tail call <4 x i16> @llvm.arm.neon.vqadds.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqadd_v2.i
}

define <2 x i32> @test_vqadd_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqadd_s32:
; CHECK: sqadd.2s v0, v0, v1
  %vqadd_v2.i = tail call <2 x i32> @llvm.arm.neon.vqadds.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqadd_v2.i
}

define <1 x i64> @test_vqadd_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vqadd_s64:
; CHECK: sqadd d0, d0, d1
  %vqadd_v2.i = tail call <1 x i64> @llvm.arm.neon.vqadds.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vqadd_v2.i
}

define <8 x i8> @test_vqadd_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vqadd_u8:
; CHECK: uqadd.8b v0, v0, v1
  %vqadd_v.i = tail call <8 x i8> @llvm.arm.neon.vqaddu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vqadd_v.i
}

define <4 x i16> @test_vqadd_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqadd_u16:
; CHECK: uqadd.4h v0, v0, v1
  %vqadd_v2.i = tail call <4 x i16> @llvm.arm.neon.vqaddu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqadd_v2.i
}

define <2 x i32> @test_vqadd_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqadd_u32:
; CHECK: uqadd.2s v0, v0, v1
  %vqadd_v2.i = tail call <2 x i32> @llvm.arm.neon.vqaddu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqadd_v2.i
}

define <1 x i64> @test_vqadd_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vqadd_u64:
; CHECK: uqadd d0, d0, d1
  %vqadd_v2.i = tail call <1 x i64> @llvm.arm.neon.vqaddu.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vqadd_v2.i
}

define <16 x i8> @test_vqaddq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vqaddq_s8:
; CHECK: sqadd.16b v0, v0, v1
  %vqaddq_v.i = tail call <16 x i8> @llvm.arm.neon.vqadds.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vqaddq_v.i
}

define <8 x i16> @test_vqaddq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqaddq_s16:
; CHECK: sqadd.8h v0, v0, v1
  %vqaddq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqadds.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqaddq_v2.i
}

define <4 x i32> @test_vqaddq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqaddq_s32:
; CHECK: sqadd.4s v0, v0, v1
  %vqaddq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqadds.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqaddq_v2.i
}

define <2 x i64> @test_vqaddq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vqaddq_s64:
; CHECK: sqadd.2d v0, v0, v1
  %vqaddq_v2.i = tail call <2 x i64> @llvm.arm.neon.vqadds.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vqaddq_v2.i
}

define <16 x i8> @test_vqaddq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vqaddq_u8:
; CHECK: uqadd.16b v0, v0, v1
  %vqaddq_v.i = tail call <16 x i8> @llvm.arm.neon.vqaddu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vqaddq_v.i
}

define <8 x i16> @test_vqaddq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqaddq_u16:
; CHECK: uqadd.8h v0, v0, v1
  %vqaddq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqaddu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqaddq_v2.i
}

define <4 x i32> @test_vqaddq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqaddq_u32:
; CHECK: uqadd.4s v0, v0, v1
  %vqaddq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqaddu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqaddq_v2.i
}

define <2 x i64> @test_vqaddq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vqaddq_u64:
; CHECK: uqadd.2d v0, v0, v1
  %vqaddq_v2.i = tail call <2 x i64> @llvm.arm.neon.vqaddu.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vqaddq_v2.i
}

define <4 x i32> @test_vqdmlal_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vqdmlal_s16:
; CHECK: sqdmlal.4s v0, v1, v2
  %vqdmlal2.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %b, <4 x i16> %c) #5
  %vqdmlal_v3.i = tail call <4 x i32> @llvm.arm.neon.vqadds.v4i32(<4 x i32> %a, <4 x i32> %vqdmlal2.i) #5
  ret <4 x i32> %vqdmlal_v3.i
}

define <2 x i64> @test_vqdmlal_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vqdmlal_s32:
; CHECK: sqdmlal.2d v0, v1, v2
  %vqdmlal2.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %b, <2 x i32> %c) #5
  %vqdmlal_v3.i = tail call <2 x i64> @llvm.arm.neon.vqadds.v2i64(<2 x i64> %a, <2 x i64> %vqdmlal2.i) #5
  ret <2 x i64> %vqdmlal_v3.i
}

define <4 x i32> @test_vqdmlal_lane_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vqdmlal_lane_s16:
; CHECK: sqdmlal.4s v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vqdmlal2.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %b, <4 x i16> %shuffle) #5
  %vqdmlal_v3.i = tail call <4 x i32> @llvm.arm.neon.vqadds.v4i32(<4 x i32> %a, <4 x i32> %vqdmlal2.i) #5
  ret <4 x i32> %vqdmlal_v3.i
}

define <2 x i64> @test_vqdmlal_lane_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vqdmlal_lane_s32:
; CHECK: sqdmlal.2d v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vqdmlal2.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %b, <2 x i32> %shuffle) #5
  %vqdmlal_v3.i = tail call <2 x i64> @llvm.arm.neon.vqadds.v2i64(<2 x i64> %a, <2 x i64> %vqdmlal2.i) #5
  ret <2 x i64> %vqdmlal_v3.i
}

define <4 x i32> @test_vqdmlal_n_s16(<4 x i32> %a, <4 x i16> %b, i16 signext %c) #0 {
; CHECK-LABEL: test_vqdmlal_n_s16:
; CHECK: dup.4h v2, w0
; CHECK: sqdmlal.4s v0, v1, v2
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %vqdmlal5.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %b, <4 x i16> %vecinit3.i) #5
  %vqdmlal_v6.i = tail call <4 x i32> @llvm.arm.neon.vqadds.v4i32(<4 x i32> %a, <4 x i32> %vqdmlal5.i) #5
  ret <4 x i32> %vqdmlal_v6.i
}

define <2 x i64> @test_vqdmlal_n_s32(<2 x i64> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vqdmlal_n_s32:
; CHECK: dup.2s v2, w0
; CHECK: sqdmlal.2d v0, v1, v2
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %vqdmlal3.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %b, <2 x i32> %vecinit1.i) #5
  %vqdmlal_v4.i = tail call <2 x i64> @llvm.arm.neon.vqadds.v2i64(<2 x i64> %a, <2 x i64> %vqdmlal3.i) #5
  ret <2 x i64> %vqdmlal_v4.i
}

define <4 x i32> @test_vqdmlsl_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vqdmlsl_s16:
; CHECK: sqdmlsl.4s v0, v1, v2
  %vqdmlal2.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %b, <4 x i16> %c) #5
  %vqdmlsl_v3.i = tail call <4 x i32> @llvm.arm.neon.vqsubs.v4i32(<4 x i32> %a, <4 x i32> %vqdmlal2.i) #5
  ret <4 x i32> %vqdmlsl_v3.i
}

define <2 x i64> @test_vqdmlsl_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vqdmlsl_s32:
; CHECK: sqdmlsl.2d v0, v1, v2
  %vqdmlal2.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %b, <2 x i32> %c) #5
  %vqdmlsl_v3.i = tail call <2 x i64> @llvm.arm.neon.vqsubs.v2i64(<2 x i64> %a, <2 x i64> %vqdmlal2.i) #5
  ret <2 x i64> %vqdmlsl_v3.i
}

define <4 x i32> @test_vqdmlsl_lane_s16(<4 x i32> %a, <4 x i16> %b, <4 x i16> %c) #0 {
; CHECK-LABEL: test_vqdmlsl_lane_s16:
; CHECK: sqdmlsl.4s v0, v1, v2[3]
  %shuffle = shufflevector <4 x i16> %c, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vqdmlal2.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %b, <4 x i16> %shuffle) #5
  %vqdmlsl_v3.i = tail call <4 x i32> @llvm.arm.neon.vqsubs.v4i32(<4 x i32> %a, <4 x i32> %vqdmlal2.i) #5
  ret <4 x i32> %vqdmlsl_v3.i
}

define <2 x i64> @test_vqdmlsl_lane_s32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) #0 {
; CHECK-LABEL: test_vqdmlsl_lane_s32:
; CHECK: sqdmlsl.2d v0, v1, v2[1]
  %shuffle = shufflevector <2 x i32> %c, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vqdmlal2.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %b, <2 x i32> %shuffle) #5
  %vqdmlsl_v3.i = tail call <2 x i64> @llvm.arm.neon.vqsubs.v2i64(<2 x i64> %a, <2 x i64> %vqdmlal2.i) #5
  ret <2 x i64> %vqdmlsl_v3.i
}

define <4 x i32> @test_vqdmlsl_n_s16(<4 x i32> %a, <4 x i16> %b, i16 signext %c) #0 {
; CHECK-LABEL: test_vqdmlsl_n_s16:
; CHECK: dup.4h v2, w0
; CHECK: sqdmlsl.4s v0, v1, v2
  %vecinit.i = insertelement <4 x i16> undef, i16 %c, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %c, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %c, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %c, i32 3
  %vqdmlal5.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %b, <4 x i16> %vecinit3.i) #5
  %vqdmlsl_v6.i = tail call <4 x i32> @llvm.arm.neon.vqsubs.v4i32(<4 x i32> %a, <4 x i32> %vqdmlal5.i) #5
  ret <4 x i32> %vqdmlsl_v6.i
}

define <2 x i64> @test_vqdmlsl_n_s32(<2 x i64> %a, <2 x i32> %b, i32 %c) #0 {
; CHECK-LABEL: test_vqdmlsl_n_s32:
; CHECK: dup.2s v2, w0
; CHECK: sqdmlsl.2d v0, v1, v2
  %vecinit.i = insertelement <2 x i32> undef, i32 %c, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %c, i32 1
  %vqdmlal3.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %b, <2 x i32> %vecinit1.i) #5
  %vqdmlsl_v4.i = tail call <2 x i64> @llvm.arm.neon.vqsubs.v2i64(<2 x i64> %a, <2 x i64> %vqdmlal3.i) #5
  ret <2 x i64> %vqdmlsl_v4.i
}

define <4 x i16> @test_vqdmulh_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqdmulh_s16:
; CHECK: sqdmulh.4h v0, v0, v1
  %vqdmulh_v2.i = tail call <4 x i16> @llvm.arm.neon.vqdmulh.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqdmulh_v2.i
}

define <2 x i32> @test_vqdmulh_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqdmulh_s32:
; CHECK: sqdmulh.2s v0, v0, v1
  %vqdmulh_v2.i = tail call <2 x i32> @llvm.arm.neon.vqdmulh.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqdmulh_v2.i
}

define <8 x i16> @test_vqdmulhq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqdmulhq_s16:
; CHECK: sqdmulh.8h v0, v0, v1
  %vqdmulhq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqdmulh.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqdmulhq_v2.i
}

define <4 x i32> @test_vqdmulhq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqdmulhq_s32:
; CHECK: sqdmulh.4s v0, v0, v1
  %vqdmulhq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqdmulh.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqdmulhq_v2.i
}

define <4 x i16> @test_vqdmulh_lane_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqdmulh_lane_s16:
; CHECK: sqdmulh.4h v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vqdmulh_v2.i = tail call <4 x i16> @llvm.arm.neon.vqdmulh.v4i16(<4 x i16> %a, <4 x i16> %shuffle) #5
  ret <4 x i16> %vqdmulh_v2.i
}

define <2 x i32> @test_vqdmulh_lane_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqdmulh_lane_s32:
; CHECK: sqdmulh.2s v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vqdmulh_v2.i = tail call <2 x i32> @llvm.arm.neon.vqdmulh.v2i32(<2 x i32> %a, <2 x i32> %shuffle) #5
  ret <2 x i32> %vqdmulh_v2.i
}

define <8 x i16> @test_vqdmulhq_lane_s16(<8 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqdmulhq_lane_s16:
; CHECK: sqdmulh.8h v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %vqdmulhq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqdmulh.v8i16(<8 x i16> %a, <8 x i16> %shuffle) #5
  ret <8 x i16> %vqdmulhq_v2.i
}

define <4 x i32> @test_vqdmulhq_lane_s32(<4 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqdmulhq_lane_s32:
; CHECK: sqdmulh.4s v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %vqdmulhq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqdmulh.v4i32(<4 x i32> %a, <4 x i32> %shuffle) #5
  ret <4 x i32> %vqdmulhq_v2.i
}

define <4 x i16> @test_vqdmulh_n_s16(<4 x i16> %a, i16 signext %b) #0 {
; CHECK-LABEL: test_vqdmulh_n_s16:
; CHECK: dup.4h v1, w0
; CHECK: sqdmulh.4h v0, v0, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %b, i32 3
  %vqdmulh_v5.i = tail call <4 x i16> @llvm.arm.neon.vqdmulh.v4i16(<4 x i16> %a, <4 x i16> %vecinit3.i) #5
  ret <4 x i16> %vqdmulh_v5.i
}

define <2 x i32> @test_vqdmulh_n_s32(<2 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vqdmulh_n_s32:
; CHECK: dup.2s v1, w0
; CHECK: sqdmulh.2s v0, v0, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %b, i32 1
  %vqdmulh_v3.i = tail call <2 x i32> @llvm.arm.neon.vqdmulh.v2i32(<2 x i32> %a, <2 x i32> %vecinit1.i) #5
  ret <2 x i32> %vqdmulh_v3.i
}

define <8 x i16> @test_vqdmulhq_n_s16(<8 x i16> %a, i16 signext %b) #0 {
; CHECK-LABEL: test_vqdmulhq_n_s16:
; CHECK: dup.8h v1, w0
; CHECK: sqdmulh.8h v0, v0, v1
  %vecinit.i = insertelement <8 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %b, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %b, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %b, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %b, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %b, i32 7
  %vqdmulhq_v9.i = tail call <8 x i16> @llvm.arm.neon.vqdmulh.v8i16(<8 x i16> %a, <8 x i16> %vecinit7.i) #5
  ret <8 x i16> %vqdmulhq_v9.i
}

define <4 x i32> @test_vqdmulhq_n_s32(<4 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vqdmulhq_n_s32:
; CHECK: dup.4s v1, w0
; CHECK: sqdmulh.4s v0, v0, v1
  %vecinit.i = insertelement <4 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %b, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %b, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %b, i32 3
  %vqdmulhq_v5.i = tail call <4 x i32> @llvm.arm.neon.vqdmulh.v4i32(<4 x i32> %a, <4 x i32> %vecinit3.i) #5
  ret <4 x i32> %vqdmulhq_v5.i
}

define <4 x i32> @test_vqdmull_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqdmull_s16:
; CHECK: sqdmull.4s v0, v0, v1
  %vqdmull_v2.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i32> %vqdmull_v2.i
}

define <2 x i64> @test_vqdmull_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqdmull_s32:
; CHECK: sqdmull.2d v0, v0, v1
  %vqdmull_v2.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i64> %vqdmull_v2.i
}

define <4 x i32> @test_vqdmull_lane_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqdmull_lane_s16:
; CHECK: sqdmull.4s v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vqdmull_v2.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %a, <4 x i16> %shuffle) #5
  ret <4 x i32> %vqdmull_v2.i
}

define <2 x i64> @test_vqdmull_lane_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqdmull_lane_s32:
; CHECK: sqdmull.2d v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vqdmull_v2.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %a, <2 x i32> %shuffle) #5
  ret <2 x i64> %vqdmull_v2.i
}

define <4 x i32> @test_vqdmull_n_s16(<4 x i16> %a, i16 signext %b) #0 {
; CHECK-LABEL: test_vqdmull_n_s16:
; CHECK: dup.4h v1, w0
; CHECK: sqdmull.4s v0, v0, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %b, i32 3
  %vqdmull_v5.i = tail call <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16> %a, <4 x i16> %vecinit3.i) #5
  ret <4 x i32> %vqdmull_v5.i
}

define <2 x i64> @test_vqdmull_n_s32(<2 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vqdmull_n_s32:
; CHECK: dup.2s v1, w0
; CHECK: sqdmull.2d v0, v0, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %b, i32 1
  %vqdmull_v3.i = tail call <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32> %a, <2 x i32> %vecinit1.i) #5
  ret <2 x i64> %vqdmull_v3.i
}

define <8 x i8> @test_vqmovn_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqmovn_s16:
; CHECK: sqxtn.8b v0, v0
  %vqmovn_v1.i = tail call <8 x i8> @llvm.arm.neon.vqmovns.v8i8(<8 x i16> %a) #5
  ret <8 x i8> %vqmovn_v1.i
}

define <4 x i16> @test_vqmovn_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqmovn_s32:
; CHECK: sqxtn.4h v0, v0
  %vqmovn_v1.i = tail call <4 x i16> @llvm.arm.neon.vqmovns.v4i16(<4 x i32> %a) #5
  ret <4 x i16> %vqmovn_v1.i
}

define <2 x i32> @test_vqmovn_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqmovn_s64:
; CHECK: sqxtn.2s v0, v0
  %vqmovn_v1.i = tail call <2 x i32> @llvm.arm.neon.vqmovns.v2i32(<2 x i64> %a) #5
  ret <2 x i32> %vqmovn_v1.i
}

define <8 x i8> @test_vqmovn_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqmovn_u16:
; CHECK: uqxtn.8b v0, v0
  %vqmovn_v1.i = tail call <8 x i8> @llvm.arm.neon.vqmovnu.v8i8(<8 x i16> %a) #5
  ret <8 x i8> %vqmovn_v1.i
}

define <4 x i16> @test_vqmovn_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqmovn_u32:
; CHECK: uqxtn.4h v0, v0
  %vqmovn_v1.i = tail call <4 x i16> @llvm.arm.neon.vqmovnu.v4i16(<4 x i32> %a) #5
  ret <4 x i16> %vqmovn_v1.i
}

define <2 x i32> @test_vqmovn_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqmovn_u64:
; CHECK: uqxtn.2s v0, v0
  %vqmovn_v1.i = tail call <2 x i32> @llvm.arm.neon.vqmovnu.v2i32(<2 x i64> %a) #5
  ret <2 x i32> %vqmovn_v1.i
}

define <8 x i8> @test_vqmovun_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqmovun_s16:
; CHECK: sqxtun.8b v0, v0
  %vqmovun_v1.i = tail call <8 x i8> @llvm.arm.neon.vqmovnsu.v8i8(<8 x i16> %a) #5
  ret <8 x i8> %vqmovun_v1.i
}

define <4 x i16> @test_vqmovun_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqmovun_s32:
; CHECK: sqxtun.4h v0, v0
  %vqmovun_v1.i = tail call <4 x i16> @llvm.arm.neon.vqmovnsu.v4i16(<4 x i32> %a) #5
  ret <4 x i16> %vqmovun_v1.i
}

define <2 x i32> @test_vqmovun_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqmovun_s64:
; CHECK: sqxtun.2s v0, v0
  %vqmovun_v1.i = tail call <2 x i32> @llvm.arm.neon.vqmovnsu.v2i32(<2 x i64> %a) #5
  ret <2 x i32> %vqmovun_v1.i
}

define <8 x i8> @test_vqneg_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vqneg_s8:
; CHECK: sqneg.8b v0, v0
  %vqneg_v.i = tail call <8 x i8> @llvm.arm.neon.vqneg.v8i8(<8 x i8> %a) #5
  ret <8 x i8> %vqneg_v.i
}

define <4 x i16> @test_vqneg_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vqneg_s16:
; CHECK: sqneg.4h v0, v0
  %vqneg_v1.i = tail call <4 x i16> @llvm.arm.neon.vqneg.v4i16(<4 x i16> %a) #5
  ret <4 x i16> %vqneg_v1.i
}

define <2 x i32> @test_vqneg_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vqneg_s32:
; CHECK: sqneg.2s v0, v0
  %vqneg_v1.i = tail call <2 x i32> @llvm.arm.neon.vqneg.v2i32(<2 x i32> %a) #5
  ret <2 x i32> %vqneg_v1.i
}

define <16 x i8> @test_vqnegq_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vqnegq_s8:
; CHECK: sqneg.16b v0, v0
  %vqnegq_v.i = tail call <16 x i8> @llvm.arm.neon.vqneg.v16i8(<16 x i8> %a) #5
  ret <16 x i8> %vqnegq_v.i
}

define <8 x i16> @test_vqnegq_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqnegq_s16:
; CHECK: sqneg.8h v0, v0
  %vqnegq_v1.i = tail call <8 x i16> @llvm.arm.neon.vqneg.v8i16(<8 x i16> %a) #5
  ret <8 x i16> %vqnegq_v1.i
}

define <4 x i32> @test_vqnegq_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqnegq_s32:
; CHECK: sqneg.4s v0, v0
  %vqnegq_v1.i = tail call <4 x i32> @llvm.arm.neon.vqneg.v4i32(<4 x i32> %a) #5
  ret <4 x i32> %vqnegq_v1.i
}

define <4 x i16> @test_vqrdmulh_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqrdmulh_s16:
; CHECK: sqrdmulh.4h v0, v0, v1
  %vqrdmulh_v2.i = tail call <4 x i16> @llvm.arm.neon.vqrdmulh.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqrdmulh_v2.i
}

define <2 x i32> @test_vqrdmulh_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqrdmulh_s32:
; CHECK: sqrdmulh.2s v0, v0, v1
  %vqrdmulh_v2.i = tail call <2 x i32> @llvm.arm.neon.vqrdmulh.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqrdmulh_v2.i
}

define <8 x i16> @test_vqrdmulhq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqrdmulhq_s16:
; CHECK: sqrdmulh.8h v0, v0, v1
  %vqrdmulhq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqrdmulh.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqrdmulhq_v2.i
}

define <4 x i32> @test_vqrdmulhq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqrdmulhq_s32:
; CHECK: sqrdmulh.4s v0, v0, v1
  %vqrdmulhq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqrdmulh.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqrdmulhq_v2.i
}

define <4 x i16> @test_vqrdmulh_lane_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqrdmulh_lane_s16:
; CHECK: sqrdmulh.4h v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %vqrdmulh_v2.i = tail call <4 x i16> @llvm.arm.neon.vqrdmulh.v4i16(<4 x i16> %a, <4 x i16> %shuffle) #5
  ret <4 x i16> %vqrdmulh_v2.i
}

define <2 x i32> @test_vqrdmulh_lane_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqrdmulh_lane_s32:
; CHECK: sqrdmulh.2s v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <2 x i32> <i32 1, i32 1>
  %vqrdmulh_v2.i = tail call <2 x i32> @llvm.arm.neon.vqrdmulh.v2i32(<2 x i32> %a, <2 x i32> %shuffle) #5
  ret <2 x i32> %vqrdmulh_v2.i
}

define <8 x i16> @test_vqrdmulhq_lane_s16(<8 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqrdmulhq_lane_s16:
; CHECK: sqrdmulh.8h v0, v0, v1[3]
  %shuffle = shufflevector <4 x i16> %b, <4 x i16> undef, <8 x i32> <i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3>
  %vqrdmulhq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqrdmulh.v8i16(<8 x i16> %a, <8 x i16> %shuffle) #5
  ret <8 x i16> %vqrdmulhq_v2.i
}

define <4 x i32> @test_vqrdmulhq_lane_s32(<4 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqrdmulhq_lane_s32:
; CHECK: sqrdmulh.4s v0, v0, v1[1]
  %shuffle = shufflevector <2 x i32> %b, <2 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %vqrdmulhq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqrdmulh.v4i32(<4 x i32> %a, <4 x i32> %shuffle) #5
  ret <4 x i32> %vqrdmulhq_v2.i
}

define <4 x i16> @test_vqrdmulh_n_s16(<4 x i16> %a, i16 signext %b) #0 {
; CHECK-LABEL: test_vqrdmulh_n_s16:
; CHECK: dup.4h v1, w0
; CHECK: sqrdmulh.4h v0, v0, v1
  %vecinit.i = insertelement <4 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <4 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <4 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <4 x i16> %vecinit2.i, i16 %b, i32 3
  %vqrdmulh_v5.i = tail call <4 x i16> @llvm.arm.neon.vqrdmulh.v4i16(<4 x i16> %a, <4 x i16> %vecinit3.i) #5
  ret <4 x i16> %vqrdmulh_v5.i
}

define <2 x i32> @test_vqrdmulh_n_s32(<2 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vqrdmulh_n_s32:
; CHECK: dup.2s v1, w0
; CHECK: sqrdmulh.2s v0, v0, v1
  %vecinit.i = insertelement <2 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <2 x i32> %vecinit.i, i32 %b, i32 1
  %vqrdmulh_v3.i = tail call <2 x i32> @llvm.arm.neon.vqrdmulh.v2i32(<2 x i32> %a, <2 x i32> %vecinit1.i) #5
  ret <2 x i32> %vqrdmulh_v3.i
}

define <8 x i16> @test_vqrdmulhq_n_s16(<8 x i16> %a, i16 signext %b) #0 {
; CHECK-LABEL: test_vqrdmulhq_n_s16:
; CHECK: dup.8h v1, w0
; CHECK: sqrdmulh.8h v0, v0, v1
  %vecinit.i = insertelement <8 x i16> undef, i16 %b, i32 0
  %vecinit1.i = insertelement <8 x i16> %vecinit.i, i16 %b, i32 1
  %vecinit2.i = insertelement <8 x i16> %vecinit1.i, i16 %b, i32 2
  %vecinit3.i = insertelement <8 x i16> %vecinit2.i, i16 %b, i32 3
  %vecinit4.i = insertelement <8 x i16> %vecinit3.i, i16 %b, i32 4
  %vecinit5.i = insertelement <8 x i16> %vecinit4.i, i16 %b, i32 5
  %vecinit6.i = insertelement <8 x i16> %vecinit5.i, i16 %b, i32 6
  %vecinit7.i = insertelement <8 x i16> %vecinit6.i, i16 %b, i32 7
  %vqrdmulhq_v9.i = tail call <8 x i16> @llvm.arm.neon.vqrdmulh.v8i16(<8 x i16> %a, <8 x i16> %vecinit7.i) #5
  ret <8 x i16> %vqrdmulhq_v9.i
}

define <4 x i32> @test_vqrdmulhq_n_s32(<4 x i32> %a, i32 %b) #0 {
; CHECK-LABEL: test_vqrdmulhq_n_s32:
; CHECK: dup.4s v1, w0
; CHECK: sqrdmulh.4s v0, v0, v1
  %vecinit.i = insertelement <4 x i32> undef, i32 %b, i32 0
  %vecinit1.i = insertelement <4 x i32> %vecinit.i, i32 %b, i32 1
  %vecinit2.i = insertelement <4 x i32> %vecinit1.i, i32 %b, i32 2
  %vecinit3.i = insertelement <4 x i32> %vecinit2.i, i32 %b, i32 3
  %vqrdmulhq_v5.i = tail call <4 x i32> @llvm.arm.neon.vqrdmulh.v4i32(<4 x i32> %a, <4 x i32> %vecinit3.i) #5
  ret <4 x i32> %vqrdmulhq_v5.i
}

define <8 x i8> @test_vqrshl_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vqrshl_s8:
; CHECK: sqrshl.8b v0, v0, v1
  %vqrshl_v.i = tail call <8 x i8> @llvm.arm.neon.vqrshifts.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vqrshl_v.i
}

define <4 x i16> @test_vqrshl_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqrshl_s16:
; CHECK: sqrshl.4h v0, v0, v1
  %vqrshl_v2.i = tail call <4 x i16> @llvm.arm.neon.vqrshifts.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqrshl_v2.i
}

define <2 x i32> @test_vqrshl_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqrshl_s32:
; CHECK: sqrshl.2s v0, v0, v1
  %vqrshl_v2.i = tail call <2 x i32> @llvm.arm.neon.vqrshifts.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqrshl_v2.i
}

define <1 x i64> @test_vqrshl_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vqrshl_s64:
; CHECK: sqrshl d0, d0, d1
  %vqrshl_v2.i = tail call <1 x i64> @llvm.arm.neon.vqrshifts.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vqrshl_v2.i
}

define <8 x i8> @test_vqrshl_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vqrshl_u8:
; CHECK: uqrshl.8b v0, v0, v1
  %vqrshl_v.i = tail call <8 x i8> @llvm.arm.neon.vqrshiftu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vqrshl_v.i
}

define <4 x i16> @test_vqrshl_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqrshl_u16:
; CHECK: uqrshl.4h v0, v0, v1
  %vqrshl_v2.i = tail call <4 x i16> @llvm.arm.neon.vqrshiftu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqrshl_v2.i
}

define <2 x i32> @test_vqrshl_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqrshl_u32:
; CHECK: uqrshl.2s v0, v0, v1
  %vqrshl_v2.i = tail call <2 x i32> @llvm.arm.neon.vqrshiftu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqrshl_v2.i
}

define <1 x i64> @test_vqrshl_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vqrshl_u64:
; CHECK: uqrshl d0, d0, d1
  %vqrshl_v2.i = tail call <1 x i64> @llvm.arm.neon.vqrshiftu.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vqrshl_v2.i
}

define <16 x i8> @test_vqrshlq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vqrshlq_s8:
; CHECK: sqrshl.16b v0, v0, v1
  %vqrshlq_v.i = tail call <16 x i8> @llvm.arm.neon.vqrshifts.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vqrshlq_v.i
}

define <8 x i16> @test_vqrshlq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqrshlq_s16:
; CHECK: sqrshl.8h v0, v0, v1
  %vqrshlq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqrshifts.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqrshlq_v2.i
}

define <4 x i32> @test_vqrshlq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqrshlq_s32:
; CHECK: sqrshl.4s v0, v0, v1
  %vqrshlq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqrshifts.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqrshlq_v2.i
}

define <2 x i64> @test_vqrshlq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vqrshlq_s64:
; CHECK: sqrshl.2d v0, v0, v1
  %vqrshlq_v2.i = tail call <2 x i64> @llvm.arm.neon.vqrshifts.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vqrshlq_v2.i
}

define <16 x i8> @test_vqrshlq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vqrshlq_u8:
; CHECK: uqrshl.16b v0, v0, v1
  %vqrshlq_v.i = tail call <16 x i8> @llvm.arm.neon.vqrshiftu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vqrshlq_v.i
}

define <8 x i16> @test_vqrshlq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqrshlq_u16:
; CHECK: uqrshl.8h v0, v0, v1
  %vqrshlq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqrshiftu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqrshlq_v2.i
}

define <4 x i32> @test_vqrshlq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqrshlq_u32:
; CHECK: uqrshl.4s v0, v0, v1
  %vqrshlq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqrshiftu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqrshlq_v2.i
}

define <2 x i64> @test_vqrshlq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vqrshlq_u64:
; CHECK: uqrshl.2d v0, v0, v1
  %vqrshlq_v2.i = tail call <2 x i64> @llvm.arm.neon.vqrshiftu.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vqrshlq_v2.i
}

define <8 x i8> @test_vqrshrn_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqrshrn_n_s16:
; CHECK: sqrshrn.8b v0, v0, #1
  %vqrshrn_n1 = tail call <8 x i8> @llvm.arm.neon.vqrshiftns.v8i8(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i8> %vqrshrn_n1
}

declare <8 x i8> @llvm.arm.neon.vqrshiftns.v8i8(<8 x i16>, <8 x i16>) #1

define <4 x i16> @test_vqrshrn_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqrshrn_n_s32:
; CHECK: sqrshrn.4h v0, v0, #1
  %vqrshrn_n1 = tail call <4 x i16> @llvm.arm.neon.vqrshiftns.v4i16(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i16> %vqrshrn_n1
}

declare <4 x i16> @llvm.arm.neon.vqrshiftns.v4i16(<4 x i32>, <4 x i32>) #1

define <2 x i32> @test_vqrshrn_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqrshrn_n_s64:
; CHECK: sqrshrn.2s v0, v0, #1
  %vqrshrn_n1 = tail call <2 x i32> @llvm.arm.neon.vqrshiftns.v2i32(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i32> %vqrshrn_n1
}

declare <2 x i32> @llvm.arm.neon.vqrshiftns.v2i32(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vqrshrn_n_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqrshrn_n_u16:
; CHECK: uqrshrn.8b v0, v0, #1
  %vqrshrn_n1 = tail call <8 x i8> @llvm.arm.neon.vqrshiftnu.v8i8(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i8> %vqrshrn_n1
}

declare <8 x i8> @llvm.arm.neon.vqrshiftnu.v8i8(<8 x i16>, <8 x i16>) #1

define <4 x i16> @test_vqrshrn_n_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqrshrn_n_u32:
; CHECK: uqrshrn.4h v0, v0, #1
  %vqrshrn_n1 = tail call <4 x i16> @llvm.arm.neon.vqrshiftnu.v4i16(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i16> %vqrshrn_n1
}

declare <4 x i16> @llvm.arm.neon.vqrshiftnu.v4i16(<4 x i32>, <4 x i32>) #1

define <2 x i32> @test_vqrshrn_n_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqrshrn_n_u64:
; CHECK: uqrshrn.2s v0, v0, #1
  %vqrshrn_n1 = tail call <2 x i32> @llvm.arm.neon.vqrshiftnu.v2i32(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i32> %vqrshrn_n1
}

declare <2 x i32> @llvm.arm.neon.vqrshiftnu.v2i32(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vqrshrun_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqrshrun_n_s16:
; CHECK: sqrshrun.8b v0, v0, #1
  %vqrshrun_n1 = tail call <8 x i8> @llvm.arm.neon.vqrshiftnsu.v8i8(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i8> %vqrshrun_n1
}

declare <8 x i8> @llvm.arm.neon.vqrshiftnsu.v8i8(<8 x i16>, <8 x i16>) #1

define <4 x i16> @test_vqrshrun_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqrshrun_n_s32:
; CHECK: sqrshrun.4h v0, v0, #1
  %vqrshrun_n1 = tail call <4 x i16> @llvm.arm.neon.vqrshiftnsu.v4i16(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i16> %vqrshrun_n1
}

declare <4 x i16> @llvm.arm.neon.vqrshiftnsu.v4i16(<4 x i32>, <4 x i32>) #1

define <2 x i32> @test_vqrshrun_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqrshrun_n_s64:
; CHECK: sqrshrun.2s v0, v0, #1
  %vqrshrun_n1 = tail call <2 x i32> @llvm.arm.neon.vqrshiftnsu.v2i32(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i32> %vqrshrun_n1
}

declare <2 x i32> @llvm.arm.neon.vqrshiftnsu.v2i32(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vqshl_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vqshl_s8:
; CHECK: sqshl.8b v0, v0, v1
  %vqshl_v.i = tail call <8 x i8> @llvm.arm.neon.vqshifts.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vqshl_v.i
}

define <4 x i16> @test_vqshl_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqshl_s16:
; CHECK: sqshl.4h v0, v0, v1
  %vqshl_v2.i = tail call <4 x i16> @llvm.arm.neon.vqshifts.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqshl_v2.i
}

define <2 x i32> @test_vqshl_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqshl_s32:
; CHECK: sqshl.2s v0, v0, v1
  %vqshl_v2.i = tail call <2 x i32> @llvm.arm.neon.vqshifts.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqshl_v2.i
}

define <1 x i64> @test_vqshl_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vqshl_s64:
; CHECK: sqshl d0, d0, d1
  %vqshl_v2.i = tail call <1 x i64> @llvm.arm.neon.vqshifts.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vqshl_v2.i
}

define <8 x i8> @test_vqshl_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vqshl_u8:
; CHECK: uqshl.8b v0, v0, v1
  %vqshl_v.i = tail call <8 x i8> @llvm.arm.neon.vqshiftu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vqshl_v.i
}

define <4 x i16> @test_vqshl_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqshl_u16:
; CHECK: uqshl.4h v0, v0, v1
  %vqshl_v2.i = tail call <4 x i16> @llvm.arm.neon.vqshiftu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqshl_v2.i
}

define <2 x i32> @test_vqshl_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqshl_u32:
; CHECK: uqshl.2s v0, v0, v1
  %vqshl_v2.i = tail call <2 x i32> @llvm.arm.neon.vqshiftu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqshl_v2.i
}

define <1 x i64> @test_vqshl_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vqshl_u64:
; CHECK: uqshl d0, d0, d1
  %vqshl_v2.i = tail call <1 x i64> @llvm.arm.neon.vqshiftu.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vqshl_v2.i
}

define <16 x i8> @test_vqshlq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vqshlq_s8:
; CHECK: sqshl.16b v0, v0, v1
  %vqshlq_v.i = tail call <16 x i8> @llvm.arm.neon.vqshifts.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vqshlq_v.i
}

define <8 x i16> @test_vqshlq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqshlq_s16:
; CHECK: sqshl.8h v0, v0, v1
  %vqshlq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqshifts.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqshlq_v2.i
}

define <4 x i32> @test_vqshlq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqshlq_s32:
; CHECK: sqshl.4s v0, v0, v1
  %vqshlq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqshifts.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqshlq_v2.i
}

define <2 x i64> @test_vqshlq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vqshlq_s64:
; CHECK: sqshl.2d v0, v0, v1
  %vqshlq_v2.i = tail call <2 x i64> @llvm.arm.neon.vqshifts.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vqshlq_v2.i
}

define <16 x i8> @test_vqshlq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vqshlq_u8:
; CHECK: uqshl.16b v0, v0, v1
  %vqshlq_v.i = tail call <16 x i8> @llvm.arm.neon.vqshiftu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vqshlq_v.i
}

define <8 x i16> @test_vqshlq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqshlq_u16:
; CHECK: uqshl.8h v0, v0, v1
  %vqshlq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqshiftu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqshlq_v2.i
}

define <4 x i32> @test_vqshlq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqshlq_u32:
; CHECK: uqshl.4s v0, v0, v1
  %vqshlq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqshiftu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqshlq_v2.i
}

define <2 x i64> @test_vqshlq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vqshlq_u64:
; CHECK: uqshl.2d v0, v0, v1
  %vqshlq_v2.i = tail call <2 x i64> @llvm.arm.neon.vqshiftu.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vqshlq_v2.i
}

define <8 x i8> @test_vqshlu_n_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vqshlu_n_s8:
; CHECK: sqshlu.8b v0, v0, #1
  %vqshlu_n = tail call <8 x i8> @llvm.arm.neon.vqshiftsu.v8i8(<8 x i8> %a, <8 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <8 x i8> %vqshlu_n
}

declare <8 x i8> @llvm.arm.neon.vqshiftsu.v8i8(<8 x i8>, <8 x i8>) #1

define <4 x i16> @test_vqshlu_n_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vqshlu_n_s16:
; CHECK: sqshlu.4h v0, v0, #1
  %vqshlu_n1 = tail call <4 x i16> @llvm.arm.neon.vqshiftsu.v4i16(<4 x i16> %a, <4 x i16> <i16 1, i16 1, i16 1, i16 1>)
  ret <4 x i16> %vqshlu_n1
}

declare <4 x i16> @llvm.arm.neon.vqshiftsu.v4i16(<4 x i16>, <4 x i16>) #1

define <2 x i32> @test_vqshlu_n_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vqshlu_n_s32:
; CHECK: sqshlu.2s v0, v0, #1
  %vqshlu_n1 = tail call <2 x i32> @llvm.arm.neon.vqshiftsu.v2i32(<2 x i32> %a, <2 x i32> <i32 1, i32 1>)
  ret <2 x i32> %vqshlu_n1
}

declare <2 x i32> @llvm.arm.neon.vqshiftsu.v2i32(<2 x i32>, <2 x i32>) #1

define <1 x i64> @test_vqshlu_n_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vqshlu_n_s64:
; CHECK: sqshlu d0, d0, #1
  %vqshlu_n1 = tail call <1 x i64> @llvm.arm.neon.vqshiftsu.v1i64(<1 x i64> %a, <1 x i64> <i64 1>)
  ret <1 x i64> %vqshlu_n1
}

declare <1 x i64> @llvm.arm.neon.vqshiftsu.v1i64(<1 x i64>, <1 x i64>) #1

define <16 x i8> @test_vqshluq_n_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vqshluq_n_s8:
; CHECK: sqshlu.16b v0, v0, #1
  %vqshlu_n = tail call <16 x i8> @llvm.arm.neon.vqshiftsu.v16i8(<16 x i8> %a, <16 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <16 x i8> %vqshlu_n
}

declare <16 x i8> @llvm.arm.neon.vqshiftsu.v16i8(<16 x i8>, <16 x i8>) #1

define <8 x i16> @test_vqshluq_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqshluq_n_s16:
; CHECK: sqshlu.8h v0, v0, #1
  %vqshlu_n1 = tail call <8 x i16> @llvm.arm.neon.vqshiftsu.v8i16(<8 x i16> %a, <8 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>)
  ret <8 x i16> %vqshlu_n1
}

declare <8 x i16> @llvm.arm.neon.vqshiftsu.v8i16(<8 x i16>, <8 x i16>) #1

define <4 x i32> @test_vqshluq_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqshluq_n_s32:
; CHECK: sqshlu.4s v0, v0, #1
  %vqshlu_n1 = tail call <4 x i32> @llvm.arm.neon.vqshiftsu.v4i32(<4 x i32> %a, <4 x i32> <i32 1, i32 1, i32 1, i32 1>)
  ret <4 x i32> %vqshlu_n1
}

declare <4 x i32> @llvm.arm.neon.vqshiftsu.v4i32(<4 x i32>, <4 x i32>) #1

define <2 x i64> @test_vqshluq_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqshluq_n_s64:
; CHECK: sqshlu.2d v0, v0, #1
  %vqshlu_n1 = tail call <2 x i64> @llvm.arm.neon.vqshiftsu.v2i64(<2 x i64> %a, <2 x i64> <i64 1, i64 1>)
  ret <2 x i64> %vqshlu_n1
}

declare <2 x i64> @llvm.arm.neon.vqshiftsu.v2i64(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vqshl_n_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vqshl_n_s8:
; CHECK: sqshl.8b v0, v0, #1
  %vqshl_n = tail call <8 x i8> @llvm.arm.neon.vqshifts.v8i8(<8 x i8> %a, <8 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <8 x i8> %vqshl_n
}

declare <8 x i8> @llvm.arm.neon.vqshifts.v8i8(<8 x i8>, <8 x i8>) #1

define <4 x i16> @test_vqshl_n_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vqshl_n_s16:
; CHECK: sqshl.4h v0, v0, #1
  %vqshl_n1 = tail call <4 x i16> @llvm.arm.neon.vqshifts.v4i16(<4 x i16> %a, <4 x i16> <i16 1, i16 1, i16 1, i16 1>)
  ret <4 x i16> %vqshl_n1
}

declare <4 x i16> @llvm.arm.neon.vqshifts.v4i16(<4 x i16>, <4 x i16>) #1

define <2 x i32> @test_vqshl_n_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vqshl_n_s32:
; CHECK: sqshl.2s v0, v0, #1
  %vqshl_n1 = tail call <2 x i32> @llvm.arm.neon.vqshifts.v2i32(<2 x i32> %a, <2 x i32> <i32 1, i32 1>)
  ret <2 x i32> %vqshl_n1
}

declare <2 x i32> @llvm.arm.neon.vqshifts.v2i32(<2 x i32>, <2 x i32>) #1

define <1 x i64> @test_vqshl_n_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vqshl_n_s64:
; CHECK: sqshl d0, d0, #1
  %vqshl_n1 = tail call <1 x i64> @llvm.arm.neon.vqshifts.v1i64(<1 x i64> %a, <1 x i64> <i64 1>)
  ret <1 x i64> %vqshl_n1
}

declare <1 x i64> @llvm.arm.neon.vqshifts.v1i64(<1 x i64>, <1 x i64>) #1

define <8 x i8> @test_vqshl_n_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vqshl_n_u8:
; CHECK: uqshl.8b v0, v0, #1
  %vqshl_n = tail call <8 x i8> @llvm.arm.neon.vqshiftu.v8i8(<8 x i8> %a, <8 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <8 x i8> %vqshl_n
}

declare <8 x i8> @llvm.arm.neon.vqshiftu.v8i8(<8 x i8>, <8 x i8>) #1

define <4 x i16> @test_vqshl_n_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vqshl_n_u16:
; CHECK: uqshl.4h v0, v0, #1
  %vqshl_n1 = tail call <4 x i16> @llvm.arm.neon.vqshiftu.v4i16(<4 x i16> %a, <4 x i16> <i16 1, i16 1, i16 1, i16 1>)
  ret <4 x i16> %vqshl_n1
}

declare <4 x i16> @llvm.arm.neon.vqshiftu.v4i16(<4 x i16>, <4 x i16>) #1

define <2 x i32> @test_vqshl_n_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vqshl_n_u32:
; CHECK: uqshl.2s v0, v0, #1
  %vqshl_n1 = tail call <2 x i32> @llvm.arm.neon.vqshiftu.v2i32(<2 x i32> %a, <2 x i32> <i32 1, i32 1>)
  ret <2 x i32> %vqshl_n1
}

declare <2 x i32> @llvm.arm.neon.vqshiftu.v2i32(<2 x i32>, <2 x i32>) #1

define <1 x i64> @test_vqshl_n_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vqshl_n_u64:
; CHECK: uqshl d0, d0, #1
  %vqshl_n1 = tail call <1 x i64> @llvm.arm.neon.vqshiftu.v1i64(<1 x i64> %a, <1 x i64> <i64 1>)
  ret <1 x i64> %vqshl_n1
}

declare <1 x i64> @llvm.arm.neon.vqshiftu.v1i64(<1 x i64>, <1 x i64>) #1

define <16 x i8> @test_vqshlq_n_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vqshlq_n_s8:
; CHECK: sqshl.16b v0, v0, #1
  %vqshl_n = tail call <16 x i8> @llvm.arm.neon.vqshifts.v16i8(<16 x i8> %a, <16 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <16 x i8> %vqshl_n
}

declare <16 x i8> @llvm.arm.neon.vqshifts.v16i8(<16 x i8>, <16 x i8>) #1

define <8 x i16> @test_vqshlq_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqshlq_n_s16:
; CHECK: sqshl.8h v0, v0, #1
  %vqshl_n1 = tail call <8 x i16> @llvm.arm.neon.vqshifts.v8i16(<8 x i16> %a, <8 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>)
  ret <8 x i16> %vqshl_n1
}

declare <8 x i16> @llvm.arm.neon.vqshifts.v8i16(<8 x i16>, <8 x i16>) #1

define <4 x i32> @test_vqshlq_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqshlq_n_s32:
; CHECK: sqshl.4s v0, v0, #1
  %vqshl_n1 = tail call <4 x i32> @llvm.arm.neon.vqshifts.v4i32(<4 x i32> %a, <4 x i32> <i32 1, i32 1, i32 1, i32 1>)
  ret <4 x i32> %vqshl_n1
}

declare <4 x i32> @llvm.arm.neon.vqshifts.v4i32(<4 x i32>, <4 x i32>) #1

define <2 x i64> @test_vqshlq_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqshlq_n_s64:
; CHECK: sqshl.2d v0, v0, #1
  %vqshl_n1 = tail call <2 x i64> @llvm.arm.neon.vqshifts.v2i64(<2 x i64> %a, <2 x i64> <i64 1, i64 1>)
  ret <2 x i64> %vqshl_n1
}

declare <2 x i64> @llvm.arm.neon.vqshifts.v2i64(<2 x i64>, <2 x i64>) #1

define <16 x i8> @test_vqshlq_n_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vqshlq_n_u8:
; CHECK: uqshl.16b v0, v0, #1
  %vqshl_n = tail call <16 x i8> @llvm.arm.neon.vqshiftu.v16i8(<16 x i8> %a, <16 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <16 x i8> %vqshl_n
}

declare <16 x i8> @llvm.arm.neon.vqshiftu.v16i8(<16 x i8>, <16 x i8>) #1

define <8 x i16> @test_vqshlq_n_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqshlq_n_u16:
; CHECK: uqshl.8h v0, v0, #1
  %vqshl_n1 = tail call <8 x i16> @llvm.arm.neon.vqshiftu.v8i16(<8 x i16> %a, <8 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>)
  ret <8 x i16> %vqshl_n1
}

declare <8 x i16> @llvm.arm.neon.vqshiftu.v8i16(<8 x i16>, <8 x i16>) #1

define <4 x i32> @test_vqshlq_n_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqshlq_n_u32:
; CHECK: uqshl.4s v0, v0, #1
  %vqshl_n1 = tail call <4 x i32> @llvm.arm.neon.vqshiftu.v4i32(<4 x i32> %a, <4 x i32> <i32 1, i32 1, i32 1, i32 1>)
  ret <4 x i32> %vqshl_n1
}

declare <4 x i32> @llvm.arm.neon.vqshiftu.v4i32(<4 x i32>, <4 x i32>) #1

define <2 x i64> @test_vqshlq_n_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqshlq_n_u64:
; CHECK: uqshl.2d v0, v0, #1
  %vqshl_n1 = tail call <2 x i64> @llvm.arm.neon.vqshiftu.v2i64(<2 x i64> %a, <2 x i64> <i64 1, i64 1>)
  ret <2 x i64> %vqshl_n1
}

declare <2 x i64> @llvm.arm.neon.vqshiftu.v2i64(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vqshrn_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqshrn_n_s16:
; CHECK: sqshrn.8b v0, v0, #1
  %vqshrn_n1 = tail call <8 x i8> @llvm.arm.neon.vqshiftns.v8i8(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i8> %vqshrn_n1
}

declare <8 x i8> @llvm.arm.neon.vqshiftns.v8i8(<8 x i16>, <8 x i16>) #1

define <4 x i16> @test_vqshrn_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqshrn_n_s32:
; CHECK: sqshrn.4h v0, v0, #1
  %vqshrn_n1 = tail call <4 x i16> @llvm.arm.neon.vqshiftns.v4i16(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i16> %vqshrn_n1
}

declare <4 x i16> @llvm.arm.neon.vqshiftns.v4i16(<4 x i32>, <4 x i32>) #1

define <2 x i32> @test_vqshrn_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqshrn_n_s64:
; CHECK: sqshrn.2s v0, v0, #1
  %vqshrn_n1 = tail call <2 x i32> @llvm.arm.neon.vqshiftns.v2i32(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i32> %vqshrn_n1
}

declare <2 x i32> @llvm.arm.neon.vqshiftns.v2i32(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vqshrn_n_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqshrn_n_u16:
; CHECK: uqshrn.8b v0, v0, #1
  %vqshrn_n1 = tail call <8 x i8> @llvm.arm.neon.vqshiftnu.v8i8(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i8> %vqshrn_n1
}

declare <8 x i8> @llvm.arm.neon.vqshiftnu.v8i8(<8 x i16>, <8 x i16>) #1

define <4 x i16> @test_vqshrn_n_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqshrn_n_u32:
; CHECK: uqshrn.4h v0, v0, #1
  %vqshrn_n1 = tail call <4 x i16> @llvm.arm.neon.vqshiftnu.v4i16(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i16> %vqshrn_n1
}

declare <4 x i16> @llvm.arm.neon.vqshiftnu.v4i16(<4 x i32>, <4 x i32>) #1

define <2 x i32> @test_vqshrn_n_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqshrn_n_u64:
; CHECK: uqshrn.2s v0, v0, #1
  %vqshrn_n1 = tail call <2 x i32> @llvm.arm.neon.vqshiftnu.v2i32(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i32> %vqshrn_n1
}

declare <2 x i32> @llvm.arm.neon.vqshiftnu.v2i32(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vqshrun_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vqshrun_n_s16:
; CHECK: sqshrun.8b v0, v0, #1
  %vqshrun_n1 = tail call <8 x i8> @llvm.arm.neon.vqshiftnsu.v8i8(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i8> %vqshrun_n1
}

declare <8 x i8> @llvm.arm.neon.vqshiftnsu.v8i8(<8 x i16>, <8 x i16>) #1

define <4 x i16> @test_vqshrun_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vqshrun_n_s32:
; CHECK: sqshrun.4h v0, v0, #1
  %vqshrun_n1 = tail call <4 x i16> @llvm.arm.neon.vqshiftnsu.v4i16(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i16> %vqshrun_n1
}

declare <4 x i16> @llvm.arm.neon.vqshiftnsu.v4i16(<4 x i32>, <4 x i32>) #1

define <2 x i32> @test_vqshrun_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vqshrun_n_s64:
; CHECK: sqshrun.2s v0, v0, #1
  %vqshrun_n1 = tail call <2 x i32> @llvm.arm.neon.vqshiftnsu.v2i32(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i32> %vqshrun_n1
}

declare <2 x i32> @llvm.arm.neon.vqshiftnsu.v2i32(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vqsub_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vqsub_s8:
; CHECK: sqsub.8b v0, v0, v1
  %vqsub_v.i = tail call <8 x i8> @llvm.arm.neon.vqsubs.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vqsub_v.i
}

define <4 x i16> @test_vqsub_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqsub_s16:
; CHECK: sqsub.4h v0, v0, v1
  %vqsub_v2.i = tail call <4 x i16> @llvm.arm.neon.vqsubs.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqsub_v2.i
}

define <2 x i32> @test_vqsub_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqsub_s32:
; CHECK: sqsub.2s v0, v0, v1
  %vqsub_v2.i = tail call <2 x i32> @llvm.arm.neon.vqsubs.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqsub_v2.i
}

define <1 x i64> @test_vqsub_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vqsub_s64:
; CHECK: sqsub d0, d0, d1
  %vqsub_v2.i = tail call <1 x i64> @llvm.arm.neon.vqsubs.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vqsub_v2.i
}

define <8 x i8> @test_vqsub_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vqsub_u8:
; CHECK: uqsub.8b v0, v0, v1
  %vqsub_v.i = tail call <8 x i8> @llvm.arm.neon.vqsubu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vqsub_v.i
}

define <4 x i16> @test_vqsub_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vqsub_u16:
; CHECK: uqsub.4h v0, v0, v1
  %vqsub_v2.i = tail call <4 x i16> @llvm.arm.neon.vqsubu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vqsub_v2.i
}

define <2 x i32> @test_vqsub_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vqsub_u32:
; CHECK: uqsub.2s v0, v0, v1
  %vqsub_v2.i = tail call <2 x i32> @llvm.arm.neon.vqsubu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vqsub_v2.i
}

define <1 x i64> @test_vqsub_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vqsub_u64:
; CHECK: uqsub d0, d0, d1
  %vqsub_v2.i = tail call <1 x i64> @llvm.arm.neon.vqsubu.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vqsub_v2.i
}

define <16 x i8> @test_vqsubq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vqsubq_s8:
; CHECK: sqsub.16b v0, v0, v1
  %vqsubq_v.i = tail call <16 x i8> @llvm.arm.neon.vqsubs.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vqsubq_v.i
}

define <8 x i16> @test_vqsubq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqsubq_s16:
; CHECK: sqsub.8h v0, v0, v1
  %vqsubq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqsubs.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqsubq_v2.i
}

define <4 x i32> @test_vqsubq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqsubq_s32:
; CHECK: sqsub.4s v0, v0, v1
  %vqsubq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqsubs.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqsubq_v2.i
}

define <2 x i64> @test_vqsubq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vqsubq_s64:
; CHECK: sqsub.2d v0, v0, v1
  %vqsubq_v2.i = tail call <2 x i64> @llvm.arm.neon.vqsubs.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vqsubq_v2.i
}

define <16 x i8> @test_vqsubq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vqsubq_u8:
; CHECK: uqsub.16b v0, v0, v1
  %vqsubq_v.i = tail call <16 x i8> @llvm.arm.neon.vqsubu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vqsubq_v.i
}

define <8 x i16> @test_vqsubq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vqsubq_u16:
; CHECK: uqsub.8h v0, v0, v1
  %vqsubq_v2.i = tail call <8 x i16> @llvm.arm.neon.vqsubu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vqsubq_v2.i
}

define <4 x i32> @test_vqsubq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vqsubq_u32:
; CHECK: uqsub.4s v0, v0, v1
  %vqsubq_v2.i = tail call <4 x i32> @llvm.arm.neon.vqsubu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vqsubq_v2.i
}

define <2 x i64> @test_vqsubq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vqsubq_u64:
; CHECK: uqsub.2d v0, v0, v1
  %vqsubq_v2.i = tail call <2 x i64> @llvm.arm.neon.vqsubu.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vqsubq_v2.i
}

define <8 x i8> @test_vraddhn_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vraddhn_s16:
; CHECK: raddhn.8b v0, v0, v1
  %vraddhn_v2.i = tail call <8 x i8> @llvm.arm.neon.vraddhn.v8i8(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i8> %vraddhn_v2.i
}

define <4 x i16> @test_vraddhn_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vraddhn_s32:
; CHECK: raddhn.4h v0, v0, v1
  %vraddhn_v2.i = tail call <4 x i16> @llvm.arm.neon.vraddhn.v4i16(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i16> %vraddhn_v2.i
}

define <2 x i32> @test_vraddhn_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vraddhn_s64:
; CHECK: raddhn.2s v0, v0, v1
  %vraddhn_v2.i = tail call <2 x i32> @llvm.arm.neon.vraddhn.v2i32(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i32> %vraddhn_v2.i
}

define <8 x i8> @test_vraddhn_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vraddhn_u16:
; CHECK: raddhn.8b v0, v0, v1
  %vraddhn_v2.i = tail call <8 x i8> @llvm.arm.neon.vraddhn.v8i8(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i8> %vraddhn_v2.i
}

define <4 x i16> @test_vraddhn_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vraddhn_u32:
; CHECK: raddhn.4h v0, v0, v1
  %vraddhn_v2.i = tail call <4 x i16> @llvm.arm.neon.vraddhn.v4i16(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i16> %vraddhn_v2.i
}

define <2 x i32> @test_vraddhn_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vraddhn_u64:
; CHECK: raddhn.2s v0, v0, v1
  %vraddhn_v2.i = tail call <2 x i32> @llvm.arm.neon.vraddhn.v2i32(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i32> %vraddhn_v2.i
}

define <2 x float> @test_vrecpe_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vrecpe_f32:
; CHECK: frecpe.2s v0, v0
  %vrecpe_v1.i = tail call <2 x float> @llvm.arm.neon.vrecpe.v2f32(<2 x float> %a) #5
  ret <2 x float> %vrecpe_v1.i
}

define <2 x i32> @test_vrecpe_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vrecpe_u32:
; CHECK: urecpe.2s v0, v0
  %vrecpe_v1.i = tail call <2 x i32> @llvm.arm.neon.vrecpe.v2i32(<2 x i32> %a) #5
  ret <2 x i32> %vrecpe_v1.i
}

define <4 x float> @test_vrecpeq_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vrecpeq_f32:
; CHECK: frecpe.4s v0, v0
  %vrecpeq_v1.i = tail call <4 x float> @llvm.arm.neon.vrecpe.v4f32(<4 x float> %a) #5
  ret <4 x float> %vrecpeq_v1.i
}

define <4 x i32> @test_vrecpeq_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vrecpeq_u32:
; CHECK: urecpe.4s v0, v0
  %vrecpeq_v1.i = tail call <4 x i32> @llvm.arm.neon.vrecpe.v4i32(<4 x i32> %a) #5
  ret <4 x i32> %vrecpeq_v1.i
}

define <2 x float> @test_vrecps_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vrecps_f32:
; CHECK: frecps.2s v0, v0, v1
  %vrecps_v2.i = tail call <2 x float> @llvm.arm.neon.vrecps.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x float> %vrecps_v2.i
}

define <4 x float> @test_vrecpsq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vrecpsq_f32:
; CHECK: frecps.4s v0, v0, v1
  %vrecpsq_v2.i = tail call <4 x float> @llvm.arm.neon.vrecps.v4f32(<4 x float> %a, <4 x float> %b) #5
  ret <4 x float> %vrecpsq_v2.i
}

define <8 x i8> @test_vreinterpret_s8_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_s16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_s8_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_s32:
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_s8_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_s64:
  %t0 = bitcast <1 x i64> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_s8_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_u8:
  ret <8 x i8> %a
}

define <8 x i8> @test_vreinterpret_s8_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_u16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_s8_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_u32:
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_s8_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_u64:
  %t0 = bitcast <1 x i64> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_s8_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_f16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_s8_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_f32:
  %t0 = bitcast <2 x float> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_s8_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_p8:
  ret <8 x i8> %a
}

define <8 x i8> @test_vreinterpret_s8_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s8_p16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <4 x i16> @test_vreinterpret_s16_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_s8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_s16_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_s32:
  %t0 = bitcast <2 x i32> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_s16_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_s64:
  %t0 = bitcast <1 x i64> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_s16_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_u8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_s16_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_u16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_s16_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_u32:
  %t0 = bitcast <2 x i32> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_s16_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_u64:
  %t0 = bitcast <1 x i64> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_s16_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_f16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_s16_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_f32:
  %t0 = bitcast <2 x float> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_s16_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_p8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_s16_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s16_p16:
  ret <4 x i16> %a
}

define <2 x i32> @test_vreinterpret_s32_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_s8:
  %t0 = bitcast <8 x i8> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_s16:
  %t0 = bitcast <4 x i16> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_s64:
  %t0 = bitcast <1 x i64> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_u8:
  %t0 = bitcast <8 x i8> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_u16:
  %t0 = bitcast <4 x i16> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_u32:
  ret <2 x i32> %a
}

define <2 x i32> @test_vreinterpret_s32_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_u64:
  %t0 = bitcast <1 x i64> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_f16:
  %t0 = bitcast <4 x i16> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_f32:
  %t0 = bitcast <2 x float> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_p8:
  %t0 = bitcast <8 x i8> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_s32_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s32_p16:
  %t0 = bitcast <4 x i16> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <1 x i64> @test_vreinterpret_s64_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_s8:
  %t0 = bitcast <8 x i8> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_s16:
  %t0 = bitcast <4 x i16> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_s32:
  %t0 = bitcast <2 x i32> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_u8:
  %t0 = bitcast <8 x i8> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_u16:
  %t0 = bitcast <4 x i16> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_u32:
  %t0 = bitcast <2 x i32> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_u64:
  ret <1 x i64> %a
}

define <1 x i64> @test_vreinterpret_s64_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_f16:
  %t0 = bitcast <4 x i16> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_f32:
  %t0 = bitcast <2 x float> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_p8:
  %t0 = bitcast <8 x i8> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_s64_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_s64_p16:
  %t0 = bitcast <4 x i16> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <8 x i8> @test_vreinterpret_u8_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_s8:
  ret <8 x i8> %a
}

define <8 x i8> @test_vreinterpret_u8_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_s16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_u8_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_s32:
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_u8_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_s64:
  %t0 = bitcast <1 x i64> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_u8_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_u16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_u8_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_u32:
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_u8_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_u64:
  %t0 = bitcast <1 x i64> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_u8_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_f16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_u8_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_f32:
  %t0 = bitcast <2 x float> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_u8_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_p8:
  ret <8 x i8> %a
}

define <8 x i8> @test_vreinterpret_u8_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u8_p16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <4 x i16> @test_vreinterpret_u16_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_s8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_u16_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_s16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_u16_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_s32:
  %t0 = bitcast <2 x i32> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_u16_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_s64:
  %t0 = bitcast <1 x i64> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_u16_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_u8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_u16_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_u32:
  %t0 = bitcast <2 x i32> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_u16_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_u64:
  %t0 = bitcast <1 x i64> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_u16_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_f16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_u16_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_f32:
  %t0 = bitcast <2 x float> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_u16_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_p8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_u16_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u16_p16:
  ret <4 x i16> %a
}

define <2 x i32> @test_vreinterpret_u32_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_s8:
  %t0 = bitcast <8 x i8> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_s16:
  %t0 = bitcast <4 x i16> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_s32:
  ret <2 x i32> %a
}

define <2 x i32> @test_vreinterpret_u32_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_s64:
  %t0 = bitcast <1 x i64> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_u8:
  %t0 = bitcast <8 x i8> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_u16:
  %t0 = bitcast <4 x i16> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_u64:
  %t0 = bitcast <1 x i64> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_f16:
  %t0 = bitcast <4 x i16> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_f32:
  %t0 = bitcast <2 x float> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_p8:
  %t0 = bitcast <8 x i8> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <2 x i32> @test_vreinterpret_u32_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u32_p16:
  %t0 = bitcast <4 x i16> %a to <2 x i32>
  ret <2 x i32> %t0
}

define <1 x i64> @test_vreinterpret_u64_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_s8:
  %t0 = bitcast <8 x i8> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_s16:
  %t0 = bitcast <4 x i16> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_s32:
  %t0 = bitcast <2 x i32> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_s64:
  ret <1 x i64> %a
}

define <1 x i64> @test_vreinterpret_u64_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_u8:
  %t0 = bitcast <8 x i8> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_u16:
  %t0 = bitcast <4 x i16> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_u32:
  %t0 = bitcast <2 x i32> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_f16:
  %t0 = bitcast <4 x i16> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_f32:
  %t0 = bitcast <2 x float> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_p8:
  %t0 = bitcast <8 x i8> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <1 x i64> @test_vreinterpret_u64_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_u64_p16:
  %t0 = bitcast <4 x i16> %a to <1 x i64>
  ret <1 x i64> %t0
}

define <4 x i16> @test_vreinterpret_f16_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_s8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_f16_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_s16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_f16_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_s32:
  %t0 = bitcast <2 x i32> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_f16_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_s64:
  %t0 = bitcast <1 x i64> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_f16_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_u8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_f16_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_u16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_f16_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_u32:
  %t0 = bitcast <2 x i32> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_f16_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_u64:
  %t0 = bitcast <1 x i64> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_f16_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_f32:
  %t0 = bitcast <2 x float> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_f16_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_p8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_f16_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f16_p16:
  ret <4 x i16> %a
}

define <2 x float> @test_vreinterpret_f32_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_s8:
  %t0 = bitcast <8 x i8> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_s16:
  %t0 = bitcast <4 x i16> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_s32:
  %t0 = bitcast <2 x i32> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_s64:
  %t0 = bitcast <1 x i64> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_u8:
  %t0 = bitcast <8 x i8> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_u16:
  %t0 = bitcast <4 x i16> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_u32:
  %t0 = bitcast <2 x i32> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_u64:
  %t0 = bitcast <1 x i64> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_f16:
  %t0 = bitcast <4 x i16> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_p8:
  %t0 = bitcast <8 x i8> %a to <2 x float>
  ret <2 x float> %t0
}

define <2 x float> @test_vreinterpret_f32_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_f32_p16:
  %t0 = bitcast <4 x i16> %a to <2 x float>
  ret <2 x float> %t0
}

define <8 x i8> @test_vreinterpret_p8_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_s8:
  ret <8 x i8> %a
}

define <8 x i8> @test_vreinterpret_p8_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_s16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_p8_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_s32:
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_p8_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_s64:
  %t0 = bitcast <1 x i64> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_p8_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_u8:
  ret <8 x i8> %a
}

define <8 x i8> @test_vreinterpret_p8_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_u16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_p8_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_u32:
  %t0 = bitcast <2 x i32> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_p8_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_u64:
  %t0 = bitcast <1 x i64> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_p8_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_f16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_p8_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_f32:
  %t0 = bitcast <2 x float> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <8 x i8> @test_vreinterpret_p8_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p8_p16:
  %t0 = bitcast <4 x i16> %a to <8 x i8>
  ret <8 x i8> %t0
}

define <4 x i16> @test_vreinterpret_p16_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_s8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_p16_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_s16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_p16_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_s32:
  %t0 = bitcast <2 x i32> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_p16_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_s64:
  %t0 = bitcast <1 x i64> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_p16_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_u8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_p16_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_u16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_p16_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_u32:
  %t0 = bitcast <2 x i32> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_p16_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_u64:
  %t0 = bitcast <1 x i64> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_p16_f16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_f16:
  ret <4 x i16> %a
}

define <4 x i16> @test_vreinterpret_p16_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_f32:
  %t0 = bitcast <2 x float> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <4 x i16> @test_vreinterpret_p16_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpret_p16_p8:
  %t0 = bitcast <8 x i8> %a to <4 x i16>
  ret <4 x i16> %t0
}

define <16 x i8> @test_vreinterpretq_s8_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_s16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_s8_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_s32:
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_s8_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_s64:
  %t0 = bitcast <2 x i64> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_s8_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_u8:
  ret <16 x i8> %a
}

define <16 x i8> @test_vreinterpretq_s8_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_u16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_s8_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_u32:
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_s8_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_u64:
  %t0 = bitcast <2 x i64> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_s8_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_f16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_s8_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_f32:
  %t0 = bitcast <4 x float> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_s8_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_p8:
  ret <16 x i8> %a
}

define <16 x i8> @test_vreinterpretq_s8_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s8_p16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <8 x i16> @test_vreinterpretq_s16_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_s8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_s16_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_s32:
  %t0 = bitcast <4 x i32> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_s16_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_s64:
  %t0 = bitcast <2 x i64> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_s16_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_u8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_s16_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_u16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_s16_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_u32:
  %t0 = bitcast <4 x i32> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_s16_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_u64:
  %t0 = bitcast <2 x i64> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_s16_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_f16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_s16_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_f32:
  %t0 = bitcast <4 x float> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_s16_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_p8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_s16_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s16_p16:
  ret <8 x i16> %a
}

define <4 x i32> @test_vreinterpretq_s32_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_s8:
  %t0 = bitcast <16 x i8> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_s16:
  %t0 = bitcast <8 x i16> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_s64:
  %t0 = bitcast <2 x i64> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_u8:
  %t0 = bitcast <16 x i8> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_u16:
  %t0 = bitcast <8 x i16> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_u32:
  ret <4 x i32> %a
}

define <4 x i32> @test_vreinterpretq_s32_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_u64:
  %t0 = bitcast <2 x i64> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_f16:
  %t0 = bitcast <8 x i16> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_f32:
  %t0 = bitcast <4 x float> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_p8:
  %t0 = bitcast <16 x i8> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_s32_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s32_p16:
  %t0 = bitcast <8 x i16> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <2 x i64> @test_vreinterpretq_s64_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_s8:
  %t0 = bitcast <16 x i8> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_s16:
  %t0 = bitcast <8 x i16> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_s32:
  %t0 = bitcast <4 x i32> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_u8:
  %t0 = bitcast <16 x i8> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_u16:
  %t0 = bitcast <8 x i16> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_u32:
  %t0 = bitcast <4 x i32> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_u64:
  ret <2 x i64> %a
}

define <2 x i64> @test_vreinterpretq_s64_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_f16:
  %t0 = bitcast <8 x i16> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_f32:
  %t0 = bitcast <4 x float> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_p8:
  %t0 = bitcast <16 x i8> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_s64_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_s64_p16:
  %t0 = bitcast <8 x i16> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <16 x i8> @test_vreinterpretq_u8_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_s8:
  ret <16 x i8> %a
}

define <16 x i8> @test_vreinterpretq_u8_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_s16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_u8_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_s32:
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_u8_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_s64:
  %t0 = bitcast <2 x i64> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_u8_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_u16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_u8_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_u32:
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_u8_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_u64:
  %t0 = bitcast <2 x i64> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_u8_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_f16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_u8_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_f32:
  %t0 = bitcast <4 x float> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_u8_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_p8:
  ret <16 x i8> %a
}

define <16 x i8> @test_vreinterpretq_u8_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u8_p16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <8 x i16> @test_vreinterpretq_u16_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_s8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_u16_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_s16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_u16_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_s32:
  %t0 = bitcast <4 x i32> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_u16_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_s64:
  %t0 = bitcast <2 x i64> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_u16_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_u8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_u16_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_u32:
  %t0 = bitcast <4 x i32> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_u16_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_u64:
  %t0 = bitcast <2 x i64> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_u16_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_f16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_u16_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_f32:
  %t0 = bitcast <4 x float> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_u16_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_p8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_u16_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u16_p16:
  ret <8 x i16> %a
}

define <4 x i32> @test_vreinterpretq_u32_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_s8:
  %t0 = bitcast <16 x i8> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_s16:
  %t0 = bitcast <8 x i16> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_s32:
  ret <4 x i32> %a
}

define <4 x i32> @test_vreinterpretq_u32_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_s64:
  %t0 = bitcast <2 x i64> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_u8:
  %t0 = bitcast <16 x i8> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_u16:
  %t0 = bitcast <8 x i16> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_u64:
  %t0 = bitcast <2 x i64> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_f16:
  %t0 = bitcast <8 x i16> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_f32:
  %t0 = bitcast <4 x float> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_p8:
  %t0 = bitcast <16 x i8> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <4 x i32> @test_vreinterpretq_u32_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u32_p16:
  %t0 = bitcast <8 x i16> %a to <4 x i32>
  ret <4 x i32> %t0
}

define <2 x i64> @test_vreinterpretq_u64_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_s8:
  %t0 = bitcast <16 x i8> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_s16:
  %t0 = bitcast <8 x i16> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_s32:
  %t0 = bitcast <4 x i32> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_s64:
  ret <2 x i64> %a
}

define <2 x i64> @test_vreinterpretq_u64_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_u8:
  %t0 = bitcast <16 x i8> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_u16:
  %t0 = bitcast <8 x i16> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_u32:
  %t0 = bitcast <4 x i32> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_f16:
  %t0 = bitcast <8 x i16> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_f32:
  %t0 = bitcast <4 x float> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_p8:
  %t0 = bitcast <16 x i8> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <2 x i64> @test_vreinterpretq_u64_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_u64_p16:
  %t0 = bitcast <8 x i16> %a to <2 x i64>
  ret <2 x i64> %t0
}

define <8 x i16> @test_vreinterpretq_f16_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_s8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_f16_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_s16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_f16_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_s32:
  %t0 = bitcast <4 x i32> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_f16_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_s64:
  %t0 = bitcast <2 x i64> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_f16_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_u8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_f16_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_u16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_f16_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_u32:
  %t0 = bitcast <4 x i32> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_f16_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_u64:
  %t0 = bitcast <2 x i64> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_f16_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_f32:
  %t0 = bitcast <4 x float> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_f16_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_p8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_f16_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f16_p16:
  ret <8 x i16> %a
}

define <4 x float> @test_vreinterpretq_f32_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_s8:
  %t0 = bitcast <16 x i8> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_s16:
  %t0 = bitcast <8 x i16> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_s32:
  %t0 = bitcast <4 x i32> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_s64:
  %t0 = bitcast <2 x i64> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_u8:
  %t0 = bitcast <16 x i8> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_u16:
  %t0 = bitcast <8 x i16> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_u32:
  %t0 = bitcast <4 x i32> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_u64:
  %t0 = bitcast <2 x i64> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_f16:
  %t0 = bitcast <8 x i16> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_p8:
  %t0 = bitcast <16 x i8> %a to <4 x float>
  ret <4 x float> %t0
}

define <4 x float> @test_vreinterpretq_f32_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_f32_p16:
  %t0 = bitcast <8 x i16> %a to <4 x float>
  ret <4 x float> %t0
}

define <16 x i8> @test_vreinterpretq_p8_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_s8:
  ret <16 x i8> %a
}

define <16 x i8> @test_vreinterpretq_p8_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_s16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_p8_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_s32:
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_p8_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_s64:
  %t0 = bitcast <2 x i64> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_p8_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_u8:
  ret <16 x i8> %a
}

define <16 x i8> @test_vreinterpretq_p8_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_u16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_p8_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_u32:
  %t0 = bitcast <4 x i32> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_p8_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_u64:
  %t0 = bitcast <2 x i64> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_p8_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_f16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_p8_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_f32:
  %t0 = bitcast <4 x float> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <16 x i8> @test_vreinterpretq_p8_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p8_p16:
  %t0 = bitcast <8 x i16> %a to <16 x i8>
  ret <16 x i8> %t0
}

define <8 x i16> @test_vreinterpretq_p16_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_s8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_p16_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_s16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_p16_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_s32:
  %t0 = bitcast <4 x i32> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_p16_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_s64:
  %t0 = bitcast <2 x i64> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_p16_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_u8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_p16_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_u16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_p16_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_u32:
  %t0 = bitcast <4 x i32> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_p16_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_u64:
  %t0 = bitcast <2 x i64> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_p16_f16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_f16:
  ret <8 x i16> %a
}

define <8 x i16> @test_vreinterpretq_p16_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_f32:
  %t0 = bitcast <4 x float> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i16> @test_vreinterpretq_p16_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vreinterpretq_p16_p8:
  %t0 = bitcast <16 x i8> %a to <8 x i16>
  ret <8 x i16> %t0
}

define <8 x i8> @test_vrev16_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev16_s8:
; CHECK: rev16.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6>
  ret <8 x i8> %shuffle.i
}

define <8 x i8> @test_vrev16_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev16_u8:
; CHECK: rev16.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6>
  ret <8 x i8> %shuffle.i
}

define <8 x i8> @test_vrev16_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev16_p8:
; CHECK: rev16.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6>
  ret <8 x i8> %shuffle.i
}

define <16 x i8> @test_vrev16q_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev16q_s8:
; CHECK: rev16.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6, i32 9, i32 8, i32 11, i32 10, i32 13, i32 12, i32 15, i32 14>
  ret <16 x i8> %shuffle.i
}

define <16 x i8> @test_vrev16q_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev16q_u8:
; CHECK: rev16.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6, i32 9, i32 8, i32 11, i32 10, i32 13, i32 12, i32 15, i32 14>
  ret <16 x i8> %shuffle.i
}

define <16 x i8> @test_vrev16q_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev16q_p8:
; CHECK: rev16.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6, i32 9, i32 8, i32 11, i32 10, i32 13, i32 12, i32 15, i32 14>
  ret <16 x i8> %shuffle.i
}

define <8 x i8> @test_vrev32_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev32_s8:
; CHECK: rev32.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vrev32_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vrev32_s16:
; CHECK: rev32.4h v0, v0
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  ret <4 x i16> %shuffle.i
}

define <8 x i8> @test_vrev32_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev32_u8:
; CHECK: rev32.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vrev32_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vrev32_u16:
; CHECK: rev32.4h v0, v0
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  ret <4 x i16> %shuffle.i
}

define <8 x i8> @test_vrev32_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev32_p8:
; CHECK: rev32.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vrev32_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vrev32_p16:
; CHECK: rev32.4h v0, v0
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  ret <4 x i16> %shuffle.i
}

define <16 x i8> @test_vrev32q_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev32q_s8:
; CHECK: rev32.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4, i32 11, i32 10, i32 9, i32 8, i32 15, i32 14, i32 13, i32 12>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vrev32q_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrev32q_s16:
; CHECK: rev32.8h v0, v0
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <8 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6>
  ret <8 x i16> %shuffle.i
}

define <16 x i8> @test_vrev32q_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev32q_u8:
; CHECK: rev32.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4, i32 11, i32 10, i32 9, i32 8, i32 15, i32 14, i32 13, i32 12>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vrev32q_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrev32q_u16:
; CHECK: rev32.8h v0, v0
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <8 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6>
  ret <8 x i16> %shuffle.i
}

define <16 x i8> @test_vrev32q_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev32q_p8:
; CHECK: rev32.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4, i32 11, i32 10, i32 9, i32 8, i32 15, i32 14, i32 13, i32 12>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vrev32q_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrev32q_p16:
; CHECK: rev32.8h v0, v0
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <8 x i32> <i32 1, i32 0, i32 3, i32 2, i32 5, i32 4, i32 7, i32 6>
  ret <8 x i16> %shuffle.i
}

define <8 x i8> @test_vrev64_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev64_s8:
; CHECK: rev64.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vrev64_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vrev64_s16:
; CHECK: rev64.4h v0, v0
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x i16> %shuffle.i
}

define <2 x i32> @test_vrev64_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vrev64_s32:
; CHECK: rev64.2s v0, v0
  %shuffle.i = shufflevector <2 x i32> %a, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  ret <2 x i32> %shuffle.i
}

define <8 x i8> @test_vrev64_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev64_u8:
; CHECK: rev64.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vrev64_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vrev64_u16:
; CHECK: rev64.4h v0, v0
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x i16> %shuffle.i
}

define <2 x i32> @test_vrev64_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vrev64_u32:
; CHECK: rev64.2s v0, v0
  %shuffle.i = shufflevector <2 x i32> %a, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  ret <2 x i32> %shuffle.i
}

define <8 x i8> @test_vrev64_p8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrev64_p8:
; CHECK: rev64.8b v0, v0
  %shuffle.i = shufflevector <8 x i8> %a, <8 x i8> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  ret <8 x i8> %shuffle.i
}

define <4 x i16> @test_vrev64_p16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vrev64_p16:
; CHECK: rev64.4h v0, v0
  %shuffle.i = shufflevector <4 x i16> %a, <4 x i16> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  ret <4 x i16> %shuffle.i
}

define <2 x float> @test_vrev64_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vrev64_f32:
; CHECK: rev64.2s v0, v0
  %shuffle.i = shufflevector <2 x float> %a, <2 x float> undef, <2 x i32> <i32 1, i32 0>
  ret <2 x float> %shuffle.i
}

define <16 x i8> @test_vrev64q_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev64q_s8:
; CHECK: rev64.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vrev64q_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrev64q_s16:
; CHECK: rev64.8h v0, v0
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <8 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4>
  ret <8 x i16> %shuffle.i
}

define <4 x i32> @test_vrev64q_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vrev64q_s32:
; CHECK: rev64.4s v0, v0
  %shuffle.i = shufflevector <4 x i32> %a, <4 x i32> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  ret <4 x i32> %shuffle.i
}

define <16 x i8> @test_vrev64q_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev64q_u8:
; CHECK: rev64.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vrev64q_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrev64q_u16:
; CHECK: rev64.8h v0, v0
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <8 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4>
  ret <8 x i16> %shuffle.i
}

define <4 x i32> @test_vrev64q_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vrev64q_u32:
; CHECK: rev64.4s v0, v0
  %shuffle.i = shufflevector <4 x i32> %a, <4 x i32> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  ret <4 x i32> %shuffle.i
}

define <16 x i8> @test_vrev64q_p8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrev64q_p8:
; CHECK: rev64.16b v0, v0
  %shuffle.i = shufflevector <16 x i8> %a, <16 x i8> undef, <16 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8>
  ret <16 x i8> %shuffle.i
}

define <8 x i16> @test_vrev64q_p16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrev64q_p16:
; CHECK: rev64.8h v0, v0
  %shuffle.i = shufflevector <8 x i16> %a, <8 x i16> undef, <8 x i32> <i32 3, i32 2, i32 1, i32 0, i32 7, i32 6, i32 5, i32 4>
  ret <8 x i16> %shuffle.i
}

define <4 x float> @test_vrev64q_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vrev64q_f32:
; CHECK: rev64.4s v0, v0
  %shuffle.i = shufflevector <4 x float> %a, <4 x float> undef, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  ret <4 x float> %shuffle.i
}

define <8 x i8> @test_vrhadd_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vrhadd_s8:
; CHECK: srhadd.8b v0, v0, v1
  %vrhadd_v.i = tail call <8 x i8> @llvm.arm.neon.vrhadds.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vrhadd_v.i
}

define <4 x i16> @test_vrhadd_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vrhadd_s16:
; CHECK: srhadd.4h v0, v0, v1
  %vrhadd_v2.i = tail call <4 x i16> @llvm.arm.neon.vrhadds.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vrhadd_v2.i
}

define <2 x i32> @test_vrhadd_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vrhadd_s32:
; CHECK: srhadd.2s v0, v0, v1
  %vrhadd_v2.i = tail call <2 x i32> @llvm.arm.neon.vrhadds.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vrhadd_v2.i
}

define <8 x i8> @test_vrhadd_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vrhadd_u8:
; CHECK: urhadd.8b v0, v0, v1
  %vrhadd_v.i = tail call <8 x i8> @llvm.arm.neon.vrhaddu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vrhadd_v.i
}

define <4 x i16> @test_vrhadd_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vrhadd_u16:
; CHECK: urhadd.4h v0, v0, v1
  %vrhadd_v2.i = tail call <4 x i16> @llvm.arm.neon.vrhaddu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vrhadd_v2.i
}

define <2 x i32> @test_vrhadd_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vrhadd_u32:
; CHECK: urhadd.2s v0, v0, v1
  %vrhadd_v2.i = tail call <2 x i32> @llvm.arm.neon.vrhaddu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vrhadd_v2.i
}

define <16 x i8> @test_vrhaddq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vrhaddq_s8:
; CHECK: srhadd.16b v0, v0, v1
  %vrhaddq_v.i = tail call <16 x i8> @llvm.arm.neon.vrhadds.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vrhaddq_v.i
}

define <8 x i16> @test_vrhaddq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vrhaddq_s16:
; CHECK: srhadd.8h v0, v0, v1
  %vrhaddq_v2.i = tail call <8 x i16> @llvm.arm.neon.vrhadds.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vrhaddq_v2.i
}

define <4 x i32> @test_vrhaddq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vrhaddq_s32:
; CHECK: srhadd.4s v0, v0, v1
  %vrhaddq_v2.i = tail call <4 x i32> @llvm.arm.neon.vrhadds.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vrhaddq_v2.i
}

define <16 x i8> @test_vrhaddq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vrhaddq_u8:
; CHECK: urhadd.16b v0, v0, v1
  %vrhaddq_v.i = tail call <16 x i8> @llvm.arm.neon.vrhaddu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vrhaddq_v.i
}

define <8 x i16> @test_vrhaddq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vrhaddq_u16:
; CHECK: urhadd.8h v0, v0, v1
  %vrhaddq_v2.i = tail call <8 x i16> @llvm.arm.neon.vrhaddu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vrhaddq_v2.i
}

define <4 x i32> @test_vrhaddq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vrhaddq_u32:
; CHECK: urhadd.4s v0, v0, v1
  %vrhaddq_v2.i = tail call <4 x i32> @llvm.arm.neon.vrhaddu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vrhaddq_v2.i
}

define <8 x i8> @test_vrshl_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vrshl_s8:
; CHECK: srshl.8b v0, v0, v1
  %vrshl_v.i = tail call <8 x i8> @llvm.arm.neon.vrshifts.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vrshl_v.i
}

define <4 x i16> @test_vrshl_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vrshl_s16:
; CHECK: srshl.4h v0, v0, v1
  %vrshl_v2.i = tail call <4 x i16> @llvm.arm.neon.vrshifts.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vrshl_v2.i
}

define <2 x i32> @test_vrshl_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vrshl_s32:
; CHECK: srshl.2s v0, v0, v1
  %vrshl_v2.i = tail call <2 x i32> @llvm.arm.neon.vrshifts.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vrshl_v2.i
}

define <1 x i64> @test_vrshl_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vrshl_s64:
; CHECK: srshl d0, d0, d1
  %vrshl_v2.i = tail call <1 x i64> @llvm.arm.neon.vrshifts.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vrshl_v2.i
}

define <8 x i8> @test_vrshl_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vrshl_u8:
; CHECK: urshl.8b v0, v0, v1
  %vrshl_v.i = tail call <8 x i8> @llvm.arm.neon.vrshiftu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vrshl_v.i
}

define <4 x i16> @test_vrshl_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vrshl_u16:
; CHECK: urshl.4h v0, v0, v1
  %vrshl_v2.i = tail call <4 x i16> @llvm.arm.neon.vrshiftu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vrshl_v2.i
}

define <2 x i32> @test_vrshl_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vrshl_u32:
; CHECK: urshl.2s v0, v0, v1
  %vrshl_v2.i = tail call <2 x i32> @llvm.arm.neon.vrshiftu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vrshl_v2.i
}

define <1 x i64> @test_vrshl_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vrshl_u64:
; CHECK: urshl d0, d0, d1
  %vrshl_v2.i = tail call <1 x i64> @llvm.arm.neon.vrshiftu.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vrshl_v2.i
}

define <16 x i8> @test_vrshlq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vrshlq_s8:
; CHECK: srshl.16b v0, v0, v1
  %vrshlq_v.i = tail call <16 x i8> @llvm.arm.neon.vrshifts.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vrshlq_v.i
}

define <8 x i16> @test_vrshlq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vrshlq_s16:
; CHECK: srshl.8h v0, v0, v1
  %vrshlq_v2.i = tail call <8 x i16> @llvm.arm.neon.vrshifts.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vrshlq_v2.i
}

define <4 x i32> @test_vrshlq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vrshlq_s32:
; CHECK: srshl.4s v0, v0, v1
  %vrshlq_v2.i = tail call <4 x i32> @llvm.arm.neon.vrshifts.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vrshlq_v2.i
}

define <2 x i64> @test_vrshlq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vrshlq_s64:
; CHECK: srshl.2d v0, v0, v1
  %vrshlq_v2.i = tail call <2 x i64> @llvm.arm.neon.vrshifts.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vrshlq_v2.i
}

define <16 x i8> @test_vrshlq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vrshlq_u8:
; CHECK: urshl.16b v0, v0, v1
  %vrshlq_v.i = tail call <16 x i8> @llvm.arm.neon.vrshiftu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vrshlq_v.i
}

define <8 x i16> @test_vrshlq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vrshlq_u16:
; CHECK: urshl.8h v0, v0, v1
  %vrshlq_v2.i = tail call <8 x i16> @llvm.arm.neon.vrshiftu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vrshlq_v2.i
}

define <4 x i32> @test_vrshlq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vrshlq_u32:
; CHECK: urshl.4s v0, v0, v1
  %vrshlq_v2.i = tail call <4 x i32> @llvm.arm.neon.vrshiftu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vrshlq_v2.i
}

define <2 x i64> @test_vrshlq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vrshlq_u64:
; CHECK: urshl.2d v0, v0, v1
  %vrshlq_v2.i = tail call <2 x i64> @llvm.arm.neon.vrshiftu.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vrshlq_v2.i
}

define <8 x i8> @test_vrshrn_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrshrn_n_s16:
; CHECK: rshrn.8b v0, v0, #1
  %vrshrn_n1 = tail call <8 x i8> @llvm.arm.neon.vrshiftn.v8i8(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i8> %vrshrn_n1
}

declare <8 x i8> @llvm.arm.neon.vrshiftn.v8i8(<8 x i16>, <8 x i16>) #1

define <4 x i16> @test_vrshrn_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vrshrn_n_s32:
; CHECK: rshrn.4h v0, v0, #1
  %vrshrn_n1 = tail call <4 x i16> @llvm.arm.neon.vrshiftn.v4i16(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i16> %vrshrn_n1
}

declare <4 x i16> @llvm.arm.neon.vrshiftn.v4i16(<4 x i32>, <4 x i32>) #1

define <2 x i32> @test_vrshrn_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vrshrn_n_s64:
; CHECK: rshrn.2s v0, v0, #1
  %vrshrn_n1 = tail call <2 x i32> @llvm.arm.neon.vrshiftn.v2i32(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i32> %vrshrn_n1
}

declare <2 x i32> @llvm.arm.neon.vrshiftn.v2i32(<2 x i64>, <2 x i64>) #1

define <8 x i8> @test_vrshrn_n_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrshrn_n_u16:
; CHECK: rshrn.8b v0, v0, #1
  %vrshrn_n1 = tail call <8 x i8> @llvm.arm.neon.vrshiftn.v8i8(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i8> %vrshrn_n1
}

define <4 x i16> @test_vrshrn_n_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vrshrn_n_u32:
; CHECK: rshrn.4h v0, v0, #1
  %vrshrn_n1 = tail call <4 x i16> @llvm.arm.neon.vrshiftn.v4i16(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i16> %vrshrn_n1
}

define <2 x i32> @test_vrshrn_n_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vrshrn_n_u64:
; CHECK: rshrn.2s v0, v0, #1
  %vrshrn_n1 = tail call <2 x i32> @llvm.arm.neon.vrshiftn.v2i32(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i32> %vrshrn_n1
}

define <8 x i8> @test_vrshr_n_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrshr_n_s8:
; CHECK: srshr.8b v0, v0, #1
  %vrshr_n = tail call <8 x i8> @llvm.arm.neon.vrshifts.v8i8(<8 x i8> %a, <8 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <8 x i8> %vrshr_n
}

declare <8 x i8> @llvm.arm.neon.vrshifts.v8i8(<8 x i8>, <8 x i8>) #1

define <4 x i16> @test_vrshr_n_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vrshr_n_s16:
; CHECK: srshr.4h v0, v0, #1
  %vrshr_n1 = tail call <4 x i16> @llvm.arm.neon.vrshifts.v4i16(<4 x i16> %a, <4 x i16> <i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <4 x i16> %vrshr_n1
}

declare <4 x i16> @llvm.arm.neon.vrshifts.v4i16(<4 x i16>, <4 x i16>) #1

define <2 x i32> @test_vrshr_n_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vrshr_n_s32:
; CHECK: srshr.2s v0, v0, #1
  %vrshr_n1 = tail call <2 x i32> @llvm.arm.neon.vrshifts.v2i32(<2 x i32> %a, <2 x i32> <i32 -1, i32 -1>)
  ret <2 x i32> %vrshr_n1
}

declare <2 x i32> @llvm.arm.neon.vrshifts.v2i32(<2 x i32>, <2 x i32>) #1

define <1 x i64> @test_vrshr_n_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vrshr_n_s64:
; CHECK: srshr d0, d0, #1
  %vrshr_n1 = tail call <1 x i64> @llvm.arm.neon.vrshifts.v1i64(<1 x i64> %a, <1 x i64> <i64 -1>)
  ret <1 x i64> %vrshr_n1
}

declare <1 x i64> @llvm.arm.neon.vrshifts.v1i64(<1 x i64>, <1 x i64>) #1

define <8 x i8> @test_vrshr_n_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vrshr_n_u8:
; CHECK: urshr.8b v0, v0, #1
  %vrshr_n = tail call <8 x i8> @llvm.arm.neon.vrshiftu.v8i8(<8 x i8> %a, <8 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <8 x i8> %vrshr_n
}

declare <8 x i8> @llvm.arm.neon.vrshiftu.v8i8(<8 x i8>, <8 x i8>) #1

define <4 x i16> @test_vrshr_n_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vrshr_n_u16:
; CHECK: urshr.4h v0, v0, #1
  %vrshr_n1 = tail call <4 x i16> @llvm.arm.neon.vrshiftu.v4i16(<4 x i16> %a, <4 x i16> <i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <4 x i16> %vrshr_n1
}

declare <4 x i16> @llvm.arm.neon.vrshiftu.v4i16(<4 x i16>, <4 x i16>) #1

define <2 x i32> @test_vrshr_n_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vrshr_n_u32:
; CHECK: urshr.2s v0, v0, #1
  %vrshr_n1 = tail call <2 x i32> @llvm.arm.neon.vrshiftu.v2i32(<2 x i32> %a, <2 x i32> <i32 -1, i32 -1>)
  ret <2 x i32> %vrshr_n1
}

declare <2 x i32> @llvm.arm.neon.vrshiftu.v2i32(<2 x i32>, <2 x i32>) #1

define <1 x i64> @test_vrshr_n_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vrshr_n_u64:
; CHECK: urshr d0, d0, #1
  %vrshr_n1 = tail call <1 x i64> @llvm.arm.neon.vrshiftu.v1i64(<1 x i64> %a, <1 x i64> <i64 -1>)
  ret <1 x i64> %vrshr_n1
}

declare <1 x i64> @llvm.arm.neon.vrshiftu.v1i64(<1 x i64>, <1 x i64>) #1

define <16 x i8> @test_vrshrq_n_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrshrq_n_s8:
; CHECK: srshr.16b v0, v0, #1
  %vrshr_n = tail call <16 x i8> @llvm.arm.neon.vrshifts.v16i8(<16 x i8> %a, <16 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <16 x i8> %vrshr_n
}

declare <16 x i8> @llvm.arm.neon.vrshifts.v16i8(<16 x i8>, <16 x i8>) #1

define <8 x i16> @test_vrshrq_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrshrq_n_s16:
; CHECK: srshr.8h v0, v0, #1
  %vrshr_n1 = tail call <8 x i16> @llvm.arm.neon.vrshifts.v8i16(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i16> %vrshr_n1
}

declare <8 x i16> @llvm.arm.neon.vrshifts.v8i16(<8 x i16>, <8 x i16>) #1

define <4 x i32> @test_vrshrq_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vrshrq_n_s32:
; CHECK: srshr.4s v0, v0, #1
  %vrshr_n1 = tail call <4 x i32> @llvm.arm.neon.vrshifts.v4i32(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i32> %vrshr_n1
}

declare <4 x i32> @llvm.arm.neon.vrshifts.v4i32(<4 x i32>, <4 x i32>) #1

define <2 x i64> @test_vrshrq_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vrshrq_n_s64:
; CHECK: srshr.2d v0, v0, #1
  %vrshr_n1 = tail call <2 x i64> @llvm.arm.neon.vrshifts.v2i64(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i64> %vrshr_n1
}

declare <2 x i64> @llvm.arm.neon.vrshifts.v2i64(<2 x i64>, <2 x i64>) #1

define <16 x i8> @test_vrshrq_n_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vrshrq_n_u8:
; CHECK: urshr.16b v0, v0, #1
  %vrshr_n = tail call <16 x i8> @llvm.arm.neon.vrshiftu.v16i8(<16 x i8> %a, <16 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <16 x i8> %vrshr_n
}

declare <16 x i8> @llvm.arm.neon.vrshiftu.v16i8(<16 x i8>, <16 x i8>) #1

define <8 x i16> @test_vrshrq_n_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vrshrq_n_u16:
; CHECK: urshr.8h v0, v0, #1
  %vrshr_n1 = tail call <8 x i16> @llvm.arm.neon.vrshiftu.v8i16(<8 x i16> %a, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i16> %vrshr_n1
}

declare <8 x i16> @llvm.arm.neon.vrshiftu.v8i16(<8 x i16>, <8 x i16>) #1

define <4 x i32> @test_vrshrq_n_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vrshrq_n_u32:
; CHECK: urshr.4s v0, v0, #1
  %vrshr_n1 = tail call <4 x i32> @llvm.arm.neon.vrshiftu.v4i32(<4 x i32> %a, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i32> %vrshr_n1
}

declare <4 x i32> @llvm.arm.neon.vrshiftu.v4i32(<4 x i32>, <4 x i32>) #1

define <2 x i64> @test_vrshrq_n_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vrshrq_n_u64:
; CHECK: urshr.2d v0, v0, #1
  %vrshr_n1 = tail call <2 x i64> @llvm.arm.neon.vrshiftu.v2i64(<2 x i64> %a, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i64> %vrshr_n1
}

declare <2 x i64> @llvm.arm.neon.vrshiftu.v2i64(<2 x i64>, <2 x i64>) #1

define <2 x float> @test_vrsqrte_f32(<2 x float> %a) #0 {
; CHECK-LABEL: test_vrsqrte_f32:
; CHECK: frsqrte.2s v0, v0
  %vrsqrte_v1.i = tail call <2 x float> @llvm.arm.neon.vrsqrte.v2f32(<2 x float> %a) #5
  ret <2 x float> %vrsqrte_v1.i
}

define <2 x i32> @test_vrsqrte_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vrsqrte_u32:
; CHECK: ursqrte.2s v0, v0
  %vrsqrte_v1.i = tail call <2 x i32> @llvm.arm.neon.vrsqrte.v2i32(<2 x i32> %a) #5
  ret <2 x i32> %vrsqrte_v1.i
}

define <4 x float> @test_vrsqrteq_f32(<4 x float> %a) #0 {
; CHECK-LABEL: test_vrsqrteq_f32:
; CHECK: frsqrte.4s v0, v0
  %vrsqrteq_v1.i = tail call <4 x float> @llvm.arm.neon.vrsqrte.v4f32(<4 x float> %a) #5
  ret <4 x float> %vrsqrteq_v1.i
}

define <4 x i32> @test_vrsqrteq_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vrsqrteq_u32:
; CHECK: ursqrte.4s v0, v0
  %vrsqrteq_v1.i = tail call <4 x i32> @llvm.arm.neon.vrsqrte.v4i32(<4 x i32> %a) #5
  ret <4 x i32> %vrsqrteq_v1.i
}

define <2 x float> @test_vrsqrts_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vrsqrts_f32:
; CHECK: frsqrts.2s v0, v0, v1
  %vrsqrts_v2.i = tail call <2 x float> @llvm.arm.neon.vrsqrts.v2f32(<2 x float> %a, <2 x float> %b) #5
  ret <2 x float> %vrsqrts_v2.i
}

define <4 x float> @test_vrsqrtsq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vrsqrtsq_f32:
; CHECK: frsqrts.4s v0, v0, v1
  %vrsqrtsq_v2.i = tail call <4 x float> @llvm.arm.neon.vrsqrts.v4f32(<4 x float> %a, <4 x float> %b) #5
  ret <4 x float> %vrsqrtsq_v2.i
}

define <8 x i8> @test_vrsra_n_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vrsra_n_s8:
; CHECK: srsra.8b v0, v1, #1
  %t0 = tail call <8 x i8> @llvm.arm.neon.vrshifts.v8i8(<8 x i8> %b, <8 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  %vrsra_n = add <8 x i8> %t0, %a
  ret <8 x i8> %vrsra_n
}

define <4 x i16> @test_vrsra_n_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vrsra_n_s16:
; CHECK: srsra.4h v0, v1, #1
  %t0 = tail call <4 x i16> @llvm.arm.neon.vrshifts.v4i16(<4 x i16> %b, <4 x i16> <i16 -1, i16 -1, i16 -1, i16 -1>)
  %vrsra_n = add <4 x i16> %t0, %a
  ret <4 x i16> %vrsra_n
}

define <2 x i32> @test_vrsra_n_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vrsra_n_s32:
; CHECK: srsra.2s v0, v1, #1
  %t0 = tail call <2 x i32> @llvm.arm.neon.vrshifts.v2i32(<2 x i32> %b, <2 x i32> <i32 -1, i32 -1>)
  %vrsra_n = add <2 x i32> %t0, %a
  ret <2 x i32> %vrsra_n
}

define <1 x i64> @test_vrsra_n_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vrsra_n_s64:
; CHECK: srsra d0, d1, #1
  %t0 = tail call <1 x i64> @llvm.arm.neon.vrshifts.v1i64(<1 x i64> %b, <1 x i64> <i64 -1>)
  %vrsra_n = add <1 x i64> %t0, %a
  ret <1 x i64> %vrsra_n
}

define <8 x i8> @test_vrsra_n_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vrsra_n_u8:
; CHECK: ursra.8b v0, v1, #1
  %t0 = tail call <8 x i8> @llvm.arm.neon.vrshiftu.v8i8(<8 x i8> %b, <8 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  %vrsra_n = add <8 x i8> %t0, %a
  ret <8 x i8> %vrsra_n
}

define <4 x i16> @test_vrsra_n_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vrsra_n_u16:
; CHECK: ursra.4h v0, v1, #1
  %t0 = tail call <4 x i16> @llvm.arm.neon.vrshiftu.v4i16(<4 x i16> %b, <4 x i16> <i16 -1, i16 -1, i16 -1, i16 -1>)
  %vrsra_n = add <4 x i16> %t0, %a
  ret <4 x i16> %vrsra_n
}

define <2 x i32> @test_vrsra_n_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vrsra_n_u32:
; CHECK: ursra.2s v0, v1, #1
  %t0 = tail call <2 x i32> @llvm.arm.neon.vrshiftu.v2i32(<2 x i32> %b, <2 x i32> <i32 -1, i32 -1>)
  %vrsra_n = add <2 x i32> %t0, %a
  ret <2 x i32> %vrsra_n
}

define <1 x i64> @test_vrsra_n_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vrsra_n_u64:
; CHECK: ursra d0, d1, #1
  %t0 = tail call <1 x i64> @llvm.arm.neon.vrshiftu.v1i64(<1 x i64> %b, <1 x i64> <i64 -1>)
  %vrsra_n = add <1 x i64> %t0, %a
  ret <1 x i64> %vrsra_n
}

define <16 x i8> @test_vrsraq_n_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vrsraq_n_s8:
; CHECK: srsra.16b v0, v1, #1
  %t0 = tail call <16 x i8> @llvm.arm.neon.vrshifts.v16i8(<16 x i8> %b, <16 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  %vrsra_n = add <16 x i8> %t0, %a
  ret <16 x i8> %vrsra_n
}

define <8 x i16> @test_vrsraq_n_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vrsraq_n_s16:
; CHECK: srsra.8h v0, v1, #1
  %t0 = tail call <8 x i16> @llvm.arm.neon.vrshifts.v8i16(<8 x i16> %b, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  %vrsra_n = add <8 x i16> %t0, %a
  ret <8 x i16> %vrsra_n
}

define <4 x i32> @test_vrsraq_n_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vrsraq_n_s32:
; CHECK: srsra.4s v0, v1, #1
  %t0 = tail call <4 x i32> @llvm.arm.neon.vrshifts.v4i32(<4 x i32> %b, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  %vrsra_n = add <4 x i32> %t0, %a
  ret <4 x i32> %vrsra_n
}

define <2 x i64> @test_vrsraq_n_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vrsraq_n_s64:
; CHECK: srsra.2d v0, v1, #1
  %t0 = tail call <2 x i64> @llvm.arm.neon.vrshifts.v2i64(<2 x i64> %b, <2 x i64> <i64 -1, i64 -1>)
  %vrsra_n = add <2 x i64> %t0, %a
  ret <2 x i64> %vrsra_n
}

define <16 x i8> @test_vrsraq_n_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vrsraq_n_u8:
; CHECK: ursra.16b v0, v1, #1
  %t0 = tail call <16 x i8> @llvm.arm.neon.vrshiftu.v16i8(<16 x i8> %b, <16 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  %vrsra_n = add <16 x i8> %t0, %a
  ret <16 x i8> %vrsra_n
}

define <8 x i16> @test_vrsraq_n_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vrsraq_n_u16:
; CHECK: ursra.8h v0, v1, #1
  %t0 = tail call <8 x i16> @llvm.arm.neon.vrshiftu.v8i16(<8 x i16> %b, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  %vrsra_n = add <8 x i16> %t0, %a
  ret <8 x i16> %vrsra_n
}

define <4 x i32> @test_vrsraq_n_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vrsraq_n_u32:
; CHECK: ursra.4s v0, v1, #1
  %t0 = tail call <4 x i32> @llvm.arm.neon.vrshiftu.v4i32(<4 x i32> %b, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  %vrsra_n = add <4 x i32> %t0, %a
  ret <4 x i32> %vrsra_n
}

define <2 x i64> @test_vrsraq_n_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vrsraq_n_u64:
; CHECK: ursra.2d v0, v1, #1
  %t0 = tail call <2 x i64> @llvm.arm.neon.vrshiftu.v2i64(<2 x i64> %b, <2 x i64> <i64 -1, i64 -1>)
  %vrsra_n = add <2 x i64> %t0, %a
  ret <2 x i64> %vrsra_n
}

define <8 x i8> @test_vrsubhn_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vrsubhn_s16:
; CHECK: rsubhn.8b v0, v0, v1
  %vrsubhn_v2.i = tail call <8 x i8> @llvm.arm.neon.vrsubhn.v8i8(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i8> %vrsubhn_v2.i
}

define <4 x i16> @test_vrsubhn_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vrsubhn_s32:
; CHECK: rsubhn.4h v0, v0, v1
  %vrsubhn_v2.i = tail call <4 x i16> @llvm.arm.neon.vrsubhn.v4i16(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i16> %vrsubhn_v2.i
}

define <2 x i32> @test_vrsubhn_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vrsubhn_s64:
; CHECK: rsubhn.2s v0, v0, v1
  %vrsubhn_v2.i = tail call <2 x i32> @llvm.arm.neon.vrsubhn.v2i32(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i32> %vrsubhn_v2.i
}

define <8 x i8> @test_vrsubhn_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vrsubhn_u16:
; CHECK: rsubhn.8b v0, v0, v1
  %vrsubhn_v2.i = tail call <8 x i8> @llvm.arm.neon.vrsubhn.v8i8(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i8> %vrsubhn_v2.i
}

define <4 x i16> @test_vrsubhn_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vrsubhn_u32:
; CHECK: rsubhn.4h v0, v0, v1
  %vrsubhn_v2.i = tail call <4 x i16> @llvm.arm.neon.vrsubhn.v4i16(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i16> %vrsubhn_v2.i
}

define <2 x i32> @test_vrsubhn_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vrsubhn_u64:
; CHECK: rsubhn.2s v0, v0, v1
  %vrsubhn_v2.i = tail call <2 x i32> @llvm.arm.neon.vrsubhn.v2i32(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i32> %vrsubhn_v2.i
}

define <8 x i8> @test_vset_lane_u8(i8 zeroext %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vset_lane_u8:
; CHECK: mov.b v0[7], w0
  %vset_lane = insertelement <8 x i8> %b, i8 %a, i32 7
  ret <8 x i8> %vset_lane
}

define <4 x i16> @test_vset_lane_u16(i16 zeroext %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vset_lane_u16:
; CHECK: mov.h v0[3], w0
  %vset_lane = insertelement <4 x i16> %b, i16 %a, i32 3
  ret <4 x i16> %vset_lane
}

define <2 x i32> @test_vset_lane_u32(i32 %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vset_lane_u32:
; CHECK: mov.s v0[1], w0
  %vset_lane = insertelement <2 x i32> %b, i32 %a, i32 1
  ret <2 x i32> %vset_lane
}

define <8 x i8> @test_vset_lane_s8(i8 signext %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vset_lane_s8:
; CHECK: mov.b v0[7], w0
  %vset_lane = insertelement <8 x i8> %b, i8 %a, i32 7
  ret <8 x i8> %vset_lane
}

define <4 x i16> @test_vset_lane_s16(i16 signext %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vset_lane_s16:
; CHECK: mov.h v0[3], w0
  %vset_lane = insertelement <4 x i16> %b, i16 %a, i32 3
  ret <4 x i16> %vset_lane
}

define <2 x i32> @test_vset_lane_s32(i32 %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vset_lane_s32:
; CHECK: mov.s v0[1], w0
  %vset_lane = insertelement <2 x i32> %b, i32 %a, i32 1
  ret <2 x i32> %vset_lane
}

define <8 x i8> @test_vset_lane_p8(i8 signext %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vset_lane_p8:
; CHECK: mov.b v0[7], w0
  %vset_lane = insertelement <8 x i8> %b, i8 %a, i32 7
  ret <8 x i8> %vset_lane
}

define <4 x i16> @test_vset_lane_p16(i16 signext %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vset_lane_p16:
; CHECK: mov.h v0[3], w0
  %vset_lane = insertelement <4 x i16> %b, i16 %a, i32 3
  ret <4 x i16> %vset_lane
}

define <2 x float> @test_vset_lane_f32(float %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vset_lane_f32:
; CHECK: mov.s v1[1], v0[0]
; CHECK: mov.16b  v0, v1
  %vset_lane = insertelement <2 x float> %b, float %a, i32 1
  ret <2 x float> %vset_lane
}

define <16 x i8> @test_vsetq_lane_u8(i8 zeroext %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_u8:
; CHECK: mov.b v0[15], w0
  %vset_lane = insertelement <16 x i8> %b, i8 %a, i32 15
  ret <16 x i8> %vset_lane
}

define <8 x i16> @test_vsetq_lane_u16(i16 zeroext %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_u16:
; CHECK: mov.h v0[7], w0
  %vset_lane = insertelement <8 x i16> %b, i16 %a, i32 7
  ret <8 x i16> %vset_lane
}

define <4 x i32> @test_vsetq_lane_u32(i32 %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_u32:
; CHECK: mov.s v0[3], w0
  %vset_lane = insertelement <4 x i32> %b, i32 %a, i32 3
  ret <4 x i32> %vset_lane
}

define <16 x i8> @test_vsetq_lane_s8(i8 signext %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_s8:
; CHECK: mov.b v0[15], w0
  %vset_lane = insertelement <16 x i8> %b, i8 %a, i32 15
  ret <16 x i8> %vset_lane
}

define <8 x i16> @test_vsetq_lane_s16(i16 signext %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_s16:
; CHECK: mov.h v0[7], w0
  %vset_lane = insertelement <8 x i16> %b, i16 %a, i32 7
  ret <8 x i16> %vset_lane
}

define <4 x i32> @test_vsetq_lane_s32(i32 %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_s32:
; CHECK: mov.s v0[3], w0
  %vset_lane = insertelement <4 x i32> %b, i32 %a, i32 3
  ret <4 x i32> %vset_lane
}

define <16 x i8> @test_vsetq_lane_p8(i8 signext %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_p8:
; CHECK: mov.b v0[15], w0
  %vset_lane = insertelement <16 x i8> %b, i8 %a, i32 15
  ret <16 x i8> %vset_lane
}

define <8 x i16> @test_vsetq_lane_p16(i16 signext %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_p16:
; CHECK: mov.h v0[7], w0
  %vset_lane = insertelement <8 x i16> %b, i16 %a, i32 7
  ret <8 x i16> %vset_lane
}

define <4 x float> @test_vsetq_lane_f32(float %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_f32:
; CHECK: mov.s v1[3], v0[0]
; CHECK: mov.16b  v0, v1
  %vset_lane = insertelement <4 x float> %b, float %a, i32 3
  ret <4 x float> %vset_lane
}

define <1 x i64> @test_vset_lane_s64(i64 %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vset_lane_s64:
; CHECK: fmov d0, x0
  %vset_lane = insertelement <1 x i64> undef, i64 %a, i32 0
  ret <1 x i64> %vset_lane
}

define <1 x i64> @test_vset_lane_u64(i64 %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vset_lane_u64:
; CHECK: fmov d0, x0
  %vset_lane = insertelement <1 x i64> undef, i64 %a, i32 0
  ret <1 x i64> %vset_lane
}

define <2 x i64> @test_vsetq_lane_s64(i64 %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_s64:
; CHECK: mov.d v0[1], x0
  %vset_lane = insertelement <2 x i64> %b, i64 %a, i32 1
  ret <2 x i64> %vset_lane
}

define <2 x i64> @test_vsetq_lane_u64(i64 %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsetq_lane_u64:
; CHECK: mov.d v0[1], x0
  %vset_lane = insertelement <2 x i64> %b, i64 %a, i32 1
  ret <2 x i64> %vset_lane
}

define <8 x i8> @test_vshl_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vshl_s8:
; CHECK: sshl.8b v0, v0, v1
  %vshl_v.i = tail call <8 x i8> @llvm.arm.neon.vshifts.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vshl_v.i
}

define <4 x i16> @test_vshl_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vshl_s16:
; CHECK: sshl.4h v0, v0, v1
  %vshl_v2.i = tail call <4 x i16> @llvm.arm.neon.vshifts.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vshl_v2.i
}

define <2 x i32> @test_vshl_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vshl_s32:
; CHECK: sshl.2s v0, v0, v1
  %vshl_v2.i = tail call <2 x i32> @llvm.arm.neon.vshifts.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vshl_v2.i
}

define <1 x i64> @test_vshl_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vshl_s64:
; CHECK: sshl d0, d0, d1
  %vshl_v2.i = tail call <1 x i64> @llvm.arm.neon.vshifts.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vshl_v2.i
}

define <8 x i8> @test_vshl_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vshl_u8:
; CHECK: ushl.8b v0, v0, v1
  %vshl_v.i = tail call <8 x i8> @llvm.arm.neon.vshiftu.v8i8(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vshl_v.i
}

define <4 x i16> @test_vshl_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vshl_u16:
; CHECK: ushl.4h v0, v0, v1
  %vshl_v2.i = tail call <4 x i16> @llvm.arm.neon.vshiftu.v4i16(<4 x i16> %a, <4 x i16> %b) #5
  ret <4 x i16> %vshl_v2.i
}

define <2 x i32> @test_vshl_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vshl_u32:
; CHECK: ushl.2s v0, v0, v1
  %vshl_v2.i = tail call <2 x i32> @llvm.arm.neon.vshiftu.v2i32(<2 x i32> %a, <2 x i32> %b) #5
  ret <2 x i32> %vshl_v2.i
}

define <1 x i64> @test_vshl_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vshl_u64:
; CHECK: ushl d0, d0, d1
  %vshl_v2.i = tail call <1 x i64> @llvm.arm.neon.vshiftu.v1i64(<1 x i64> %a, <1 x i64> %b) #5
  ret <1 x i64> %vshl_v2.i
}

define <16 x i8> @test_vshlq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vshlq_s8:
; CHECK: sshl.16b v0, v0, v1
  %vshlq_v.i = tail call <16 x i8> @llvm.arm.neon.vshifts.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vshlq_v.i
}

define <8 x i16> @test_vshlq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vshlq_s16:
; CHECK: sshl.8h v0, v0, v1
  %vshlq_v2.i = tail call <8 x i16> @llvm.arm.neon.vshifts.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vshlq_v2.i
}

define <4 x i32> @test_vshlq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vshlq_s32:
; CHECK: sshl.4s v0, v0, v1
  %vshlq_v2.i = tail call <4 x i32> @llvm.arm.neon.vshifts.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vshlq_v2.i
}

define <2 x i64> @test_vshlq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vshlq_s64:
; CHECK: sshl.2d v0, v0, v1
  %vshlq_v2.i = tail call <2 x i64> @llvm.arm.neon.vshifts.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vshlq_v2.i
}

define <16 x i8> @test_vshlq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vshlq_u8:
; CHECK: ushl.16b v0, v0, v1
  %vshlq_v.i = tail call <16 x i8> @llvm.arm.neon.vshiftu.v16i8(<16 x i8> %a, <16 x i8> %b) #5
  ret <16 x i8> %vshlq_v.i
}

define <8 x i16> @test_vshlq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vshlq_u16:
; CHECK: ushl.8h v0, v0, v1
  %vshlq_v2.i = tail call <8 x i16> @llvm.arm.neon.vshiftu.v8i16(<8 x i16> %a, <8 x i16> %b) #5
  ret <8 x i16> %vshlq_v2.i
}

define <4 x i32> @test_vshlq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vshlq_u32:
; CHECK: ushl.4s v0, v0, v1
  %vshlq_v2.i = tail call <4 x i32> @llvm.arm.neon.vshiftu.v4i32(<4 x i32> %a, <4 x i32> %b) #5
  ret <4 x i32> %vshlq_v2.i
}

define <2 x i64> @test_vshlq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vshlq_u64:
; CHECK: ushl.2d v0, v0, v1
  %vshlq_v2.i = tail call <2 x i64> @llvm.arm.neon.vshiftu.v2i64(<2 x i64> %a, <2 x i64> %b) #5
  ret <2 x i64> %vshlq_v2.i
}

define <8 x i16> @test_vshll_n_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vshll_n_s8:
; CHECK: sshll.8h v0, v0, #1
  %t0 = sext <8 x i8> %a to <8 x i16>
  %vshll_n = shl <8 x i16> %t0, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  ret <8 x i16> %vshll_n
}

define <4 x i32> @test_vshll_n_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vshll_n_s16:
; CHECK: sshll.4s v0, v0, #1
  %t0 = sext <4 x i16> %a to <4 x i32>
  %vshll_n = shl <4 x i32> %t0, <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %vshll_n
}

define <2 x i64> @test_vshll_n_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vshll_n_s32:
; CHECK: sshll.2d v0, v0, #1
  %t0 = sext <2 x i32> %a to <2 x i64>
  %vshll_n = shl <2 x i64> %t0, <i64 1, i64 1>
  ret <2 x i64> %vshll_n
}

define <8 x i16> @test_vshll_n_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vshll_n_u8:
; CHECK: ushll.8h v0, v0, #1
  %t0 = zext <8 x i8> %a to <8 x i16>
  %vshll_n = shl <8 x i16> %t0, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  ret <8 x i16> %vshll_n
}

define <4 x i32> @test_vshll_n_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vshll_n_u16:
; CHECK: ushll.4s v0, v0, #1
  %t0 = zext <4 x i16> %a to <4 x i32>
  %vshll_n = shl <4 x i32> %t0, <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %vshll_n
}

define <2 x i64> @test_vshll_n_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vshll_n_u32:
; CHECK: ushll.2d v0, v0, #1
  %t0 = zext <2 x i32> %a to <2 x i64>
  %vshll_n = shl <2 x i64> %t0, <i64 1, i64 1>
  ret <2 x i64> %vshll_n
}

define <8 x i8> @test_vshl_n_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vshl_n_s8:
; CHECK: shl.8b v0, v0, #1
  %vshl_n = shl <8 x i8> %a, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <8 x i8> %vshl_n
}

define <4 x i16> @test_vshl_n_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vshl_n_s16:
; CHECK: shl.4h v0, v0, #1
  %vshl_n = shl <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  ret <4 x i16> %vshl_n
}

define <2 x i32> @test_vshl_n_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vshl_n_s32:
; CHECK: shl.2s v0, v0, #1
  %vshl_n = shl <2 x i32> %a, <i32 1, i32 1>
  ret <2 x i32> %vshl_n
}

define <1 x i64> @test_vshl_n_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vshl_n_s64:
; CHECK: shl d0, d0, #1
  %vshl_n = shl <1 x i64> %a, <i64 1>
  ret <1 x i64> %vshl_n
}

define <8 x i8> @test_vshl_n_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vshl_n_u8:
; CHECK: shl.8b v0, v0, #1
  %vshl_n = shl <8 x i8> %a, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <8 x i8> %vshl_n
}

define <4 x i16> @test_vshl_n_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vshl_n_u16:
; CHECK: shl.4h v0, v0, #1
  %vshl_n = shl <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  ret <4 x i16> %vshl_n
}

define <2 x i32> @test_vshl_n_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vshl_n_u32:
; CHECK: shl.2s v0, v0, #1
  %vshl_n = shl <2 x i32> %a, <i32 1, i32 1>
  ret <2 x i32> %vshl_n
}

define <1 x i64> @test_vshl_n_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vshl_n_u64:
; CHECK: shl d0, d0, #1
  %vshl_n = shl <1 x i64> %a, <i64 1>
  ret <1 x i64> %vshl_n
}

define <16 x i8> @test_vshlq_n_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vshlq_n_s8:
; CHECK: shl.16b v0, v0, #1
  %vshl_n = shl <16 x i8> %a, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <16 x i8> %vshl_n
}

define <8 x i16> @test_vshlq_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vshlq_n_s16:
; CHECK: shl.8h v0, v0, #1
  %vshl_n = shl <8 x i16> %a, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  ret <8 x i16> %vshl_n
}

define <4 x i32> @test_vshlq_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vshlq_n_s32:
; CHECK: shl.4s v0, v0, #1
  %vshl_n = shl <4 x i32> %a, <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %vshl_n
}

define <2 x i64> @test_vshlq_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vshlq_n_s64:
; CHECK: shl.2d v0, v0, #1
  %vshl_n = shl <2 x i64> %a, <i64 1, i64 1>
  ret <2 x i64> %vshl_n
}

define <16 x i8> @test_vshlq_n_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vshlq_n_u8:
; CHECK: shl.16b v0, v0, #1
  %vshl_n = shl <16 x i8> %a, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <16 x i8> %vshl_n
}

define <8 x i16> @test_vshlq_n_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vshlq_n_u16:
; CHECK: shl.8h v0, v0, #1
  %vshl_n = shl <8 x i16> %a, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  ret <8 x i16> %vshl_n
}

define <4 x i32> @test_vshlq_n_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vshlq_n_u32:
; CHECK: shl.4s v0, v0, #1
  %vshl_n = shl <4 x i32> %a, <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %vshl_n
}

define <2 x i64> @test_vshlq_n_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vshlq_n_u64:
; CHECK: shl.2d v0, v0, #1
  %vshl_n = shl <2 x i64> %a, <i64 1, i64 1>
  ret <2 x i64> %vshl_n
}

define <8 x i8> @test_vshrn_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vshrn_n_s16:
; CHECK: shrn.8b v0, v0, #1
  %t0 = ashr <8 x i16> %a, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %vshrn_n = trunc <8 x i16> %t0 to <8 x i8>
  ret <8 x i8> %vshrn_n
}

define <4 x i16> @test_vshrn_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vshrn_n_s32:
; CHECK: shrn.4h v0, v0, #1
  %t0 = ashr <4 x i32> %a, <i32 1, i32 1, i32 1, i32 1>
  %vshrn_n = trunc <4 x i32> %t0 to <4 x i16>
  ret <4 x i16> %vshrn_n
}

define <2 x i32> @test_vshrn_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vshrn_n_s64:
; CHECK: shrn.2s v0, v0, #1
  %t0 = ashr <2 x i64> %a, <i64 1, i64 1>
  %vshrn_n = trunc <2 x i64> %t0 to <2 x i32>
  ret <2 x i32> %vshrn_n
}

define <8 x i8> @test_vshrn_n_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vshrn_n_u16:
; CHECK: shrn.8b v0, v0, #1
  %t0 = lshr <8 x i16> %a, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %vshrn_n = trunc <8 x i16> %t0 to <8 x i8>
  ret <8 x i8> %vshrn_n
}

define <4 x i16> @test_vshrn_n_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vshrn_n_u32:
; CHECK: shrn.4h v0, v0, #1
  %t0 = lshr <4 x i32> %a, <i32 1, i32 1, i32 1, i32 1>
  %vshrn_n = trunc <4 x i32> %t0 to <4 x i16>
  ret <4 x i16> %vshrn_n
}

define <2 x i32> @test_vshrn_n_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vshrn_n_u64:
; CHECK: shrn.2s v0, v0, #1
  %t0 = lshr <2 x i64> %a, <i64 1, i64 1>
  %vshrn_n = trunc <2 x i64> %t0 to <2 x i32>
  ret <2 x i32> %vshrn_n
}

define <8 x i8> @test_vshr_n_s8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vshr_n_s8:
; CHECK: sshr.8b v0, v0, #1
  %vshr_n = ashr <8 x i8> %a, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <8 x i8> %vshr_n
}

define <4 x i16> @test_vshr_n_s16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vshr_n_s16:
; CHECK: sshr.4h v0, v0, #1
  %vshr_n = ashr <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  ret <4 x i16> %vshr_n
}

define <2 x i32> @test_vshr_n_s32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vshr_n_s32:
; CHECK: sshr.2s v0, v0, #1
  %vshr_n = ashr <2 x i32> %a, <i32 1, i32 1>
  ret <2 x i32> %vshr_n
}

define <1 x i64> @test_vshr_n_s64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vshr_n_s64:
; CHECK: sshr d0, d0, #1
  %vshr_n = ashr <1 x i64> %a, <i64 1>
  ret <1 x i64> %vshr_n
}

define <8 x i8> @test_vshr_n_u8(<8 x i8> %a) #0 {
; CHECK-LABEL: test_vshr_n_u8:
; CHECK: ushr.8b v0, v0, #1
  %vshr_n = lshr <8 x i8> %a, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <8 x i8> %vshr_n
}

define <4 x i16> @test_vshr_n_u16(<4 x i16> %a) #0 {
; CHECK-LABEL: test_vshr_n_u16:
; CHECK: ushr.4h v0, v0, #1
  %vshr_n = lshr <4 x i16> %a, <i16 1, i16 1, i16 1, i16 1>
  ret <4 x i16> %vshr_n
}

define <2 x i32> @test_vshr_n_u32(<2 x i32> %a) #0 {
; CHECK-LABEL: test_vshr_n_u32:
; CHECK: ushr.2s v0, v0, #1
  %vshr_n = lshr <2 x i32> %a, <i32 1, i32 1>
  ret <2 x i32> %vshr_n
}

define <1 x i64> @test_vshr_n_u64(<1 x i64> %a) #0 {
; CHECK-LABEL: test_vshr_n_u64:
; CHECK: ushr d0, d0, #1
  %vshr_n = lshr <1 x i64> %a, <i64 1>
  ret <1 x i64> %vshr_n
}

define <16 x i8> @test_vshrq_n_s8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vshrq_n_s8:
; CHECK: sshr.16b v0, v0, #1
  %vshr_n = ashr <16 x i8> %a, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <16 x i8> %vshr_n
}

define <8 x i16> @test_vshrq_n_s16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vshrq_n_s16:
; CHECK: sshr.8h v0, v0, #1
  %vshr_n = ashr <8 x i16> %a, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  ret <8 x i16> %vshr_n
}

define <4 x i32> @test_vshrq_n_s32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vshrq_n_s32:
; CHECK: sshr.4s v0, v0, #1
  %vshr_n = ashr <4 x i32> %a, <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %vshr_n
}

define <2 x i64> @test_vshrq_n_s64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vshrq_n_s64:
; CHECK: sshr.2d v0, v0, #1
  %vshr_n = ashr <2 x i64> %a, <i64 1, i64 1>
  ret <2 x i64> %vshr_n
}

define <16 x i8> @test_vshrq_n_u8(<16 x i8> %a) #0 {
; CHECK-LABEL: test_vshrq_n_u8:
; CHECK: ushr.16b v0, v0, #1
  %vshr_n = lshr <16 x i8> %a, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  ret <16 x i8> %vshr_n
}

define <8 x i16> @test_vshrq_n_u16(<8 x i16> %a) #0 {
; CHECK-LABEL: test_vshrq_n_u16:
; CHECK: ushr.8h v0, v0, #1
  %vshr_n = lshr <8 x i16> %a, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  ret <8 x i16> %vshr_n
}

define <4 x i32> @test_vshrq_n_u32(<4 x i32> %a) #0 {
; CHECK-LABEL: test_vshrq_n_u32:
; CHECK: ushr.4s v0, v0, #1
  %vshr_n = lshr <4 x i32> %a, <i32 1, i32 1, i32 1, i32 1>
  ret <4 x i32> %vshr_n
}

define <2 x i64> @test_vshrq_n_u64(<2 x i64> %a) #0 {
; CHECK-LABEL: test_vshrq_n_u64:
; CHECK: ushr.2d v0, v0, #1
  %vshr_n = lshr <2 x i64> %a, <i64 1, i64 1>
  ret <2 x i64> %vshr_n
}

define <8 x i8> @test_vsli_n_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsli_n_s8:
; CHECK: sli.8b v0, v1, #1
  %vsli_n = tail call <8 x i8> @llvm.arm.neon.vshiftins.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <8 x i8> %vsli_n
}

declare <8 x i8> @llvm.arm.neon.vshiftins.v8i8(<8 x i8>, <8 x i8>, <8 x i8>) #1

define <4 x i16> @test_vsli_n_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsli_n_s16:
; CHECK: sli.4h v0, v1, #1
  %vsli_n2 = tail call <4 x i16> @llvm.arm.neon.vshiftins.v4i16(<4 x i16> %a, <4 x i16> %b, <4 x i16> <i16 1, i16 1, i16 1, i16 1>)
  ret <4 x i16> %vsli_n2
}

declare <4 x i16> @llvm.arm.neon.vshiftins.v4i16(<4 x i16>, <4 x i16>, <4 x i16>) #1

define <2 x i32> @test_vsli_n_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsli_n_s32:
; CHECK: sli.2s v0, v1, #1
  %vsli_n2 = tail call <2 x i32> @llvm.arm.neon.vshiftins.v2i32(<2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 1>)
  ret <2 x i32> %vsli_n2
}

declare <2 x i32> @llvm.arm.neon.vshiftins.v2i32(<2 x i32>, <2 x i32>, <2 x i32>) #1

define <1 x i64> @test_vsli_n_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vsli_n_s64:
; CHECK: sli d0, d1, #1
  %vsli_n2 = tail call <1 x i64> @llvm.arm.neon.vshiftins.v1i64(<1 x i64> %a, <1 x i64> %b, <1 x i64> <i64 1>)
  ret <1 x i64> %vsli_n2
}

declare <1 x i64> @llvm.arm.neon.vshiftins.v1i64(<1 x i64>, <1 x i64>, <1 x i64>) #1

define <8 x i8> @test_vsli_n_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsli_n_u8:
; CHECK: sli.8b v0, v1, #1
  %vsli_n = tail call <8 x i8> @llvm.arm.neon.vshiftins.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <8 x i8> %vsli_n
}

define <4 x i16> @test_vsli_n_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsli_n_u16:
; CHECK: sli.4h v0, v1, #1
  %vsli_n2 = tail call <4 x i16> @llvm.arm.neon.vshiftins.v4i16(<4 x i16> %a, <4 x i16> %b, <4 x i16> <i16 1, i16 1, i16 1, i16 1>)
  ret <4 x i16> %vsli_n2
}

define <2 x i32> @test_vsli_n_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsli_n_u32:
; CHECK: sli.2s v0, v1, #1
  %vsli_n2 = tail call <2 x i32> @llvm.arm.neon.vshiftins.v2i32(<2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 1>)
  ret <2 x i32> %vsli_n2
}

define <1 x i64> @test_vsli_n_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vsli_n_u64:
; CHECK: sli d0, d1, #1
  %vsli_n2 = tail call <1 x i64> @llvm.arm.neon.vshiftins.v1i64(<1 x i64> %a, <1 x i64> %b, <1 x i64> <i64 1>)
  ret <1 x i64> %vsli_n2
}

define <8 x i8> @test_vsli_n_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsli_n_p8:
; CHECK: sli.8b v0, v1, #1
  %vsli_n = tail call <8 x i8> @llvm.arm.neon.vshiftins.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <8 x i8> %vsli_n
}

define <4 x i16> @test_vsli_n_p16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsli_n_p16:
; CHECK: sli.4h v0, v1, #1
  %vsli_n2 = tail call <4 x i16> @llvm.arm.neon.vshiftins.v4i16(<4 x i16> %a, <4 x i16> %b, <4 x i16> <i16 1, i16 1, i16 1, i16 1>)
  ret <4 x i16> %vsli_n2
}

define <16 x i8> @test_vsliq_n_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsliq_n_s8:
; CHECK: sli.16b v0, v1, #1
  %vsli_n = tail call <16 x i8> @llvm.arm.neon.vshiftins.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <16 x i8> %vsli_n
}

declare <16 x i8> @llvm.arm.neon.vshiftins.v16i8(<16 x i8>, <16 x i8>, <16 x i8>) #1

define <8 x i16> @test_vsliq_n_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsliq_n_s16:
; CHECK: sli.8h v0, v1, #1
  %vsli_n2 = tail call <8 x i16> @llvm.arm.neon.vshiftins.v8i16(<8 x i16> %a, <8 x i16> %b, <8 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>)
  ret <8 x i16> %vsli_n2
}

declare <8 x i16> @llvm.arm.neon.vshiftins.v8i16(<8 x i16>, <8 x i16>, <8 x i16>) #1

define <4 x i32> @test_vsliq_n_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsliq_n_s32:
; CHECK: sli.4s v0, v1, #1
  %vsli_n2 = tail call <4 x i32> @llvm.arm.neon.vshiftins.v4i32(<4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 1, i32 1, i32 1>)
  ret <4 x i32> %vsli_n2
}

declare <4 x i32> @llvm.arm.neon.vshiftins.v4i32(<4 x i32>, <4 x i32>, <4 x i32>) #1

define <2 x i64> @test_vsliq_n_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsliq_n_s64:
; CHECK: sli.2d v0, v1, #1
  %vsli_n2 = tail call <2 x i64> @llvm.arm.neon.vshiftins.v2i64(<2 x i64> %a, <2 x i64> %b, <2 x i64> <i64 1, i64 1>)
  ret <2 x i64> %vsli_n2
}

declare <2 x i64> @llvm.arm.neon.vshiftins.v2i64(<2 x i64>, <2 x i64>, <2 x i64>) #1

define <16 x i8> @test_vsliq_n_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsliq_n_u8:
; CHECK: sli.16b v0, v1, #1
  %vsli_n = tail call <16 x i8> @llvm.arm.neon.vshiftins.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <16 x i8> %vsli_n
}

define <8 x i16> @test_vsliq_n_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsliq_n_u16:
; CHECK: sli.8h v0, v1, #1
  %vsli_n2 = tail call <8 x i16> @llvm.arm.neon.vshiftins.v8i16(<8 x i16> %a, <8 x i16> %b, <8 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>)
  ret <8 x i16> %vsli_n2
}

define <4 x i32> @test_vsliq_n_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsliq_n_u32:
; CHECK: sli.4s v0, v1, #1
  %vsli_n2 = tail call <4 x i32> @llvm.arm.neon.vshiftins.v4i32(<4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 1, i32 1, i32 1>)
  ret <4 x i32> %vsli_n2
}

define <2 x i64> @test_vsliq_n_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsliq_n_u64:
; CHECK: sli.2d v0, v1, #1
  %vsli_n2 = tail call <2 x i64> @llvm.arm.neon.vshiftins.v2i64(<2 x i64> %a, <2 x i64> %b, <2 x i64> <i64 1, i64 1>)
  ret <2 x i64> %vsli_n2
}

define <16 x i8> @test_vsliq_n_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsliq_n_p8:
; CHECK: sli.16b v0, v1, #1
  %vsli_n = tail call <16 x i8> @llvm.arm.neon.vshiftins.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>)
  ret <16 x i8> %vsli_n
}

define <8 x i16> @test_vsliq_n_p16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsliq_n_p16:
; CHECK: sli.8h v0, v1, #1
  %vsli_n2 = tail call <8 x i16> @llvm.arm.neon.vshiftins.v8i16(<8 x i16> %a, <8 x i16> %b, <8 x i16> <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>)
  ret <8 x i16> %vsli_n2
}

define <8 x i8> @test_vsra_n_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsra_n_s8:
; CHECK: ssra.8b v0, v1, #1
  %vsra_n = ashr <8 x i8> %b, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %t0 = add <8 x i8> %vsra_n, %a
  ret <8 x i8> %t0
}

define <4 x i16> @test_vsra_n_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsra_n_s16:
; CHECK: ssra.4h v0, v1, #1
  %vsra_n = ashr <4 x i16> %b, <i16 1, i16 1, i16 1, i16 1>
  %t0 = add <4 x i16> %vsra_n, %a
  ret <4 x i16> %t0
}

define <2 x i32> @test_vsra_n_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsra_n_s32:
; CHECK: ssra.2s v0, v1, #1
  %vsra_n = ashr <2 x i32> %b, <i32 1, i32 1>
  %t0 = add <2 x i32> %vsra_n, %a
  ret <2 x i32> %t0
}

define <1 x i64> @test_vsra_n_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vsra_n_s64:
; CHECK: ssra d0, d1, #1
  %vsra_n = ashr <1 x i64> %b, <i64 1>
  %t0 = add <1 x i64> %vsra_n, %a
  ret <1 x i64> %t0
}

define <8 x i8> @test_vsra_n_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsra_n_u8:
; CHECK: usra.8b v0, v1, #1
  %vsra_n = lshr <8 x i8> %b, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %t0 = add <8 x i8> %vsra_n, %a
  ret <8 x i8> %t0
}

define <4 x i16> @test_vsra_n_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsra_n_u16:
; CHECK: usra.4h v0, v1, #1
  %vsra_n = lshr <4 x i16> %b, <i16 1, i16 1, i16 1, i16 1>
  %t0 = add <4 x i16> %vsra_n, %a
  ret <4 x i16> %t0
}

define <2 x i32> @test_vsra_n_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsra_n_u32:
; CHECK: usra.2s v0, v1, #1
  %vsra_n = lshr <2 x i32> %b, <i32 1, i32 1>
  %t0 = add <2 x i32> %vsra_n, %a
  ret <2 x i32> %t0
}

define <1 x i64> @test_vsra_n_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vsra_n_u64:
; CHECK: usra d0, d1, #1
  %vsra_n = lshr <1 x i64> %b, <i64 1>
  %t0 = add <1 x i64> %vsra_n, %a
  ret <1 x i64> %t0
}

define <16 x i8> @test_vsraq_n_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsraq_n_s8:
; CHECK: ssra.16b v0, v1, #1
  %vsra_n = ashr <16 x i8> %b, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %t0 = add <16 x i8> %vsra_n, %a
  ret <16 x i8> %t0
}

define <8 x i16> @test_vsraq_n_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsraq_n_s16:
; CHECK: ssra.8h v0, v1, #1
  %vsra_n = ashr <8 x i16> %b, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %t0 = add <8 x i16> %vsra_n, %a
  ret <8 x i16> %t0
}

define <4 x i32> @test_vsraq_n_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsraq_n_s32:
; CHECK: ssra.4s v0, v1, #1
  %vsra_n = ashr <4 x i32> %b, <i32 1, i32 1, i32 1, i32 1>
  %t0 = add <4 x i32> %vsra_n, %a
  ret <4 x i32> %t0
}

define <2 x i64> @test_vsraq_n_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsraq_n_s64:
; CHECK: ssra.2d v0, v1, #1
  %vsra_n = ashr <2 x i64> %b, <i64 1, i64 1>
  %t0 = add <2 x i64> %vsra_n, %a
  ret <2 x i64> %t0
}

define <16 x i8> @test_vsraq_n_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsraq_n_u8:
; CHECK: usra.16b v0, v1, #1
  %vsra_n = lshr <16 x i8> %b, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %t0 = add <16 x i8> %vsra_n, %a
  ret <16 x i8> %t0
}

define <8 x i16> @test_vsraq_n_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsraq_n_u16:
; CHECK: usra.8h v0, v1, #1
  %vsra_n = lshr <8 x i16> %b, <i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1>
  %t0 = add <8 x i16> %vsra_n, %a
  ret <8 x i16> %t0
}

define <4 x i32> @test_vsraq_n_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsraq_n_u32:
; CHECK: usra.4s v0, v1, #1
  %vsra_n = lshr <4 x i32> %b, <i32 1, i32 1, i32 1, i32 1>
  %t0 = add <4 x i32> %vsra_n, %a
  ret <4 x i32> %t0
}

define <2 x i64> @test_vsraq_n_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsraq_n_u64:
; CHECK: usra.2d v0, v1, #1
  %vsra_n = lshr <2 x i64> %b, <i64 1, i64 1>
  %t0 = add <2 x i64> %vsra_n, %a
  ret <2 x i64> %t0
}

define <8 x i8> @test_vsri_n_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsri_n_s8:
; CHECK: sri.8b v0, v1, #1
  %vsli_n = tail call <8 x i8> @llvm.arm.neon.vshiftins.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <8 x i8> %vsli_n
}

define <4 x i16> @test_vsri_n_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsri_n_s16:
; CHECK: sri.4h v0, v1, #1
  %vsli_n2 = tail call <4 x i16> @llvm.arm.neon.vshiftins.v4i16(<4 x i16> %a, <4 x i16> %b, <4 x i16> <i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <4 x i16> %vsli_n2
}

define <2 x i32> @test_vsri_n_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsri_n_s32:
; CHECK: sri.2s v0, v1, #1
  %vsli_n2 = tail call <2 x i32> @llvm.arm.neon.vshiftins.v2i32(<2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 -1, i32 -1>)
  ret <2 x i32> %vsli_n2
}

define <1 x i64> @test_vsri_n_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vsri_n_s64:
; CHECK: sri d0, d1, #1
  %vsli_n2 = tail call <1 x i64> @llvm.arm.neon.vshiftins.v1i64(<1 x i64> %a, <1 x i64> %b, <1 x i64> <i64 -1>)
  ret <1 x i64> %vsli_n2
}

define <8 x i8> @test_vsri_n_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsri_n_u8:
; CHECK: sri.8b v0, v1, #1
  %vsli_n = tail call <8 x i8> @llvm.arm.neon.vshiftins.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <8 x i8> %vsli_n
}

define <4 x i16> @test_vsri_n_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsri_n_u16:
; CHECK: sri.4h v0, v1, #1
  %vsli_n2 = tail call <4 x i16> @llvm.arm.neon.vshiftins.v4i16(<4 x i16> %a, <4 x i16> %b, <4 x i16> <i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <4 x i16> %vsli_n2
}

define <2 x i32> @test_vsri_n_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsri_n_u32:
; CHECK: sri.2s v0, v1, #1
  %vsli_n2 = tail call <2 x i32> @llvm.arm.neon.vshiftins.v2i32(<2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 -1, i32 -1>)
  ret <2 x i32> %vsli_n2
}

define <1 x i64> @test_vsri_n_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vsri_n_u64:
; CHECK: sri d0, d1, #1
  %vsli_n2 = tail call <1 x i64> @llvm.arm.neon.vshiftins.v1i64(<1 x i64> %a, <1 x i64> %b, <1 x i64> <i64 -1>)
  ret <1 x i64> %vsli_n2
}

define <8 x i8> @test_vsri_n_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsri_n_p8:
; CHECK: sri.8b v0, v1, #1
  %vsli_n = tail call <8 x i8> @llvm.arm.neon.vshiftins.v8i8(<8 x i8> %a, <8 x i8> %b, <8 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <8 x i8> %vsli_n
}

define <4 x i16> @test_vsri_n_p16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsri_n_p16:
; CHECK: sri.4h v0, v1, #1
  %vsli_n2 = tail call <4 x i16> @llvm.arm.neon.vshiftins.v4i16(<4 x i16> %a, <4 x i16> %b, <4 x i16> <i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <4 x i16> %vsli_n2
}

define <16 x i8> @test_vsriq_n_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsriq_n_s8:
; CHECK: sri.16b v0, v1, #1
  %vsli_n = tail call <16 x i8> @llvm.arm.neon.vshiftins.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <16 x i8> %vsli_n
}

define <8 x i16> @test_vsriq_n_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsriq_n_s16:
; CHECK: sri.8h v0, v1, #1
  %vsli_n2 = tail call <8 x i16> @llvm.arm.neon.vshiftins.v8i16(<8 x i16> %a, <8 x i16> %b, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i16> %vsli_n2
}

define <4 x i32> @test_vsriq_n_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsriq_n_s32:
; CHECK: sri.4s v0, v1, #1
  %vsli_n2 = tail call <4 x i32> @llvm.arm.neon.vshiftins.v4i32(<4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i32> %vsli_n2
}

define <2 x i64> @test_vsriq_n_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsriq_n_s64:
; CHECK: sri.2d v0, v1, #1
  %vsli_n2 = tail call <2 x i64> @llvm.arm.neon.vshiftins.v2i64(<2 x i64> %a, <2 x i64> %b, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i64> %vsli_n2
}

define <16 x i8> @test_vsriq_n_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsriq_n_u8:
; CHECK: sri.16b v0, v1, #1
  %vsli_n = tail call <16 x i8> @llvm.arm.neon.vshiftins.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <16 x i8> %vsli_n
}

define <8 x i16> @test_vsriq_n_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsriq_n_u16:
; CHECK: sri.8h v0, v1, #1
  %vsli_n2 = tail call <8 x i16> @llvm.arm.neon.vshiftins.v8i16(<8 x i16> %a, <8 x i16> %b, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i16> %vsli_n2
}

define <4 x i32> @test_vsriq_n_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsriq_n_u32:
; CHECK: sri.4s v0, v1, #1
  %vsli_n2 = tail call <4 x i32> @llvm.arm.neon.vshiftins.v4i32(<4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 -1, i32 -1, i32 -1, i32 -1>)
  ret <4 x i32> %vsli_n2
}

define <2 x i64> @test_vsriq_n_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsriq_n_u64:
; CHECK: sri.2d v0, v1, #1
  %vsli_n2 = tail call <2 x i64> @llvm.arm.neon.vshiftins.v2i64(<2 x i64> %a, <2 x i64> %b, <2 x i64> <i64 -1, i64 -1>)
  ret <2 x i64> %vsli_n2
}

define <16 x i8> @test_vsriq_n_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsriq_n_p8:
; CHECK: sri.16b v0, v1, #1
  %vsli_n = tail call <16 x i8> @llvm.arm.neon.vshiftins.v16i8(<16 x i8> %a, <16 x i8> %b, <16 x i8> <i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1, i8 -1>)
  ret <16 x i8> %vsli_n
}

define <8 x i16> @test_vsriq_n_p16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsriq_n_p16:
; CHECK: sri.8h v0, v1, #1
  %vsli_n2 = tail call <8 x i16> @llvm.arm.neon.vshiftins.v8i16(<8 x i16> %a, <8 x i16> %b, <8 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>)
  ret <8 x i16> %vsli_n2
}

define void @test_vst1q_u8(i8* %a, <16 x i8> %b) #4 {
; CHECK-LABEL: test_vst1q_u8:
; CHECK: str  q0, [x0]
  tail call void @llvm.arm.neon.vst1.v16i8(i8* %a, <16 x i8> %b, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst1.v16i8(i8*, <16 x i8>, i32) #5

define void @test_vst1q_u16(i16* %a, <8 x i16> %b) #4 {
; CHECK-LABEL: test_vst1q_u16:
; CHECK: str  q0, [x0]
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst1.v8i16(i8* %t0, <8 x i16> %b, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst1.v8i16(i8*, <8 x i16>, i32) #5

define void @test_vst1q_u32(i32* %a, <4 x i32> %b) #4 {
; CHECK-LABEL: test_vst1q_u32:
; CHECK: str  q0, [x0]
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst1.v4i32(i8* %t0, <4 x i32> %b, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst1.v4i32(i8*, <4 x i32>, i32) #5

define void @test_vst1q_u64(i64* %a, <2 x i64> %b) #4 {
; CHECK-LABEL: test_vst1q_u64:
; CHECK: str  q0, [x0]
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst1.v2i64(i8* %t0, <2 x i64> %b, i32 8)
  ret void
}

declare void @llvm.arm.neon.vst1.v2i64(i8*, <2 x i64>, i32) #5

define void @test_vst1q_s8(i8* %a, <16 x i8> %b) #4 {
; CHECK-LABEL: test_vst1q_s8:
; CHECK: str  q0, [x0]
  tail call void @llvm.arm.neon.vst1.v16i8(i8* %a, <16 x i8> %b, i32 1)
  ret void
}

define void @test_vst1q_s16(i16* %a, <8 x i16> %b) #4 {
; CHECK-LABEL: test_vst1q_s16:
; CHECK: str  q0, [x0]
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst1.v8i16(i8* %t0, <8 x i16> %b, i32 2)
  ret void
}

define void @test_vst1q_s32(i32* %a, <4 x i32> %b) #4 {
; CHECK-LABEL: test_vst1q_s32:
; CHECK: str  q0, [x0]
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst1.v4i32(i8* %t0, <4 x i32> %b, i32 4)
  ret void
}

define void @test_vst1q_s64(i64* %a, <2 x i64> %b) #4 {
; CHECK-LABEL: test_vst1q_s64:
; CHECK: str  q0, [x0]
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst1.v2i64(i8* %t0, <2 x i64> %b, i32 8)
  ret void
}

define void @test_vst1q_f16(i16* %a, <8 x i16> %b) #4 {
; CHECK-LABEL: test_vst1q_f16:
; CHECK: str  q0, [x0]
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst1.v8i16(i8* %t0, <8 x i16> %b, i32 2)
  ret void
}

define void @test_vst1q_f32(float* %a, <4 x float> %b) #4 {
; CHECK-LABEL: test_vst1q_f32:
; CHECK: str  q0, [x0]
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst1.v4f32(i8* %t0, <4 x float> %b, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst1.v4f32(i8*, <4 x float>, i32) #5

define void @test_vst1q_p8(i8* %a, <16 x i8> %b) #4 {
; CHECK-LABEL: test_vst1q_p8:
; CHECK: str  q0, [x0]
  tail call void @llvm.arm.neon.vst1.v16i8(i8* %a, <16 x i8> %b, i32 1)
  ret void
}

define void @test_vst1q_p16(i16* %a, <8 x i16> %b) #4 {
; CHECK-LABEL: test_vst1q_p16:
; CHECK: str  q0, [x0]
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst1.v8i16(i8* %t0, <8 x i16> %b, i32 2)
  ret void
}

define void @test_vst1_u8(i8* %a, <8 x i8> %b) #4 {
; CHECK-LABEL: test_vst1_u8:
; CHECK: str  d0, [x0]
  tail call void @llvm.arm.neon.vst1.v8i8(i8* %a, <8 x i8> %b, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst1.v8i8(i8*, <8 x i8>, i32) #5

define void @test_vst1_u16(i16* %a, <4 x i16> %b) #4 {
; CHECK-LABEL: test_vst1_u16:
; CHECK: str  d0, [x0]
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst1.v4i16(i8* %t0, <4 x i16> %b, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst1.v4i16(i8*, <4 x i16>, i32) #5

define void @test_vst1_u32(i32* %a, <2 x i32> %b) #4 {
; CHECK-LABEL: test_vst1_u32:
; CHECK: str  d0, [x0]
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst1.v2i32(i8* %t0, <2 x i32> %b, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst1.v2i32(i8*, <2 x i32>, i32) #5

define void @test_vst1_u64(i64* %a, <1 x i64> %b) #4 {
; CHECK-LABEL: test_vst1_u64:
; CHECK: str  d0, [x0]
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst1.v1i64(i8* %t0, <1 x i64> %b, i32 8)
  ret void
}

declare void @llvm.arm.neon.vst1.v1i64(i8*, <1 x i64>, i32) #5

define void @test_vst1_s8(i8* %a, <8 x i8> %b) #4 {
; CHECK-LABEL: test_vst1_s8:
; CHECK: str  d0, [x0]
  tail call void @llvm.arm.neon.vst1.v8i8(i8* %a, <8 x i8> %b, i32 1)
  ret void
}

define void @test_vst1_s16(i16* %a, <4 x i16> %b) #4 {
; CHECK-LABEL: test_vst1_s16:
; CHECK: str  d0, [x0]
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst1.v4i16(i8* %t0, <4 x i16> %b, i32 2)
  ret void
}

define void @test_vst1_s32(i32* %a, <2 x i32> %b) #4 {
; CHECK-LABEL: test_vst1_s32:
; CHECK: str  d0, [x0]
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst1.v2i32(i8* %t0, <2 x i32> %b, i32 4)
  ret void
}

define void @test_vst1_s64(i64* %a, <1 x i64> %b) #4 {
; CHECK-LABEL: test_vst1_s64:
; CHECK: str  d0, [x0]
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst1.v1i64(i8* %t0, <1 x i64> %b, i32 8)
  ret void
}

define void @test_vst1_f16(i16* %a, <4 x i16> %b) #4 {
; CHECK-LABEL: test_vst1_f16:
; CHECK: str  d0, [x0]
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst1.v4i16(i8* %t0, <4 x i16> %b, i32 2)
  ret void
}

define void @test_vst1_f32(float* %a, <2 x float> %b) #4 {
; CHECK-LABEL: test_vst1_f32:
; CHECK: str  d0, [x0]
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst1.v2f32(i8* %t0, <2 x float> %b, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst1.v2f32(i8*, <2 x float>, i32) #5

define void @test_vst1_p8(i8* %a, <8 x i8> %b) #4 {
; CHECK-LABEL: test_vst1_p8:
; CHECK: str  d0, [x0]
  tail call void @llvm.arm.neon.vst1.v8i8(i8* %a, <8 x i8> %b, i32 1)
  ret void
}

define void @test_vst1_p16(i16* %a, <4 x i16> %b) #4 {
; CHECK-LABEL: test_vst1_p16:
; CHECK: str  d0, [x0]
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst1.v4i16(i8* %t0, <4 x i16> %b, i32 2)
  ret void
}

define void @test_vst1q_lane_u8(i8* nocapture %a, <16 x i8> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_u8:
; CHECK: st1.b { v0 }[15], [x0]
  %t0 = extractelement <16 x i8> %b, i32 15
  store i8 %t0, i8* %a, align 1
  ret void
}

define void @test_vst1q_lane_u16(i16* nocapture %a, <8 x i16> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_u16:
; CHECK: st1.h { v0 }[7], [x0]
  %t0 = extractelement <8 x i16> %b, i32 7
  store i16 %t0, i16* %a, align 2
  ret void
}

define void @test_vst1q_lane_u32(i32* nocapture %a, <4 x i32> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_u32:
; CHECK: st1.s { v0 }[3], [x0]
  %t0 = extractelement <4 x i32> %b, i32 3
  store i32 %t0, i32* %a, align 4
  ret void
}

define void @test_vst1q_lane_u64(i64* %a, <2 x i64> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_u64:
; CHECK: ext.16b v0, v0, v0, #8
; CHECK: str  d0, [x0]
  %t0 = bitcast i64* %a to i8*
  %t1 = shufflevector <2 x i64> %b, <2 x i64> undef, <1 x i32> <i32 1>
  tail call void @llvm.arm.neon.vst1.v1i64(i8* %t0, <1 x i64> %t1, i32 8)
  ret void
}

define void @test_vst1q_lane_s8(i8* nocapture %a, <16 x i8> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_s8:
; CHECK: st1.b { v0 }[15], [x0]
  %t0 = extractelement <16 x i8> %b, i32 15
  store i8 %t0, i8* %a, align 1
  ret void
}

define void @test_vst1q_lane_s16(i16* nocapture %a, <8 x i16> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_s16:
; CHECK: st1.h { v0 }[7], [x0]
  %t0 = extractelement <8 x i16> %b, i32 7
  store i16 %t0, i16* %a, align 2
  ret void
}

define void @test_vst1q_lane_s32(i32* nocapture %a, <4 x i32> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_s32:
; CHECK: st1.s { v0 }[3], [x0]
  %t0 = extractelement <4 x i32> %b, i32 3
  store i32 %t0, i32* %a, align 4
  ret void
}

define void @test_vst1q_lane_s64(i64* %a, <2 x i64> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_s64:
; CHECK: ext.16b v0, v0, v0, #8
; CHECK: str  d0, [x0]
  %t0 = bitcast i64* %a to i8*
  %t1 = shufflevector <2 x i64> %b, <2 x i64> undef, <1 x i32> <i32 1>
  tail call void @llvm.arm.neon.vst1.v1i64(i8* %t0, <1 x i64> %t1, i32 8)
  ret void
}

define void @test_vst1q_lane_f16(i16* nocapture %a, <8 x i16> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_f16:
; CHECK: st1.h  { v0 }[7], [x0]
  %t0 = extractelement <8 x i16> %b, i32 7
  store i16 %t0, i16* %a, align 2
  ret void
}

define void @test_vst1q_lane_f32(float* nocapture %a, <4 x float> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_f32:
; CHECK: st1.s { v0 }[3], [x0]
  %t0 = extractelement <4 x float> %b, i32 3
  store float %t0, float* %a, align 4
  ret void
}

define void @test_vst1q_lane_p8(i8* nocapture %a, <16 x i8> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_p8:
; CHECK: st1.b { v0 }[15], [x0]
  %t0 = extractelement <16 x i8> %b, i32 15
  store i8 %t0, i8* %a, align 1
  ret void
}

define void @test_vst1q_lane_p16(i16* nocapture %a, <8 x i16> %b) #4 {
; CHECK-LABEL: test_vst1q_lane_p16:
; CHECK: st1.h { v0 }[7], [x0]
  %t0 = extractelement <8 x i16> %b, i32 7
  store i16 %t0, i16* %a, align 2
  ret void
}

define void @test_vst1_lane_u8(i8* nocapture %a, <8 x i8> %b) #4 {
; CHECK-LABEL: test_vst1_lane_u8:
; CHECK: st1.b  { v0 }[7], [x0]
  %t0 = extractelement <8 x i8> %b, i32 7
  store i8 %t0, i8* %a, align 1
  ret void
}

define void @test_vst1_lane_u16(i16* nocapture %a, <4 x i16> %b) #4 {
; CHECK-LABEL: test_vst1_lane_u16:
; CHECK: st1.h  { v0 }[3], [x0]
  %t0 = extractelement <4 x i16> %b, i32 3
  store i16 %t0, i16* %a, align 2
  ret void
}

define void @test_vst1_lane_u32(i32* nocapture %a, <2 x i32> %b) #4 {
; CHECK-LABEL: test_vst1_lane_u32:
; CHECK: st1.s  { v0 }[1], [x0]
  %t0 = extractelement <2 x i32> %b, i32 1
  store i32 %t0, i32* %a, align 4
  ret void
}

define void @test_vst1_lane_u64(i64* nocapture %a, <1 x i64> %b) #4 {
; CHECK-LABEL: test_vst1_lane_u64:
; CHECK: str d0, [x0]
  %t0 = extractelement <1 x i64> %b, i32 0
  store i64 %t0, i64* %a, align 8
  ret void
}

define void @test_vst1_lane_s8(i8* nocapture %a, <8 x i8> %b) #4 {
; CHECK-LABEL: test_vst1_lane_s8:
; CHECK: st1.b { v0 }[7], [x0]
  %t0 = extractelement <8 x i8> %b, i32 7
  store i8 %t0, i8* %a, align 1
  ret void
}

define void @test_vst1_lane_s16(i16* nocapture %a, <4 x i16> %b) #4 {
; CHECK-LABEL: test_vst1_lane_s16:
; CHECK: st1.h  { v0 }[3], [x0]
  %t0 = extractelement <4 x i16> %b, i32 3
  store i16 %t0, i16* %a, align 2
  ret void
}

define void @test_vst1_lane_s32(i32* nocapture %a, <2 x i32> %b) #4 {
; CHECK-LABEL: test_vst1_lane_s32:
; CHECK: st1.s  { v0 }[1], [x0]
  %t0 = extractelement <2 x i32> %b, i32 1
  store i32 %t0, i32* %a, align 4
  ret void
}

define void @test_vst1_lane_s64(i64* nocapture %a, <1 x i64> %b) #4 {
; CHECK-LABEL: test_vst1_lane_s64:
; CHECK: str d0, [x0]
  %t0 = extractelement <1 x i64> %b, i32 0
  store i64 %t0, i64* %a, align 8
  ret void
}

define void @test_vst1_lane_f16(i16* nocapture %a, <4 x i16> %b) #4 {
; CHECK-LABEL: test_vst1_lane_f16:
; CHECK: st1.h { v0 }[3], [x0]
  %t0 = extractelement <4 x i16> %b, i32 3
  store i16 %t0, i16* %a, align 2
  ret void
}

define void @test_vst1_lane_f32(float* nocapture %a, <2 x float> %b) #4 {
; CHECK-LABEL: test_vst1_lane_f32:
; CHECK: st1.s  { v0 }[1], [x0]
  %t0 = extractelement <2 x float> %b, i32 1
  store float %t0, float* %a, align 4
  ret void
}

define void @test_vst1_lane_p8(i8* nocapture %a, <8 x i8> %b) #4 {
; CHECK-LABEL: test_vst1_lane_p8:
; CHECK: st1.b { v0 }[7], [x0]
  %t0 = extractelement <8 x i8> %b, i32 7
  store i8 %t0, i8* %a, align 1
  ret void
}

define void @test_vst1_lane_p16(i16* nocapture %a, <4 x i16> %b) #4 {
; CHECK-LABEL: test_vst1_lane_p16:
; CHECK: st1.h { v0 }[3], [x0]
  %t0 = extractelement <4 x i16> %b, i32 3
  store i16 %t0, i16* %a, align 2
  ret void
}

define void @test_vst2q_u8(i8* %a, [2 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_u8:
; CHECK: st2.16b { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <16 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst2.v16i8(i8*, <16 x i8>, <16 x i8>, i32) #5

define void @test_vst2q_u16(i16* %a, [2 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_u16:
; CHECK: st2.8h { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst2.v8i16(i8*, <8 x i16>, <8 x i16>, i32) #5

define void @test_vst2q_u32(i32* %a, [2 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_u32:
; CHECK: st2.4s { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst2.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst2.v4i32(i8*, <4 x i32>, <4 x i32>, i32) #5

define void @test_vst2q_s8(i8* %a, [2 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_s8:
; CHECK: st2.16b { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <16 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, i32 1)
  ret void
}

define void @test_vst2q_s16(i16* %a, [2 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_s16:
; CHECK: st2.8h { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 2)
  ret void
}

define void @test_vst2q_s32(i32* %a, [2 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_s32:
; CHECK: st2.4s { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst2.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, i32 4)
  ret void
}

define void @test_vst2q_f16(i16* %a, [2 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_f16:
; CHECK: st2.8h { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 2)
  ret void
}

define void @test_vst2q_f32(float* %a, [2 x <4 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_f32:
; CHECK: st2.4s { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x float>] %b.coerce, 1
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst2.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst2.v4f32(i8*, <4 x float>, <4 x float>, i32) #5

define void @test_vst2q_p8(i8* %a, [2 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_p8:
; CHECK: st2.16b { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <16 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, i32 1)
  ret void
}

define void @test_vst2q_p16(i16* %a, [2 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_p16:
; CHECK: st2.8h { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 2)
  ret void
}

define void @test_vst2_u8(i8* %a, [2 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_u8:
; CHECK: st2.8b { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst2.v8i8(i8*, <8 x i8>, <8 x i8>, i32) #5

define void @test_vst2_u16(i16* %a, [2 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_u16:
; CHECK: st2.4h { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst2.v4i16(i8*, <4 x i16>, <4 x i16>, i32) #5

define void @test_vst2_u32(i32* %a, [2 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_u32:
; CHECK: st2.2s { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst2.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst2.v2i32(i8*, <2 x i32>, <2 x i32>, i32) #5

define void @test_vst2_u64(i64* %a, [2 x <1 x i64>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_u64:
; CHECK: st1.1d { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <1 x i64>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <1 x i64>] %b.coerce, 1
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst2.v1i64(i8* %t0, <1 x i64> %b.coerce.fca.0.extract, <1 x i64> %b.coerce.fca.1.extract, i32 8)
  ret void
}

declare void @llvm.arm.neon.vst2.v1i64(i8*, <1 x i64>, <1 x i64>, i32) #5

define void @test_vst2_s8(i8* %a, [2 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_s8:
; CHECK: st2.8b { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 1)
  ret void
}

define void @test_vst2_s16(i16* %a, [2 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_s16:
; CHECK: st2.4h { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 2)
  ret void
}

define void @test_vst2_s32(i32* %a, [2 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_s32:
; CHECK: st2.2s { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst2.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, i32 4)
  ret void
}

define void @test_vst2_s64(i64* %a, [2 x <1 x i64>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_s64:
; CHECK: st1.1d { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <1 x i64>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <1 x i64>] %b.coerce, 1
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst2.v1i64(i8* %t0, <1 x i64> %b.coerce.fca.0.extract, <1 x i64> %b.coerce.fca.1.extract, i32 8)
  ret void
}

define void @test_vst2_f16(i16* %a, [2 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_f16:
; CHECK: st2.4h { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 2)
  ret void
}

define void @test_vst2_f32(float* %a, [2 x <2 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_f32:
; CHECK: st2.2s { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x float>] %b.coerce, 1
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst2.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst2.v2f32(i8*, <2 x float>, <2 x float>, i32) #5

define void @test_vst2_p8(i8* %a, [2 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_p8:
; CHECK: st2.8b { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 1)
  ret void
}

define void @test_vst2_p16(i16* %a, [2 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_p16:
; CHECK: st2.4h { v0, v1 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 2)
  ret void
}

define void @test_vst2q_lane_u16(i16* %a, [2 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_lane_u16:
; CHECK: st2.h { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 7, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst2lane.v8i16(i8*, <8 x i16>, <8 x i16>, i32, i32) #5

define void @test_vst2q_lane_u32(i32* %a, [2 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_lane_u32:
; CHECK: st2.s { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, i32 3, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst2lane.v4i32(i8*, <4 x i32>, <4 x i32>, i32, i32) #5

define void @test_vst2q_lane_s16(i16* %a, [2 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_lane_s16:
; CHECK: st2.h { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 7, i32 2)
  ret void
}

define void @test_vst2q_lane_s32(i32* %a, [2 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_lane_s32:
; CHECK: st2.s { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, i32 3, i32 4)
  ret void
}

define void @test_vst2q_lane_f16(i16* %a, [2 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_lane_f16:
; CHECK: st2.h { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 7, i32 2)
  ret void
}

define void @test_vst2q_lane_f32(float* %a, [2 x <4 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_lane_f32:
; CHECK: st2.s { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x float>] %b.coerce, 1
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, i32 3, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst2lane.v4f32(i8*, <4 x float>, <4 x float>, i32, i32) #5

define void @test_vst2q_lane_p16(i16* %a, [2 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2q_lane_p16:
; CHECK: st2.h { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, i32 7, i32 2)
  ret void
}

define void @test_vst2_lane_u8(i8* %a, [2 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_u8:
; CHECK: st2.b { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 7, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst2lane.v8i8(i8*, <8 x i8>, <8 x i8>, i32, i32) #5

define void @test_vst2_lane_u16(i16* %a, [2 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_u16:
; CHECK: st2.h { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 3, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst2lane.v4i16(i8*, <4 x i16>, <4 x i16>, i32, i32) #5

define void @test_vst2_lane_u32(i32* %a, [2 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_u32:
; CHECK: st2.s { v0, v1 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, i32 1, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst2lane.v2i32(i8*, <2 x i32>, <2 x i32>, i32, i32) #5

define void @test_vst2_lane_s8(i8* %a, [2 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_s8:
; CHECK: st2.b { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 7, i32 1)
  ret void
}

define void @test_vst2_lane_s16(i16* %a, [2 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_s16:
; CHECK: st2.h { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 3, i32 2)
  ret void
}

define void @test_vst2_lane_s32(i32* %a, [2 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_s32:
; CHECK: st2.s { v0, v1 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x i32>] %b.coerce, 1
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, i32 1, i32 4)
  ret void
}

define void @test_vst2_lane_f16(i16* %a, [2 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_f16:
; CHECK: st2.h { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 3, i32 2)
  ret void
}

define void @test_vst2_lane_f32(float* %a, [2 x <2 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_f32:
; CHECK: st2.s { v0, v1 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <2 x float>] %b.coerce, 1
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, i32 1, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst2lane.v2f32(i8*, <2 x float>, <2 x float>, i32, i32) #5

define void @test_vst2_lane_p8(i8* %a, [2 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_p8:
; CHECK: st2.b { v0, v1 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <8 x i8>] %b.coerce, 1
  tail call void @llvm.arm.neon.vst2lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, i32 7, i32 1)
  ret void
}

define void @test_vst2_lane_p16(i16* %a, [2 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst2_lane_p16:
; CHECK: st2.h { v0, v1 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [2 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [2 x <4 x i16>] %b.coerce, 1
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst2lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, i32 3, i32 2)
  ret void
}

define void @test_vst3q_u8(i8* %a, [3 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_u8:
; CHECK: st3.16b { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <16 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <16 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, <16 x i8> %b.coerce.fca.2.extract, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst3.v16i8(i8*, <16 x i8>, <16 x i8>, <16 x i8>, i32) #5

define void @test_vst3q_u16(i16* %a, [3 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_u16:
; CHECK: st3.8h { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst3.v8i16(i8*, <8 x i16>, <8 x i16>, <8 x i16>, i32) #5

define void @test_vst3q_u32(i32* %a, [3 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_u32:
; CHECK: st3.4s { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst3.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst3.v4i32(i8*, <4 x i32>, <4 x i32>, <4 x i32>, i32) #5

define void @test_vst3q_s8(i8* %a, [3 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_s8:
; CHECK: st3.16b { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <16 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <16 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, <16 x i8> %b.coerce.fca.2.extract, i32 1)
  ret void
}

define void @test_vst3q_s16(i16* %a, [3 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_s16:
; CHECK: st3.8h { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 2)
  ret void
}

define void @test_vst3q_s32(i32* %a, [3 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_s32:
; CHECK: st3.4s { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst3.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, i32 4)
  ret void
}

define void @test_vst3q_f16(i16* %a, [3 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_f16:
; CHECK: st3.8h { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 2)
  ret void
}

define void @test_vst3q_f32(float* %a, [3 x <4 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_f32:
; CHECK: st3.4s { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x float>] %b.coerce, 2
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst3.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, <4 x float> %b.coerce.fca.2.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst3.v4f32(i8*, <4 x float>, <4 x float>, <4 x float>, i32) #5

define void @test_vst3q_p8(i8* %a, [3 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_p8:
; CHECK: st3.16b { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <16 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <16 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, <16 x i8> %b.coerce.fca.2.extract, i32 1)
  ret void
}

define void @test_vst3q_p16(i16* %a, [3 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_p16:
; CHECK: st3.8h { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 2)
  ret void
}

define void @test_vst3_u8(i8* %a, [3 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_u8:
; CHECK: st3.8b { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst3.v8i8(i8*, <8 x i8>, <8 x i8>, <8 x i8>, i32) #5

define void @test_vst3_u16(i16* %a, [3 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_u16:
; CHECK: st3.4h { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst3.v4i16(i8*, <4 x i16>, <4 x i16>, <4 x i16>, i32) #5

define void @test_vst3_u32(i32* %a, [3 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_u32:
; CHECK: st3.2s { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst3.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst3.v2i32(i8*, <2 x i32>, <2 x i32>, <2 x i32>, i32) #5

define void @test_vst3_u64(i64* %a, [3 x <1 x i64>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_u64:
; CHECK: st1.1d { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <1 x i64>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <1 x i64>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <1 x i64>] %b.coerce, 2
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst3.v1i64(i8* %t0, <1 x i64> %b.coerce.fca.0.extract, <1 x i64> %b.coerce.fca.1.extract, <1 x i64> %b.coerce.fca.2.extract, i32 8)
  ret void
}

declare void @llvm.arm.neon.vst3.v1i64(i8*, <1 x i64>, <1 x i64>, <1 x i64>, i32) #5

define void @test_vst3_s8(i8* %a, [3 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_s8:
; CHECK: st3.8b { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 1)
  ret void
}

define void @test_vst3_s16(i16* %a, [3 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_s16:
; CHECK: st3.4h { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 2)
  ret void
}

define void @test_vst3_s32(i32* %a, [3 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_s32:
; CHECK: st3.2s { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst3.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, i32 4)
  ret void
}

define void @test_vst3_s64(i64* %a, [3 x <1 x i64>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_s64:
; CHECK: st1.1d { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <1 x i64>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <1 x i64>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <1 x i64>] %b.coerce, 2
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst3.v1i64(i8* %t0, <1 x i64> %b.coerce.fca.0.extract, <1 x i64> %b.coerce.fca.1.extract, <1 x i64> %b.coerce.fca.2.extract, i32 8)
  ret void
}

define void @test_vst3_f16(i16* %a, [3 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_f16:
; CHECK: st3.4h { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 2)
  ret void
}

define void @test_vst3_f32(float* %a, [3 x <2 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_f32:
; CHECK: st3.2s { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x float>] %b.coerce, 2
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst3.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, <2 x float> %b.coerce.fca.2.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst3.v2f32(i8*, <2 x float>, <2 x float>, <2 x float>, i32) #5

define void @test_vst3_p8(i8* %a, [3 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_p8:
; CHECK: st3.8b { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 1)
  ret void
}

define void @test_vst3_p16(i16* %a, [3 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_p16:
; CHECK: st3.4h { v0, v1, v2 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 2)
  ret void
}

define void @test_vst3q_lane_u16(i16* %a, [3 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_lane_u16:
; CHECK: st3.h { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 7, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst3lane.v8i16(i8*, <8 x i16>, <8 x i16>, <8 x i16>, i32, i32) #5

define void @test_vst3q_lane_u32(i32* %a, [3 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_lane_u32:
; CHECK: st3.s { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, i32 3, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst3lane.v4i32(i8*, <4 x i32>, <4 x i32>, <4 x i32>, i32, i32) #5

define void @test_vst3q_lane_s16(i16* %a, [3 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_lane_s16:
; CHECK: st3.h { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 7, i32 2)
  ret void
}

define void @test_vst3q_lane_s32(i32* %a, [3 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_lane_s32:
; CHECK: st3.s { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, i32 3, i32 4)
  ret void
}

define void @test_vst3q_lane_f16(i16* %a, [3 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_lane_f16:
; CHECK: st3.h { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 7, i32 2)
  ret void
}

define void @test_vst3q_lane_f32(float* %a, [3 x <4 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_lane_f32:
; CHECK: st3.s { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x float>] %b.coerce, 2
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, <4 x float> %b.coerce.fca.2.extract, i32 3, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst3lane.v4f32(i8*, <4 x float>, <4 x float>, <4 x float>, i32, i32) #5

define void @test_vst3q_lane_p16(i16* %a, [3 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3q_lane_p16:
; CHECK: st3.h { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, i32 7, i32 2)
  ret void
}

define void @test_vst3_lane_u8(i8* %a, [3 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_u8:
; CHECK: st3.b { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 7, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst3lane.v8i8(i8*, <8 x i8>, <8 x i8>, <8 x i8>, i32, i32) #5

define void @test_vst3_lane_u16(i16* %a, [3 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_u16:
; CHECK: st3.h { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 3, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst3lane.v4i16(i8*, <4 x i16>, <4 x i16>, <4 x i16>, i32, i32) #5

define void @test_vst3_lane_u32(i32* %a, [3 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_u32:
; CHECK: st3.s { v0, v1, v2 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, i32 1, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst3lane.v2i32(i8*, <2 x i32>, <2 x i32>, <2 x i32>, i32, i32) #5

define void @test_vst3_lane_s8(i8* %a, [3 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_s8:
; CHECK: st3.b { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 7, i32 1)
  ret void
}

define void @test_vst3_lane_s16(i16* %a, [3 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_s16:
; CHECK: st3.h { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 3, i32 2)
  ret void
}

define void @test_vst3_lane_s32(i32* %a, [3 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_s32:
; CHECK: st3.s { v0, v1, v2 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x i32>] %b.coerce, 2
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, i32 1, i32 4)
  ret void
}

define void @test_vst3_lane_f16(i16* %a, [3 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_f16:
; CHECK: st3.h { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 3, i32 2)
  ret void
}

define void @test_vst3_lane_f32(float* %a, [3 x <2 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_f32:
; CHECK: st3.s { v0, v1, v2 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <2 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <2 x float>] %b.coerce, 2
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, <2 x float> %b.coerce.fca.2.extract, i32 1, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst3lane.v2f32(i8*, <2 x float>, <2 x float>, <2 x float>, i32, i32) #5

define void @test_vst3_lane_p8(i8* %a, [3 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_p8:
; CHECK: st3.b { v0, v1, v2 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <8 x i8>] %b.coerce, 2
  tail call void @llvm.arm.neon.vst3lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, i32 7, i32 1)
  ret void
}

define void @test_vst3_lane_p16(i16* %a, [3 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst3_lane_p16:
; CHECK: st3.h { v0, v1, v2 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [3 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [3 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [3 x <4 x i16>] %b.coerce, 2
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst3lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, i32 3, i32 2)
  ret void
}

define void @test_vst4q_u8(i8* %a, [4 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_u8:
; CHECK: st4.16b { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <16 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <16 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <16 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, <16 x i8> %b.coerce.fca.2.extract, <16 x i8> %b.coerce.fca.3.extract, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst4.v16i8(i8*, <16 x i8>, <16 x i8>, <16 x i8>, <16 x i8>, i32) #5

define void @test_vst4q_u16(i16* %a, [4 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_u16:
; CHECK: st4.8h { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst4.v8i16(i8*, <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16>, i32) #5

define void @test_vst4q_u32(i32* %a, [4 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_u32:
; CHECK: st4.4s { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst4.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, <4 x i32> %b.coerce.fca.3.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst4.v4i32(i8*, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, i32) #5

define void @test_vst4q_s8(i8* %a, [4 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_s8:
; CHECK: st4.16b { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <16 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <16 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <16 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, <16 x i8> %b.coerce.fca.2.extract, <16 x i8> %b.coerce.fca.3.extract, i32 1)
  ret void
}

define void @test_vst4q_s16(i16* %a, [4 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_s16:
; CHECK: st4.8h { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 2)
  ret void
}

define void @test_vst4q_s32(i32* %a, [4 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_s32:
; CHECK: st4.4s { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst4.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, <4 x i32> %b.coerce.fca.3.extract, i32 4)
  ret void
}

define void @test_vst4q_f16(i16* %a, [4 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_f16:
; CHECK: st4.8h { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 2)
  ret void
}

define void @test_vst4q_f32(float* %a, [4 x <4 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_f32:
; CHECK: st4.4s { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x float>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x float>] %b.coerce, 3
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst4.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, <4 x float> %b.coerce.fca.2.extract, <4 x float> %b.coerce.fca.3.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst4.v4f32(i8*, <4 x float>, <4 x float>, <4 x float>, <4 x float>, i32) #5

define void @test_vst4q_p8(i8* %a, [4 x <16 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_p8:
; CHECK: st4.16b { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <16 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <16 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <16 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <16 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4.v16i8(i8* %a, <16 x i8> %b.coerce.fca.0.extract, <16 x i8> %b.coerce.fca.1.extract, <16 x i8> %b.coerce.fca.2.extract, <16 x i8> %b.coerce.fca.3.extract, i32 1)
  ret void
}

define void @test_vst4q_p16(i16* %a, [4 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_p16:
; CHECK: st4.8h { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 2)
  ret void
}

define void @test_vst4_u8(i8* %a, [4 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_u8:
; CHECK: st4.8b { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst4.v8i8(i8*, <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>, i32) #5

define void @test_vst4_u16(i16* %a, [4 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_u16:
; CHECK: st4.4h { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst4.v4i16(i8*, <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16>, i32) #5

define void @test_vst4_u32(i32* %a, [4 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_u32:
; CHECK: st4.2s { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst4.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, <2 x i32> %b.coerce.fca.3.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst4.v2i32(i8*, <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32>, i32) #5

define void @test_vst4_u64(i64* %a, [4 x <1 x i64>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_u64:
; CHECK: st1.1d { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <1 x i64>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <1 x i64>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <1 x i64>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <1 x i64>] %b.coerce, 3
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst4.v1i64(i8* %t0, <1 x i64> %b.coerce.fca.0.extract, <1 x i64> %b.coerce.fca.1.extract, <1 x i64> %b.coerce.fca.2.extract, <1 x i64> %b.coerce.fca.3.extract, i32 8)
  ret void
}

declare void @llvm.arm.neon.vst4.v1i64(i8*, <1 x i64>, <1 x i64>, <1 x i64>, <1 x i64>, i32) #5

define void @test_vst4_s8(i8* %a, [4 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_s8:
; CHECK: st4.8b { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 1)
  ret void
}

define void @test_vst4_s16(i16* %a, [4 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_s16:
; CHECK: st4.4h { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 2)
  ret void
}

define void @test_vst4_s32(i32* %a, [4 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_s32:
; CHECK: st4.2s { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst4.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, <2 x i32> %b.coerce.fca.3.extract, i32 4)
  ret void
}

define void @test_vst4_s64(i64* %a, [4 x <1 x i64>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_s64:
; CHECK: st1.1d { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <1 x i64>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <1 x i64>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <1 x i64>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <1 x i64>] %b.coerce, 3
  %t0 = bitcast i64* %a to i8*
  tail call void @llvm.arm.neon.vst4.v1i64(i8* %t0, <1 x i64> %b.coerce.fca.0.extract, <1 x i64> %b.coerce.fca.1.extract, <1 x i64> %b.coerce.fca.2.extract, <1 x i64> %b.coerce.fca.3.extract, i32 8)
  ret void
}

define void @test_vst4_f16(i16* %a, [4 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_f16:
; CHECK: st4.4h { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 2)
  ret void
}

define void @test_vst4_f32(float* %a, [4 x <2 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_f32:
; CHECK: st4.2s { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x float>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x float>] %b.coerce, 3
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst4.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, <2 x float> %b.coerce.fca.2.extract, <2 x float> %b.coerce.fca.3.extract, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst4.v2f32(i8*, <2 x float>, <2 x float>, <2 x float>, <2 x float>, i32) #5

define void @test_vst4_p8(i8* %a, [4 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_p8:
; CHECK: st4.8b { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 1)
  ret void
}

define void @test_vst4_p16(i16* %a, [4 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_p16:
; CHECK: st4.4h { v0, v1, v2, v3 }, [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 2)
  ret void
}

define void @test_vst4q_lane_u16(i16* %a, [4 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_lane_u16:
; CHECK: st4.h { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 7, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst4lane.v8i16(i8*, <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16>, i32, i32) #5

define void @test_vst4q_lane_u32(i32* %a, [4 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_lane_u32:
; CHECK: st4.s { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, <4 x i32> %b.coerce.fca.3.extract, i32 3, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst4lane.v4i32(i8*, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, i32, i32) #5

define void @test_vst4q_lane_s16(i16* %a, [4 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_lane_s16:
; CHECK: st4.h { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 7, i32 2)
  ret void
}

define void @test_vst4q_lane_s32(i32* %a, [4 x <4 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_lane_s32:
; CHECK: st4.s { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v4i32(i8* %t0, <4 x i32> %b.coerce.fca.0.extract, <4 x i32> %b.coerce.fca.1.extract, <4 x i32> %b.coerce.fca.2.extract, <4 x i32> %b.coerce.fca.3.extract, i32 3, i32 4)
  ret void
}

define void @test_vst4q_lane_f16(i16* %a, [4 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_lane_f16:
; CHECK: st4.h { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 7, i32 2)
  ret void
}

define void @test_vst4q_lane_f32(float* %a, [4 x <4 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_lane_f32:
; CHECK: st4.s { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x float>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x float>] %b.coerce, 3
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v4f32(i8* %t0, <4 x float> %b.coerce.fca.0.extract, <4 x float> %b.coerce.fca.1.extract, <4 x float> %b.coerce.fca.2.extract, <4 x float> %b.coerce.fca.3.extract, i32 3, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst4lane.v4f32(i8*, <4 x float>, <4 x float>, <4 x float>, <4 x float>, i32, i32) #5

define void @test_vst4q_lane_p16(i16* %a, [4 x <8 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4q_lane_p16:
; CHECK: st4.h { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v8i16(i8* %t0, <8 x i16> %b.coerce.fca.0.extract, <8 x i16> %b.coerce.fca.1.extract, <8 x i16> %b.coerce.fca.2.extract, <8 x i16> %b.coerce.fca.3.extract, i32 7, i32 2)
  ret void
}

define void @test_vst4_lane_u8(i8* %a, [4 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_u8:
; CHECK: st4.b { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 7, i32 1)
  ret void
}

declare void @llvm.arm.neon.vst4lane.v8i8(i8*, <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>, i32, i32) #5

define void @test_vst4_lane_u16(i16* %a, [4 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_u16:
; CHECK: st4.h { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 3, i32 2)
  ret void
}

declare void @llvm.arm.neon.vst4lane.v4i16(i8*, <4 x i16>, <4 x i16>, <4 x i16>, <4 x i16>, i32, i32) #5

define void @test_vst4_lane_u32(i32* %a, [4 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_u32:
; CHECK: st4.s { v0, v1, v2, v3 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, <2 x i32> %b.coerce.fca.3.extract, i32 1, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst4lane.v2i32(i8*, <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32>, i32, i32) #5

define void @test_vst4_lane_s8(i8* %a, [4 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_s8:
; CHECK: st4.b { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 7, i32 1)
  ret void
}

define void @test_vst4_lane_s16(i16* %a, [4 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_s16:
; CHECK: st4.h { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 3, i32 2)
  ret void
}

define void @test_vst4_lane_s32(i32* %a, [4 x <2 x i32>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_s32:
; CHECK: st4.s { v0, v1, v2, v3 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x i32>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x i32>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x i32>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x i32>] %b.coerce, 3
  %t0 = bitcast i32* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v2i32(i8* %t0, <2 x i32> %b.coerce.fca.0.extract, <2 x i32> %b.coerce.fca.1.extract, <2 x i32> %b.coerce.fca.2.extract, <2 x i32> %b.coerce.fca.3.extract, i32 1, i32 4)
  ret void
}

define void @test_vst4_lane_f16(i16* %a, [4 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_f16:
; CHECK: st4.h { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 3, i32 2)
  ret void
}

define void @test_vst4_lane_f32(float* %a, [4 x <2 x float>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_f32:
; CHECK: st4.s { v0, v1, v2, v3 }[1], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <2 x float>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <2 x float>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <2 x float>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <2 x float>] %b.coerce, 3
  %t0 = bitcast float* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v2f32(i8* %t0, <2 x float> %b.coerce.fca.0.extract, <2 x float> %b.coerce.fca.1.extract, <2 x float> %b.coerce.fca.2.extract, <2 x float> %b.coerce.fca.3.extract, i32 1, i32 4)
  ret void
}

declare void @llvm.arm.neon.vst4lane.v2f32(i8*, <2 x float>, <2 x float>, <2 x float>, <2 x float>, i32, i32) #5

define void @test_vst4_lane_p8(i8* %a, [4 x <8 x i8>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_p8:
; CHECK: st4.b { v0, v1, v2, v3 }[7], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <8 x i8>] %b.coerce, 3
  tail call void @llvm.arm.neon.vst4lane.v8i8(i8* %a, <8 x i8> %b.coerce.fca.0.extract, <8 x i8> %b.coerce.fca.1.extract, <8 x i8> %b.coerce.fca.2.extract, <8 x i8> %b.coerce.fca.3.extract, i32 7, i32 1)
  ret void
}

define void @test_vst4_lane_p16(i16* %a, [4 x <4 x i16>] %b.coerce) #4 {
; CHECK-LABEL: test_vst4_lane_p16:
; CHECK: st4.h { v0, v1, v2, v3 }[3], [x0]
  %b.coerce.fca.0.extract = extractvalue [4 x <4 x i16>] %b.coerce, 0
  %b.coerce.fca.1.extract = extractvalue [4 x <4 x i16>] %b.coerce, 1
  %b.coerce.fca.2.extract = extractvalue [4 x <4 x i16>] %b.coerce, 2
  %b.coerce.fca.3.extract = extractvalue [4 x <4 x i16>] %b.coerce, 3
  %t0 = bitcast i16* %a to i8*
  tail call void @llvm.arm.neon.vst4lane.v4i16(i8* %t0, <4 x i16> %b.coerce.fca.0.extract, <4 x i16> %b.coerce.fca.1.extract, <4 x i16> %b.coerce.fca.2.extract, <4 x i16> %b.coerce.fca.3.extract, i32 3, i32 2)
  ret void
}

define <8 x i8> @test_vsub_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsub_s8:
; CHECK: sub.8b v0, v0, v1
  %sub.i = sub <8 x i8> %a, %b
  ret <8 x i8> %sub.i
}

define <4 x i16> @test_vsub_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsub_s16:
; CHECK: sub.4h v0, v0, v1
  %sub.i = sub <4 x i16> %a, %b
  ret <4 x i16> %sub.i
}

define <2 x i32> @test_vsub_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsub_s32:
; CHECK: sub.2s v0, v0, v1
  %sub.i = sub <2 x i32> %a, %b
  ret <2 x i32> %sub.i
}

define <1 x i64> @test_vsub_s64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vsub_s64:
; CHECK: sub d0, d0, d1
  %sub.i = sub <1 x i64> %a, %b
  ret <1 x i64> %sub.i
}

define <2 x float> @test_vsub_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vsub_f32:
; CHECK: fsub.2s v0, v0, v1
  %sub.i = fsub <2 x float> %a, %b
  ret <2 x float> %sub.i
}

define <8 x i8> @test_vsub_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsub_u8:
; CHECK: sub.8b v0, v0, v1
  %sub.i = sub <8 x i8> %a, %b
  ret <8 x i8> %sub.i
}

define <4 x i16> @test_vsub_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsub_u16:
; CHECK: sub.4h v0, v0, v1
  %sub.i = sub <4 x i16> %a, %b
  ret <4 x i16> %sub.i
}

define <2 x i32> @test_vsub_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsub_u32:
; CHECK: sub.2s v0, v0, v1
  %sub.i = sub <2 x i32> %a, %b
  ret <2 x i32> %sub.i
}

define <1 x i64> @test_vsub_u64(<1 x i64> %a, <1 x i64> %b) #0 {
; CHECK-LABEL: test_vsub_u64:
; CHECK: sub d0, d0, d1
  %sub.i = sub <1 x i64> %a, %b
  ret <1 x i64> %sub.i
}

define <16 x i8> @test_vsubq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsubq_s8:
; CHECK: sub.16b v0, v0, v1
  %sub.i = sub <16 x i8> %a, %b
  ret <16 x i8> %sub.i
}

define <8 x i16> @test_vsubq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsubq_s16:
; CHECK: sub.8h v0, v0, v1
  %sub.i = sub <8 x i16> %a, %b
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vsubq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsubq_s32:
; CHECK: sub.4s v0, v0, v1
  %sub.i = sub <4 x i32> %a, %b
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vsubq_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsubq_s64:
; CHECK: sub.2d v0, v0, v1
  %sub.i = sub <2 x i64> %a, %b
  ret <2 x i64> %sub.i
}

define <4 x float> @test_vsubq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vsubq_f32:
; CHECK: fsub.4s v0, v0, v1
  %sub.i = fsub <4 x float> %a, %b
  ret <4 x float> %sub.i
}

define <16 x i8> @test_vsubq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vsubq_u8:
; CHECK: sub.16b v0, v0, v1
  %sub.i = sub <16 x i8> %a, %b
  ret <16 x i8> %sub.i
}

define <8 x i16> @test_vsubq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsubq_u16:
; CHECK: sub.8h v0, v0, v1
  %sub.i = sub <8 x i16> %a, %b
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vsubq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsubq_u32:
; CHECK: sub.4s v0, v0, v1
  %sub.i = sub <4 x i32> %a, %b
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vsubq_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsubq_u64:
; CHECK: sub.2d v0, v0, v1
  %sub.i = sub <2 x i64> %a, %b
  ret <2 x i64> %sub.i
}

define <8 x i8> @test_vsubhn_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsubhn_s16:
; CHECK: subhn.8b v0, v0, v1
  %vsubhn.i = sub <8 x i16> %a, %b
  %vsubhn1.i = lshr <8 x i16> %vsubhn.i, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %vsubhn2.i = trunc <8 x i16> %vsubhn1.i to <8 x i8>
  ret <8 x i8> %vsubhn2.i
}

define <4 x i16> @test_vsubhn_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsubhn_s32:
; CHECK: subhn.4h v0, v0, v1
  %vsubhn.i = sub <4 x i32> %a, %b
  %vsubhn1.i = lshr <4 x i32> %vsubhn.i, <i32 16, i32 16, i32 16, i32 16>
  %vsubhn2.i = trunc <4 x i32> %vsubhn1.i to <4 x i16>
  ret <4 x i16> %vsubhn2.i
}

define <2 x i32> @test_vsubhn_s64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsubhn_s64:
; CHECK: subhn.2s v0, v0, v1
  %vsubhn.i = sub <2 x i64> %a, %b
  %vsubhn1.i = lshr <2 x i64> %vsubhn.i, <i64 32, i64 32>
  %vsubhn2.i = trunc <2 x i64> %vsubhn1.i to <2 x i32>
  ret <2 x i32> %vsubhn2.i
}

define <8 x i8> @test_vsubhn_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vsubhn_u16:
; CHECK: subhn.8b v0, v0, v1
  %vsubhn.i = sub <8 x i16> %a, %b
  %vsubhn1.i = lshr <8 x i16> %vsubhn.i, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %vsubhn2.i = trunc <8 x i16> %vsubhn1.i to <8 x i8>
  ret <8 x i8> %vsubhn2.i
}

define <4 x i16> @test_vsubhn_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vsubhn_u32:
; CHECK: subhn.4h v0, v0, v1
  %vsubhn.i = sub <4 x i32> %a, %b
  %vsubhn1.i = lshr <4 x i32> %vsubhn.i, <i32 16, i32 16, i32 16, i32 16>
  %vsubhn2.i = trunc <4 x i32> %vsubhn1.i to <4 x i16>
  ret <4 x i16> %vsubhn2.i
}

define <2 x i32> @test_vsubhn_u64(<2 x i64> %a, <2 x i64> %b) #0 {
; CHECK-LABEL: test_vsubhn_u64:
; CHECK: subhn.2s v0, v0, v1
  %vsubhn.i = sub <2 x i64> %a, %b
  %vsubhn1.i = lshr <2 x i64> %vsubhn.i, <i64 32, i64 32>
  %vsubhn2.i = trunc <2 x i64> %vsubhn1.i to <2 x i32>
  ret <2 x i32> %vsubhn2.i
}

define <8 x i16> @test_vsubl_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsubl_s8:
; CHECK: ssubl.8h v0, v0, v1
  %vmovl.i.i = sext <8 x i8> %a to <8 x i16>
  %vmovl.i2.i = sext <8 x i8> %b to <8 x i16>
  %sub.i = sub nsw <8 x i16> %vmovl.i.i, %vmovl.i2.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vsubl_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsubl_s16:
; CHECK: ssubl.4s v0, v0, v1
  %vmovl.i.i = sext <4 x i16> %a to <4 x i32>
  %vmovl.i2.i = sext <4 x i16> %b to <4 x i32>
  %sub.i = sub nsw <4 x i32> %vmovl.i.i, %vmovl.i2.i
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vsubl_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsubl_s32:
; CHECK: ssubl.2d v0, v0, v1
  %vmovl.i.i = sext <2 x i32> %a to <2 x i64>
  %vmovl.i2.i = sext <2 x i32> %b to <2 x i64>
  %sub.i = sub nsw <2 x i64> %vmovl.i.i, %vmovl.i2.i
  ret <2 x i64> %sub.i
}

define <8 x i16> @test_vsubl_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsubl_u8:
; CHECK: usubl.8h v0, v0, v1
  %vmovl.i.i = zext <8 x i8> %a to <8 x i16>
  %vmovl.i2.i = zext <8 x i8> %b to <8 x i16>
  %sub.i = sub nsw <8 x i16> %vmovl.i.i, %vmovl.i2.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vsubl_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsubl_u16:
; CHECK: usubl.4s v0, v0, v1
  %vmovl.i.i = zext <4 x i16> %a to <4 x i32>
  %vmovl.i2.i = zext <4 x i16> %b to <4 x i32>
  %sub.i = sub nsw <4 x i32> %vmovl.i.i, %vmovl.i2.i
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vsubl_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsubl_u32:
; CHECK: usubl.2d v0, v0, v1
  %vmovl.i.i = zext <2 x i32> %a to <2 x i64>
  %vmovl.i2.i = zext <2 x i32> %b to <2 x i64>
  %sub.i = sub nsw <2 x i64> %vmovl.i.i, %vmovl.i2.i
  ret <2 x i64> %sub.i
}

define <8 x i16> @test_vsubw_s8(<8 x i16> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsubw_s8:
; CHECK: ssubw.8h v0, v0, v1
  %vmovl.i.i = sext <8 x i8> %b to <8 x i16>
  %sub.i = sub <8 x i16> %a, %vmovl.i.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vsubw_s16(<4 x i32> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsubw_s16:
; CHECK: ssubw.4s v0, v0, v1
  %vmovl.i.i = sext <4 x i16> %b to <4 x i32>
  %sub.i = sub <4 x i32> %a, %vmovl.i.i
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vsubw_s32(<2 x i64> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsubw_s32:
; CHECK: ssubw.2d v0, v0, v1
  %vmovl.i.i = sext <2 x i32> %b to <2 x i64>
  %sub.i = sub <2 x i64> %a, %vmovl.i.i
  ret <2 x i64> %sub.i
}

define <8 x i16> @test_vsubw_u8(<8 x i16> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vsubw_u8:
; CHECK: usubw.8h v0, v0, v1
  %vmovl.i.i = zext <8 x i8> %b to <8 x i16>
  %sub.i = sub <8 x i16> %a, %vmovl.i.i
  ret <8 x i16> %sub.i
}

define <4 x i32> @test_vsubw_u16(<4 x i32> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vsubw_u16:
; CHECK: usubw.4s v0, v0, v1
  %vmovl.i.i = zext <4 x i16> %b to <4 x i32>
  %sub.i = sub <4 x i32> %a, %vmovl.i.i
  ret <4 x i32> %sub.i
}

define <2 x i64> @test_vsubw_u32(<2 x i64> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vsubw_u32:
; CHECK: usubw.2d v0, v0, v1
  %vmovl.i.i = zext <2 x i32> %b to <2 x i64>
  %sub.i = sub <2 x i64> %a, %vmovl.i.i
  ret <2 x i64> %sub.i
}

define <8 x i8> @test_vtbl1_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl1_u8:
; CHECK: movi.16b v2, #0
; CHECK: mov.d v0[1], v2[0]
; CHECK: tbl.8b v0, { v0 }, v1
  %vtbl1.i = tail call <8 x i8> @llvm.arm.neon.vtbl1(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vtbl1.i
}

define <8 x i8> @test_vtbl1_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl1_s8:
; CHECK: movi.16b v2, #0
; CHECK: mov.d v0[1], v2[0]
; CHECK: tbl.8b v0, { v0 }, v1
  %vtbl1.i = tail call <8 x i8> @llvm.arm.neon.vtbl1(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vtbl1.i
}

define <8 x i8> @test_vtbl1_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl1_p8:
; CHECK: movi.16b v2, #0
; CHECK: mov.d v0[1], v2[0]
; CHECK: tbl.8b v0, { v0 }, v1
  %vtbl1.i = tail call <8 x i8> @llvm.arm.neon.vtbl1(<8 x i8> %a, <8 x i8> %b) #5
  ret <8 x i8> %vtbl1.i
}

define <8 x i8> @test_vtbl2_u8([2 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl2_u8:
; CHECK: mov.d v0[1], v1[0]
; CHECK: tbl.8b v0, { v0 }, v2
  %__p0.coerce.fca.0.extract.i = extractvalue [2 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [2 x <8 x i8>] %a.coerce, 1
  %vtbl2.i = tail call <8 x i8> @llvm.arm.neon.vtbl2(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl2.i
}

define <8 x i8> @test_vtbl2_s8([2 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl2_s8:
; CHECK: mov.d v0[1], v1[0]
; CHECK: tbl.8b v0, { v0 }, v2
  %__p0.coerce.fca.0.extract.i = extractvalue [2 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [2 x <8 x i8>] %a.coerce, 1
  %vtbl2.i = tail call <8 x i8> @llvm.arm.neon.vtbl2(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl2.i
}

define <8 x i8> @test_vtbl2_p8([2 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl2_p8:
; CHECK: mov.d v0[1], v1[0]
; CHECK: tbl.8b v0, { v0 }, v2
  %__p0.coerce.fca.0.extract.i = extractvalue [2 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [2 x <8 x i8>] %a.coerce, 1
  %vtbl2.i = tail call <8 x i8> @llvm.arm.neon.vtbl2(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl2.i
}

define <8 x i8> @test_vtbl3_u8([3 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl3_u8:
; CHECK: mov.16b  v5, v2
; CHECK: mov.16b  v4, v0
; CHECK: mov.d v4[1], v1[0]
; CHECK: movi.16b v0, #0
; CHECK: mov.d v5[1], v0[0]
; CHECK: tbl.8b v0, { v4, v5 }, v3
  %__p0.coerce.fca.0.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 1
  %__p0.coerce.fca.2.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 2
  %vtbl3.i = tail call <8 x i8> @llvm.arm.neon.vtbl3(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %__p0.coerce.fca.2.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl3.i
}

define <8 x i8> @test_vtbl3_s8([3 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl3_s8:
; CHECK: mov.16b  v5, v2
; CHECK: mov.16b  v4, v0
; CHECK: mov.d v4[1], v1[0]
; CHECK: movi.16b v0, #0
; CHECK: mov.d v5[1], v0[0]
; CHECK: tbl.8b v0, { v4, v5 }, v3
  %__p0.coerce.fca.0.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 1
  %__p0.coerce.fca.2.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 2
  %vtbl3.i = tail call <8 x i8> @llvm.arm.neon.vtbl3(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %__p0.coerce.fca.2.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl3.i
}

define <8 x i8> @test_vtbl3_p8([3 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl3_p8:
; CHECK: mov.16b  v5, v2
; CHECK: mov.16b  v4, v0
; CHECK: mov.d v4[1], v1[0]
; CHECK: movi.16b v0, #0
; CHECK: mov.d v5[1], v0[0]
; CHECK: tbl.8b v0, { v4, v5 }, v3
  %__p0.coerce.fca.0.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 1
  %__p0.coerce.fca.2.extract.i = extractvalue [3 x <8 x i8>] %a.coerce, 2
  %vtbl3.i = tail call <8 x i8> @llvm.arm.neon.vtbl3(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %__p0.coerce.fca.2.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl3.i
}

define <8 x i8> @test_vtbl4_u8([4 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl4_u8:
; CHECK: mov.16b  v6, v2
; CHECK: mov.16b  v5, v0
; CHECK: mov.d v5[1], v1[0]
; CHECK: mov.d v6[1], v3[0]
; CHECK: tbl.8b v0, { v5, v6 }, v4
  %__p0.coerce.fca.0.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 1
  %__p0.coerce.fca.2.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 2
  %__p0.coerce.fca.3.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 3
  %vtbl4.i = tail call <8 x i8> @llvm.arm.neon.vtbl4(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %__p0.coerce.fca.2.extract.i, <8 x i8> %__p0.coerce.fca.3.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl4.i
}

define <8 x i8> @test_vtbl4_s8([4 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl4_s8:
; CHECK: mov.16b  v6, v2
; CHECK: mov.16b  v5, v0
; CHECK: mov.d v5[1], v1[0]
; CHECK: mov.d v6[1], v3[0]
; CHECK: tbl.8b v0, { v5, v6 }, v4
  %__p0.coerce.fca.0.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 1
  %__p0.coerce.fca.2.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 2
  %__p0.coerce.fca.3.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 3
  %vtbl4.i = tail call <8 x i8> @llvm.arm.neon.vtbl4(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %__p0.coerce.fca.2.extract.i, <8 x i8> %__p0.coerce.fca.3.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl4.i
}

define <8 x i8> @test_vtbl4_p8([4 x <8 x i8>] %a.coerce, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtbl4_p8:
; CHECK: mov.16b  v6, v2
; CHECK: mov.16b  v5, v0
; CHECK: mov.d v5[1], v1[0]
; CHECK: mov.d v6[1], v3[0]
; CHECK: tbl.8b v0, { v5, v6 }, v4
  %__p0.coerce.fca.0.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 0
  %__p0.coerce.fca.1.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 1
  %__p0.coerce.fca.2.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 2
  %__p0.coerce.fca.3.extract.i = extractvalue [4 x <8 x i8>] %a.coerce, 3
  %vtbl4.i = tail call <8 x i8> @llvm.arm.neon.vtbl4(<8 x i8> %__p0.coerce.fca.0.extract.i, <8 x i8> %__p0.coerce.fca.1.extract.i, <8 x i8> %__p0.coerce.fca.2.extract.i, <8 x i8> %__p0.coerce.fca.3.extract.i, <8 x i8> %b) #5
  ret <8 x i8> %vtbl4.i
}

define <8 x i8> @test_vtbx1_u8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx1_u8:
; CHECK: movi.8b v3, #8
; CHECK: cmhs.8b v4, v2, v3
; CHECK: and.8b v4, v4, v0
; CHECK: tbx.8b v0, { v1 }, v2
; CHECK: cmhi.8b v1, v3, v2
; CHECK: and.8b v0, v1, v0
; CHECK: orr.8b v0, v4, v0
  %vtbx1.i = tail call <8 x i8> @llvm.arm.neon.vtbx1(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #5
  ret <8 x i8> %vtbx1.i
}

define <8 x i8> @test_vtbx1_s8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx1_s8:
; CHECK: movi.8b v3, #8
; CHECK: cmhs.8b v4, v2, v3
; CHECK: and.8b v4, v4, v0
; CHECK: tbx.8b v0, { v1 }, v2
; CHECK: cmhi.8b v1, v3, v2
; CHECK: and.8b v0, v1, v0
; CHECK: orr.8b v0, v4, v0
  %vtbx1.i = tail call <8 x i8> @llvm.arm.neon.vtbx1(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #5
  ret <8 x i8> %vtbx1.i
}

define <8 x i8> @test_vtbx1_p8(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx1_p8:
; CHECK: movi.8b v3, #8
; CHECK: cmhs.8b v4, v2, v3
; CHECK: and.8b v4, v4, v0
; CHECK: tbx.8b v0, { v1 }, v2
; CHECK: cmhi.8b v1, v3, v2
; CHECK: and.8b v0, v1, v0
; CHECK: orr.8b v0, v4, v0
  %vtbx1.i = tail call <8 x i8> @llvm.arm.neon.vtbx1(<8 x i8> %a, <8 x i8> %b, <8 x i8> %c) #5
  ret <8 x i8> %vtbx1.i
}

define <8 x i8> @test_vtbx2_u8(<8 x i8> %a, [2 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx2_u8:
; CHECK: mov.d v1[1], v2[0]
; CHECK: tbx.8b v0, { v1 }, v3
  %__p1.coerce.fca.0.extract.i = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [2 x <8 x i8>] %b.coerce, 1
  %vtbx2.i = tail call <8 x i8> @llvm.arm.neon.vtbx2(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx2.i
}

define <8 x i8> @test_vtbx2_s8(<8 x i8> %a, [2 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx2_s8:
; CHECK: mov.d v1[1], v2[0]
; CHECK: tbx.8b v0, { v1 }, v3
  %__p1.coerce.fca.0.extract.i = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [2 x <8 x i8>] %b.coerce, 1
  %vtbx2.i = tail call <8 x i8> @llvm.arm.neon.vtbx2(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx2.i
}

define <8 x i8> @test_vtbx2_p8(<8 x i8> %a, [2 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx2_p8:
; CHECK: mov.d v1[1], v2[0]
; CHECK: tbx.8b v0, { v1 }, v3
  %__p1.coerce.fca.0.extract.i = extractvalue [2 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [2 x <8 x i8>] %b.coerce, 1
  %vtbx2.i = tail call <8 x i8> @llvm.arm.neon.vtbx2(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx2.i
}

define <8 x i8> @test_vtbx3_u8(<8 x i8> %a, [3 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx3_u8:
; CHECK: mov.16b v6, v3
; CHECK: mov.16b v5, v1
; CHECK: movi.8b v1, #24
; CHECK: mov.d   v5[1], v2[0]
; CHECK: cmhs.8b v2, v4, v1
; CHECK: and.8b  v2, v2, v0
; CHECK: tbx.8b  v0, { v5, v6 }, v4
; CHECK: cmhi.8b v1, v1, v4
; CHECK: and.8b  v0, v1, v0
; CHECK: orr.8b  v0, v2, v0
  %__p1.coerce.fca.0.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %__p1.coerce.fca.2.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 2
  %vtbx3.i = tail call <8 x i8> @llvm.arm.neon.vtbx3(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %__p1.coerce.fca.2.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx3.i
}

define <8 x i8> @test_vtbx3_s8(<8 x i8> %a, [3 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx3_s8:
; CHECK: mov.16b v6, v3
; CHECK: mov.16b v5, v1
; CHECK: movi.8b v1, #24
; CHECK: mov.d   v5[1], v2[0]
; CHECK: cmhs.8b v2, v4, v1
; CHECK: and.8b  v2, v2, v0
; CHECK: tbx.8b  v0, { v5, v6 }, v4
; CHECK: cmhi.8b v1, v1, v4
; CHECK: and.8b  v0, v1, v0
; CHECK: orr.8b  v0, v2, v0
  %__p1.coerce.fca.0.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %__p1.coerce.fca.2.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 2
  %vtbx3.i = tail call <8 x i8> @llvm.arm.neon.vtbx3(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %__p1.coerce.fca.2.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx3.i
}

define <8 x i8> @test_vtbx3_p8(<8 x i8> %a, [3 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx3_p8:
; CHECK: mov.16b v6, v3
; CHECK: mov.16b v5, v1
; CHECK: movi.8b v1, #24
; CHECK: mov.d   v5[1], v2[0]
; CHECK: cmhs.8b v2, v4, v1
; CHECK: and.8b  v2, v2, v0
; CHECK: tbx.8b  v0, { v5, v6 }, v4
; CHECK: cmhi.8b v1, v1, v4
; CHECK: and.8b  v0, v1, v0
; CHECK: orr.8b  v0, v2, v0
  %__p1.coerce.fca.0.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 1
  %__p1.coerce.fca.2.extract.i = extractvalue [3 x <8 x i8>] %b.coerce, 2
  %vtbx3.i = tail call <8 x i8> @llvm.arm.neon.vtbx3(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %__p1.coerce.fca.2.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx3.i
}

define <8 x i8> @test_vtbx4_u8(<8 x i8> %a, [4 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx4_u8:
; CHECK: mov.16b  v7, v3
; CHECK: mov.16b  v6, v1
; CHECK: mov.d v6[1], v2[0]
; CHECK: mov.d v7[1], v4[0]
; CHECK: tbx.8b v0, { v6, v7 }, v5
  %__p1.coerce.fca.0.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %__p1.coerce.fca.2.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %__p1.coerce.fca.3.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 3
  %vtbx4.i = tail call <8 x i8> @llvm.arm.neon.vtbx4(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %__p1.coerce.fca.2.extract.i, <8 x i8> %__p1.coerce.fca.3.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx4.i
}

define <8 x i8> @test_vtbx4_s8(<8 x i8> %a, [4 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx4_s8:
; CHECK: mov.16b  v7, v3
; CHECK: mov.16b  v6, v1
; CHECK: mov.d v6[1], v2[0]
; CHECK: mov.d v7[1], v4[0]
; CHECK: tbx.8b v0, { v6, v7 }, v5
  %__p1.coerce.fca.0.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %__p1.coerce.fca.2.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %__p1.coerce.fca.3.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 3
  %vtbx4.i = tail call <8 x i8> @llvm.arm.neon.vtbx4(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %__p1.coerce.fca.2.extract.i, <8 x i8> %__p1.coerce.fca.3.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx4.i
}

define <8 x i8> @test_vtbx4_p8(<8 x i8> %a, [4 x <8 x i8>] %b.coerce, <8 x i8> %c) #0 {
; CHECK-LABEL: test_vtbx4_p8:
; CHECK: mov.16b  v7, v3
; CHECK: mov.16b  v6, v1
; CHECK: mov.d v6[1], v2[0]
; CHECK: mov.d v7[1], v4[0]
; CHECK: tbx.8b v0, { v6, v7 }, v5
  %__p1.coerce.fca.0.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 0
  %__p1.coerce.fca.1.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 1
  %__p1.coerce.fca.2.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 2
  %__p1.coerce.fca.3.extract.i = extractvalue [4 x <8 x i8>] %b.coerce, 3
  %vtbx4.i = tail call <8 x i8> @llvm.arm.neon.vtbx4(<8 x i8> %a, <8 x i8> %__p1.coerce.fca.0.extract.i, <8 x i8> %__p1.coerce.fca.1.extract.i, <8 x i8> %__p1.coerce.fca.2.extract.i, <8 x i8> %__p1.coerce.fca.3.extract.i, <8 x i8> %c) #5
  ret <8 x i8> %vtbx4.i
}

define %struct.int8x8x2_t @test_vtrn_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtrn_s8:
; CHECK: trn1.8b v2, v0, v1
; CHECK: trn2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %vtrn1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.int8x8x2_t undef, <8 x i8> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x2_t %.fca.0.0.insert, <8 x i8> %vtrn1.i, 0, 1
  ret %struct.int8x8x2_t %.fca.0.1.insert
}

define %struct.int16x4x2_t @test_vtrn_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vtrn_s16:
; CHECK: trn1.4h v2, v0, v1
; CHECK: trn2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %vtrn1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.int16x4x2_t undef, <4 x i16> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x2_t %.fca.0.0.insert, <4 x i16> %vtrn1.i, 0, 1
  ret %struct.int16x4x2_t %.fca.0.1.insert
}

define %struct.int32x2x2_t @test_vtrn_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vtrn_s32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 0, i32 2>
  %vtrn1.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.int32x2x2_t undef, <2 x i32> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x2_t %.fca.0.0.insert, <2 x i32> %vtrn1.i, 0, 1
  ret %struct.int32x2x2_t %.fca.0.1.insert
}

define %struct.uint8x8x2_t @test_vtrn_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtrn_u8:
; CHECK: trn1.8b v2, v0, v1
; CHECK: trn2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %vtrn1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.uint8x8x2_t undef, <8 x i8> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x2_t %.fca.0.0.insert, <8 x i8> %vtrn1.i, 0, 1
  ret %struct.uint8x8x2_t %.fca.0.1.insert
}

define %struct.uint16x4x2_t @test_vtrn_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vtrn_u16:
; CHECK: trn1.4h v2, v0, v1
; CHECK: trn2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %vtrn1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.uint16x4x2_t undef, <4 x i16> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x2_t %.fca.0.0.insert, <4 x i16> %vtrn1.i, 0, 1
  ret %struct.uint16x4x2_t %.fca.0.1.insert
}

define %struct.uint32x2x2_t @test_vtrn_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vtrn_u32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 0, i32 2>
  %vtrn1.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.uint32x2x2_t undef, <2 x i32> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x2_t %.fca.0.0.insert, <2 x i32> %vtrn1.i, 0, 1
  ret %struct.uint32x2x2_t %.fca.0.1.insert
}

define %struct.float32x2x2_t @test_vtrn_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vtrn_f32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <2 x float> %a, <2 x float> %b, <2 x i32> <i32 0, i32 2>
  %vtrn1.i = shufflevector <2 x float> %a, <2 x float> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.float32x2x2_t undef, <2 x float> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x2_t %.fca.0.0.insert, <2 x float> %vtrn1.i, 0, 1
  ret %struct.float32x2x2_t %.fca.0.1.insert
}

define %struct.poly8x8x2_t @test_vtrn_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtrn_p8:
; CHECK: trn1.8b v2, v0, v1
; CHECK: trn2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %vtrn1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.poly8x8x2_t undef, <8 x i8> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x2_t %.fca.0.0.insert, <8 x i8> %vtrn1.i, 0, 1
  ret %struct.poly8x8x2_t %.fca.0.1.insert
}

define %struct.poly16x4x2_t @test_vtrn_p16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vtrn_p16:
; CHECK: trn1.4h v2, v0, v1
; CHECK: trn2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %vtrn1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.poly16x4x2_t undef, <4 x i16> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x2_t %.fca.0.0.insert, <4 x i16> %vtrn1.i, 0, 1
  ret %struct.poly16x4x2_t %.fca.0.1.insert
}

define %struct.int8x16x2_t @test_vtrnq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vtrnq_s8:
; CHECK: trn1.16b v2, v0, v1
; CHECK: trn2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 16, i32 2, i32 18, i32 4, i32 20, i32 6, i32 22, i32 8, i32 24, i32 10, i32 26, i32 12, i32 28, i32 14, i32 30>
  %vtrn1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 1, i32 17, i32 3, i32 19, i32 5, i32 21, i32 7, i32 23, i32 9, i32 25, i32 11, i32 27, i32 13, i32 29, i32 15, i32 31>
  %.fca.0.0.insert = insertvalue %struct.int8x16x2_t undef, <16 x i8> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x16x2_t %.fca.0.0.insert, <16 x i8> %vtrn1.i, 0, 1
  ret %struct.int8x16x2_t %.fca.0.1.insert
}

define %struct.int16x8x2_t @test_vtrnq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vtrnq_s16:
; CHECK: trn1.8h v2, v0, v1
; CHECK: trn2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %vtrn1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.int16x8x2_t undef, <8 x i16> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x2_t %.fca.0.0.insert, <8 x i16> %vtrn1.i, 0, 1
  ret %struct.int16x8x2_t %.fca.0.1.insert
}

define %struct.int32x4x2_t @test_vtrnq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vtrnq_s32:
; CHECK: trn1.4s v2, v0, v1
; CHECK: trn2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %vtrn1.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.int32x4x2_t undef, <4 x i32> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x2_t %.fca.0.0.insert, <4 x i32> %vtrn1.i, 0, 1
  ret %struct.int32x4x2_t %.fca.0.1.insert
}

define %struct.uint8x16x2_t @test_vtrnq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vtrnq_u8:
; CHECK: trn1.16b v2, v0, v1
; CHECK: trn2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 16, i32 2, i32 18, i32 4, i32 20, i32 6, i32 22, i32 8, i32 24, i32 10, i32 26, i32 12, i32 28, i32 14, i32 30>
  %vtrn1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 1, i32 17, i32 3, i32 19, i32 5, i32 21, i32 7, i32 23, i32 9, i32 25, i32 11, i32 27, i32 13, i32 29, i32 15, i32 31>
  %.fca.0.0.insert = insertvalue %struct.uint8x16x2_t undef, <16 x i8> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x16x2_t %.fca.0.0.insert, <16 x i8> %vtrn1.i, 0, 1
  ret %struct.uint8x16x2_t %.fca.0.1.insert
}

define %struct.uint16x8x2_t @test_vtrnq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vtrnq_u16:
; CHECK: trn1.8h v2, v0, v1
; CHECK: trn2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %vtrn1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.uint16x8x2_t undef, <8 x i16> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x2_t %.fca.0.0.insert, <8 x i16> %vtrn1.i, 0, 1
  ret %struct.uint16x8x2_t %.fca.0.1.insert
}

define %struct.uint32x4x2_t @test_vtrnq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vtrnq_u32:
; CHECK: trn1.4s v2, v0, v1
; CHECK: trn2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %vtrn1.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.uint32x4x2_t undef, <4 x i32> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x2_t %.fca.0.0.insert, <4 x i32> %vtrn1.i, 0, 1
  ret %struct.uint32x4x2_t %.fca.0.1.insert
}

define %struct.float32x4x2_t @test_vtrnq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vtrnq_f32:
; CHECK: trn1.4s v2, v0, v1
; CHECK: trn2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %vtrn1.i = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.float32x4x2_t undef, <4 x float> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x2_t %.fca.0.0.insert, <4 x float> %vtrn1.i, 0, 1
  ret %struct.float32x4x2_t %.fca.0.1.insert
}

define %struct.poly8x16x2_t @test_vtrnq_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vtrnq_p8:
; CHECK: trn1.16b v2, v0, v1
; CHECK: trn2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 16, i32 2, i32 18, i32 4, i32 20, i32 6, i32 22, i32 8, i32 24, i32 10, i32 26, i32 12, i32 28, i32 14, i32 30>
  %vtrn1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 1, i32 17, i32 3, i32 19, i32 5, i32 21, i32 7, i32 23, i32 9, i32 25, i32 11, i32 27, i32 13, i32 29, i32 15, i32 31>
  %.fca.0.0.insert = insertvalue %struct.poly8x16x2_t undef, <16 x i8> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x16x2_t %.fca.0.0.insert, <16 x i8> %vtrn1.i, 0, 1
  ret %struct.poly8x16x2_t %.fca.0.1.insert
}

define %struct.poly16x8x2_t @test_vtrnq_p16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vtrnq_p16:
; CHECK: trn1.8h v2, v0, v1
; CHECK: trn2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vtrn.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %vtrn1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.poly16x8x2_t undef, <8 x i16> %vtrn.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x2_t %.fca.0.0.insert, <8 x i16> %vtrn1.i, 0, 1
  ret %struct.poly16x8x2_t %.fca.0.1.insert
}

define <8 x i8> @test_vtst_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtst_s8:
; CHECK: cmtst.8b v0, v0, v1
  %t0 = and <8 x i8> %a, %b
  %t1 = icmp ne <8 x i8> %t0, zeroinitializer
  %vtst.i = sext <8 x i1> %t1 to <8 x i8>
  ret <8 x i8> %vtst.i
}

define <4 x i16> @test_vtst_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vtst_s16:
; CHECK: cmtst.4h v0, v0, v1
  %t0 = and <4 x i16> %a, %b
  %t1 = icmp ne <4 x i16> %t0, zeroinitializer
  %vtst.i = sext <4 x i1> %t1 to <4 x i16>
  ret <4 x i16> %vtst.i
}

define <2 x i32> @test_vtst_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vtst_s32:
; CHECK: cmtst.2s v0, v0, v1
  %t0 = and <2 x i32> %a, %b
  %t1 = icmp ne <2 x i32> %t0, zeroinitializer
  %vtst.i = sext <2 x i1> %t1 to <2 x i32>
  ret <2 x i32> %vtst.i
}

define <8 x i8> @test_vtst_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtst_u8:
; CHECK: cmtst.8b v0, v0, v1
  %t0 = and <8 x i8> %a, %b
  %t1 = icmp ne <8 x i8> %t0, zeroinitializer
  %vtst.i = sext <8 x i1> %t1 to <8 x i8>
  ret <8 x i8> %vtst.i
}

define <4 x i16> @test_vtst_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vtst_u16:
; CHECK: cmtst.4h v0, v0, v1
  %t0 = and <4 x i16> %a, %b
  %t1 = icmp ne <4 x i16> %t0, zeroinitializer
  %vtst.i = sext <4 x i1> %t1 to <4 x i16>
  ret <4 x i16> %vtst.i
}

define <2 x i32> @test_vtst_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vtst_u32:
; CHECK: cmtst.2s v0, v0, v1
  %t0 = and <2 x i32> %a, %b
  %t1 = icmp ne <2 x i32> %t0, zeroinitializer
  %vtst.i = sext <2 x i1> %t1 to <2 x i32>
  ret <2 x i32> %vtst.i
}

define <8 x i8> @test_vtst_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vtst_p8:
; CHECK: cmtst.8b v0, v0, v1
  %t0 = and <8 x i8> %a, %b
  %t1 = icmp ne <8 x i8> %t0, zeroinitializer
  %vtst.i = sext <8 x i1> %t1 to <8 x i8>
  ret <8 x i8> %vtst.i
}

define <4 x i16> @test_vtst_p16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vtst_p16:
; CHECK: cmtst.4h v0, v0, v1
  %t0 = and <4 x i16> %a, %b
  %t1 = icmp ne <4 x i16> %t0, zeroinitializer
  %vtst.i = sext <4 x i1> %t1 to <4 x i16>
  ret <4 x i16> %vtst.i
}

define <16 x i8> @test_vtstq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vtstq_s8:
; CHECK: cmtst.16b v0, v0, v1
  %t0 = and <16 x i8> %a, %b
  %t1 = icmp ne <16 x i8> %t0, zeroinitializer
  %vtst.i = sext <16 x i1> %t1 to <16 x i8>
  ret <16 x i8> %vtst.i
}

define <8 x i16> @test_vtstq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vtstq_s16:
; CHECK: cmtst.8h v0, v0, v1
  %t0 = and <8 x i16> %a, %b
  %t1 = icmp ne <8 x i16> %t0, zeroinitializer
  %vtst.i = sext <8 x i1> %t1 to <8 x i16>
  ret <8 x i16> %vtst.i
}

define <4 x i32> @test_vtstq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vtstq_s32:
; CHECK: cmtst.4s v0, v0, v1
  %t0 = and <4 x i32> %a, %b
  %t1 = icmp ne <4 x i32> %t0, zeroinitializer
  %vtst.i = sext <4 x i1> %t1 to <4 x i32>
  ret <4 x i32> %vtst.i
}

define <16 x i8> @test_vtstq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vtstq_u8:
; CHECK: cmtst.16b v0, v0, v1
  %t0 = and <16 x i8> %a, %b
  %t1 = icmp ne <16 x i8> %t0, zeroinitializer
  %vtst.i = sext <16 x i1> %t1 to <16 x i8>
  ret <16 x i8> %vtst.i
}

define <8 x i16> @test_vtstq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vtstq_u16:
; CHECK: cmtst.8h v0, v0, v1
  %t0 = and <8 x i16> %a, %b
  %t1 = icmp ne <8 x i16> %t0, zeroinitializer
  %vtst.i = sext <8 x i1> %t1 to <8 x i16>
  ret <8 x i16> %vtst.i
}

define <4 x i32> @test_vtstq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vtstq_u32:
; CHECK: cmtst.4s v0, v0, v1
  %t0 = and <4 x i32> %a, %b
  %t1 = icmp ne <4 x i32> %t0, zeroinitializer
  %vtst.i = sext <4 x i1> %t1 to <4 x i32>
  ret <4 x i32> %vtst.i
}

define <16 x i8> @test_vtstq_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vtstq_p8:
; CHECK: cmtst.16b v0, v0, v1
  %t0 = and <16 x i8> %a, %b
  %t1 = icmp ne <16 x i8> %t0, zeroinitializer
  %vtst.i = sext <16 x i1> %t1 to <16 x i8>
  ret <16 x i8> %vtst.i
}

define <8 x i16> @test_vtstq_p16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vtstq_p16:
; CHECK: cmtst.8h v0, v0, v1
  %t0 = and <8 x i16> %a, %b
  %t1 = icmp ne <8 x i16> %t0, zeroinitializer
  %vtst.i = sext <8 x i1> %t1 to <8 x i16>
  ret <8 x i16> %vtst.i
}

define %struct.int8x8x2_t @test_vuzp_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vuzp_s8:
; CHECK: uzp1.8b v2, v0, v1
; CHECK: uzp2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %vuzp1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %.fca.0.0.insert = insertvalue %struct.int8x8x2_t undef, <8 x i8> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x2_t %.fca.0.0.insert, <8 x i8> %vuzp1.i, 0, 1
  ret %struct.int8x8x2_t %.fca.0.1.insert
}

define %struct.int16x4x2_t @test_vuzp_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vuzp_s16:
; CHECK: uzp1.4h v2, v0, v1
; CHECK: uzp2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %vuzp1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %.fca.0.0.insert = insertvalue %struct.int16x4x2_t undef, <4 x i16> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x2_t %.fca.0.0.insert, <4 x i16> %vuzp1.i, 0, 1
  ret %struct.int16x4x2_t %.fca.0.1.insert
}

define %struct.int32x2x2_t @test_vuzp_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vuzp_s32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 0, i32 2>
  %vuzp1.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.int32x2x2_t undef, <2 x i32> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x2_t %.fca.0.0.insert, <2 x i32> %vuzp1.i, 0, 1
  ret %struct.int32x2x2_t %.fca.0.1.insert
}

define %struct.uint8x8x2_t @test_vuzp_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vuzp_u8:
; CHECK: uzp1.8b v2, v0, v1
; CHECK: uzp2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %vuzp1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %.fca.0.0.insert = insertvalue %struct.uint8x8x2_t undef, <8 x i8> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x2_t %.fca.0.0.insert, <8 x i8> %vuzp1.i, 0, 1
  ret %struct.uint8x8x2_t %.fca.0.1.insert
}

define %struct.uint16x4x2_t @test_vuzp_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vuzp_u16:
; CHECK: uzp1.4h v2, v0, v1
; CHECK: uzp2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %vuzp1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %.fca.0.0.insert = insertvalue %struct.uint16x4x2_t undef, <4 x i16> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x2_t %.fca.0.0.insert, <4 x i16> %vuzp1.i, 0, 1
  ret %struct.uint16x4x2_t %.fca.0.1.insert
}

define %struct.uint32x2x2_t @test_vuzp_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vuzp_u32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 0, i32 2>
  %vuzp1.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.uint32x2x2_t undef, <2 x i32> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x2_t %.fca.0.0.insert, <2 x i32> %vuzp1.i, 0, 1
  ret %struct.uint32x2x2_t %.fca.0.1.insert
}

define %struct.float32x2x2_t @test_vuzp_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vuzp_f32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <2 x float> %a, <2 x float> %b, <2 x i32> <i32 0, i32 2>
  %vuzp1.i = shufflevector <2 x float> %a, <2 x float> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.float32x2x2_t undef, <2 x float> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x2_t %.fca.0.0.insert, <2 x float> %vuzp1.i, 0, 1
  ret %struct.float32x2x2_t %.fca.0.1.insert
}

define %struct.poly8x8x2_t @test_vuzp_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vuzp_p8:
; CHECK: uzp1.8b v2, v0, v1
; CHECK: uzp2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %vuzp1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %.fca.0.0.insert = insertvalue %struct.poly8x8x2_t undef, <8 x i8> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x2_t %.fca.0.0.insert, <8 x i8> %vuzp1.i, 0, 1
  ret %struct.poly8x8x2_t %.fca.0.1.insert
}

define %struct.poly16x4x2_t @test_vuzp_p16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vuzp_p16:
; CHECK: uzp1.4h v2, v0, v1
; CHECK: uzp2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %vuzp1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %.fca.0.0.insert = insertvalue %struct.poly16x4x2_t undef, <4 x i16> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x2_t %.fca.0.0.insert, <4 x i16> %vuzp1.i, 0, 1
  ret %struct.poly16x4x2_t %.fca.0.1.insert
}

define %struct.int8x16x2_t @test_vuzpq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vuzpq_s8:
; CHECK: uzp1.16b v2, v0, v1
; CHECK: uzp2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30>
  %vuzp1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 17, i32 19, i32 21, i32 23, i32 25, i32 27, i32 29, i32 31>
  %.fca.0.0.insert = insertvalue %struct.int8x16x2_t undef, <16 x i8> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x16x2_t %.fca.0.0.insert, <16 x i8> %vuzp1.i, 0, 1
  ret %struct.int8x16x2_t %.fca.0.1.insert
}

define %struct.int16x8x2_t @test_vuzpq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vuzpq_s16:
; CHECK: uzp1.8h v2, v0, v1
; CHECK: uzp2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %vuzp1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %.fca.0.0.insert = insertvalue %struct.int16x8x2_t undef, <8 x i16> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x2_t %.fca.0.0.insert, <8 x i16> %vuzp1.i, 0, 1
  ret %struct.int16x8x2_t %.fca.0.1.insert
}

define %struct.int32x4x2_t @test_vuzpq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vuzpq_s32:
; CHECK: uzp1.4s v2, v0, v1
; CHECK: uzp2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %vuzp1.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %.fca.0.0.insert = insertvalue %struct.int32x4x2_t undef, <4 x i32> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x2_t %.fca.0.0.insert, <4 x i32> %vuzp1.i, 0, 1
  ret %struct.int32x4x2_t %.fca.0.1.insert
}

define %struct.uint8x16x2_t @test_vuzpq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vuzpq_u8:
; CHECK: uzp1.16b v2, v0, v1
; CHECK: uzp2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30>
  %vuzp1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 17, i32 19, i32 21, i32 23, i32 25, i32 27, i32 29, i32 31>
  %.fca.0.0.insert = insertvalue %struct.uint8x16x2_t undef, <16 x i8> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x16x2_t %.fca.0.0.insert, <16 x i8> %vuzp1.i, 0, 1
  ret %struct.uint8x16x2_t %.fca.0.1.insert
}

define %struct.uint16x8x2_t @test_vuzpq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vuzpq_u16:
; CHECK: uzp1.8h v2, v0, v1
; CHECK: uzp2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %vuzp1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %.fca.0.0.insert = insertvalue %struct.uint16x8x2_t undef, <8 x i16> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x2_t %.fca.0.0.insert, <8 x i16> %vuzp1.i, 0, 1
  ret %struct.uint16x8x2_t %.fca.0.1.insert
}

define %struct.uint32x4x2_t @test_vuzpq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vuzpq_u32:
; CHECK: uzp1.4s v2, v0, v1
; CHECK: uzp2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %vuzp1.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %.fca.0.0.insert = insertvalue %struct.uint32x4x2_t undef, <4 x i32> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x2_t %.fca.0.0.insert, <4 x i32> %vuzp1.i, 0, 1
  ret %struct.uint32x4x2_t %.fca.0.1.insert
}

define %struct.float32x4x2_t @test_vuzpq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vuzpq_f32:
; CHECK: uzp1.4s v2, v0, v1
; CHECK: uzp2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %vuzp1.i = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %.fca.0.0.insert = insertvalue %struct.float32x4x2_t undef, <4 x float> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x2_t %.fca.0.0.insert, <4 x float> %vuzp1.i, 0, 1
  ret %struct.float32x4x2_t %.fca.0.1.insert
}

define %struct.poly8x16x2_t @test_vuzpq_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vuzpq_p8:
; CHECK: uzp1.16b v2, v0, v1
; CHECK: uzp2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30>
  %vuzp1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 17, i32 19, i32 21, i32 23, i32 25, i32 27, i32 29, i32 31>
  %.fca.0.0.insert = insertvalue %struct.poly8x16x2_t undef, <16 x i8> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x16x2_t %.fca.0.0.insert, <16 x i8> %vuzp1.i, 0, 1
  ret %struct.poly8x16x2_t %.fca.0.1.insert
}

define %struct.poly16x8x2_t @test_vuzpq_p16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vuzpq_p16:
; CHECK: uzp1.8h v2, v0, v1
; CHECK: uzp2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vuzp.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %vuzp1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %.fca.0.0.insert = insertvalue %struct.poly16x8x2_t undef, <8 x i16> %vuzp.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x2_t %.fca.0.0.insert, <8 x i16> %vuzp1.i, 0, 1
  ret %struct.poly16x8x2_t %.fca.0.1.insert
}

define %struct.int8x8x2_t @test_vzip_s8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vzip_s8:
; CHECK: zip1.8b v2, v0, v1
; CHECK: zip2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %vzip1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.int8x8x2_t undef, <8 x i8> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x8x2_t %.fca.0.0.insert, <8 x i8> %vzip1.i, 0, 1
  ret %struct.int8x8x2_t %.fca.0.1.insert
}

define %struct.int16x4x2_t @test_vzip_s16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vzip_s16:
; CHECK: zip1.4h v2, v0, v1
; CHECK: zip2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 4, i32 1, i32 5>
  %vzip1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 2, i32 6, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.int16x4x2_t undef, <4 x i16> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x4x2_t %.fca.0.0.insert, <4 x i16> %vzip1.i, 0, 1
  ret %struct.int16x4x2_t %.fca.0.1.insert
}

define %struct.int32x2x2_t @test_vzip_s32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vzip_s32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 0, i32 2>
  %vzip1.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.int32x2x2_t undef, <2 x i32> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x2x2_t %.fca.0.0.insert, <2 x i32> %vzip1.i, 0, 1
  ret %struct.int32x2x2_t %.fca.0.1.insert
}

define %struct.uint8x8x2_t @test_vzip_u8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vzip_u8:
; CHECK: zip1.8b v2, v0, v1
; CHECK: zip2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %vzip1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.uint8x8x2_t undef, <8 x i8> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x8x2_t %.fca.0.0.insert, <8 x i8> %vzip1.i, 0, 1
  ret %struct.uint8x8x2_t %.fca.0.1.insert
}

define %struct.uint16x4x2_t @test_vzip_u16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vzip_u16:
; CHECK: zip1.4h v2, v0, v1
; CHECK: zip2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 4, i32 1, i32 5>
  %vzip1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 2, i32 6, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.uint16x4x2_t undef, <4 x i16> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x4x2_t %.fca.0.0.insert, <4 x i16> %vzip1.i, 0, 1
  ret %struct.uint16x4x2_t %.fca.0.1.insert
}

define %struct.uint32x2x2_t @test_vzip_u32(<2 x i32> %a, <2 x i32> %b) #0 {
; CHECK-LABEL: test_vzip_u32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 0, i32 2>
  %vzip1.i = shufflevector <2 x i32> %a, <2 x i32> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.uint32x2x2_t undef, <2 x i32> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x2x2_t %.fca.0.0.insert, <2 x i32> %vzip1.i, 0, 1
  ret %struct.uint32x2x2_t %.fca.0.1.insert
}

define %struct.float32x2x2_t @test_vzip_f32(<2 x float> %a, <2 x float> %b) #0 {
; CHECK-LABEL: test_vzip_f32:
; CHECK: zip1.2s v2, v0, v1
; CHECK: zip2.2s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <2 x float> %a, <2 x float> %b, <2 x i32> <i32 0, i32 2>
  %vzip1.i = shufflevector <2 x float> %a, <2 x float> %b, <2 x i32> <i32 1, i32 3>
  %.fca.0.0.insert = insertvalue %struct.float32x2x2_t undef, <2 x float> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x2x2_t %.fca.0.0.insert, <2 x float> %vzip1.i, 0, 1
  ret %struct.float32x2x2_t %.fca.0.1.insert
}

define %struct.poly8x8x2_t @test_vzip_p8(<8 x i8> %a, <8 x i8> %b) #0 {
; CHECK-LABEL: test_vzip_p8:
; CHECK: zip1.8b v2, v0, v1
; CHECK: zip2.8b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %vzip1.i = shufflevector <8 x i8> %a, <8 x i8> %b, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.poly8x8x2_t undef, <8 x i8> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x8x2_t %.fca.0.0.insert, <8 x i8> %vzip1.i, 0, 1
  ret %struct.poly8x8x2_t %.fca.0.1.insert
}

define %struct.poly16x4x2_t @test_vzip_p16(<4 x i16> %a, <4 x i16> %b) #0 {
; CHECK-LABEL: test_vzip_p16:
; CHECK: zip1.4h v2, v0, v1
; CHECK: zip2.4h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 0, i32 4, i32 1, i32 5>
  %vzip1.i = shufflevector <4 x i16> %a, <4 x i16> %b, <4 x i32> <i32 2, i32 6, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.poly16x4x2_t undef, <4 x i16> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x4x2_t %.fca.0.0.insert, <4 x i16> %vzip1.i, 0, 1
  ret %struct.poly16x4x2_t %.fca.0.1.insert
}

define %struct.int8x16x2_t @test_vzipq_s8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vzipq_s8:
; CHECK: zip1.16b v2, v0, v1
; CHECK: zip2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23>
  %vzip1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>
  %.fca.0.0.insert = insertvalue %struct.int8x16x2_t undef, <16 x i8> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int8x16x2_t %.fca.0.0.insert, <16 x i8> %vzip1.i, 0, 1
  ret %struct.int8x16x2_t %.fca.0.1.insert
}

define %struct.int16x8x2_t @test_vzipq_s16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vzipq_s16:
; CHECK: zip1.8h v2, v0, v1
; CHECK: zip2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %vzip1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.int16x8x2_t undef, <8 x i16> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int16x8x2_t %.fca.0.0.insert, <8 x i16> %vzip1.i, 0, 1
  ret %struct.int16x8x2_t %.fca.0.1.insert
}

define %struct.int32x4x2_t @test_vzipq_s32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vzipq_s32:
; CHECK: zip1.4s v2, v0, v1
; CHECK: zip2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 4, i32 1, i32 5>
  %vzip1.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 2, i32 6, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.int32x4x2_t undef, <4 x i32> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.int32x4x2_t %.fca.0.0.insert, <4 x i32> %vzip1.i, 0, 1
  ret %struct.int32x4x2_t %.fca.0.1.insert
}

define %struct.uint8x16x2_t @test_vzipq_u8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vzipq_u8:
; CHECK: zip1.16b v2, v0, v1
; CHECK: zip2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23>
  %vzip1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>
  %.fca.0.0.insert = insertvalue %struct.uint8x16x2_t undef, <16 x i8> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint8x16x2_t %.fca.0.0.insert, <16 x i8> %vzip1.i, 0, 1
  ret %struct.uint8x16x2_t %.fca.0.1.insert
}

define %struct.uint16x8x2_t @test_vzipq_u16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vzipq_u16:
; CHECK: zip1.8h v2, v0, v1
; CHECK: zip2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %vzip1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.uint16x8x2_t undef, <8 x i16> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint16x8x2_t %.fca.0.0.insert, <8 x i16> %vzip1.i, 0, 1
  ret %struct.uint16x8x2_t %.fca.0.1.insert
}

define %struct.uint32x4x2_t @test_vzipq_u32(<4 x i32> %a, <4 x i32> %b) #0 {
; CHECK-LABEL: test_vzipq_u32:
; CHECK: zip1.4s v2, v0, v1
; CHECK: zip2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 0, i32 4, i32 1, i32 5>
  %vzip1.i = shufflevector <4 x i32> %a, <4 x i32> %b, <4 x i32> <i32 2, i32 6, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.uint32x4x2_t undef, <4 x i32> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.uint32x4x2_t %.fca.0.0.insert, <4 x i32> %vzip1.i, 0, 1
  ret %struct.uint32x4x2_t %.fca.0.1.insert
}

define %struct.float32x4x2_t @test_vzipq_f32(<4 x float> %a, <4 x float> %b) #0 {
; CHECK-LABEL: test_vzipq_f32:
; CHECK: zip1.4s v2, v0, v1
; CHECK: zip2.4s v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 0, i32 4, i32 1, i32 5>
  %vzip1.i = shufflevector <4 x float> %a, <4 x float> %b, <4 x i32> <i32 2, i32 6, i32 3, i32 7>
  %.fca.0.0.insert = insertvalue %struct.float32x4x2_t undef, <4 x float> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.float32x4x2_t %.fca.0.0.insert, <4 x float> %vzip1.i, 0, 1
  ret %struct.float32x4x2_t %.fca.0.1.insert
}

define %struct.poly8x16x2_t @test_vzipq_p8(<16 x i8> %a, <16 x i8> %b) #0 {
; CHECK-LABEL: test_vzipq_p8:
; CHECK: zip1.16b v2, v0, v1
; CHECK: zip2.16b v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 0, i32 16, i32 1, i32 17, i32 2, i32 18, i32 3, i32 19, i32 4, i32 20, i32 5, i32 21, i32 6, i32 22, i32 7, i32 23>
  %vzip1.i = shufflevector <16 x i8> %a, <16 x i8> %b, <16 x i32> <i32 8, i32 24, i32 9, i32 25, i32 10, i32 26, i32 11, i32 27, i32 12, i32 28, i32 13, i32 29, i32 14, i32 30, i32 15, i32 31>
  %.fca.0.0.insert = insertvalue %struct.poly8x16x2_t undef, <16 x i8> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly8x16x2_t %.fca.0.0.insert, <16 x i8> %vzip1.i, 0, 1
  ret %struct.poly8x16x2_t %.fca.0.1.insert
}

define %struct.poly16x8x2_t @test_vzipq_p16(<8 x i16> %a, <8 x i16> %b) #0 {
; CHECK-LABEL: test_vzipq_p16:
; CHECK: zip1.8h v2, v0, v1
; CHECK: zip2.8h v1, v0, v1
; CHECK: mov.16b  v0, v2
  %vzip.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %vzip1.i = shufflevector <8 x i16> %a, <8 x i16> %b, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %.fca.0.0.insert = insertvalue %struct.poly16x8x2_t undef, <8 x i16> %vzip.i, 0, 0
  %.fca.0.1.insert = insertvalue %struct.poly16x8x2_t %.fca.0.0.insert, <8 x i16> %vzip1.i, 0, 1
  ret %struct.poly16x8x2_t %.fca.0.1.insert
}

declare <8 x i8> @llvm.arm.neon.vtbx4(<8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vtbx3(<8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vtbx2(<8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vtbx1(<8 x i8>, <8 x i8>, <8 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vtbl4(<8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vtbl3(<8 x i8>, <8 x i8>, <8 x i8>, <8 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vtbl2(<8 x i8>, <8 x i8>, <8 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vtbl1(<8 x i8>, <8 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vshiftu.v2i64(<2 x i64>, <2 x i64>) #1

declare <4 x i32> @llvm.arm.neon.vshiftu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vshiftu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vshiftu.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vshifts.v2i64(<2 x i64>, <2 x i64>) #1

declare <4 x i32> @llvm.arm.neon.vshifts.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vshifts.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vshifts.v16i8(<16 x i8>, <16 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vshiftu.v1i64(<1 x i64>, <1 x i64>) #1

declare <2 x i32> @llvm.arm.neon.vshiftu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vshiftu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vshiftu.v8i8(<8 x i8>, <8 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vshifts.v1i64(<1 x i64>, <1 x i64>) #1

declare <2 x i32> @llvm.arm.neon.vshifts.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vshifts.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vshifts.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vrsubhn.v2i32(<2 x i64>, <2 x i64>) #1

declare <4 x i16> @llvm.arm.neon.vrsubhn.v4i16(<4 x i32>, <4 x i32>) #1

declare <8 x i8> @llvm.arm.neon.vrsubhn.v8i8(<8 x i16>, <8 x i16>) #1

declare <4 x float> @llvm.arm.neon.vrsqrts.v4f32(<4 x float>, <4 x float>) #1

declare <2 x float> @llvm.arm.neon.vrsqrts.v2f32(<2 x float>, <2 x float>) #1

declare <4 x i32> @llvm.arm.neon.vrsqrte.v4i32(<4 x i32>) #1

declare <4 x float> @llvm.arm.neon.vrsqrte.v4f32(<4 x float>) #1

declare <2 x i32> @llvm.arm.neon.vrsqrte.v2i32(<2 x i32>) #1

declare <2 x float> @llvm.arm.neon.vrsqrte.v2f32(<2 x float>) #1

declare <4 x i32> @llvm.arm.neon.vrhaddu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vrhaddu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vrhaddu.v16i8(<16 x i8>, <16 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vrhadds.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vrhadds.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vrhadds.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vrhaddu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vrhaddu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vrhaddu.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vrhadds.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vrhadds.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vrhadds.v8i8(<8 x i8>, <8 x i8>) #1

declare <4 x float> @llvm.arm.neon.vrecps.v4f32(<4 x float>, <4 x float>) #1

declare <2 x float> @llvm.arm.neon.vrecps.v2f32(<2 x float>, <2 x float>) #1

declare <4 x i32> @llvm.arm.neon.vrecpe.v4i32(<4 x i32>) #1

declare <4 x float> @llvm.arm.neon.vrecpe.v4f32(<4 x float>) #1

declare <2 x i32> @llvm.arm.neon.vrecpe.v2i32(<2 x i32>) #1

declare <2 x float> @llvm.arm.neon.vrecpe.v2f32(<2 x float>) #1

declare <2 x i32> @llvm.arm.neon.vraddhn.v2i32(<2 x i64>, <2 x i64>) #1

declare <4 x i16> @llvm.arm.neon.vraddhn.v4i16(<4 x i32>, <4 x i32>) #1

declare <8 x i8> @llvm.arm.neon.vraddhn.v8i8(<8 x i16>, <8 x i16>) #1

declare <2 x i64> @llvm.arm.neon.vqsubu.v2i64(<2 x i64>, <2 x i64>) #1

declare <4 x i32> @llvm.arm.neon.vqsubu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqsubu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vqsubu.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vqsubs.v2i64(<2 x i64>, <2 x i64>) #1

declare <4 x i32> @llvm.arm.neon.vqsubs.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqsubs.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vqsubs.v16i8(<16 x i8>, <16 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vqsubu.v1i64(<1 x i64>, <1 x i64>) #1

declare <2 x i32> @llvm.arm.neon.vqsubu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqsubu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vqsubu.v8i8(<8 x i8>, <8 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vqsubs.v1i64(<1 x i64>, <1 x i64>) #1

declare <2 x i32> @llvm.arm.neon.vqsubs.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqsubs.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vqsubs.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vqrshiftu.v2i64(<2 x i64>, <2 x i64>) #1

declare <4 x i32> @llvm.arm.neon.vqrshiftu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqrshiftu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vqrshiftu.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vqrshifts.v2i64(<2 x i64>, <2 x i64>) #1

declare <4 x i32> @llvm.arm.neon.vqrshifts.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqrshifts.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vqrshifts.v16i8(<16 x i8>, <16 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vqrshiftu.v1i64(<1 x i64>, <1 x i64>) #1

declare <2 x i32> @llvm.arm.neon.vqrshiftu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqrshiftu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vqrshiftu.v8i8(<8 x i8>, <8 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vqrshifts.v1i64(<1 x i64>, <1 x i64>) #1

declare <2 x i32> @llvm.arm.neon.vqrshifts.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqrshifts.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vqrshifts.v8i8(<8 x i8>, <8 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vqrdmulh.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqrdmulh.v8i16(<8 x i16>, <8 x i16>) #1

declare <2 x i32> @llvm.arm.neon.vqrdmulh.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqrdmulh.v4i16(<4 x i16>, <4 x i16>) #1

declare <4 x i32> @llvm.arm.neon.vqneg.v4i32(<4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqneg.v8i16(<8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vqneg.v16i8(<16 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vqneg.v2i32(<2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqneg.v4i16(<4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vqneg.v8i8(<8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vqmovnsu.v2i32(<2 x i64>) #1

declare <4 x i16> @llvm.arm.neon.vqmovnsu.v4i16(<4 x i32>) #1

declare <8 x i8> @llvm.arm.neon.vqmovnsu.v8i8(<8 x i16>) #1

declare <2 x i32> @llvm.arm.neon.vqmovnu.v2i32(<2 x i64>) #1

declare <4 x i16> @llvm.arm.neon.vqmovnu.v4i16(<4 x i32>) #1

declare <8 x i8> @llvm.arm.neon.vqmovnu.v8i8(<8 x i16>) #1

declare <2 x i32> @llvm.arm.neon.vqmovns.v2i32(<2 x i64>) #1

declare <4 x i16> @llvm.arm.neon.vqmovns.v4i16(<4 x i32>) #1

declare <8 x i8> @llvm.arm.neon.vqmovns.v8i8(<8 x i16>) #1

declare <2 x i64> @llvm.arm.neon.vqdmull.v2i64(<2 x i32>, <2 x i32>) #1

declare <4 x i32> @llvm.arm.neon.vqdmull.v4i32(<4 x i16>, <4 x i16>) #1

declare <4 x i32> @llvm.arm.neon.vqdmulh.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqdmulh.v8i16(<8 x i16>, <8 x i16>) #1

declare <2 x i32> @llvm.arm.neon.vqdmulh.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqdmulh.v4i16(<4 x i16>, <4 x i16>) #1

declare <2 x i64> @llvm.arm.neon.vqadds.v2i64(<2 x i64>, <2 x i64>) #1

declare <4 x i32> @llvm.arm.neon.vqadds.v4i32(<4 x i32>, <4 x i32>) #1

declare <2 x i64> @llvm.arm.neon.vqaddu.v2i64(<2 x i64>, <2 x i64>) #1

declare <4 x i32> @llvm.arm.neon.vqaddu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqaddu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vqaddu.v16i8(<16 x i8>, <16 x i8>) #1

declare <8 x i16> @llvm.arm.neon.vqadds.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vqadds.v16i8(<16 x i8>, <16 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vqaddu.v1i64(<1 x i64>, <1 x i64>) #1

declare <2 x i32> @llvm.arm.neon.vqaddu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqaddu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vqaddu.v8i8(<8 x i8>, <8 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vqadds.v1i64(<1 x i64>, <1 x i64>) #1

declare <2 x i32> @llvm.arm.neon.vqadds.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqadds.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vqadds.v8i8(<8 x i8>, <8 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vqabs.v4i32(<4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vqabs.v8i16(<8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vqabs.v16i8(<16 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vqabs.v2i32(<2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vqabs.v4i16(<4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vqabs.v8i8(<8 x i8>) #1

declare <2 x float> @llvm.arm.neon.vpmins.v2f32(<2 x float>, <2 x float>) #1

declare <2 x i32> @llvm.arm.neon.vpminu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vpminu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vpminu.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vpmins.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vpmins.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vpmins.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x float> @llvm.arm.neon.vpmaxs.v2f32(<2 x float>, <2 x float>) #1

declare <2 x i32> @llvm.arm.neon.vpmaxu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vpmaxu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vpmaxu.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vpmaxs.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vpmaxs.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vpmaxs.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vpaddlu.v2i64.v4i32(<4 x i32>) #1

declare <4 x i32> @llvm.arm.neon.vpaddlu.v4i32.v8i16(<8 x i16>) #1

declare <8 x i16> @llvm.arm.neon.vpaddlu.v8i16.v16i8(<16 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vpaddls.v2i64.v4i32(<4 x i32>) #1

declare <4 x i32> @llvm.arm.neon.vpaddls.v4i32.v8i16(<8 x i16>) #1

declare <8 x i16> @llvm.arm.neon.vpaddls.v8i16.v16i8(<16 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vpaddlu.v1i64.v2i32(<2 x i32>) #1

declare <2 x i32> @llvm.arm.neon.vpaddlu.v2i32.v4i16(<4 x i16>) #1

declare <4 x i16> @llvm.arm.neon.vpaddlu.v4i16.v8i8(<8 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vpaddls.v1i64.v2i32(<2 x i32>) #1

declare <2 x i32> @llvm.arm.neon.vpaddls.v2i32.v4i16(<4 x i16>) #1

declare <4 x i16> @llvm.arm.neon.vpaddls.v4i16.v8i8(<8 x i8>) #1

declare <2 x float> @llvm.arm.neon.vpadd.v2f32(<2 x float>, <2 x float>) #1

declare <2 x i32> @llvm.arm.neon.vpadd.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vpadd.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vpadd.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vpadalu.v2i64.v4i32(<2 x i64>, <4 x i32>) #1

declare <4 x i32> @llvm.arm.neon.vpadalu.v4i32.v8i16(<4 x i32>, <8 x i16>) #1

declare <8 x i16> @llvm.arm.neon.vpadalu.v8i16.v16i8(<8 x i16>, <16 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vpadals.v2i64.v4i32(<2 x i64>, <4 x i32>) #1

declare <4 x i32> @llvm.arm.neon.vpadals.v4i32.v8i16(<4 x i32>, <8 x i16>) #1

declare <8 x i16> @llvm.arm.neon.vpadals.v8i16.v16i8(<8 x i16>, <16 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vpadalu.v1i64.v2i32(<1 x i64>, <2 x i32>) #1

declare <2 x i32> @llvm.arm.neon.vpadalu.v2i32.v4i16(<2 x i32>, <4 x i16>) #1

declare <4 x i16> @llvm.arm.neon.vpadalu.v4i16.v8i8(<4 x i16>, <8 x i8>) #1

declare <1 x i64> @llvm.arm.neon.vpadals.v1i64.v2i32(<1 x i64>, <2 x i32>) #1

declare <2 x i32> @llvm.arm.neon.vpadals.v2i32.v4i16(<2 x i32>, <4 x i16>) #1

declare <4 x i16> @llvm.arm.neon.vpadals.v4i16.v8i8(<4 x i16>, <8 x i8>) #1

declare <16 x i8> @llvm.arm.neon.vmulp.v16i8(<16 x i8>, <16 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vmulp.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i64> @llvm.arm.neon.vmullu.v2i64(<2 x i32>, <2 x i32>) #1

declare <4 x i32> @llvm.arm.neon.vmullu.v4i32(<4 x i16>, <4 x i16>) #1

declare <2 x i64> @llvm.arm.neon.vmulls.v2i64(<2 x i32>, <2 x i32>) #1

declare <4 x i32> @llvm.arm.neon.vmulls.v4i32(<4 x i16>, <4 x i16>) #1

declare <8 x i16> @llvm.arm.neon.vmullp.v8i16(<8 x i8>, <8 x i8>) #1

declare <8 x i16> @llvm.arm.neon.vmullu.v8i16(<8 x i8>, <8 x i8>) #1

declare <8 x i16> @llvm.arm.neon.vmulls.v8i16(<8 x i8>, <8 x i8>) #1

declare <4 x float> @llvm.arm.neon.vmins.v4f32(<4 x float>, <4 x float>) #1

declare <4 x i32> @llvm.arm.neon.vminu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vminu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vminu.v16i8(<16 x i8>, <16 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vmins.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vmins.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vmins.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x float> @llvm.arm.neon.vmins.v2f32(<2 x float>, <2 x float>) #1

declare <2 x i32> @llvm.arm.neon.vminu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vminu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vminu.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vmins.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vmins.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vmins.v8i8(<8 x i8>, <8 x i8>) #1

declare <4 x float> @llvm.arm.neon.vmaxs.v4f32(<4 x float>, <4 x float>) #1

declare <4 x i32> @llvm.arm.neon.vmaxu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vmaxu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vmaxu.v16i8(<16 x i8>, <16 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vmaxs.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vmaxs.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vmaxs.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x float> @llvm.arm.neon.vmaxs.v2f32(<2 x float>, <2 x float>) #1

declare <2 x i32> @llvm.arm.neon.vmaxu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vmaxu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vmaxu.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vmaxs.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vmaxs.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vmaxs.v8i8(<8 x i8>, <8 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vhsubu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vhsubu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vhsubu.v16i8(<16 x i8>, <16 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vhsubs.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vhsubs.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vhsubs.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vhsubu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vhsubu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vhsubu.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vhsubs.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vhsubs.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vhsubs.v8i8(<8 x i8>, <8 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vhaddu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vhaddu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vhaddu.v16i8(<16 x i8>, <16 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vhadds.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vhadds.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vhadds.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vhaddu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vhaddu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vhaddu.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vhadds.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vhadds.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vhadds.v8i8(<8 x i8>, <8 x i8>) #1

declare <4 x float> @llvm.fma.v4f32(<4 x float>, <4 x float>, <4 x float>) #1

declare <2 x float> @llvm.fma.v2f32(<2 x float>, <2 x float>, <2 x float>) #1

declare <4 x float> @llvm.arm.neon.vcvthf2fp(<4 x i16>) #1

declare <4 x i16> @llvm.arm.neon.vcvtfp2hf(<4 x float>) #1

declare <16 x i8> @llvm.ctpop.v16i8(<16 x i8>) #1

declare <8 x i8> @llvm.ctpop.v8i8(<8 x i8>) #1

declare <4 x i32> @llvm.ctlz.v4i32(<4 x i32>, i1) #1

declare <8 x i16> @llvm.ctlz.v8i16(<8 x i16>, i1) #1

declare <16 x i8> @llvm.ctlz.v16i8(<16 x i8>, i1) #1

declare <2 x i32> @llvm.ctlz.v2i32(<2 x i32>, i1) #1

declare <4 x i16> @llvm.ctlz.v4i16(<4 x i16>, i1) #1

declare <8 x i8> @llvm.ctlz.v8i8(<8 x i8>, i1) #1

declare <4 x i32> @llvm.arm.neon.vcls.v4i32(<4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vcls.v8i16(<8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vcls.v16i8(<16 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vcls.v2i32(<2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vcls.v4i16(<4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vcls.v8i8(<8 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vacgt.v4i32.v4f32(<4 x float>, <4 x float>) #1

declare <2 x i32> @llvm.arm.neon.vacgt.v2i32.v2f32(<2 x float>, <2 x float>) #1

declare <4 x i32> @llvm.arm.neon.vacge.v4i32.v4f32(<4 x float>, <4 x float>) #1

declare <2 x i32> @llvm.arm.neon.vacge.v2i32.v2f32(<2 x float>, <2 x float>) #1

declare <16 x i8> @llvm.arm.neon.vbsl.v16i8(<16 x i8>, <16 x i8>, <16 x i8>) #1

declare <8 x i8> @llvm.arm.neon.vbsl.v8i8(<8 x i8>, <8 x i8>, <8 x i8>) #1

declare <4 x float> @llvm.fabs.v4f32(<4 x float>) #1

declare <4 x i32> @llvm.arm.neon.vabs.v4i32(<4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vabs.v8i16(<8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vabs.v16i8(<16 x i8>) #1

declare <2 x float> @llvm.fabs.v2f32(<2 x float>) #1

declare <2 x i32> @llvm.arm.neon.vabs.v2i32(<2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vabs.v4i16(<4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vabs.v8i8(<8 x i8>) #1

declare <4 x float> @llvm.arm.neon.vabds.v4f32(<4 x float>, <4 x float>) #1

declare <4 x i32> @llvm.arm.neon.vabdu.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vabdu.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vabdu.v16i8(<16 x i8>, <16 x i8>) #1

declare <4 x i32> @llvm.arm.neon.vabds.v4i32(<4 x i32>, <4 x i32>) #1

declare <8 x i16> @llvm.arm.neon.vabds.v8i16(<8 x i16>, <8 x i16>) #1

declare <16 x i8> @llvm.arm.neon.vabds.v16i8(<16 x i8>, <16 x i8>) #1

declare <2 x float> @llvm.arm.neon.vabds.v2f32(<2 x float>, <2 x float>) #1

declare <2 x i32> @llvm.arm.neon.vabdu.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vabdu.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vabdu.v8i8(<8 x i8>, <8 x i8>) #1

declare <2 x i32> @llvm.arm.neon.vabds.v2i32(<2 x i32>, <2 x i32>) #1

declare <4 x i16> @llvm.arm.neon.vabds.v4i16(<4 x i16>, <4 x i16>) #1

declare <8 x i8> @llvm.arm.neon.vabds.v8i8(<8 x i8>, <8 x i8>) #1

attributes #0 = { nounwind readnone ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }
attributes #4 = { nounwind ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

