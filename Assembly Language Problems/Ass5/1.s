.data 
sp: .asciiz "\n"
str1: .asciiz "Enter the integer number : \n"
str2: .asciiz "The factorial is : \n"
.text

read_number:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
 
    li $v0,4
    la $a0, str1
    syscall
	
    li $v0, 5
    syscall  
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4 
    jr $ra

Factorial: 
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    li $t4, 1
	add $t3, $a0 , $zero
 	while: beq $t3, 1, endwhile
		    mul $t4,$t4,$t3  
		    sub $t3,$t3,1 
		    j while
	endwhile: 
	add $v0, $t4, $zero
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra	
main:
 
jal read_number
add  $t1, $v0, $zero

move $a0, $t1
jal Factorial 
add  $t2, $v0, $zero

li $v0,4
la $a0, str2
syscall
	
li $v0, 1
move $a0, $t2
syscall

li $v0,10
syscall

.end main