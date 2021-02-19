# MIPS example to float-version i+j and i-j

.data
string1:  .asciiz "Input float i: \n" 
string2:  .asciiz "Input float j: \n" 
string3:  .asciiz "\n i+j=" 
string4:  .asciiz "\n i-j=" 


.text
main:	
		# Read input i to $f1
		addi $v0, $zero, 4      # code for printing string is $v0=4 
      		la $a0, string1 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 
		addi $v0, $zero, 6      # code for reading float is $v0=6 
   		syscall           	# call operating system
   		mov.s $f1, $f0          # read number is automatically stored in $f0, we move it to $f1  
 
 		# Read input j to $f2
		addi $v0, $zero, 4      # code for printing string is $v0=4 
      		la $a0, string2 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 
   		# Write code here to read input j to $s2
		addi $v0, $zero, 6      # code for reading float is $v0=6
   		syscall           	# call operating system
   		mov.s $f2, $f0          # read number is automatically stored in $f0, we move it to $f2  
  		
   		# Write code here to perform: i+j and i-j 
		add.s $f3, $f1, $f2
		sub.s $f4, $f1, $f2
		
   		# print i+j
   		addi $v0, $zero, 4      # code for printing string is $v0=4 
      		la $a0, string3 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   					   			
		add $a0, $t0, $zero	
		addi $v0,$zero,2	# code for printing float is $v0=2, and $f12 = float to be printed
		mov.s $f12, $f3         
		syscall

		# print i-j
   		addi $v0, $zero, 4      # code for printing string is 4 
      		la $a0, string4 	# load address of string to be printed into $a0    
      		syscall         	# call operating system 								   					   			
		add $a0, $t1, $zero	
		addi $v0,$zero,2	# code for printing float is $v0=2, and $f12 = float to be printed
		mov.s $f12, $f4
		syscall

		# exit	
		addi $v0, $zero, 10
		syscall 

