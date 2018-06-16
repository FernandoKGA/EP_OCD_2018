.text
.globl main
main:
	li $a1,0      #carrega contador apartir do 0
	lb $a2,$tam  #carrega o tamanho da string
	j imprime_sequencia   #vai para a funcao de imprimir sequencia
	
imprime_sequencia:   #funcao que imprime uma sequencia de caracteres (convertendo)
	lb $t2,$sequencia($a1)      #pega o byte segundo o indice apresentado
	move $a0, $t2               #passa o caracter para o $a0 como argumento
	addi $a1,$a1,1               #adiciona 1 no contador
	jal converte                    #funcao de conversao
	jal printa_caracter      #funcao de printar caracter
	blt $a1,$a2, imprime_sequencia   #se a1 menor que a2 faz loop
	j fim_programa            #chama o encerramento do programa
	
fim_programa:   #funcao que imprime uma sequencia de caracteres
	li $v0, 10    #codigo para sair do programa
	syscall	  #chama o sistema operacional
	
converte:  #funcao que converte um unico caracter

	#numero
	sgeu $t0, $a0, 48   #intervalo de ascii
	sleu $t1, $a0, 57   #intervalo de ascii
	and $t0, $t0, $t1   #se esta dentro desse intervalo  $t0 = 1 / c.c. $t0 = 0
	beq $t0, 1, numero  #se eh numero entra na funcao
	
	#letra maiuscula
	sgeu $t0, $a0, 65   #intervalo de ascii
	sleu $t1, $a0, 90   #intervalo de ascii
	and $t0, $t0, $t1   #se esta dentro desse intervalo $t0 = 1 / c.c. $t0 = 0
	beq $t0, 1, letra_maiuscula  #se eh letra maiuscula entra na funcao
	
	#letra minuscula
	sgeu $t0, $a0, 97     #intervalo de ascii
	sleu $t1, $a0, 122    #intervalo de ascii
	and $t0, $t0, $t1     #se entra dentro desse intervalo $t0 = 1 / c.c. $t0 = 0
	beq $t0, 1, letra_minuscula  #se eh letra minuscula entra na funcao
	
	#se passou direto entra para caracter especial
	j carac_especial  #funcao de caracter especial
	
converte_retorno:   #funcao que entra para dar jump ao endereco de retorno
	jr $ra     #da jump para a instrucao onde o registro de retorno aponta
	
printa_caracter:   #funcao que faz o print dos caracteres
	beq $t2, 2, printa_carac_retorno #se nao for letra ou numero, ja retorna sem printar
	li $v0, 11   #printa caracter
	syscall    #chama o sistema para fazer a operacao
	j printa_carac_retorno   #chama o retorno ao final para voltar ao loop
	
printa_carac_retorno:  #funcao que entra para dar jump ao endereco de retorno
	jr $ra     #da jump para a instrucao onde o registro de retorno aponta
	
numero:      #funcao que coloca o tipo do caracter no registrador $t2
	li $t2, 0    #coloca 0 em $t2 para numeros
	j converte_retorno     #chama o retorno da funcao de conversao
	
letra_minuscula:    #funcao que coloca o tipo do caracter no registrador $t2 e converte em maiuscula
	li $t2, 1     #coloca 1 em $t2 para letras
	sub $a0, $a0, 32   #transforma para maiuscula subtraindo 32
	j converte_retorno   #chama o retorno da funcao de conversao
	
letra_maiuscula:   #funcao que coloca o tipo do caracter no registrador $t2
	li $t2, 1    #coloca 1 em $t2 para letras
	j converte_retorno   #chama o retorno da funcao de conversao

carac_especial:    #funcao que coloca o tipo do caracter no registrador $t2
	li $t2, 2    #coloca 2 em $t2 para caracteres especiais
	j converte_retorno    #chama o retorno da funcao de conversao

.data
#deve ser especificado o tamanho da sequencia de caracteres em .asciiz e a sequencia em si
$tam: .word 14        #tamanho da sequencia de caracteres
$sequencia: .asciiz "C0oNv3eRS 4Ao"
