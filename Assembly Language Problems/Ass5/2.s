.data
string_space: .asciiz ""
str: .asciiz "Enter string : \n"
pal: .asciiz "is a palindrome.\n"
not_pal: .asciiz "is not a palindrome.\n"
.text

    is_palandrom: 
		addi $sp, $sp, -4
	    sw $ra, 0($sp)
         		
	    addi $t1, $a0, 0 # A = STRING.
	    addi $t2, $a0, 0 # B = STRING from the end
		
		##### get length of string #####
		length_loop:
		lb $t3, ($t2) 
		beq $t3,$0, end_length_loop 
		add $t2, $t2, 1 
		j length_loop 
		end_length_loop:
		sub $t2, $t2, 2 
		################################
	    
		test_loop:  bge $t1, $t2, is_palindrome
     
			lb $t3, ($t1) # addr A into $t3,
			lb $t4, ($t2) # addr B into $t4.
			bne $t3, $t4, not_palindrome 
			
			addu $t1, $t1, 1 # A++
			subu $t2, $t2, 1 # B--
			j test_loop
			
			is_palindrome:
			    li $s1, 0 
				add $v0,$s1,$0
			j exit
				 
			not_palindrome:
			    li $s1, 1
				add $v0,$s1,$0
			j exit 
		exit: 
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
main:
	
	li $v0, 4
	la $a0,str
	syscall
	
	la $a0, string_space
	li $a1, 100
	li $v0, 8
    syscall          
    
    jal is_palandrom	
	add	$s0, $v0, $zero
	beq $s0,$0,palind
       la $a0, not_pal
	   li $v0, 4
	   syscall
	   j stop
	palind:
	la $a0, pal
	li $v0, 4
	syscall
	stop:
	
li $v0, 10 
syscall  