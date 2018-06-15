#  APRENDENDO A USAR ASSEMBLY DE FORMA DECENTE 
#  Por Lucas Pereira Castelo Branco


main: 
	lb $a0, $caracter
	li $v0, 1
	syscall
	li $v0, 11
	syscall
	j converte
	
converte:
	sgeu $t0, $a0, 97
	sleu $t1, $a0, 122
	and $t0, $t0, $t1
	bgtz $t0, minuscula
	
minuscula:
	sub $a0, $a0, 32
	li $v0, 1
	syscall
	li $v0, 11
	syscall
	li $v0, 10
	syscall
	
	
	
	
.data
$caracter:
        .byte 'a'
	
#fim do programa
	
	