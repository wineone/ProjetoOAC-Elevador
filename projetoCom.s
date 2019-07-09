	.file	"projetoCom.c"
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
	sw	zero,8(a5)
	ret
	.size	init, .-init
	.align	1
	.globl	print
	.type	print, @function
print:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
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
.L4:
	lui	a5,%hi(estadoAtual+8)
	lw	a1,%lo(estadoAtual+8)(a5)
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	printf
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L3:
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	puts
	j	.L4
	.size	print, .-print
	.align	1
	.globl	description
	.type	description, @function
description:
	addi	sp,sp,-16
	sw	ra,12(sp)
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
	lui	a0,%hi(.LC10)
	addi	a0,a0,%lo(.LC10)
	call	puts
	lui	a0,%hi(.LC11)
	addi	a0,a0,%lo(.LC11)
	call	puts
	lui	a0,%hi(.LC12)
	addi	a0,a0,%lo(.LC12)
	call	puts
	lui	a0,%hi(.LC13)
	addi	a0,a0,%lo(.LC13)
	call	puts
	lui	a0,%hi(.LC14)
	addi	a0,a0,%lo(.LC14)
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
	lui	a0,%hi(.LC15)
	addi	a0,a0,%lo(.LC15)
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
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	call	description
	lui	s1,%hi(estadoAtual)
	addi	s0,s1,%lo(estadoAtual)
	lui	s2,%hi(.LC23)
	lui	s6,%hi(.LC19)
	lui	s3,%hi(.LC18)
	lui	s5,%hi(.LC17)
	lui	s7,%hi(.LC16)
	lui	s4,%hi(.LC22)
.L11:
	lw	a5,%lo(estadoAtual)(s1)
	sw	a5,0(sp)
	lw	a5,4(s0)
	sw	a5,4(sp)
	lw	a5,8(s0)
	sw	a5,8(sp)
	mv	a0,sp
	call	print
	call	option
	li	a5,93
	beq	a0,a5,.L12
	bgtu	a0,a5,.L13
	li	a5,45
	beq	a0,a5,.L14
	li	a5,91
	beq	a0,a5,.L15
	li	a5,43
	beq	a0,a5,.L31
.L17:
	addi	a0,s2,%lo(.LC23)
	call	puts
	j	.L11
.L13:
	li	a5,113
	beq	a0,a5,.L10
	li	a5,118
	beq	a0,a5,.L19
	li	a5,94
	bne	a0,a5,.L17
	lw	a5,%lo(estadoAtual)(s1)
	li	a4,2
	beq	a5,a4,.L32
	lw	a4,4(s0)
	beqz	a4,.L33
	addi	a5,a5,1
	sw	a5,%lo(estadoAtual)(s1)
	j	.L11
.L15:
	sw	zero,4(s0)
	j	.L11
.L12:
	li	a5,1
	sw	a5,4(s0)
	j	.L11
.L32:
	addi	a0,s7,%lo(.LC16)
	call	puts
	j	.L11
.L33:
	addi	a0,s5,%lo(.LC17)
	call	puts
	j	.L11
.L19:
	lw	a5,%lo(estadoAtual)(s1)
	beqz	a5,.L34
	lw	a4,4(s0)
	beqz	a4,.L35
	addi	a5,a5,-1
	sw	a5,%lo(estadoAtual)(s1)
	j	.L11
.L34:
	addi	a0,s3,%lo(.LC18)
	call	puts
	j	.L11
.L35:
	addi	a0,s6,%lo(.LC19)
	call	puts
	j	.L11
.L31:
	lw	a4,4(s0)
	li	a5,1
	beq	a4,a5,.L36
	lw	a5,8(s0)
	li	a4,3
	beq	a5,a4,.L37
	addi	a5,a5,1
	sw	a5,8(s0)
	j	.L11
.L36:
	lui	a0,%hi(.LC20)
	addi	a0,a0,%lo(.LC20)
	call	puts
	j	.L11
.L37:
	lui	a0,%hi(.LC21)
	addi	a0,a0,%lo(.LC21)
	call	puts
	j	.L11
.L14:
	lw	a4,4(s0)
	li	a5,1
	beq	a4,a5,.L38
	lw	a5,8(s0)
	beqz	a5,.L39
	addi	a5,a5,-1
	sw	a5,8(s0)
	j	.L11
.L38:
	lui	a0,%hi(.LC20)
	addi	a0,a0,%lo(.LC20)
	call	puts
	j	.L11
.L39:
	addi	a0,s4,%lo(.LC22)
	call	puts
	j	.L11
.L10:
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	addi	sp,sp,64
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
	.comm	estadoAtual,12,4
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
	.string	"O elevador tem %d pessoas\n"
	.zero	1
.LC4:
	.string	"\n~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*\n"
	.zero	1
.LC5:
	.string	"   Maquina de estados para simular um elevador com capacidade de 3 pessoas\nem um edificio com 3 andares "
	.zero	3
.LC6:
	.string	"   Para comandar o elevador s\303\243o disponibilizadas os seguintes comandos:\n"
	.zero	2
.LC7:
	.string	"^ -> subir de andar"
.LC8:
	.string	"v -> descer de andar"
	.zero	3
.LC9:
	.string	"[ -> abrir a porta para a entrada de pessoas"
	.zero	3
.LC10:
	.string	"] -> fecha a porta para o elevador poder se mover"
	.zero	2
.LC11:
	.string	"+ -> uma pessoa entrou no elevador"
	.zero	1
.LC12:
	.string	"- -> uma pessoa saiu no elevador"
	.zero	3
.LC13:
	.string	"q -> acaba a execu\303\247\303\243o da maquina de estados"
	.zero	2
.LC14:
	.string	"\n~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
	.zero	2
.LC15:
	.string	"\nInsira a op\303\247\303\243o que deseja: "
	.zero	1
.LC16:
	.string	"\n----------------- ERRO --------------\n        -> Voc\303\252 j\303\241 est\303\241 no \303\272ltimo andar\n"
.LC17:
	.string	"\n----------------- ERRO --------------\n        -> Voc\303\252 n\303\243o pode subir com o elevador de porta aberta\n"
.LC18:
	.string	"\n------------------ ERRO ------------------\n        -> Voc\303\252 j\303\241 est\303\241 no t\303\251rreo\n"
	.zero	1
.LC19:
	.string	"\n----------------- ERRO --------------\n        -> Voc\303\252 n\303\243o pode descer com o elevador de porta aberta\n"
	.zero	3
.LC20:
	.string	"\n------------------ ERRO ------------------\n        -> A porta do elevador est\303\241 fechada\n"
	.zero	2
.LC21:
	.string	"\n------------------ ERRO ------------------\n        -> O elevador est\303\241 cheio\n"
	.zero	1
.LC22:
	.string	"\n------------------ ERRO ------------------\n        -> O elevador est\303\241 vazio\n"
	.zero	1
.LC23:
	.string	"\n--------------- COMANDO N\303\203O EXISTE --------------\n"
	.ident	"GCC: (GNU) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
