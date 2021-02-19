#CSUID :2782551
#Name  :Anil Pavuluru
#Assignment :#2
.data
Array:  .word 43, -5, 11, 12, 64, -7, 14, 71, 70, 13, -27
string:  .asciiz "\n" 

# Tranfer the C code of selection sort to MIPS code. Do not modify the existing code and structure!

.text 
main:	
	la $t0, Array
	li $t1, 0	
	li $t7,11   		# array length n=11
	mul $t7, $t7, 4 	# 4*n
	subi $t8, $t7, 4 	# 4*(n-1)

OuterLoop:
	add $t2, $t1, 4		# i is in $t1 and j is in $t2
	# write your code here for Selection Sort
	blt $t1,$t8,InnerLoop
	li $t1,0
	j Print
InnerLoop:
        blt $t2,$t7,Load
        j Inci
Load:
        add $t3,$t1,$t0
        lw $t4,0($t3)
        add $t5,$t2,$t0
        lw $t6,0($t5)
        bgt $t4,$t6,Sort        
	j Incj
Sort:
        add $t9,$zero,$t4
        add $t4,$t6,$zero
        add $t6,$t9,$zero
        sw $t4,0($t3)
        sw $t6,0($t5)
Incj:
        addi $t2,$t2,4
        j InnerLoop
Inci:
        addi $t1,$t1,4
	j OuterLoop
	
# write your code here to print the sorted array/result 
Print:
        blt $t1,$t7,Loop
        j Exit
Loop: 
        li $v0,1
        add $t3,$t1,$t0
        lw $a0,0($t3)
        syscall
        li $v0,4
        la $a0,string
        syscall
        addi $t1,$t1,4
        j Print
                
# exit	
Exit:
addi $v0, $zero, 10
syscall 

		

