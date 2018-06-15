.text
.globl main
main:
	lb $a0, $caracter
	li $v0, 1
	syscall
	li $v0, 11
	syscall
	jal converte
	li $v0, 10
	syscall
converte_sequencia:   #função que converte uma sequencia de caracteres

imprime_sequencia:   #função que imprime uma sequencia de caracteres

converte:  #função que converte um único caracter
	#sgeu $t0, $a0, 65
	#sleu $t1, $a0, 90
	#and $t0, $t0, $t1
	#bgtz $t0, letra_maiuscula  #se eh maiuscula entra na funcao
	#essa parte nao eh necessaria dado que ela ja eh maiuscula
	sgeu $t0, $a0, 97
	sleu $t1, $a0, 122
	and $t0, $t0, $t1
	bgtz $t0, letra_minuscula  #se eh minuscula entra na funcao
	#aqui deve verifica para o resto, ou nem precisa?
converte_retorno:
	jr $ra

letra_minuscula:
	sub $a0, $a0, 32
	li $v0, 1
	syscall
	li $v0, 11
	syscall
	j converte_retorno
	
letra_maiuscula:

.data
$caracter: .byte 'a'
$tam: .word 13
$sequencia: .asciiz "C0Nv3eRS 4Ao"
