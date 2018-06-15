.text
.globl main
main:
	li $a1,0      #carrega uma variavel?
	lb $a2,$tam  #carrega o tamanho da string
	jal converte_sequencia
	li $v0, 10
	syscall
imprime_sequencia:   #função que imprime uma sequencia de caracteres
	
converte_sequencia:   #função que converte uma sequencia de caracteres
	lb $t2,$sequencia($a1)
	move $a0, $t2
	addi $a1,$a1,1
	li $v0, 11    #carrega para print char
	syscall
	blt $a1,$a2, converte_sequencia
	j converte_retorno
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
$tam: .word 13
$sequencia: .asciiz "C0Nv3eRS 4Ao"
