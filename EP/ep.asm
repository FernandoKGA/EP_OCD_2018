.text
.globl main
main:
	li $a1,0      #carrega contador apartir do 0
	lb $a2,$tam  #carrega o tamanho da string
	j imprime_sequencia
	
fim_programa:   #função que imprime uma sequencia de caracteres
	li $v0, 10
	syscall
	
imprime_sequencia:   #função que imprime uma sequencia de caracteres (convertendo)
	lb $t2,$sequencia($a1)
	move $a0, $t2               #passa o caracter para o a0 como argumento
	addi $a1,$a1,1               #adiciona um no contador
	jal converte                    #funcao de conversao
	jal printa_caracter      #funcao de printar caracter
	blt $a1,$a2, imprime_sequencia   #se a1 menor que a2
	j fim_programa            #chama o encerramento do programa
	
converte:  #função que converte um único caracter

	#numero
	sgeu $t0, $a0, 48          
	sleu $t1, $a0, 57
	and $t0, $t0, $t1
	beq $t0, 1, numero  #se eh letra maiuscula entra na funcao
	
	#letra maiuscula
	sgeu $t0, $a0, 65          
	sleu $t1, $a0, 90
	and $t0, $t0, $t1
	beq $t0, 1, letra_maiuscula  #se eh letra maiuscula entra na funcao
	
	#letra minuscula
	sgeu $t0, $a0, 97
	sleu $t1, $a0, 122
	and $t0, $t0, $t1
	beq $t0, 1, letra_minuscula  #se eh letra minuscula entra na funcao
	
	#se passou direto entra para caracter especial
	j carac_especial
	
converte_retorno:
	jr $ra
	
printa_caracter:
	bne $t2, 1, printa_carac_retorno #se nao for letra, ja retorna sem printar
	li $v0, 11   #printa caracter
	syscall
	j printa_carac_retorno
	
printa_carac_retorno:
	jr $ra
	
numero:
	li $t2, 0
	j converte_retorno 
	
letra_minuscula:
	li $t2, 1
	sub $a0, $a0, 32   #transforma para maiuscula subtraindo 32
	j converte_retorno
	
letra_maiuscula:
	li $t2, 1
	j converte_retorno

carac_especial:
	li $t2, 2
	j converte_retorno

.data
$tam: .word 14
$sequencia: .asciiz "C0oNv3eRS 4Ao"
