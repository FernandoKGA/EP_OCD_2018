#IF - Condicionais
.text
.globl main
main:
	ld $a1,$idade    #carrega a idade
	blt $a1,18,menor	#branch se a idade for menor que, chama menor, caso nao, continua rodando
	la $a0,$texto2   #idade maior
	j fim		#chama fim para nao executar o que esta a baixo
menor:
	la $a0,$texto1   #idade menor
fim:
	li $v0,4   #printa
	syscall
	li $v0,10  #termina
	syscall 
.data
$idade: .word 10
$texto1: .asciiz "Sim"
$texto2: .asciiz "Nao"