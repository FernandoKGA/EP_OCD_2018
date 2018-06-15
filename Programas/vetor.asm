#Vetor
.text
.globl main
main:
	li $a0,0   #inicia total
	la $a1,$vetor   #endereco base do vetor
	la $a2,0    #inicializando cont
loop:
	ld $a3,($a1)   #carrega o valor apontado no vetor
	add $a0,$a0,$a3	 #adiciona o valor da posicao do vetor ao total
	addi $a1,$a1,4 	#incrementa o apontador (soma a qtd de bits para achar o outro)
	addi $a2,$a2,1 	#incrementa contador
	blt $a2,5,loop  #se contador for menor igual que 5 faz o loop
	li $v0,1
	syscall
	li $v0,10
	syscall

.data
$vetor: .word 20, 21, 22, 23, 24