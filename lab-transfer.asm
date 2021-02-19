.data
String: .asciiz "HelLo WoRLD, THIs iS A tesT!!!"

.text

main:
	la $t0, String 	# loading the base address of the string. "base address" is the first chararter address in the string. 
	li $t1, 0 # $t1 is the incrementer, so that in each iteration it can be used for refering different characters in the string. 
Loop:
	add $t2, $t0, $t1   # adding incrementer (offset) to base address, such that $t2 is the actual address of the character in the string 
	lb $t3, 0($t2) 		# load byte (character). The value in $t3 is ASCII value of the character. 
	addi $t1, $t1, 1 	# increase the incrementer by 1. 
	
	blt $t3, 65, Nochange
	bgt $t3, 90, Nochange
	addi $t3, $t3, 32
Nochange:	
	
	add $a0, $zero, $t3 # assign $a0 with $t3
	li $v0, 11 	# let computer know that we are going to print character. 
	syscall 	# trigger!!!! 
	bne $t3, 0, Loop # branch when ASCII value not equal to 0 (means 'NULL' character), back to the loop. Otherwise, it ends. 
