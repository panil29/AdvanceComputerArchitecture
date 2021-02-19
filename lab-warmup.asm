# MIPS example to int-version i+j and i-j

.data
string1:  .asciiz "Input i: \n" 
string2:  .asciiz "Input j: \n" 
string3:  .asciiz "\n i+j=" 
string4:  .asciiz "\n i-j=" 


.text
main:	
		# Read input i to $s1
		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string1 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 
		addi $v0, $zero, 5      # code for reading integer is 5 
   		syscall           	# call operating system
   		add $s1, $v0, $zero  	# i in $s1
 
 		# Read input j to $s2
		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string2 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 
   		# Read input j to $s2
		addi $v0, $zero, 5      # code for reading integer is 5 
   		syscall           	    # call operating system
   		add $s2, $v0, $zero  	# j in $s2
  		
   		# Write code here to perform: i+j and i-j 
		add $t0, $s1, $s2
		sub $t1, $s1, $s2
		
   		# print i+j
   		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string3 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   					   			
		add $a0, $t0, $zero	
		addi $v0,$zero,1	# prints integer
		syscall

		# print i-j
   		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string4 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   					   			
		add $a0, $t1, $zero	
		addi $v0,$zero,1	# prints integer
		syscall

		# exit	
		addi $v0, $zero, 10
		syscall 

