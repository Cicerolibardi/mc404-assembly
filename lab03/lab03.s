	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	.file	"lab03.c"
	.globl	read
	.p2align	2
	.type	read,@function
read:
.Lfunc_begin0:
	.file	1 "/mnt/c/Users/C\303\255cero/Desktop/Unicamp/6 semestre/MC404" "lab03.c"
	.loc	1 1 0
	.cfi_sections .debug_frame
	.cfi_startproc
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
.Ltmp0:
	.loc	1 11 10 prologue_end
	lw	a3, -12(s0)
	.loc	1 11 21 is_stmt 0
	lw	a4, -16(s0)
	.loc	1 11 33
	lw	a5, -20(s0)
	.loc	1 3 5 is_stmt 1
	#APP
	mv	a0, a3	# file descriptor
	mv	a1, a4	# buffer 
	mv	a2, a5	# size 
	addi	a7, zero, 63	# syscall read (63) 
	ecall	

	mv	a3, a0
	#NO_APP
	sw	a3, -28(s0)
	lw	a0, -28(s0)
	sw	a0, -24(s0)
	.loc	1 14 12
	lw	a0, -24(s0)
	.loc	1 14 5 is_stmt 0
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp1:
.Lfunc_end0:
	.size	read, .Lfunc_end0-read
	.cfi_endproc

	.globl	write
	.p2align	2
	.type	write,@function
write:
.Lfunc_begin1:
	.loc	1 17 0 is_stmt 1
	.cfi_startproc
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
.Ltmp2:
	.loc	1 25 10 prologue_end
	lw	a3, -12(s0)
	.loc	1 25 21 is_stmt 0
	lw	a4, -16(s0)
	.loc	1 25 33
	lw	a5, -20(s0)
	.loc	1 18 5 is_stmt 1
	#APP
	mv	a0, a3	# file descriptor
	mv	a1, a4	# buffer 
	mv	a2, a5	# size 
	addi	a7, zero, 64	# syscall write (64) 
	ecall	

	#NO_APP
	.loc	1 28 1
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp3:
.Lfunc_end1:
	.size	write, .Lfunc_end1-write
	.cfi_endproc

	.globl	reconhecer_entrada
	.p2align	2
	.type	reconhecer_entrada,@function
reconhecer_entrada:
.Lfunc_begin2:
	.loc	1 31 0
	.cfi_startproc
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
.Ltmp4:
	.loc	1 32 9 prologue_end
	lw	a0, -16(s0)
	lbu	a0, 1(a0)
	addi	a1, zero, 120
.Ltmp5:
	.loc	1 32 9 is_stmt 0
	beq	a0, a1, .LBB2_2
	j	.LBB2_1
.LBB2_1:
	.loc	1 0 9
	mv	a0, zero
.Ltmp6:
	.loc	1 33 9 is_stmt 1
	sw	a0, -12(s0)
	j	.LBB2_3
.Ltmp7:
.LBB2_2:
	.loc	1 0 9 is_stmt 0
	addi	a0, zero, 1
	.loc	1 35 5 is_stmt 1
	sw	a0, -12(s0)
	j	.LBB2_3
.LBB2_3:
	.loc	1 36 1
	lw	a0, -12(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Ltmp8:
.Lfunc_end2:
	.size	reconhecer_entrada, .Lfunc_end2-reconhecer_entrada
	.cfi_endproc

	.globl	elevar_numero
	.p2align	2
	.type	elevar_numero,@function
elevar_numero:
.Lfunc_begin3:
	.loc	1 38 0
	.cfi_startproc
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	addi	a0, zero, 1
.Ltmp9:
	.loc	1 39 9 prologue_end
	sw	a0, -20(s0)
	mv	a0, zero
.Ltmp10:
	.loc	1 40 14
	sw	a0, -24(s0)
	.loc	1 40 10 is_stmt 0
	j	.LBB3_1
.LBB3_1:
.Ltmp11:
	.loc	1 40 21
	lw	a0, -24(s0)
	.loc	1 40 25
	lw	a1, -16(s0)
.Ltmp12:
	.loc	1 40 5
	bge	a0, a1, .LBB3_4
	j	.LBB3_2
.LBB3_2:
.Ltmp13:
	.loc	1 41 20 is_stmt 1
	lw	a1, -12(s0)
	.loc	1 41 17 is_stmt 0
	lw	a0, -20(s0)
	mul	a0, a0, a1
	sw	a0, -20(s0)
	.loc	1 42 5 is_stmt 1
	j	.LBB3_3
.Ltmp14:
.LBB3_3:
	.loc	1 40 36
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	.loc	1 40 5 is_stmt 0
	j	.LBB3_1
.Ltmp15:
.LBB3_4:
	.loc	1 43 12 is_stmt 1
	lw	a0, -20(s0)
	.loc	1 43 5 is_stmt 0
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp16:
.Lfunc_end3:
	.size	elevar_numero, .Lfunc_end3-elevar_numero
	.cfi_endproc

	.globl	transformar_str_int
	.p2align	2
	.type	transformar_str_int,@function
transformar_str_int:
.Lfunc_begin4:
	.loc	1 46 0 is_stmt 1
	.cfi_startproc
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sw	ra, 60(sp)
	sw	s0, 56(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	mv	a1, zero
.Ltmp17:
	.loc	1 47 9 prologue_end
	sw	a1, -24(s0)
.Ltmp18:
	.loc	1 49 9
	lw	a0, -16(s0)
.Ltmp19:
	.loc	1 49 9 is_stmt 0
	bne	a0, a1, .LBB4_13
	j	.LBB4_1
.LBB4_1:
.Ltmp20:
	.loc	1 50 13 is_stmt 1
	lw	a0, -12(s0)
	lbu	a0, 0(a0)
	addi	a1, zero, 45
.Ltmp21:
	.loc	1 50 13 is_stmt 0
	bne	a0, a1, .LBB4_7
	j	.LBB4_2
.LBB4_2:
	.loc	1 0 13
	addi	a0, zero, 1
.Ltmp22:
	.loc	1 51 22 is_stmt 1
	sw	a0, -28(s0)
	.loc	1 51 18 is_stmt 0
	j	.LBB4_3
.LBB4_3:
.Ltmp23:
	.loc	1 51 29
	lw	a0, -28(s0)
	.loc	1 51 33
	lw	a1, -20(s0)
	.loc	1 51 35
	addi	a1, a1, -1
.Ltmp24:
	.loc	1 51 13
	bge	a0, a1, .LBB4_6
	j	.LBB4_4
.LBB4_4:
.Ltmp25:
	.loc	1 52 37 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 52 41 is_stmt 0
	lw	a1, -28(s0)
	.loc	1 52 37
	add	a0, a0, a1
	lbu	a0, 0(a0)
	.loc	1 52 44
	addi	a0, a0, -48
	.loc	1 52 71
	sw	a0, -40(s0)
	lw	a0, -20(s0)
	.loc	1 52 73
	sub	a0, a0, a1
	.loc	1 52 77
	addi	a1, a0, -2
	addi	a0, zero, 10
	.loc	1 52 53
	call	elevar_numero
	mv	a1, a0
	.loc	1 52 51
	lw	a0, -40(s0)
	mul	a1, a0, a1
	.loc	1 52 33
	lw	a0, -24(s0)
	add	a0, a0, a1
	sw	a0, -24(s0)
	.loc	1 53 13 is_stmt 1
	j	.LBB4_5
.Ltmp26:
.LBB4_5:
	.loc	1 51 41
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	.loc	1 51 13 is_stmt 0
	j	.LBB4_3
.Ltmp27:
.LBB4_6:
	.loc	1 54 9 is_stmt 1
	j	.LBB4_12
.Ltmp28:
.LBB4_7:
	.loc	1 0 9 is_stmt 0
	mv	a0, zero
.Ltmp29:
	.loc	1 56 22 is_stmt 1
	sw	a0, -32(s0)
	.loc	1 56 18 is_stmt 0
	j	.LBB4_8
.LBB4_8:
.Ltmp30:
	.loc	1 56 29
	lw	a0, -32(s0)
	.loc	1 56 33
	lw	a1, -20(s0)
	.loc	1 56 35
	addi	a1, a1, -1
.Ltmp31:
	.loc	1 56 13
	bge	a0, a1, .LBB4_11
	j	.LBB4_9
.LBB4_9:
.Ltmp32:
	.loc	1 57 37 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 57 41 is_stmt 0
	lw	a1, -32(s0)
	.loc	1 57 37
	add	a0, a0, a1
	lbu	a0, 0(a0)
	.loc	1 57 44
	addi	a0, a0, -48
	.loc	1 57 71
	sw	a0, -44(s0)
	lw	a0, -20(s0)
	.loc	1 57 73
	sub	a0, a0, a1
	.loc	1 57 77
	addi	a1, a0, -2
	addi	a0, zero, 10
	.loc	1 57 53
	call	elevar_numero
	mv	a1, a0
	.loc	1 57 51
	lw	a0, -44(s0)
	mul	a1, a0, a1
	.loc	1 57 33
	lw	a0, -24(s0)
	add	a0, a0, a1
	sw	a0, -24(s0)
	.loc	1 58 13 is_stmt 1
	j	.LBB4_10
.Ltmp33:
.LBB4_10:
	.loc	1 56 41
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	.loc	1 56 13 is_stmt 0
	j	.LBB4_8
.Ltmp34:
.LBB4_11:
	.loc	1 0 13
	j	.LBB4_12
.LBB4_12:
	.loc	1 60 5 is_stmt 1
	j	.LBB4_23
.Ltmp35:
.LBB4_13:
	.loc	1 61 14
	lw	a0, -16(s0)
	addi	a1, zero, 1
.Ltmp36:
	.loc	1 61 14 is_stmt 0
	bne	a0, a1, .LBB4_22
	j	.LBB4_14
.LBB4_14:
	.loc	1 0 14
	addi	a0, zero, 2
.Ltmp37:
	.loc	1 62 18 is_stmt 1
	sw	a0, -36(s0)
	.loc	1 62 14 is_stmt 0
	j	.LBB4_15
.LBB4_15:
.Ltmp38:
	.loc	1 62 25
	lw	a0, -36(s0)
	.loc	1 62 29
	lw	a1, -20(s0)
	.loc	1 62 31
	addi	a1, a1, -1
.Ltmp39:
	.loc	1 62 9
	bge	a0, a1, .LBB4_21
	j	.LBB4_16
.LBB4_16:
.Ltmp40:
	.loc	1 63 17 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 63 21 is_stmt 0
	lw	a1, -36(s0)
	.loc	1 63 17
	add	a0, a0, a1
	lbu	a1, 0(a0)
	addi	a0, zero, 57
.Ltmp41:
	.loc	1 63 17
	blt	a0, a1, .LBB4_18
	j	.LBB4_17
.LBB4_17:
.Ltmp42:
	.loc	1 64 37 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 64 41 is_stmt 0
	lw	a1, -36(s0)
	.loc	1 64 37
	add	a0, a0, a1
	lbu	a0, 0(a0)
	.loc	1 64 44
	addi	a0, a0, -48
	.loc	1 64 71
	sw	a0, -48(s0)
	lw	a0, -20(s0)
	.loc	1 64 73
	sub	a0, a0, a1
	.loc	1 64 77
	addi	a1, a0, -2
	addi	a0, zero, 16
	.loc	1 64 53
	call	elevar_numero
	mv	a1, a0
	.loc	1 64 51
	lw	a0, -48(s0)
	mul	a1, a0, a1
	.loc	1 64 33
	lw	a0, -24(s0)
	add	a0, a0, a1
	sw	a0, -24(s0)
	.loc	1 65 13 is_stmt 1
	j	.LBB4_19
.Ltmp43:
.LBB4_18:
	.loc	1 67 37
	lw	a0, -12(s0)
	.loc	1 67 41 is_stmt 0
	lw	a1, -36(s0)
	.loc	1 67 37
	add	a0, a0, a1
	lbu	a0, 0(a0)
	.loc	1 67 49
	addi	a0, a0, -87
	.loc	1 67 76
	sw	a0, -52(s0)
	lw	a0, -20(s0)
	.loc	1 67 78
	sub	a0, a0, a1
	.loc	1 67 82
	addi	a1, a0, -2
	addi	a0, zero, 16
	.loc	1 67 58
	call	elevar_numero
	mv	a1, a0
	.loc	1 67 56
	lw	a0, -52(s0)
	mul	a1, a0, a1
	.loc	1 67 33
	lw	a0, -24(s0)
	add	a0, a0, a1
	sw	a0, -24(s0)
	j	.LBB4_19
.Ltmp44:
.LBB4_19:
	.loc	1 69 9 is_stmt 1
	j	.LBB4_20
.Ltmp45:
.LBB4_20:
	.loc	1 62 37
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	.loc	1 62 9 is_stmt 0
	j	.LBB4_15
.Ltmp46:
.LBB4_21:
	.loc	1 70 5 is_stmt 1
	j	.LBB4_22
.Ltmp47:
.LBB4_22:
	.loc	1 0 5 is_stmt 0
	j	.LBB4_23
.LBB4_23:
	.loc	1 72 12 is_stmt 1
	lw	a0, -24(s0)
	.loc	1 72 5 is_stmt 0
	lw	s0, 56(sp)
	lw	ra, 60(sp)
	addi	sp, sp, 64
	ret
.Ltmp48:
.Lfunc_end4:
	.size	transformar_str_int, .Lfunc_end4-transformar_str_int
	.cfi_endproc

	.globl	inteiro_para_binario
	.p2align	2
	.type	inteiro_para_binario,@function
inteiro_para_binario:
.Lfunc_begin5:
	.loc	1 75 0 is_stmt 1
	.cfi_startproc
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sw	ra, 76(sp)
	sw	s0, 72(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 80
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	mv	a0, zero
.Ltmp49:
	.loc	1 78 9 prologue_end
	sw	a0, -72(s0)
	.loc	1 80 5
	j	.LBB5_1
.LBB5_1:
	.loc	1 80 12 is_stmt 0
	lw	a0, -12(s0)
	mv	a1, zero
	.loc	1 80 5
	beq	a0, a1, .LBB5_3
	j	.LBB5_2
.LBB5_2:
.Ltmp50:
	.loc	1 81 33 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 81 41 is_stmt 0
	andi	a0, a0, 1
	.loc	1 81 27
	lw	a2, -72(s0)
	addi	a1, s0, -66
	.loc	1 81 9
	add	a1, a1, a2
	.loc	1 81 30
	sb	a0, 0(a1)
	.loc	1 82 10 is_stmt 1
	lw	a0, -72(s0)
	addi	a0, a0, 1
	sw	a0, -72(s0)
	.loc	1 83 19
	lw	a0, -12(s0)
	.loc	1 83 27 is_stmt 0
	srli	a0, a0, 1
	.loc	1 83 17
	sw	a0, -12(s0)
.Ltmp51:
	.loc	1 80 5 is_stmt 1
	j	.LBB5_1
.LBB5_3:
	.loc	1 86 5
	lw	a1, -16(s0)
	addi	a0, zero, 48
	.loc	1 86 16 is_stmt 0
	sb	a0, 0(a1)
	.loc	1 87 5 is_stmt 1
	lw	a1, -16(s0)
	addi	a0, zero, 98
	.loc	1 87 16 is_stmt 0
	sb	a0, 1(a1)
	addi	a0, zero, 2
	.loc	1 88 9 is_stmt 1
	sw	a0, -76(s0)
.Ltmp52:
	.loc	1 89 18
	lw	a0, -72(s0)
	.loc	1 89 20 is_stmt 0
	addi	a0, a0, -1
	.loc	1 89 14
	sw	a0, -80(s0)
	.loc	1 89 10
	j	.LBB5_4
.LBB5_4:
.Ltmp53:
	.loc	1 89 25
	lw	a0, -80(s0)
	mv	a1, zero
.Ltmp54:
	.loc	1 89 5
	blt	a0, a1, .LBB5_7
	j	.LBB5_5
.LBB5_5:
.Ltmp55:
	.loc	1 90 40 is_stmt 1
	lw	a1, -80(s0)
	addi	a0, s0, -66
	.loc	1 90 22 is_stmt 0
	add	a0, a0, a1
	lb	a0, 0(a0)
	.loc	1 90 43
	addi	a0, a0, 48
	.loc	1 90 9
	lw	a1, -16(s0)
	.loc	1 90 17
	lw	a2, -76(s0)
	.loc	1 90 9
	add	a1, a1, a2
	.loc	1 90 20
	sb	a0, 0(a1)
	.loc	1 91 10 is_stmt 1
	lw	a0, -76(s0)
	addi	a0, a0, 1
	sw	a0, -76(s0)
	.loc	1 92 5
	j	.LBB5_6
.Ltmp56:
.LBB5_6:
	.loc	1 89 34
	lw	a0, -80(s0)
	addi	a0, a0, -1
	sw	a0, -80(s0)
	.loc	1 89 5 is_stmt 0
	j	.LBB5_4
.Ltmp57:
.LBB5_7:
	.loc	1 94 5 is_stmt 1
	lw	a0, -16(s0)
	.loc	1 94 13 is_stmt 0
	lw	a1, -76(s0)
	.loc	1 94 5
	add	a1, a0, a1
	addi	a0, zero, 10
	.loc	1 94 16
	sb	a0, 0(a1)
	.loc	1 95 5 is_stmt 1
	lw	a1, -16(s0)
	.loc	1 95 13 is_stmt 0
	lw	a0, -76(s0)
	.loc	1 95 14
	add	a1, a0, a1
	mv	a0, zero
	.loc	1 95 18
	sb	a0, 1(a1)
	.loc	1 96 12 is_stmt 1
	lw	a0, -76(s0)
	.loc	1 96 13 is_stmt 0
	addi	a0, a0, 2
	.loc	1 96 5
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	ret
.Ltmp58:
.Lfunc_end5:
	.size	inteiro_para_binario, .Lfunc_end5-inteiro_para_binario
	.cfi_endproc

	.globl	inteiro_para_hexadecimal
	.p2align	2
	.type	inteiro_para_hexadecimal,@function
inteiro_para_hexadecimal:
.Lfunc_begin6:
	.loc	1 99 0 is_stmt 1
	.cfi_startproc
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sw	ra, 76(sp)
	sw	s0, 72(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 80
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	mv	a0, zero
.Ltmp59:
	.loc	1 102 9 prologue_end
	sw	a0, -72(s0)
	.loc	1 104 5
	j	.LBB6_1
.LBB6_1:
	.loc	1 104 12 is_stmt 0
	lw	a0, -12(s0)
	mv	a1, zero
	.loc	1 104 5
	beq	a0, a1, .LBB6_3
	j	.LBB6_2
.LBB6_2:
.Ltmp60:
	.loc	1 105 33 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 105 41 is_stmt 0
	andi	a0, a0, 15
	.loc	1 105 27
	lw	a2, -72(s0)
	addi	a1, s0, -66
	.loc	1 105 9
	add	a1, a1, a2
	.loc	1 105 30
	sb	a0, 0(a1)
	.loc	1 106 10 is_stmt 1
	lw	a0, -72(s0)
	addi	a0, a0, 1
	sw	a0, -72(s0)
	.loc	1 107 19
	lw	a0, -12(s0)
	.loc	1 107 27 is_stmt 0
	srli	a0, a0, 4
	.loc	1 107 17
	sw	a0, -12(s0)
.Ltmp61:
	.loc	1 104 5 is_stmt 1
	j	.LBB6_1
.LBB6_3:
	.loc	1 110 5
	lw	a1, -16(s0)
	addi	a0, zero, 48
	.loc	1 110 20 is_stmt 0
	sb	a0, 0(a1)
	.loc	1 111 5 is_stmt 1
	lw	a1, -16(s0)
	addi	a0, zero, 120
	.loc	1 111 20 is_stmt 0
	sb	a0, 1(a1)
	addi	a0, zero, 2
	.loc	1 112 9 is_stmt 1
	sw	a0, -76(s0)
.Ltmp62:
	.loc	1 113 18
	lw	a0, -72(s0)
	.loc	1 113 20 is_stmt 0
	addi	a0, a0, -1
	.loc	1 113 14
	sw	a0, -80(s0)
	.loc	1 113 10
	j	.LBB6_4
.LBB6_4:
.Ltmp63:
	.loc	1 113 25
	lw	a0, -80(s0)
	mv	a1, zero
.Ltmp64:
	.loc	1 113 5
	blt	a0, a1, .LBB6_10
	j	.LBB6_5
.LBB6_5:
.Ltmp65:
	.loc	1 114 31 is_stmt 1
	lw	a1, -80(s0)
	addi	a0, s0, -66
	.loc	1 114 13 is_stmt 0
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a1, zero, 10
.Ltmp66:
	.loc	1 114 13
	blt	a0, a1, .LBB6_7
	j	.LBB6_6
.LBB6_6:
.Ltmp67:
	.loc	1 115 48 is_stmt 1
	lw	a1, -80(s0)
	addi	a0, s0, -66
	.loc	1 115 30 is_stmt 0
	add	a0, a0, a1
	lb	a0, 0(a0)
	.loc	1 115 57
	addi	a0, a0, 87
	.loc	1 115 13
	lw	a1, -16(s0)
	.loc	1 115 25
	lw	a2, -76(s0)
	.loc	1 115 13
	add	a1, a1, a2
	.loc	1 115 28
	sb	a0, 0(a1)
	.loc	1 116 5 is_stmt 1
	j	.LBB6_8
.Ltmp68:
.LBB6_7:
	.loc	1 118 48
	lw	a1, -80(s0)
	addi	a0, s0, -66
	.loc	1 118 30 is_stmt 0
	add	a0, a0, a1
	lb	a0, 0(a0)
	.loc	1 118 51
	addi	a0, a0, 48
	.loc	1 118 13
	lw	a1, -16(s0)
	.loc	1 118 25
	lw	a2, -76(s0)
	.loc	1 118 13
	add	a1, a1, a2
	.loc	1 118 28
	sb	a0, 0(a1)
	j	.LBB6_8
.Ltmp69:
.LBB6_8:
	.loc	1 120 10 is_stmt 1
	lw	a0, -76(s0)
	addi	a0, a0, 1
	sw	a0, -76(s0)
	.loc	1 121 5
	j	.LBB6_9
.Ltmp70:
.LBB6_9:
	.loc	1 113 34
	lw	a0, -80(s0)
	addi	a0, a0, -1
	sw	a0, -80(s0)
	.loc	1 113 5 is_stmt 0
	j	.LBB6_4
.Ltmp71:
.LBB6_10:
	.loc	1 123 5 is_stmt 1
	lw	a0, -16(s0)
	.loc	1 123 17 is_stmt 0
	lw	a1, -76(s0)
	.loc	1 123 5
	add	a1, a0, a1
	addi	a0, zero, 10
	.loc	1 123 20
	sb	a0, 0(a1)
	.loc	1 124 5 is_stmt 1
	lw	a1, -16(s0)
	.loc	1 124 17 is_stmt 0
	lw	a0, -76(s0)
	.loc	1 124 18
	add	a1, a0, a1
	mv	a0, zero
	.loc	1 124 22
	sb	a0, 1(a1)
	.loc	1 125 12 is_stmt 1
	lw	a0, -76(s0)
	.loc	1 125 13 is_stmt 0
	addi	a0, a0, 2
	.loc	1 125 5
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	ret
.Ltmp72:
.Lfunc_end6:
	.size	inteiro_para_hexadecimal, .Lfunc_end6-inteiro_para_hexadecimal
	.cfi_endproc

	.globl	inteiro_para_decimal
	.p2align	2
	.type	inteiro_para_decimal,@function
inteiro_para_decimal:
.Lfunc_begin7:
	.loc	1 128 0 is_stmt 1
	.cfi_startproc
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sw	ra, 76(sp)
	sw	s0, 72(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 80
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sb	a2, -17(s0)
	mv	a0, zero
.Ltmp73:
	.loc	1 131 9 prologue_end
	sw	a0, -72(s0)
.Ltmp74:
	.loc	1 134 9
	lbu	a0, -17(s0)
	addi	a1, zero, 1
.Ltmp75:
	.loc	1 134 9 is_stmt 0
	bne	a0, a1, .LBB7_2
	j	.LBB7_1
.LBB7_1:
.Ltmp76:
	.loc	1 135 9 is_stmt 1
	lw	a1, -16(s0)
	addi	a0, zero, 45
	.loc	1 135 20 is_stmt 0
	sb	a0, 0(a1)
	addi	a0, zero, 1
	.loc	1 136 11 is_stmt 1
	sw	a0, -76(s0)
	.loc	1 137 5
	j	.LBB7_3
.Ltmp77:
.LBB7_2:
	.loc	1 0 5 is_stmt 0
	mv	a0, zero
.Ltmp78:
	.loc	1 139 11 is_stmt 1
	sw	a0, -76(s0)
	j	.LBB7_3
.Ltmp79:
.LBB7_3:
	.loc	1 142 5
	j	.LBB7_4
.LBB7_4:
	.loc	1 142 12 is_stmt 0
	lw	a0, -12(s0)
	mv	a1, zero
	.loc	1 142 5
	beq	a0, a1, .LBB7_6
	j	.LBB7_5
.LBB7_5:
.Ltmp80:
	.loc	1 143 33 is_stmt 1
	lw	a0, -12(s0)
	lui	a1, 838861
	addi	a1, a1, -819
	.loc	1 143 41 is_stmt 0
	mulhu	a2, a0, a1
	srli	a2, a2, 3
	addi	a3, zero, 10
	mul	a2, a2, a3
	sub	a0, a0, a2
	.loc	1 143 27
	lw	a3, -72(s0)
	addi	a2, s0, -67
	.loc	1 143 9
	add	a2, a2, a3
	.loc	1 143 30
	sb	a0, 0(a2)
	.loc	1 144 10 is_stmt 1
	lw	a0, -72(s0)
	addi	a0, a0, 1
	sw	a0, -72(s0)
	.loc	1 145 19
	lw	a0, -12(s0)
	.loc	1 145 27 is_stmt 0
	mulhu	a0, a0, a1
	srli	a0, a0, 3
	.loc	1 145 17
	sw	a0, -12(s0)
.Ltmp81:
	.loc	1 142 5 is_stmt 1
	j	.LBB7_4
.LBB7_6:
.Ltmp82:
	.loc	1 148 18
	lw	a0, -72(s0)
	.loc	1 148 20 is_stmt 0
	addi	a0, a0, -1
	.loc	1 148 14
	sw	a0, -80(s0)
	.loc	1 148 10
	j	.LBB7_7
.LBB7_7:
.Ltmp83:
	.loc	1 148 25
	lw	a0, -80(s0)
	mv	a1, zero
.Ltmp84:
	.loc	1 148 5
	blt	a0, a1, .LBB7_10
	j	.LBB7_8
.LBB7_8:
.Ltmp85:
	.loc	1 149 40 is_stmt 1
	lw	a1, -80(s0)
	addi	a0, s0, -67
	.loc	1 149 22 is_stmt 0
	add	a0, a0, a1
	lb	a0, 0(a0)
	.loc	1 149 43
	addi	a0, a0, 48
	.loc	1 149 9
	lw	a1, -16(s0)
	.loc	1 149 17
	lw	a2, -76(s0)
	.loc	1 149 9
	add	a1, a1, a2
	.loc	1 149 20
	sb	a0, 0(a1)
	.loc	1 150 10 is_stmt 1
	lw	a0, -76(s0)
	addi	a0, a0, 1
	sw	a0, -76(s0)
	.loc	1 151 5
	j	.LBB7_9
.Ltmp86:
.LBB7_9:
	.loc	1 148 34
	lw	a0, -80(s0)
	addi	a0, a0, -1
	sw	a0, -80(s0)
	.loc	1 148 5 is_stmt 0
	j	.LBB7_7
.Ltmp87:
.LBB7_10:
	.loc	1 153 5 is_stmt 1
	lw	a0, -16(s0)
	.loc	1 153 13 is_stmt 0
	lw	a1, -76(s0)
	.loc	1 153 5
	add	a1, a0, a1
	addi	a0, zero, 10
	.loc	1 153 16
	sb	a0, 0(a1)
	.loc	1 154 5 is_stmt 1
	lw	a1, -16(s0)
	.loc	1 154 13 is_stmt 0
	lw	a0, -76(s0)
	.loc	1 154 14
	add	a1, a0, a1
	mv	a0, zero
	.loc	1 154 18
	sb	a0, 1(a1)
	.loc	1 155 12 is_stmt 1
	lw	a0, -76(s0)
	.loc	1 155 13 is_stmt 0
	addi	a0, a0, 2
	.loc	1 155 5
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	ret
.Ltmp88:
.Lfunc_end7:
	.size	inteiro_para_decimal, .Lfunc_end7-inteiro_para_decimal
	.cfi_endproc

	.globl	trocar_endianess
	.p2align	2
	.type	trocar_endianess,@function
trocar_endianess:
.Lfunc_begin8:
	.loc	1 158 0 is_stmt 1
	.cfi_startproc
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	sw	ra, 108(sp)
	sw	s0, 104(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 112
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	addi	a0, zero, 255
.Ltmp89:
	.loc	1 160 9 prologue_end
	sw	a0, -20(s0)
	mv	a2, zero
	.loc	1 164 18
	sw	a2, -104(s0)
	sw	a2, -76(s0)
	.loc	1 165 18
	sw	a2, -80(s0)
	.loc	1 166 18
	sw	a2, -84(s0)
	.loc	1 167 18
	sw	a2, -88(s0)
	.loc	1 168 18
	sw	a2, -92(s0)
	.loc	1 170 20
	lw	a0, -12(s0)
	.loc	1 170 30 is_stmt 0
	lw	a1, -20(s0)
	.loc	1 170 28
	and	a0, a0, a1
	.loc	1 170 18
	sw	a0, -92(s0)
	.loc	1 171 15 is_stmt 1
	lw	a0, -20(s0)
	.loc	1 171 23 is_stmt 0
	slli	a0, a0, 8
	.loc	1 171 13
	sw	a0, -20(s0)
	.loc	1 172 20 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 172 30 is_stmt 0
	lw	a1, -20(s0)
	.loc	1 172 28
	and	a0, a0, a1
	.loc	1 172 18
	sw	a0, -88(s0)
	.loc	1 173 15 is_stmt 1
	lw	a0, -20(s0)
	.loc	1 173 23 is_stmt 0
	slli	a0, a0, 8
	.loc	1 173 13
	sw	a0, -20(s0)
	.loc	1 174 21 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 174 31 is_stmt 0
	lw	a1, -20(s0)
	.loc	1 174 29
	and	a0, a0, a1
	.loc	1 174 19
	sw	a0, -84(s0)
	.loc	1 175 15 is_stmt 1
	lw	a0, -20(s0)
	.loc	1 175 23 is_stmt 0
	slli	a0, a0, 8
	.loc	1 175 13
	sw	a0, -20(s0)
	.loc	1 176 21 is_stmt 1
	lw	a0, -12(s0)
	.loc	1 176 31 is_stmt 0
	lw	a1, -20(s0)
	.loc	1 176 29
	and	a0, a0, a1
	.loc	1 176 19
	sw	a0, -80(s0)
	.loc	1 178 20 is_stmt 1
	lw	a0, -92(s0)
	.loc	1 178 33 is_stmt 0
	slli	a0, a0, 24
	.loc	1 178 18
	sw	a0, -92(s0)
	.loc	1 179 20 is_stmt 1
	lw	a0, -88(s0)
	.loc	1 179 33 is_stmt 0
	slli	a0, a0, 8
	.loc	1 179 18
	sw	a0, -88(s0)
	.loc	1 180 21 is_stmt 1
	lw	a0, -84(s0)
	.loc	1 180 35 is_stmt 0
	srli	a0, a0, 8
	.loc	1 180 19
	sw	a0, -84(s0)
	.loc	1 181 21 is_stmt 1
	lbu	a0, -77(s0)
	.loc	1 181 19 is_stmt 0
	sw	a0, -80(s0)
	.loc	1 183 20 is_stmt 1
	lw	a0, -92(s0)
	.loc	1 183 35 is_stmt 0
	lw	a1, -88(s0)
	.loc	1 183 33
	add	a0, a0, a1
	.loc	1 183 50
	lw	a1, -84(s0)
	.loc	1 183 48
	add	a0, a0, a1
	.loc	1 183 66
	lw	a1, -80(s0)
	.loc	1 183 64
	add	a0, a0, a1
	.loc	1 183 18
	sw	a0, -76(s0)
	.loc	1 184 34 is_stmt 1
	lw	a0, -76(s0)
	addi	a1, s0, -70
	.loc	1 184 13 is_stmt 0
	call	inteiro_para_decimal
	mv	a1, a0
	.loc	1 184 9
	lw	a0, -104(s0)
	sw	a1, -96(s0)
	.loc	1 186 9 is_stmt 1
	sw	a0, -100(s0)
	.loc	1 187 5
	j	.LBB8_1
.LBB8_1:
	.loc	1 187 27 is_stmt 0
	lw	a1, -100(s0)
	addi	a0, s0, -70
	.loc	1 187 12
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a1, zero, 10
	.loc	1 187 5
	beq	a0, a1, .LBB8_3
	j	.LBB8_2
.LBB8_2:
.Ltmp90:
	.loc	1 188 47 is_stmt 1
	lw	a2, -100(s0)
	addi	a0, s0, -70
	.loc	1 188 32 is_stmt 0
	add	a0, a0, a2
	lb	a0, 0(a0)
	.loc	1 188 9
	lw	a1, -16(s0)
	add	a1, a1, a2
	.loc	1 188 30
	sb	a0, 0(a1)
	.loc	1 189 10 is_stmt 1
	lw	a0, -100(s0)
	addi	a0, a0, 1
	sw	a0, -100(s0)
.Ltmp91:
	.loc	1 187 5
	j	.LBB8_1
.LBB8_3:
	.loc	1 191 5
	lw	a0, -16(s0)
	.loc	1 191 23 is_stmt 0
	lw	a1, -100(s0)
	.loc	1 191 5
	add	a1, a0, a1
	addi	a0, zero, 10
	.loc	1 191 26
	sb	a0, 0(a1)
	.loc	1 192 5 is_stmt 1
	lw	a1, -16(s0)
	.loc	1 192 23 is_stmt 0
	lw	a0, -100(s0)
	.loc	1 192 25
	add	a1, a0, a1
	mv	a0, zero
	.loc	1 192 30
	sb	a0, 1(a1)
	.loc	1 193 12 is_stmt 1
	lw	a0, -100(s0)
	.loc	1 193 13 is_stmt 0
	addi	a0, a0, 2
	.loc	1 193 5
	lw	s0, 104(sp)
	lw	ra, 108(sp)
	addi	sp, sp, 112
	ret
.Ltmp92:
.Lfunc_end8:
	.size	trocar_endianess, .Lfunc_end8-trocar_endianess
	.cfi_endproc

	.globl	main
	.p2align	2
	.type	main,@function
main:
.Lfunc_begin9:
	.loc	1 198 0 is_stmt 1
	.cfi_startproc
	addi	sp, sp, -304
	.cfi_def_cfa_offset 304
	sw	ra, 300(sp)
	sw	s0, 296(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 304
	.cfi_def_cfa s0, 0
	mv	a0, zero
	sw	a0, -12(s0)
.Ltmp93:
	.loc	1 207 9 prologue_end
	sw	a0, -240(s0)
	addi	a1, s0, -32
	sw	a1, -272(s0)
	addi	a2, zero, 20
	.loc	1 209 13
	call	read
	mv	a1, a0
	.loc	1 209 9 is_stmt 0
	lw	a0, -272(s0)
	sw	a1, -244(s0)
	.loc	1 211 24 is_stmt 1
	call	reconhecer_entrada
	mv	a1, a0
	.loc	1 211 9 is_stmt 0
	lw	a0, -272(s0)
	sw	a1, -248(s0)
	.loc	1 213 47 is_stmt 1
	lw	a1, -248(s0)
	.loc	1 213 61 is_stmt 0
	lw	a2, -244(s0)
	.loc	1 213 22
	call	transformar_str_int
	.loc	1 213 20
	sw	a0, -36(s0)
	.loc	1 215 27 is_stmt 1
	lw	a0, -36(s0)
	.loc	1 215 9 is_stmt 0
	sw	a0, -252(s0)
.Ltmp94:
	.loc	1 217 9 is_stmt 1
	lbu	a0, -32(s0)
	addi	a1, zero, 45
.Ltmp95:
	.loc	1 217 9 is_stmt 0
	bne	a0, a1, .LBB9_2
	j	.LBB9_1
.LBB9_1:
.Ltmp96:
	.loc	1 218 24 is_stmt 1
	lw	a1, -36(s0)
	mv	a0, zero
	sub	a0, a0, a1
	sw	a0, -36(s0)
	addi	a0, zero, 1
	.loc	1 219 15
	sw	a0, -240(s0)
	.loc	1 220 5
	j	.LBB9_2
.Ltmp97:
.LBB9_2:
	.loc	1 222 9
	lbu	a0, -31(s0)
	addi	a1, zero, 120
	.loc	1 222 23 is_stmt 0
	bne	a0, a1, .LBB9_6
	j	.LBB9_3
.LBB9_3:
	.loc	1 222 26
	lbu	a0, -30(s0)
	addi	a1, zero, 56
	.loc	1 222 39
	blt	a0, a1, .LBB9_6
	j	.LBB9_4
.LBB9_4:
	.loc	1 222 42
	lw	a0, -244(s0)
	addi	a1, zero, 11
.Ltmp98:
	.loc	1 222 9
	blt	a0, a1, .LBB9_6
	j	.LBB9_5
.LBB9_5:
.Ltmp99:
	.loc	1 223 25 is_stmt 1
	lw	a1, -252(s0)
	mv	a0, zero
	sub	a0, a0, a1
	sw	a0, -252(s0)
	addi	a0, zero, 1
	.loc	1 224 15
	sw	a0, -240(s0)
	.loc	1 225 5
	j	.LBB9_6
.Ltmp100:
.LBB9_6:
	.loc	1 227 48
	lw	a0, -36(s0)
	addi	a1, s0, -86
	.loc	1 227 27 is_stmt 0
	sw	a1, -292(s0)
	call	inteiro_para_binario
	.loc	1 227 9
	sw	a0, -256(s0)
	.loc	1 228 56 is_stmt 1
	lw	a0, -36(s0)
	addi	a1, s0, -186
	.loc	1 228 31 is_stmt 0
	sw	a1, -284(s0)
	call	inteiro_para_hexadecimal
	.loc	1 228 9
	sw	a0, -260(s0)
	.loc	1 229 46 is_stmt 1
	lw	a0, -36(s0)
	addi	a1, s0, -236
	.loc	1 229 29 is_stmt 0
	sw	a1, -276(s0)
	call	trocar_endianess
	.loc	1 229 9
	sw	a0, -264(s0)
	.loc	1 230 48 is_stmt 1
	lw	a0, -252(s0)
	.loc	1 230 74 is_stmt 0
	lbu	a2, -240(s0)
	addi	a1, s0, -136
	.loc	1 230 27
	sw	a1, -288(s0)
	call	inteiro_para_decimal
	lw	a1, -292(s0)
	.loc	1 230 9
	sw	a0, -268(s0)
	.loc	1 232 23 is_stmt 1
	lw	a2, -256(s0)
	addi	a0, zero, 1
	.loc	1 232 5 is_stmt 0
	sw	a0, -280(s0)
	call	write
	lw	a1, -288(s0)
	lw	a0, -280(s0)
	.loc	1 233 23 is_stmt 1
	lw	a2, -268(s0)
	.loc	1 233 5 is_stmt 0
	call	write
	lw	a1, -284(s0)
	lw	a0, -280(s0)
	.loc	1 234 27 is_stmt 1
	lw	a2, -260(s0)
	.loc	1 234 5 is_stmt 0
	call	write
	lw	a0, -280(s0)
	lw	a1, -276(s0)
	.loc	1 235 33 is_stmt 1
	lw	a2, -264(s0)
	.loc	1 235 5 is_stmt 0
	call	write
	mv	a0, zero
	.loc	1 237 5 is_stmt 1
	lw	s0, 296(sp)
	lw	ra, 300(sp)
	addi	sp, sp, 304
	ret
.Ltmp101:
.Lfunc_end9:
	.size	main, .Lfunc_end9-main
	.cfi_endproc

	.globl	_start
	.p2align	2
	.type	_start,@function
_start:
.Lfunc_begin10:
	.loc	1 240 0
	.cfi_startproc
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
.Ltmp102:
	.loc	1 241 3 prologue_end
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	call	main
	.loc	1 242 1
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Ltmp103:
.Lfunc_end10:
	.size	_start, .Lfunc_end10-_start
	.cfi_endproc

	.section	.debug_abbrev,"",@progbits
	.byte	1
	.byte	17
	.byte	1
	.byte	37
	.byte	14
	.byte	19
	.byte	5
	.byte	3
	.byte	14
	.byte	16
	.byte	23
	.byte	27
	.byte	14
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	2
	.byte	46
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	39
	.byte	25
	.byte	73
	.byte	19
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	3
	.byte	5
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	4
	.byte	52
	.byte	0
	.byte	2
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	5
	.byte	46
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	39
	.byte	25
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	6
	.byte	11
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	0
	.byte	0
	.byte	7
	.byte	46
	.byte	1
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	73
	.byte	19
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	8
	.byte	46
	.byte	0
	.byte	17
	.byte	1
	.byte	18
	.byte	6
	.byte	64
	.byte	24
	.byte	3
	.byte	14
	.byte	58
	.byte	11
	.byte	59
	.byte	11
	.byte	63
	.byte	25
	.byte	0
	.byte	0
	.byte	9
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	62
	.byte	11
	.byte	11
	.byte	11
	.byte	0
	.byte	0
	.byte	10
	.byte	15
	.byte	0
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	11
	.byte	38
	.byte	0
	.byte	0
	.byte	0
	.byte	12
	.byte	1
	.byte	1
	.byte	73
	.byte	19
	.byte	0
	.byte	0
	.byte	13
	.byte	33
	.byte	0
	.byte	73
	.byte	19
	.byte	55
	.byte	11
	.byte	0
	.byte	0
	.byte	14
	.byte	36
	.byte	0
	.byte	3
	.byte	14
	.byte	11
	.byte	11
	.byte	62
	.byte	11
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0
.Ldebug_info_start0:
	.half	4
	.word	.debug_abbrev
	.byte	4
	.byte	1
	.word	.Linfo_string0
	.half	12
	.word	.Linfo_string1
	.word	.Lline_table_start0
	.word	.Linfo_string2
	.word	.Lfunc_begin0
	.word	.Lfunc_end10-.Lfunc_begin0
	.byte	2
	.word	.Lfunc_begin0
	.word	.Lfunc_end0-.Lfunc_begin0
	.byte	1
	.byte	88
	.word	.Linfo_string3
	.byte	1
	.byte	1

	.word	1255

	.byte	3
	.byte	2
	.byte	145
	.byte	116
	.word	.Linfo_string16
	.byte	1
	.byte	1
	.word	1255
	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string17
	.byte	1
	.byte	1
	.word	1269
	.byte	3
	.byte	2
	.byte	145
	.byte	108
	.word	.Linfo_string18
	.byte	1
	.byte	1
	.word	1255
	.byte	4
	.byte	2
	.byte	145
	.byte	104
	.word	.Linfo_string19
	.byte	1
	.byte	2
	.word	1255
	.byte	0
	.byte	5
	.word	.Lfunc_begin1
	.word	.Lfunc_end1-.Lfunc_begin1
	.byte	1
	.byte	88
	.word	.Linfo_string5
	.byte	1
	.byte	17


	.byte	3
	.byte	2
	.byte	145
	.byte	116
	.word	.Linfo_string16
	.byte	1
	.byte	17
	.word	1255
	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string17
	.byte	1
	.byte	17
	.word	1269
	.byte	3
	.byte	2
	.byte	145
	.byte	108
	.word	.Linfo_string18
	.byte	1
	.byte	17
	.word	1255
	.byte	0
	.byte	2
	.word	.Lfunc_begin2
	.word	.Lfunc_end2-.Lfunc_begin2
	.byte	1
	.byte	88
	.word	.Linfo_string6
	.byte	1
	.byte	31

	.word	1255

	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string20
	.byte	1
	.byte	31
	.word	1275
	.byte	0
	.byte	2
	.word	.Lfunc_begin3
	.word	.Lfunc_end3-.Lfunc_begin3
	.byte	1
	.byte	88
	.word	.Linfo_string7
	.byte	1
	.byte	38

	.word	1255

	.byte	3
	.byte	2
	.byte	145
	.byte	116
	.word	.Linfo_string22
	.byte	1
	.byte	38
	.word	1255
	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string23
	.byte	1
	.byte	38
	.word	1255
	.byte	4
	.byte	2
	.byte	145
	.byte	108
	.word	.Linfo_string24
	.byte	1
	.byte	39
	.word	1255
	.byte	6
	.word	.Ltmp10
	.word	.Ltmp15-.Ltmp10
	.byte	4
	.byte	2
	.byte	145
	.byte	104
	.word	.Linfo_string25
	.byte	1
	.byte	40
	.word	1255
	.byte	0
	.byte	0
	.byte	2
	.word	.Lfunc_begin4
	.word	.Lfunc_end4-.Lfunc_begin4
	.byte	1
	.byte	88
	.word	.Linfo_string8
	.byte	1
	.byte	46

	.word	1262

	.byte	3
	.byte	2
	.byte	145
	.byte	116
	.word	.Linfo_string20
	.byte	1
	.byte	46
	.word	1275
	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string26
	.byte	1
	.byte	46
	.word	1255
	.byte	3
	.byte	2
	.byte	145
	.byte	108
	.word	.Linfo_string27
	.byte	1
	.byte	46
	.word	1255
	.byte	4
	.byte	2
	.byte	145
	.byte	104
	.word	.Linfo_string28
	.byte	1
	.byte	47
	.word	1255
	.byte	6
	.word	.Ltmp22
	.word	.Ltmp27-.Ltmp22
	.byte	4
	.byte	2
	.byte	145
	.byte	100
	.word	.Linfo_string29
	.byte	1
	.byte	51
	.word	1255
	.byte	0
	.byte	6
	.word	.Ltmp29
	.word	.Ltmp34-.Ltmp29
	.byte	4
	.byte	2
	.byte	145
	.byte	96
	.word	.Linfo_string29
	.byte	1
	.byte	56
	.word	1255
	.byte	0
	.byte	6
	.word	.Ltmp37
	.word	.Ltmp46-.Ltmp37
	.byte	4
	.byte	2
	.byte	145
	.byte	92
	.word	.Linfo_string29
	.byte	1
	.byte	62
	.word	1255
	.byte	0
	.byte	0
	.byte	2
	.word	.Lfunc_begin5
	.word	.Lfunc_end5-.Lfunc_begin5
	.byte	1
	.byte	88
	.word	.Linfo_string10
	.byte	1
	.byte	75

	.word	1255

	.byte	3
	.byte	2
	.byte	145
	.byte	116
	.word	.Linfo_string30
	.byte	1
	.byte	75
	.word	1262
	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string31
	.byte	1
	.byte	75
	.word	1275
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\276\177"
	.word	.Linfo_string32
	.byte	1
	.byte	76
	.word	1287
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\270\177"
	.word	.Linfo_string25
	.byte	1
	.byte	78
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\264\177"
	.word	.Linfo_string34
	.byte	1
	.byte	88
	.word	1255
	.byte	6
	.word	.Ltmp52
	.word	.Ltmp57-.Ltmp52
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\260\177"
	.word	.Linfo_string29
	.byte	1
	.byte	89
	.word	1255
	.byte	0
	.byte	0
	.byte	2
	.word	.Lfunc_begin6
	.word	.Lfunc_end6-.Lfunc_begin6
	.byte	1
	.byte	88
	.word	.Linfo_string11
	.byte	1
	.byte	99

	.word	1255

	.byte	3
	.byte	2
	.byte	145
	.byte	116
	.word	.Linfo_string30
	.byte	1
	.byte	99
	.word	1262
	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string35
	.byte	1
	.byte	99
	.word	1275
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\276\177"
	.word	.Linfo_string32
	.byte	1
	.byte	100
	.word	1287
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\270\177"
	.word	.Linfo_string25
	.byte	1
	.byte	102
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\264\177"
	.word	.Linfo_string34
	.byte	1
	.byte	112
	.word	1255
	.byte	6
	.word	.Ltmp62
	.word	.Ltmp71-.Ltmp62
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\260\177"
	.word	.Linfo_string29
	.byte	1
	.byte	113
	.word	1255
	.byte	0
	.byte	0
	.byte	2
	.word	.Lfunc_begin7
	.word	.Lfunc_end7-.Lfunc_begin7
	.byte	1
	.byte	88
	.word	.Linfo_string12
	.byte	1
	.byte	128

	.word	1255

	.byte	3
	.byte	2
	.byte	145
	.byte	116
	.word	.Linfo_string30
	.byte	1
	.byte	128
	.word	1262
	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string36
	.byte	1
	.byte	128
	.word	1275
	.byte	3
	.byte	2
	.byte	145
	.byte	111
	.word	.Linfo_string37
	.byte	1
	.byte	128
	.word	1280
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\275\177"
	.word	.Linfo_string32
	.byte	1
	.byte	129
	.word	1287
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\270\177"
	.word	.Linfo_string25
	.byte	1
	.byte	131
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\264\177"
	.word	.Linfo_string34
	.byte	1
	.byte	132
	.word	1255
	.byte	6
	.word	.Ltmp82
	.word	.Ltmp87-.Ltmp82
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\260\177"
	.word	.Linfo_string29
	.byte	1
	.byte	148
	.word	1255
	.byte	0
	.byte	0
	.byte	2
	.word	.Lfunc_begin8
	.word	.Lfunc_end8-.Lfunc_begin8
	.byte	1
	.byte	88
	.word	.Linfo_string13
	.byte	1
	.byte	158

	.word	1255

	.byte	3
	.byte	2
	.byte	145
	.byte	116
	.word	.Linfo_string30
	.byte	1
	.byte	158
	.word	1306
	.byte	3
	.byte	2
	.byte	145
	.byte	112
	.word	.Linfo_string39
	.byte	1
	.byte	158
	.word	1275
	.byte	4
	.byte	2
	.byte	145
	.byte	108
	.word	.Linfo_string40
	.byte	1
	.byte	160
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\272\177"
	.word	.Linfo_string41
	.byte	1
	.byte	162
	.word	1287
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\264\177"
	.word	.Linfo_string42
	.byte	1
	.byte	164
	.word	1306
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\260\177"
	.word	.Linfo_string43
	.byte	1
	.byte	165
	.word	1306
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\254\177"
	.word	.Linfo_string44
	.byte	1
	.byte	166
	.word	1306
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\250\177"
	.word	.Linfo_string45
	.byte	1
	.byte	167
	.word	1306
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\244\177"
	.word	.Linfo_string46
	.byte	1
	.byte	168
	.word	1306
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\240\177"
	.word	.Linfo_string27
	.byte	1
	.byte	184
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\234\177"
	.word	.Linfo_string25
	.byte	1
	.byte	186
	.word	1255
	.byte	0
	.byte	7
	.word	.Lfunc_begin9
	.word	.Lfunc_end9-.Lfunc_begin9
	.byte	1
	.byte	88
	.word	.Linfo_string14
	.byte	1
	.byte	197
	.word	1255

	.byte	4
	.byte	2
	.byte	145
	.byte	96
	.word	.Linfo_string20
	.byte	1
	.byte	199
	.word	1313
	.byte	4
	.byte	2
	.byte	145
	.byte	92
	.word	.Linfo_string47
	.byte	1
	.byte	200
	.word	1262
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\252\177"
	.word	.Linfo_string31
	.byte	1
	.byte	202
	.word	1287
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\370~"
	.word	.Linfo_string36
	.byte	1
	.byte	203
	.word	1287
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\306~"
	.word	.Linfo_string35
	.byte	1
	.byte	204
	.word	1287
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\224~"
	.word	.Linfo_string39
	.byte	1
	.byte	205
	.word	1287
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\220~"
	.word	.Linfo_string37
	.byte	1
	.byte	207
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\214~"
	.word	.Linfo_string27
	.byte	1
	.byte	209
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\210~"
	.word	.Linfo_string26
	.byte	1
	.byte	211
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\204~"
	.word	.Linfo_string48
	.byte	1
	.byte	215
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\200~"
	.word	.Linfo_string49
	.byte	1
	.byte	227
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\374}"
	.word	.Linfo_string50
	.byte	1
	.byte	228
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\370}"
	.word	.Linfo_string51
	.byte	1
	.byte	229
	.word	1255
	.byte	4
	.byte	3
	.byte	145
	.ascii	"\364}"
	.word	.Linfo_string52
	.byte	1
	.byte	230
	.word	1255
	.byte	0
	.byte	8
	.word	.Lfunc_begin10
	.word	.Lfunc_end10-.Lfunc_begin10
	.byte	1
	.byte	88
	.word	.Linfo_string15
	.byte	1
	.byte	240

	.byte	9
	.word	.Linfo_string4
	.byte	5
	.byte	4
	.byte	9
	.word	.Linfo_string9
	.byte	7
	.byte	4
	.byte	10
	.word	1274
	.byte	11
	.byte	10
	.word	1280
	.byte	9
	.word	.Linfo_string21
	.byte	8
	.byte	1
	.byte	12
	.word	1280
	.byte	13
	.word	1299
	.byte	50
	.byte	0
	.byte	14
	.word	.Linfo_string33
	.byte	8
	.byte	7
	.byte	9
	.word	.Linfo_string38
	.byte	7
	.byte	4
	.byte	12
	.word	1280
	.byte	13
	.word	1299
	.byte	20
	.byte	0
	.byte	0
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 12.0.0-3ubuntu1~20.04.5"
.Linfo_string1:
	.asciz	"lab03.c"
.Linfo_string2:
	.asciz	"/mnt/c/Users/C\303\255cero/Desktop/Unicamp/6 semestre/MC404"
.Linfo_string3:
	.asciz	"read"
.Linfo_string4:
	.asciz	"int"
.Linfo_string5:
	.asciz	"write"
.Linfo_string6:
	.asciz	"reconhecer_entrada"
.Linfo_string7:
	.asciz	"elevar_numero"
.Linfo_string8:
	.asciz	"transformar_str_int"
.Linfo_string9:
	.asciz	"long unsigned int"
.Linfo_string10:
	.asciz	"inteiro_para_binario"
.Linfo_string11:
	.asciz	"inteiro_para_hexadecimal"
.Linfo_string12:
	.asciz	"inteiro_para_decimal"
.Linfo_string13:
	.asciz	"trocar_endianess"
.Linfo_string14:
	.asciz	"main"
.Linfo_string15:
	.asciz	"_start"
.Linfo_string16:
	.asciz	"__fd"
.Linfo_string17:
	.asciz	"__buf"
.Linfo_string18:
	.asciz	"__n"
.Linfo_string19:
	.asciz	"bytes"
.Linfo_string20:
	.asciz	"str"
.Linfo_string21:
	.asciz	"char"
.Linfo_string22:
	.asciz	"base"
.Linfo_string23:
	.asciz	"potencia"
.Linfo_string24:
	.asciz	"elevado"
.Linfo_string25:
	.asciz	"i"
.Linfo_string26:
	.asciz	"tipo_entrada"
.Linfo_string27:
	.asciz	"n"
.Linfo_string28:
	.asciz	"numero_retornar"
.Linfo_string29:
	.asciz	"j"
.Linfo_string30:
	.asciz	"inteiro"
.Linfo_string31:
	.asciz	"binario"
.Linfo_string32:
	.asciz	"numero_provisorio"
.Linfo_string33:
	.asciz	"__ARRAY_SIZE_TYPE__"
.Linfo_string34:
	.asciz	"k"
.Linfo_string35:
	.asciz	"hexadecimal"
.Linfo_string36:
	.asciz	"decimal"
.Linfo_string37:
	.asciz	"token"
.Linfo_string38:
	.asciz	"unsigned int"
.Linfo_string39:
	.asciz	"endianess_trocado"
.Linfo_string40:
	.asciz	"mascara"
.Linfo_string41:
	.asciz	"num_provisorio"
.Linfo_string42:
	.asciz	"numero_final"
.Linfo_string43:
	.asciz	"mais_esquerda"
.Linfo_string44:
	.asciz	"meio_esquerda"
.Linfo_string45:
	.asciz	"meio_direita"
.Linfo_string46:
	.asciz	"mais_direita"
.Linfo_string47:
	.asciz	"numero_inteiro"
.Linfo_string48:
	.asciz	"numero_positivo"
.Linfo_string49:
	.asciz	"tamanho_binario"
.Linfo_string50:
	.asciz	"tamanho_hexadecimal"
.Linfo_string51:
	.asciz	"tamanho_endianess"
.Linfo_string52:
	.asciz	"tamanho_inteiro"
	.ident	"Ubuntu clang version 12.0.0-3ubuntu1~20.04.5"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read
	.addrsig_sym write
	.addrsig_sym reconhecer_entrada
	.addrsig_sym elevar_numero
	.addrsig_sym transformar_str_int
	.addrsig_sym inteiro_para_binario
	.addrsig_sym inteiro_para_hexadecimal
	.addrsig_sym inteiro_para_decimal
	.addrsig_sym trocar_endianess
	.addrsig_sym main
	.section	.debug_line,"",@progbits
.Lline_table_start0:
