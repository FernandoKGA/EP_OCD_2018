.text
.globl main
main:
	l.s $f12,$valor  #carrega $valor
	l.s $f13,$outro	#carrega $outro
	add.s $f12,$f12,$f13   #adiciona $f12 com $f13 e guarda em $f12
	li $v0,2   #imprime ponto flutuante
	syscall
	li $v0, 10 #termina
	syscall
	
.data
$valor: .float 45.1
$outro: .float 12.4