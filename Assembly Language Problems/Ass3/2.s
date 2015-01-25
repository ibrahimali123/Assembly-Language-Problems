.data
str1: .asciiz "Enter numbers : \n"
array: .align 2  
      .space 100       
str2: .asciiz "Enter number to search : \n"
.text
	main:
	
	li $v0 , 4
	la $a0 , str1
	syscall
		       
    la $s0 , array
    ###### initializes array from user #####
    
	li $t0 , 0  #index
	li $t1 , 1
    while: beq $t1, 0, endwhile
    
	li $v0, 5
    syscall
    add $t1, $0, $v0 
	
	sw $t1, 0($s0)
	
    addi $t0, $t0, 1
    add $s0, $s0, 4
    j while

    endwhile:
		
    li $v0 , 4
	la $a0 , str2
	syscall	

    li $v0, 5
    syscall
    add $t2, $0, $v0


	##### Find index #######
	la $s0, array
	
	li $t3, 0
	li $t1, 0
	
    while2: beq $t1, $t2, endwhile2
    
	lw $t1, 0($s0)
    
    addi $t3, $t3, 1
	beq $t3, $t0, notFound
    addi $s0, $s0, 4
    j while2
    notFound :
	   li $t3, 0
	   j endwhile2
    endwhile2:	

li $v0, 1
sub $t3, $t3, 1
move $a0, $t3
syscall	 

li $v0 , 10
syscall		
.end main
		
