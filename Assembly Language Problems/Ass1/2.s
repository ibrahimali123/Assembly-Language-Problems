.data
str1: .asciiz "Enter the (N) improvement = "
str2: .asciiz "Enter the (S) Exec time = "
result: .asciiz "execution time of a program after improvement using Amdahl’s law = "
space: .asciiz "\n"
.text
.globl main
main:

# read N
li $v0, 4	
la $a0, str1
syscall	

li.s $f1, 0.0

li    $v0,6             
syscall
mov.s  $f2,$f0

li $v0, 4	
la $a0, space
syscall	

# read S
li $v0, 4	
la $a0, str2
syscall	

li    $v0,6             
syscall
mov.s  $f3,$f0 

li $v0, 4	
la $a0, space
syscall	

#calculate
li $v0, 4	
la $a0, result
syscall	

li.s $f4, 1.0

sub.s $f5, $f4, $f3
div.s $f6, $f3, $f2
add.s $f6, $f6, $f5
div.s $f7, $f4, $f6

li $v0, 2
add.s $f12, $f7, $f1
syscall

li $v0, 10
syscall

.end main