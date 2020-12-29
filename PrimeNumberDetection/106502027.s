.text
    .globl  main
# INPUT
main:
        li 	$v0, 4
        la 	$a0, input
        syscall
        
        li 	$v0, 5
        syscall
        move 	$s0, $v0        # $s0 = input

# CHECK IF INPUT > 1 (TODO: fill this procedure as an exercise)
L1:
	addi	  $s1, $zero, 1
	bgt       $s1, $s0, Exit # small than 1
	beq       $s1, $s0, L3   # 1 is not prime
	addi	  $s1, $s1, 1    
  	beq       $s1, $s0, L4   # 2 is prime
           

# FOR LOOP INPUT > 1 (TODO: fill this procedure as an exercise)
L2:

	div	   $s0, $s1
	mfhi       $t1           # remainder
	beqz       $t1, L3       # remainder = 0, not prime
        addi       $s1, $s1, 1
        beq	   $s0, $s1, L4  # the end of division
        j          L2
	  	   	

#PRINT OUTPUT (FALSE)
L3:
        li      $v0, 4
        la      $a0, false
        syscall

        j Exit

#PRINT OUTPUT (TRUE)
L4:
        li      $v0, 4
        la      $a0, true
        syscall

        j Exit

#EXIT
Exit:
        li      $v0, 10
        syscall	

        .data
input:	.asciiz "Input: "
true: 	.asciiz "True"
false:  .asciiz "False"