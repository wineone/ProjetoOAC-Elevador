	.file	"projetoSem.c"
	.option nopic
	.text
	.align	1
	.globl	init
	.type	init, @function
init:
	lui	a5,%hi(estadoAtual)
	sw	zero,%lo(estadoAtual)(a5)
	addi	a5,a5,%lo(estadoAtual)
	li	a4,1
	sw	a4,4(a5)
	ret
	.size	init, .-init
	.align	1
	.globl	print
	.type	print, @function
print:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	lui	s0,%hi(estadoAtual)
	lw	a1,%lo(estadoAtual)(s0)
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	printf
	addi	s0,s0,%lo(estadoAtual)
	lw	a5,4(s0)
	beqz	a5,.L3
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	puts
.L2:
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
.L3:
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	puts
	j	.L2
	.size	print, .-print
	.align	1
	.globl	description
	.type	description, @function
description:
	addi	sp,sp,-16
	sw	ra,12(sp)
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	puts
	lui	a0,%hi(.LC4)
	addi	a0,a0,%lo(.LC4)
	call	puts
	lui	a0,%hi(.LC5)
	addi	a0,a0,%lo(.LC5)
	call	puts
	lui	a0,%hi(.LC6)
	addi	a0,a0,%lo(.LC6)
	call	puts
	lui	a0,%hi(.LC7)
	addi	a0,a0,%lo(.LC7)
	call	puts
	lui	a0,%hi(.LC8)
	addi	a0,a0,%lo(.LC8)
	call	puts
	lui	a0,%hi(.LC9)
	addi	a0,a0,%lo(.LC9)
	call	puts
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	description, .-description
	.align	1
	.globl	option
	.type	option, @function
option:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	lui	a0,%hi(.LC10)
	addi	a0,a0,%lo(.LC10)
	call	printf
	lui	s1,%hi(stdin)
	lw	a0,%lo(stdin)(s1)
	call	getc
	lui	s0,%hi(command)
	sb	a0,%lo(command)(s0)
	lw	a0,%lo(stdin)(s1)
	call	getc
	lbu	a0,%lo(command)(s0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
	.size	option, .-option
	.align	1
	.globl	solve
	.type	solve, @function
solve:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	s6,0(sp)
	call	description
	lui	s0,%hi(estadoAtual)
	addi	s1,s0,%lo(estadoAtual)
	lui	s3,%hi(.LC15)
	lui	s2,%hi(.L14)
	addi	s2,s2,%lo(.L14)
	lui	s6,%hi(.LC14)
	lui	s4,%hi(.LC13)
	lui	s5,%hi(.LC12)
	j	.L11
.L18:
	sw	zero,4(s1)
.L11:
	lw	a0,%lo(estadoAtual)(s0)
	lw	a1,4(s1)
	call	print
	call	option
	addi	a0,a0,-91
	andi	a4,a0,0xff
	li	a5,27
	bgtu	a4,a5,.L12
	slli	a0,a4,2
	add	a0,a0,s2
	lw	a5,0(a0)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L14:
	.word	.L18
	.word	.L12
	.word	.L17
	.word	.L16
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L10
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L13
	.text
.L17:
	li	a5,1
	sw	a5,4(s1)
	j	.L11
.L16:
	lw	a5,%lo(estadoAtual)(s0)
	li	a4,2
	beq	a5,a4,.L25
	lw	a4,4(s1)
	beqz	a4,.L26
	addi	a5,a5,1
	sw	a5,%lo(estadoAtual)(s0)
	j	.L11
.L25:
	lui	a0,%hi(.LC11)
	addi	a0,a0,%lo(.LC11)
	call	puts
	j	.L11
.L26:
	addi	a0,s5,%lo(.LC12)
	call	puts
	j	.L11
.L13:
	lw	a5,%lo(estadoAtual)(s0)
	beqz	a5,.L27
	lw	a4,4(s1)
	beqz	a4,.L28
	addi	a5,a5,-1
	sw	a5,%lo(estadoAtual)(s0)
	j	.L11
.L27:
	addi	a0,s4,%lo(.LC13)
	call	puts
	j	.L11
.L28:
	addi	a0,s6,%lo(.LC14)
	call	puts
	j	.L11
.L12:
	addi	a0,s3,%lo(.LC15)
	call	puts
	j	.L11
.L10:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	lw	s6,0(sp)
	addi	sp,sp,32
	jr	ra
	.size	solve, .-solve
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	init
	call	solve
	li	a0,0
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.comm	command,1,1
	.comm	estadoAtual,8,4
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"\nO elevador est\303\241 no andar %d\n"
	.zero	1
.LC1:
	.string	"O elevador est\303\241 com a porta fechada"
	.zero	3
.LC2:
	.string	"O elevador est\303\241 com a porta aberta"
.LC3:
	.string	"Maquina de estados para simular um elevador em um edificio com 3 andares."
	.zero	2
.LC4:
	.string	"Para comandar o elevador s\303\243o disponibilizadas os seguintes comandos:"
	.zero	2
.LC5:
	.string	"^ -> subir de andar"
.LC6:
	.string	"v -> descer de andar"
	.zero	3
.LC7:
	.string	"[ -> abrir a porta para a entrada de pessoas"
	.zero	3
.LC8:
	.string	"] -> fecha a porta para o elevador para o elevador poder se mover"
	.zero	2
.LC9:
	.string	"q -> acaba a execu\303\247\303\243o da maquina de estados"
	.zero	2
.LC10:
	.string	"\nInsira a op\303\247\303\243o que deseja: "
	.zero	1
.LC11:
	.string	"\n----------------- ERRO --------------\n        -> Voc\303\252 j\303\241 est\303\241 no \303\272ltimo andar\n"
.LC12:
	.string	"\n----------------- ERRO --------------\n        -> Voc\303\252 n\303\243o pode subir com o elevador de porta aberta\n"
.LC13:
	.string	"\n------------------ ERRO ------------------\n        -> Voc\303\252 j\303\241 est\303\241 no t\303\251rreo\n"
	.zero	1
.LC14:
	.string	"\n----------------- ERRO --------------\n        -> Voc\303\252 n\303\243o pode descer com o elevador de porta aberta\n"
	.zero	3
.LC15:
	.string	"\n--------------- COMANDO N\303\203O EXISTE --------------\n"
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
