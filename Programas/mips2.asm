.text
.globl main
main:
	la $a0,$texto   #imprime texto "Hello World!"
	li $v0,4        #saida padrao
	syscall
	li $v0,10       #termina programa
	syscall
.data
$texto:
	.ascii "Hello World!"