.data
    entr: .asciiz "Enter the number : \n"
    odd: .asciiz "the number is odd \n"
    even: .asciiz "the number is even \n"
.text
main:

li $v0,4
la $a0, entr
syscall

li $v0, 5
syscall
add $t1, $0, $v0

while: beq $t1, 0, endwhile

li $t2, 2
rem $t2, $t1, 2
beq $t2, 0, equal
        la $a0, odd
	j  Exit
    equal:
	la $a0, even
Exit:
li $v0, 4
syscall

li $v0, 5
syscall
add $t1, $0, $v0

j while

endwhile:

li $v0,10
syscall

.end main