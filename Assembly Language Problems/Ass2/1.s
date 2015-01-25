.data
    array:  .space 20
    newArray:  .space 20
    entr: .asciiz "Enter the 5 numbers : \n"
    str1: .asciiz "the actual array is : \n"
    str2: .asciiz "the reverse of array is : \n"
    space: .asciiz "\n"
    sp: .asciiz "   "
.text
main:

la $s1 , newArray      
la $s0 , array

######### initializes array from user ########
li $v0,4
la $a0, entr
syscall

li $t1 , 1
while: bgt $t1, 5, endwhile
li $v0, 5
syscall

sw $v0, 0($s0)
addi $t1, $t1, 1
addi $s0, $s0, 4
j while

endwhile:

######## print actual array   #########

#  print str1
li $v0, 4
la $a0, str1
syscall

li $t2, 1 
la $s0, array
loop1: bgt $t2, 5, whileloop1

li $v0, 1
lw $a0, 0($s0)
syscall

#  print sp
li $v0, 4
la $a0, sp
syscall

addi $t2, $t2, 1
addi $s0, $s0, 4

j loop1

whileloop1:

########  print "\n"   #############
li $v0, 4
la $a0, space
syscall

############### reverse array and initializes it to new array ################
  _print_all:
  addi $t2, $t2, -1         # subtract 1 to our counter
  addi $s0, $s0, -4         # adjust the pointer backward
    
  lw $s4, 0($s0)     
  sw $s4 , 0($s1)

  addi $s1, $s1, 4
  
  bgt $t2, 1, _print_all    # if still greater than 1, continue _print_all

########## initializes the new array to the original array #########
  li $t5, 1
  loop2: bgt $t5, 5, whileloop2

  lw $s4, 0($s1)
  sw $s4 , 0($s0)

  addi $t5, $t5, 1
  addi $s1, $s1, 4
  addi $s0, $s0, 4

  j loop2

  whileloop2:
######### print reversed array  ###############

#  print "reversed array : "
li $v0, 4
la $a0, str2
syscall

la $s0 , newArray 
li $t5, 1 
loop3: bgt $t5, 5, whileloop3

li $v0, 1
lw $a0, 0($s0)
syscall

#  print sp
li $v0, 4
la $a0, sp
syscall

addi $t5, $t5, 1
addi $s0, $s0, 4

j loop3

whileloop3:


li $v0,10
syscall

.end main