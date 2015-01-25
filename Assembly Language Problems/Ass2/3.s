.data
entr: .asciiz "Enter Your Number: \n"
aa: .asciiz "AA \n"
a: .asciiz "A \n"
bb: .asciiz "BB \n" 
ba: .asciiz "B \n" 
cc: .asciiz "CC \n"
c: .asciiz "C \n"
d: .asciiz "D \n"
f: .asciiz "F \n"
.text
.globl data
main:

li $v0,4
la $a0,entr
syscall

li $v0,5
syscall
add $s0, $v0, 0

blt $s0, 95 , ELSE
    la $a0, aa
    j exit
ELSE:
    blt $s0, 90 , ELSE2
    la $a0, a
    j exit
    ELSE2:
         blt $s0, 85 , ELSE3
         la $a0, bb
         j exit
         ELSE3:
              blt $s0, 80 , ELSE4
              la $a0, ba
              j exit
              ELSE4:
                   blt $s0, 75 , ELSE5
                   la $a0, cc
                   j exit
    		   ELSE5: 
                        blt $s0, 70 , ELSE6
                        la $a0, c
                        j exit
    		        ELSE6: 
                             blt $s0, 50 , ELSE7
                             la $a0, d
                             j exit
    		             ELSE7:
                                  la $a0, f
exit:
li $v0,4
syscall

li $v0,10
syscall

.end main
