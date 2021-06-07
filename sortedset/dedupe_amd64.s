// Code generated by command: go run dedupe_asm.go -pkg sortedset -out ../sortedset/dedupe_amd64.s -stubs ../sortedset/dedupe_amd64.go. DO NOT EDIT.

#include "textflag.h"

// func dedupe1(dst []byte, src []byte) int
// Requires: CMOV
TEXT ·dedupe1(SB), NOSPLIT, $0-56
	MOVQ src_len+32(FP), AX
	CMPQ AX, $0x00
	JE   short
	MOVQ dst_base+0(FP), CX
	MOVQ src_base+24(FP), DX
	MOVQ CX, BX
	SUBQ $0x01, AX
	MOVB (DX), SI
	MOVB SI, (BX)
	ADDQ $0x01, BX
	CMPQ AX, $0x00
	JE   done

generic:
	MOVQ    BX, SI
	ADDQ    $0x01, SI
	MOVB    (DX), DI
	MOVB    1(DX), R8
	MOVB    R8, (BX)
	CMPB    DI, R8
	CMOVQNE SI, BX
	ADDQ    $0x01, DX
	SUBQ    $0x01, AX
	CMPQ    AX, $0x00
	JG      generic

done:
	SUBQ CX, BX
	MOVQ BX, ret+48(FP)
	RET

short:
	MOVQ AX, ret+48(FP)
	RET

// func dedupe2(dst []byte, src []byte) int
// Requires: CMOV
TEXT ·dedupe2(SB), NOSPLIT, $0-56
	MOVQ src_len+32(FP), AX
	CMPQ AX, $0x00
	JE   short
	MOVQ dst_base+0(FP), CX
	MOVQ src_base+24(FP), DX
	MOVQ CX, BX
	SUBQ $0x02, AX
	MOVW (DX), SI
	MOVW SI, (BX)
	ADDQ $0x02, BX
	CMPQ AX, $0x00
	JE   done

generic:
	MOVQ    BX, SI
	ADDQ    $0x02, SI
	MOVW    (DX), DI
	MOVW    2(DX), R8
	MOVW    R8, (BX)
	CMPW    DI, R8
	CMOVQNE SI, BX
	ADDQ    $0x02, DX
	SUBQ    $0x02, AX
	CMPQ    AX, $0x00
	JG      generic

done:
	SUBQ CX, BX
	MOVQ BX, ret+48(FP)
	RET

short:
	MOVQ AX, ret+48(FP)
	RET

// func dedupe4(dst []byte, src []byte) int
// Requires: AVX, CMOV
TEXT ·dedupe4(SB), NOSPLIT, $0-56
	MOVQ src_len+32(FP), AX
	CMPQ AX, $0x00
	JE   short
	MOVQ dst_base+0(FP), CX
	MOVQ src_base+24(FP), DX
	MOVQ CX, BX
	SUBQ $0x04, AX
	CMPQ AX, $0x10
	JL   init
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

init:
	MOVL (DX), SI
	MOVL SI, (BX)
	ADDQ $0x04, BX

tail:
	CMPQ AX, $0x00
	JE   done

generic:
	MOVQ    BX, SI
	ADDQ    $0x04, SI
	MOVL    (DX), DI
	MOVL    4(DX), R8
	MOVL    R8, (BX)
	CMPL    DI, R8
	CMOVQNE SI, BX
	ADDQ    $0x04, DX
	SUBQ    $0x04, AX
	CMPQ    AX, $0x00
	JG      generic

done:
	SUBQ CX, BX
	MOVQ BX, ret+48(FP)
	RET

short:
	MOVQ AX, ret+48(FP)
	RET

avx2:
	MOVL (DX), SI
	MOVL SI, (BX)
	LEAQ dedupe4_shuffle_mask<>+0(SB), R14
	LEAQ dedupe4_offset_array<>+0(SB), R15
	ADDQ $0x04, BX
	CMPQ AX, $0x00000080
	JL   avx2_tail64

avx2_loop128:
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   32(DX), X4
	VMOVDQU   48(DX), X6
	VMOVDQU   64(DX), X8
	VMOVDQU   80(DX), X10
	VMOVDQU   96(DX), X12
	VMOVDQU   112(DX), X14
	VMOVDQU   4(DX), X1
	VMOVDQU   20(DX), X3
	VMOVDQU   36(DX), X5
	VMOVDQU   52(DX), X7
	VMOVDQU   68(DX), X9
	VMOVDQU   84(DX), X11
	VMOVDQU   100(DX), X13
	VMOVDQU   116(DX), X15
	VPCMPEQD  X1, X0, X0
	VMOVMSKPS X0, SI
	SHLQ      $0x02, SI
	VPSHUFB   (R14)(SI*4), X1, X1
	MOVL      (R15)(SI*1), SI
	VPCMPEQD  X3, X2, X2
	VMOVMSKPS X2, DI
	SHLQ      $0x02, DI
	VPSHUFB   (R14)(DI*4), X3, X3
	MOVL      (R15)(DI*1), DI
	VPCMPEQD  X5, X4, X4
	VMOVMSKPS X4, R8
	SHLQ      $0x02, R8
	VPSHUFB   (R14)(R8*4), X5, X5
	MOVL      (R15)(R8*1), R8
	VPCMPEQD  X7, X6, X6
	VMOVMSKPS X6, R9
	SHLQ      $0x02, R9
	VPSHUFB   (R14)(R9*4), X7, X7
	MOVL      (R15)(R9*1), R9
	VPCMPEQD  X9, X8, X8
	VMOVMSKPS X8, R10
	SHLQ      $0x02, R10
	VPSHUFB   (R14)(R10*4), X9, X9
	MOVL      (R15)(R10*1), R10
	VPCMPEQD  X11, X10, X10
	VMOVMSKPS X10, R11
	SHLQ      $0x02, R11
	VPSHUFB   (R14)(R11*4), X11, X11
	MOVL      (R15)(R11*1), R11
	VPCMPEQD  X13, X12, X12
	VMOVMSKPS X12, R12
	SHLQ      $0x02, R12
	VPSHUFB   (R14)(R12*4), X13, X13
	MOVL      (R15)(R12*1), R12
	VPCMPEQD  X15, X14, X14
	VMOVMSKPS X14, R13
	SHLQ      $0x02, R13
	VPSHUFB   (R14)(R13*4), X15, X15
	MOVL      (R15)(R13*1), R13
	ADDQ      SI, DI
	ADDQ      DI, R8
	ADDQ      R8, R9
	ADDQ      R9, R10
	ADDQ      R10, R11
	ADDQ      R11, R12
	ADDQ      R12, R13
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	VMOVDQU   X5, (BX)(DI*1)
	VMOVDQU   X7, (BX)(R8*1)
	VMOVDQU   X9, (BX)(R9*1)
	VMOVDQU   X11, (BX)(R10*1)
	VMOVDQU   X13, (BX)(R11*1)
	VMOVDQU   X15, (BX)(R12*1)
	ADDQ      R13, BX
	ADDQ      $0x00000080, DX
	SUBQ      $0x00000080, AX
	CMPQ      AX, $0x00000080
	JGE       avx2_loop128

avx2_tail64:
	CMPQ      AX, $0x40
	JL        avx2_tail32
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   32(DX), X4
	VMOVDQU   48(DX), X6
	VMOVDQU   4(DX), X1
	VMOVDQU   20(DX), X3
	VMOVDQU   36(DX), X5
	VMOVDQU   52(DX), X7
	VPCMPEQD  X1, X0, X0
	VMOVMSKPS X0, SI
	SHLQ      $0x02, SI
	VPSHUFB   (R14)(SI*4), X1, X1
	MOVL      (R15)(SI*1), SI
	VPCMPEQD  X3, X2, X2
	VMOVMSKPS X2, DI
	SHLQ      $0x02, DI
	VPSHUFB   (R14)(DI*4), X3, X3
	MOVL      (R15)(DI*1), DI
	VPCMPEQD  X5, X4, X4
	VMOVMSKPS X4, R8
	SHLQ      $0x02, R8
	VPSHUFB   (R14)(R8*4), X5, X5
	MOVL      (R15)(R8*1), R8
	VPCMPEQD  X7, X6, X6
	VMOVMSKPS X6, R9
	SHLQ      $0x02, R9
	VPSHUFB   (R14)(R9*4), X7, X7
	MOVL      (R15)(R9*1), R9
	ADDQ      SI, DI
	ADDQ      DI, R8
	ADDQ      R8, R9
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	VMOVDQU   X5, (BX)(DI*1)
	VMOVDQU   X7, (BX)(R8*1)
	ADDQ      R9, BX
	ADDQ      $0x40, DX
	SUBQ      $0x40, AX

avx2_tail32:
	CMPQ      AX, $0x20
	JL        avx2_tail16
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   4(DX), X1
	VMOVDQU   20(DX), X3
	VPCMPEQD  X1, X0, X0
	VMOVMSKPS X0, SI
	SHLQ      $0x02, SI
	VPSHUFB   (R14)(SI*4), X1, X1
	MOVL      (R15)(SI*1), SI
	VPCMPEQD  X3, X2, X2
	VMOVMSKPS X2, DI
	SHLQ      $0x02, DI
	VPSHUFB   (R14)(DI*4), X3, X3
	MOVL      (R15)(DI*1), DI
	ADDQ      SI, DI
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	ADDQ      DI, BX
	ADDQ      $0x20, DX
	SUBQ      $0x20, AX

avx2_tail16:
	CMPQ      AX, $0x10
	JL        avx2_tail
	VMOVDQU   (DX), X0
	VMOVDQU   4(DX), X1
	VPCMPEQD  X1, X0, X0
	VMOVMSKPS X0, SI
	SHLQ      $0x02, SI
	VPSHUFB   (R14)(SI*4), X1, X1
	MOVL      (R15)(SI*1), SI
	VMOVDQU   X1, (BX)
	ADDQ      SI, BX
	ADDQ      $0x10, DX
	SUBQ      $0x10, AX

avx2_tail:
	VZEROUPPER
	JMP tail

DATA dedupe4_shuffle_mask<>+0(SB)/8, $0x0706050403020100
DATA dedupe4_shuffle_mask<>+8(SB)/8, $0x0f0e0d0c0b0a0908
DATA dedupe4_shuffle_mask<>+16(SB)/8, $0x0b0a090807060504
DATA dedupe4_shuffle_mask<>+24(SB)/8, $0x030201000f0e0d0c
DATA dedupe4_shuffle_mask<>+32(SB)/8, $0x0b0a090803020100
DATA dedupe4_shuffle_mask<>+40(SB)/8, $0x070605040f0e0d0c
DATA dedupe4_shuffle_mask<>+48(SB)/8, $0x0f0e0d0c0b0a0908
DATA dedupe4_shuffle_mask<>+56(SB)/8, $0x0706050403020100
DATA dedupe4_shuffle_mask<>+64(SB)/8, $0x0706050403020100
DATA dedupe4_shuffle_mask<>+72(SB)/8, $0x0b0a09080f0e0d0c
DATA dedupe4_shuffle_mask<>+80(SB)/8, $0x0f0e0d0c07060504
DATA dedupe4_shuffle_mask<>+88(SB)/8, $0x0b0a090803020100
DATA dedupe4_shuffle_mask<>+96(SB)/8, $0x0f0e0d0c03020100
DATA dedupe4_shuffle_mask<>+104(SB)/8, $0x0b0a090807060504
DATA dedupe4_shuffle_mask<>+112(SB)/8, $0x030201000f0e0d0c
DATA dedupe4_shuffle_mask<>+120(SB)/8, $0x0b0a090807060504
DATA dedupe4_shuffle_mask<>+128(SB)/8, $0x0706050403020100
DATA dedupe4_shuffle_mask<>+136(SB)/8, $0x0f0e0d0c0b0a0908
DATA dedupe4_shuffle_mask<>+144(SB)/8, $0x0b0a090807060504
DATA dedupe4_shuffle_mask<>+152(SB)/8, $0x0f0e0d0c03020100
DATA dedupe4_shuffle_mask<>+160(SB)/8, $0x0f0e0d0c03020100
DATA dedupe4_shuffle_mask<>+168(SB)/8, $0x0b0a090807060504
DATA dedupe4_shuffle_mask<>+176(SB)/8, $0x030201000b0a0908
DATA dedupe4_shuffle_mask<>+184(SB)/8, $0x0f0e0d0c07060504
DATA dedupe4_shuffle_mask<>+192(SB)/8, $0x0706050403020100
DATA dedupe4_shuffle_mask<>+200(SB)/8, $0x0f0e0d0c0b0a0908
DATA dedupe4_shuffle_mask<>+208(SB)/8, $0x0302010007060504
DATA dedupe4_shuffle_mask<>+216(SB)/8, $0x0f0e0d0c0b0a0908
DATA dedupe4_shuffle_mask<>+224(SB)/8, $0x0706050403020100
DATA dedupe4_shuffle_mask<>+232(SB)/8, $0x0f0e0d0c0b0a0908
DATA dedupe4_shuffle_mask<>+240(SB)/8, $0x0706050403020100
DATA dedupe4_shuffle_mask<>+248(SB)/8, $0x0f0e0d0c0b0a0908
GLOBL dedupe4_shuffle_mask<>(SB), RODATA|NOPTR, $256

DATA dedupe4_offset_array<>+0(SB)/8, $0x0000000c00000010
DATA dedupe4_offset_array<>+8(SB)/8, $0x000000080000000c
DATA dedupe4_offset_array<>+16(SB)/8, $0x000000080000000c
DATA dedupe4_offset_array<>+24(SB)/8, $0x0000000400000008
DATA dedupe4_offset_array<>+32(SB)/8, $0x000000080000000c
DATA dedupe4_offset_array<>+40(SB)/8, $0x0000000400000008
DATA dedupe4_offset_array<>+48(SB)/8, $0x0000000400000008
DATA dedupe4_offset_array<>+56(SB)/8, $0x0000000000000004
GLOBL dedupe4_offset_array<>(SB), RODATA|NOPTR, $64

// func dedupe8(dst []byte, src []byte) int
// Requires: AVX, CMOV
TEXT ·dedupe8(SB), NOSPLIT, $0-56
	MOVQ src_len+32(FP), AX
	CMPQ AX, $0x00
	JE   short
	MOVQ dst_base+0(FP), CX
	MOVQ src_base+24(FP), DX
	MOVQ CX, BX
	SUBQ $0x08, AX
	CMPQ AX, $0x10
	JL   init
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

init:
	MOVQ (DX), SI
	MOVQ SI, (BX)
	ADDQ $0x08, BX

tail:
	CMPQ AX, $0x00
	JE   done

generic:
	MOVQ    BX, SI
	ADDQ    $0x08, SI
	MOVQ    (DX), DI
	MOVQ    8(DX), R8
	MOVQ    R8, (BX)
	CMPQ    DI, R8
	CMOVQNE SI, BX
	ADDQ    $0x08, DX
	SUBQ    $0x08, AX
	CMPQ    AX, $0x00
	JG      generic

done:
	SUBQ CX, BX
	MOVQ BX, ret+48(FP)
	RET

short:
	MOVQ AX, ret+48(FP)
	RET

avx2:
	MOVQ (DX), SI
	MOVQ SI, (BX)
	LEAQ dedupe8_shuffle_mask<>+0(SB), R14
	LEAQ dedupe8_offset_array<>+0(SB), R15
	ADDQ $0x08, BX
	CMPQ AX, $0x00000080
	JL   avx2_tail64

avx2_loop128:
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   32(DX), X4
	VMOVDQU   48(DX), X6
	VMOVDQU   64(DX), X8
	VMOVDQU   80(DX), X10
	VMOVDQU   96(DX), X12
	VMOVDQU   112(DX), X14
	VMOVDQU   8(DX), X1
	VMOVDQU   24(DX), X3
	VMOVDQU   40(DX), X5
	VMOVDQU   56(DX), X7
	VMOVDQU   72(DX), X9
	VMOVDQU   88(DX), X11
	VMOVDQU   104(DX), X13
	VMOVDQU   120(DX), X15
	VPCMPEQQ  X1, X0, X0
	VMOVMSKPD X0, SI
	VPSHUFB   (R14)(SI*8), X1, X1
	MOVQ      (R15)(SI*8), SI
	VPCMPEQQ  X3, X2, X2
	VMOVMSKPD X2, DI
	VPSHUFB   (R14)(DI*8), X3, X3
	MOVQ      (R15)(DI*8), DI
	VPCMPEQQ  X5, X4, X4
	VMOVMSKPD X4, R8
	VPSHUFB   (R14)(R8*8), X5, X5
	MOVQ      (R15)(R8*8), R8
	VPCMPEQQ  X7, X6, X6
	VMOVMSKPD X6, R9
	VPSHUFB   (R14)(R9*8), X7, X7
	MOVQ      (R15)(R9*8), R9
	VPCMPEQQ  X9, X8, X8
	VMOVMSKPD X8, R10
	VPSHUFB   (R14)(R10*8), X9, X9
	MOVQ      (R15)(R10*8), R10
	VPCMPEQQ  X11, X10, X10
	VMOVMSKPD X10, R11
	VPSHUFB   (R14)(R11*8), X11, X11
	MOVQ      (R15)(R11*8), R11
	VPCMPEQQ  X13, X12, X12
	VMOVMSKPD X12, R12
	VPSHUFB   (R14)(R12*8), X13, X13
	MOVQ      (R15)(R12*8), R12
	VPCMPEQQ  X15, X14, X14
	VMOVMSKPD X14, R13
	VPSHUFB   (R14)(R13*8), X15, X15
	MOVQ      (R15)(R13*8), R13
	ADDQ      SI, DI
	ADDQ      DI, R8
	ADDQ      R8, R9
	ADDQ      R9, R10
	ADDQ      R10, R11
	ADDQ      R11, R12
	ADDQ      R12, R13
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	VMOVDQU   X5, (BX)(DI*1)
	VMOVDQU   X7, (BX)(R8*1)
	VMOVDQU   X9, (BX)(R9*1)
	VMOVDQU   X11, (BX)(R10*1)
	VMOVDQU   X13, (BX)(R11*1)
	VMOVDQU   X15, (BX)(R12*1)
	ADDQ      R13, BX
	ADDQ      $0x00000080, DX
	SUBQ      $0x00000080, AX
	CMPQ      AX, $0x00000080
	JGE       avx2_loop128

avx2_tail64:
	CMPQ      AX, $0x40
	JL        avx2_tail32
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   32(DX), X4
	VMOVDQU   48(DX), X6
	VMOVDQU   8(DX), X1
	VMOVDQU   24(DX), X3
	VMOVDQU   40(DX), X5
	VMOVDQU   56(DX), X7
	VPCMPEQQ  X1, X0, X0
	VMOVMSKPD X0, SI
	VPSHUFB   (R14)(SI*8), X1, X1
	MOVQ      (R15)(SI*8), SI
	VPCMPEQQ  X3, X2, X2
	VMOVMSKPD X2, DI
	VPSHUFB   (R14)(DI*8), X3, X3
	MOVQ      (R15)(DI*8), DI
	VPCMPEQQ  X5, X4, X4
	VMOVMSKPD X4, R8
	VPSHUFB   (R14)(R8*8), X5, X5
	MOVQ      (R15)(R8*8), R8
	VPCMPEQQ  X7, X6, X6
	VMOVMSKPD X6, R9
	VPSHUFB   (R14)(R9*8), X7, X7
	MOVQ      (R15)(R9*8), R9
	ADDQ      SI, DI
	ADDQ      DI, R8
	ADDQ      R8, R9
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	VMOVDQU   X5, (BX)(DI*1)
	VMOVDQU   X7, (BX)(R8*1)
	ADDQ      R9, BX
	ADDQ      $0x40, DX
	SUBQ      $0x40, AX

avx2_tail32:
	CMPQ      AX, $0x20
	JL        avx2_tail16
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   8(DX), X1
	VMOVDQU   24(DX), X3
	VPCMPEQQ  X1, X0, X0
	VMOVMSKPD X0, SI
	VPSHUFB   (R14)(SI*8), X1, X1
	MOVQ      (R15)(SI*8), SI
	VPCMPEQQ  X3, X2, X2
	VMOVMSKPD X2, DI
	VPSHUFB   (R14)(DI*8), X3, X3
	MOVQ      (R15)(DI*8), DI
	ADDQ      SI, DI
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	ADDQ      DI, BX
	ADDQ      $0x20, DX
	SUBQ      $0x20, AX

avx2_tail16:
	CMPQ      AX, $0x10
	JL        avx2_tail
	VMOVDQU   (DX), X0
	VMOVDQU   8(DX), X1
	VPCMPEQQ  X1, X0, X0
	VMOVMSKPD X0, SI
	VPSHUFB   (R14)(SI*8), X1, X1
	MOVQ      (R15)(SI*8), SI
	VMOVDQU   X1, (BX)
	ADDQ      SI, BX
	ADDQ      $0x10, DX
	SUBQ      $0x10, AX

avx2_tail:
	VZEROUPPER
	JMP tail

DATA dedupe8_shuffle_mask<>+0(SB)/8, $0x0706050403020100
DATA dedupe8_shuffle_mask<>+8(SB)/8, $0x0f0e0d0c0b0a0908
DATA dedupe8_shuffle_mask<>+16(SB)/8, $0x0706050403020100
DATA dedupe8_shuffle_mask<>+24(SB)/8, $0x0706050403020100
DATA dedupe8_shuffle_mask<>+32(SB)/8, $0x0706050403020100
GLOBL dedupe8_shuffle_mask<>(SB), RODATA|NOPTR, $40

DATA dedupe8_offset_array<>+0(SB)/8, $0x0000000000000010
DATA dedupe8_offset_array<>+8(SB)/8, $0x0000000000000008
DATA dedupe8_offset_array<>+16(SB)/8, $0x0000000000000008
DATA dedupe8_offset_array<>+24(SB)/8, $0x0000000000000000
GLOBL dedupe8_offset_array<>(SB), RODATA|NOPTR, $32

// func dedupe16(dst []byte, src []byte) int
// Requires: AVX, CMOV, SSE2, SSE4.1
TEXT ·dedupe16(SB), NOSPLIT, $0-56
	MOVQ src_len+32(FP), AX
	CMPQ AX, $0x00
	JE   short
	MOVQ dst_base+0(FP), CX
	MOVQ src_base+24(FP), DX
	MOVQ CX, BX
	SUBQ $0x10, AX
	CMPQ AX, $0x10
	JL   init
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

init:
	MOVOU (DX), X0
	MOVOU X0, (BX)
	ADDQ  $0x10, BX

tail:
	CMPQ AX, $0x00
	JE   done

generic:
	MOVQ     BX, SI
	ADDQ     $0x10, SI
	MOVOU    (DX), X0
	MOVOU    16(DX), X1
	MOVOU    X1, (BX)
	PCMPEQQ  X0, X1
	PMOVMSKB X1, DI
	CMPL     DI, $0x0000ffff
	CMOVQNE  SI, BX
	ADDQ     $0x10, DX
	SUBQ     $0x10, AX
	CMPQ     AX, $0x00
	JG       generic

done:
	SUBQ CX, BX
	MOVQ BX, ret+48(FP)
	RET

short:
	MOVQ AX, ret+48(FP)
	RET

avx2:
	VMOVDQU (DX), X0
	VMOVDQU X0, (BX)
	XORQ    R14, R14
	MOVQ    $0x0000000000000010, R15
	ADDQ    $0x10, BX
	CMPQ    AX, $0x00000080
	JL      avx2_tail64

avx2_loop128:
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   32(DX), X4
	VMOVDQU   48(DX), X5
	VMOVDQU   64(DX), X7
	VMOVDQU   80(DX), X8
	VMOVDQU   96(DX), X9
	VMOVDQU   112(DX), X10
	VMOVDQU   128(DX), X11
	VMOVDQA   X2, X1
	VPCMPEQQ  X2, X0, X0
	VMOVMSKPD X0, SI
	CMPQ      SI, $0x03
	CMOVQEQ   R14, SI
	CMOVQNE   R15, SI
	VMOVDQA   X4, X3
	VPCMPEQQ  X4, X2, X2
	VMOVMSKPD X2, DI
	CMPQ      DI, $0x03
	CMOVQEQ   R14, DI
	CMOVQNE   R15, DI
	VMOVDQA   X5, X0
	VPCMPEQQ  X5, X4, X4
	VMOVMSKPD X4, R8
	CMPQ      R8, $0x03
	CMOVQEQ   R14, R8
	CMOVQNE   R15, R8
	VMOVDQA   X7, X6
	VPCMPEQQ  X7, X5, X5
	VMOVMSKPD X5, R9
	CMPQ      R9, $0x03
	CMOVQEQ   R14, R9
	CMOVQNE   R15, R9
	VMOVDQA   X8, X2
	VPCMPEQQ  X8, X7, X7
	VMOVMSKPD X7, R10
	CMPQ      R10, $0x03
	CMOVQEQ   R14, R10
	CMOVQNE   R15, R10
	VMOVDQA   X9, X4
	VPCMPEQQ  X9, X8, X8
	VMOVMSKPD X8, R11
	CMPQ      R11, $0x03
	CMOVQEQ   R14, R11
	CMOVQNE   R15, R11
	VMOVDQA   X10, X5
	VPCMPEQQ  X10, X9, X9
	VMOVMSKPD X9, R12
	CMPQ      R12, $0x03
	CMOVQEQ   R14, R12
	CMOVQNE   R15, R12
	VPCMPEQQ  X11, X10, X10
	VMOVMSKPD X10, R13
	CMPQ      R13, $0x03
	CMOVQEQ   R14, R13
	CMOVQNE   R15, R13
	ADDQ      SI, DI
	ADDQ      DI, R8
	ADDQ      R8, R9
	ADDQ      R9, R10
	ADDQ      R10, R11
	ADDQ      R11, R12
	ADDQ      R12, R13
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	VMOVDQU   X0, (BX)(DI*1)
	VMOVDQU   X6, (BX)(R8*1)
	VMOVDQU   X2, (BX)(R9*1)
	VMOVDQU   X4, (BX)(R10*1)
	VMOVDQU   X5, (BX)(R11*1)
	VMOVDQU   X11, (BX)(R12*1)
	ADDQ      R13, BX
	ADDQ      $0x00000080, DX
	SUBQ      $0x00000080, AX
	CMPQ      AX, $0x00000080
	JGE       avx2_loop128

avx2_tail64:
	CMPQ      AX, $0x40
	JL        avx2_tail32
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   32(DX), X4
	VMOVDQU   48(DX), X5
	VMOVDQU   64(DX), X6
	VMOVDQA   X2, X1
	VPCMPEQQ  X2, X0, X0
	VMOVMSKPD X0, SI
	CMPQ      SI, $0x03
	CMOVQEQ   R14, SI
	CMOVQNE   R15, SI
	VMOVDQA   X4, X3
	VPCMPEQQ  X4, X2, X2
	VMOVMSKPD X2, DI
	CMPQ      DI, $0x03
	CMOVQEQ   R14, DI
	CMOVQNE   R15, DI
	VMOVDQA   X5, X0
	VPCMPEQQ  X5, X4, X4
	VMOVMSKPD X4, R8
	CMPQ      R8, $0x03
	CMOVQEQ   R14, R8
	CMOVQNE   R15, R8
	VPCMPEQQ  X6, X5, X5
	VMOVMSKPD X5, R9
	CMPQ      R9, $0x03
	CMOVQEQ   R14, R9
	CMOVQNE   R15, R9
	ADDQ      SI, DI
	ADDQ      DI, R8
	ADDQ      R8, R9
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	VMOVDQU   X0, (BX)(DI*1)
	VMOVDQU   X6, (BX)(R8*1)
	ADDQ      R9, BX
	ADDQ      $0x40, DX
	SUBQ      $0x40, AX

avx2_tail32:
	CMPQ      AX, $0x20
	JL        avx2_tail16
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X2
	VMOVDQU   32(DX), X3
	VMOVDQA   X2, X1
	VPCMPEQQ  X2, X0, X0
	VMOVMSKPD X0, SI
	CMPQ      SI, $0x03
	CMOVQEQ   R14, SI
	CMOVQNE   R15, SI
	VPCMPEQQ  X3, X2, X2
	VMOVMSKPD X2, DI
	CMPQ      DI, $0x03
	CMOVQEQ   R14, DI
	CMOVQNE   R15, DI
	ADDQ      SI, DI
	VMOVDQU   X1, (BX)
	VMOVDQU   X3, (BX)(SI*1)
	ADDQ      DI, BX
	ADDQ      $0x20, DX
	SUBQ      $0x20, AX

avx2_tail16:
	CMPQ      AX, $0x10
	JL        avx2_tail
	VMOVDQU   (DX), X0
	VMOVDQU   16(DX), X1
	VPCMPEQQ  X1, X0, X0
	VMOVMSKPD X0, SI
	CMPQ      SI, $0x03
	CMOVQEQ   R14, SI
	CMOVQNE   R15, SI
	VMOVDQU   X1, (BX)
	ADDQ      SI, BX
	ADDQ      $0x10, DX
	SUBQ      $0x10, AX

avx2_tail:
	VZEROUPPER
	JMP tail

// func dedupe32(dst []byte, src []byte) int
// Requires: AVX, AVX2, CMOV, SSE2, SSE4.1
TEXT ·dedupe32(SB), NOSPLIT, $0-56
	MOVQ src_len+32(FP), AX
	CMPQ AX, $0x00
	JE   short
	MOVQ dst_base+0(FP), CX
	MOVQ src_base+24(FP), DX
	MOVQ CX, BX
	SUBQ $0x20, AX
	CMPQ AX, $0x20
	JL   init
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

init:
	MOVOU (DX), X0
	MOVOU 16(DX), X1
	MOVOU X0, (BX)
	MOVOU X1, 16(BX)
	ADDQ  $0x20, BX

tail:
	CMPQ AX, $0x00
	JE   done

generic:
	MOVQ     BX, SI
	ADDQ     $0x20, SI
	MOVOU    (DX), X0
	MOVOU    16(DX), X1
	MOVOU    32(DX), X2
	MOVOU    48(DX), X3
	MOVOU    X2, (BX)
	MOVOU    X3, 16(BX)
	PCMPEQQ  X0, X2
	PCMPEQQ  X1, X3
	PMOVMSKB X2, DI
	PMOVMSKB X3, R8
	ANDL     R8, DI
	CMPL     DI, $0x0000ffff
	CMOVQNE  SI, BX
	ADDQ     $0x20, DX
	SUBQ     $0x20, AX
	CMPQ     AX, $0x00
	JG       generic

done:
	SUBQ CX, BX
	MOVQ BX, ret+48(FP)
	RET

short:
	MOVQ AX, ret+48(FP)
	RET

avx2:
	VMOVDQU (DX), Y0
	VMOVDQU Y0, (BX)
	XORQ    R14, R14
	MOVQ    $0x0000000000000020, R15
	ADDQ    $0x20, BX
	CMPQ    AX, $0x00000100
	JL      avx2_tail128

avx2_loop256:
	VMOVDQU   (DX), Y0
	VMOVDQU   32(DX), Y2
	VMOVDQU   64(DX), Y4
	VMOVDQU   96(DX), Y5
	VMOVDQU   128(DX), Y7
	VMOVDQU   160(DX), Y8
	VMOVDQU   192(DX), Y9
	VMOVDQU   224(DX), Y10
	VMOVDQU   256(DX), Y11
	VMOVDQA   Y2, Y1
	VPCMPEQQ  Y2, Y0, Y0
	VMOVMSKPD Y0, SI
	CMPQ      SI, $0x0f
	CMOVQEQ   R14, SI
	CMOVQNE   R15, SI
	VMOVDQA   Y4, Y3
	VPCMPEQQ  Y4, Y2, Y2
	VMOVMSKPD Y2, DI
	CMPQ      DI, $0x0f
	CMOVQEQ   R14, DI
	CMOVQNE   R15, DI
	VMOVDQA   Y5, Y0
	VPCMPEQQ  Y5, Y4, Y4
	VMOVMSKPD Y4, R8
	CMPQ      R8, $0x0f
	CMOVQEQ   R14, R8
	CMOVQNE   R15, R8
	VMOVDQA   Y7, Y6
	VPCMPEQQ  Y7, Y5, Y5
	VMOVMSKPD Y5, R9
	CMPQ      R9, $0x0f
	CMOVQEQ   R14, R9
	CMOVQNE   R15, R9
	VMOVDQA   Y8, Y2
	VPCMPEQQ  Y8, Y7, Y7
	VMOVMSKPD Y7, R10
	CMPQ      R10, $0x0f
	CMOVQEQ   R14, R10
	CMOVQNE   R15, R10
	VMOVDQA   Y9, Y4
	VPCMPEQQ  Y9, Y8, Y8
	VMOVMSKPD Y8, R11
	CMPQ      R11, $0x0f
	CMOVQEQ   R14, R11
	CMOVQNE   R15, R11
	VMOVDQA   Y10, Y5
	VPCMPEQQ  Y10, Y9, Y9
	VMOVMSKPD Y9, R12
	CMPQ      R12, $0x0f
	CMOVQEQ   R14, R12
	CMOVQNE   R15, R12
	VPCMPEQQ  Y11, Y10, Y10
	VMOVMSKPD Y10, R13
	CMPQ      R13, $0x0f
	CMOVQEQ   R14, R13
	CMOVQNE   R15, R13
	ADDQ      SI, DI
	ADDQ      DI, R8
	ADDQ      R8, R9
	ADDQ      R9, R10
	ADDQ      R10, R11
	ADDQ      R11, R12
	ADDQ      R12, R13
	VMOVDQU   Y1, (BX)
	VMOVDQU   Y3, (BX)(SI*1)
	VMOVDQU   Y0, (BX)(DI*1)
	VMOVDQU   Y6, (BX)(R8*1)
	VMOVDQU   Y2, (BX)(R9*1)
	VMOVDQU   Y4, (BX)(R10*1)
	VMOVDQU   Y5, (BX)(R11*1)
	VMOVDQU   Y11, (BX)(R12*1)
	ADDQ      R13, BX
	ADDQ      $0x00000100, DX
	SUBQ      $0x00000100, AX
	CMPQ      AX, $0x00000100
	JGE       avx2_loop256

avx2_tail128:
	CMPQ      AX, $0x80
	JL        avx2_tail64
	VMOVDQU   (DX), Y0
	VMOVDQU   32(DX), Y2
	VMOVDQU   64(DX), Y4
	VMOVDQU   96(DX), Y5
	VMOVDQU   128(DX), Y6
	VMOVDQA   Y2, Y1
	VPCMPEQQ  Y2, Y0, Y0
	VMOVMSKPD Y0, SI
	CMPQ      SI, $0x0f
	CMOVQEQ   R14, SI
	CMOVQNE   R15, SI
	VMOVDQA   Y4, Y3
	VPCMPEQQ  Y4, Y2, Y2
	VMOVMSKPD Y2, DI
	CMPQ      DI, $0x0f
	CMOVQEQ   R14, DI
	CMOVQNE   R15, DI
	VMOVDQA   Y5, Y0
	VPCMPEQQ  Y5, Y4, Y4
	VMOVMSKPD Y4, R8
	CMPQ      R8, $0x0f
	CMOVQEQ   R14, R8
	CMOVQNE   R15, R8
	VPCMPEQQ  Y6, Y5, Y5
	VMOVMSKPD Y5, R9
	CMPQ      R9, $0x0f
	CMOVQEQ   R14, R9
	CMOVQNE   R15, R9
	ADDQ      SI, DI
	ADDQ      DI, R8
	ADDQ      R8, R9
	VMOVDQU   Y1, (BX)
	VMOVDQU   Y3, (BX)(SI*1)
	VMOVDQU   Y0, (BX)(DI*1)
	VMOVDQU   Y6, (BX)(R8*1)
	ADDQ      R9, BX
	ADDQ      $0x80, DX
	SUBQ      $0x80, AX

avx2_tail64:
	CMPQ      AX, $0x40
	JL        avx2_tail32
	VMOVDQU   (DX), Y0
	VMOVDQU   32(DX), Y2
	VMOVDQU   64(DX), Y3
	VMOVDQA   Y2, Y1
	VPCMPEQQ  Y2, Y0, Y0
	VMOVMSKPD Y0, SI
	CMPQ      SI, $0x0f
	CMOVQEQ   R14, SI
	CMOVQNE   R15, SI
	VPCMPEQQ  Y3, Y2, Y2
	VMOVMSKPD Y2, DI
	CMPQ      DI, $0x0f
	CMOVQEQ   R14, DI
	CMOVQNE   R15, DI
	ADDQ      SI, DI
	VMOVDQU   Y1, (BX)
	VMOVDQU   Y3, (BX)(SI*1)
	ADDQ      DI, BX
	ADDQ      $0x40, DX
	SUBQ      $0x40, AX

avx2_tail32:
	CMPQ      AX, $0x20
	JL        avx2_tail
	VMOVDQU   (DX), Y0
	VMOVDQU   32(DX), Y1
	VPCMPEQQ  Y1, Y0, Y0
	VMOVMSKPD Y0, SI
	CMPQ      SI, $0x0f
	CMOVQEQ   R14, SI
	CMOVQNE   R15, SI
	VMOVDQU   Y1, (BX)
	ADDQ      SI, BX
	ADDQ      $0x20, DX
	SUBQ      $0x20, AX

avx2_tail:
	VZEROUPPER
	JMP tail
