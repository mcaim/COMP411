.data
 printZero: .asciiz      "00000000"

.align 2

.text
.globl main

main:
   li	$v0, 5
   syscall
   move	$a0, $v0
   beq $a0, 0, printzero
   jal	print_bin

   li	$v0, 11
   li	$a0, 10
   syscall

   j main

printzero:
    li      $v0,4
    la      $a0,printZero
    syscall
    j exit
    
exit:
    li      $v0,10
    syscall

print_bin:
   add	$t0, $zero, $a0
   add	$t1, $zero, $zero
   addi $t3, $zero, 1
   sll $t3, $t3, 7
   addi $t4, $zero, 8

loop:
   and $t1, $t0, $t3
   beq $t1, $zero, print

   add $t1, $zero, $zero
   addi $t1, $zero, 1	
   j print

print:	
   li $v0, 1
   move $a0, $t1
   syscall

   srl $t3, $t3, 1
   addi $t4, $t4, -1
   bne	$t4, $zero, loop

   jr	$ra