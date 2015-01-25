.data
s1: .asciiz "Enter the first Number : "
s2: .asciiz "Enter the second Number : "
str1: .asciiz "The circumference is "
str2: .asciiz "The Area is "
space: .asciiz "\n"
.text
.globl main
main:

# read num 1
li $v0, 4	
la $a0, s1
syscall

li $v0, 5
syscall
add $s0, $0, $v0

li $v0, 4	
la $a0, space
syscall

# read num 2
li $v0, 4	
la $a0, s2
syscall

li $v0, 5
syscall
add $s1, $0, $v0

li $v0, 4	
la $a0, space
syscall

#calculate circumference and print "The circumference is "
add $s2, $s0, $s1
mul $s2, $s2, 2

li $v0, 4	
la $a0, str1
syscall	

li $v0, 1
move $a0, $s2
syscall


#print new line
li $v0, 4	
la $a0, space
syscall

#calculate area and print "The area is "
li $v0, 4	
la $a0, str2
syscall
 
mul $s3, $s0, $s1

li $v0, 1
move $a0, $s3
syscall

li $v0, 10
syscall

.end main