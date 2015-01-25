.data
prompt: .asciiz "Enter the string : "
str: .asciiz ""
.text
main:

		la $a0 , prompt
		li $v0 , 4
		syscall

		la $a0 , str
		li $v0 , 8
		syscall

		la $s3 , str
        li $s7,0 		# sum =0 (length of the string)
        ################# get size ###############
		while:
		  lb $t4, ($s3)
		  beq $t4, $0,exit
		  add $s3,$s3,1
		  addi $s7,$s7,1
		  j while
		exit:

		################# bubble sort #################
		la $s0 , str

		add $t0,$zero,$zero  # i
        loop:
             beq $t0,$s7,done
             sub $t7,$s7,$t0
             addi $t7,$t7,-1

             add $t1,$zero,$zero  # j

			jLoop:
                    beq $t1,$t7,continue

                    add $a0,$s0,$t1
                    lb  $s1,0($a0)
                    lb  $s2,1($a0)

					sgt $t2, $s1,$s2
					beq $t2, $zero, good
					sb  $s2,0($a0)
					sb  $s1,1($a0)

					addi $t1,$t1,1
					j jLoop

					good:
                    addi $t1,$t1,1
                    j jLoop

					continue:
					addi $t0,$t0,1
					j loop

				done:
				li $v0 , 4
				la $a0,str
				syscall

li $v0 , 10
syscall
.end main
