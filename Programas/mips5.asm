.text
.globl main
main:
	li $a0,0 #inicia total
	li $a1,1 #inicia contador
loop:
	add $a0,$a0,$a1 #soma cont no total
	addi $a1,$a1,1 #soma no contador
	ble $a1,10,loop #branch menor igual if less or equal
	li $v0,1 #printa inteiro (1)
	syscall
	li $v0,10 #termina
	syscall
	