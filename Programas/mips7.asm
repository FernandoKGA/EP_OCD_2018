#pilha cresce diminuindo e somando ela diminui
.text
.globl main
main:
	li $a0,4 #inicia o total
	jal fatorial  #chama o fatorial
	li $v0,1    #printa o resultado
	syscall
	li $v0,10  #termina o programa
	syscall
fatorial:
	bgt $a0,1,fat_exec
	li $a0,1
	j fat_fim
fat_exec:
	subu $sp,$sp,8    #subtrai na pilha
	sw $a0,4($sp)     #salva o $a0
	sw $ra,0($sp)	  #salva o endereço de retorno de onde chamou o jumper linker
	subu $a0,$a0,1    #subtrai 1 do fatorial
	jal fatorial      #chama o fatorial
	lw $ra,0($sp)     #recupera o valor original de $ra em $a1
	lw $a1,4($sp)     #recupera o valor original de $a0 em $a1
	addu $sp,$sp,0    #retira o espaço ocupado na pilha
	mul $a0,$a0,$a1   #multiplica
fat_fim:
	jr $ra         #retorno