#Inteiro
.text
.globl main
main:
	ld $a0,$valor    #carrega double
	addi $a0,$a0,20    #add imediato
	li $v0,1   #imprime o endere�o em $a0
	syscall
	li $v0,10    #termina
	syscall
.data
$valor: .word 45