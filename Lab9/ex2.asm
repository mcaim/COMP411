.globl main

main:
   li	$v0, 5
   syscall
   move	$a0, $v0
   
   j loop   
   
loop:

  
   # New Line
   li	$v0, 11
   li	$a0, 10
   syscall
   
   add $a1, $a0, $zero
   
   li $v0, 1  #print
   add $a0, $a0, $zero
   syscall
   
   srl $a0, $a0, 4
   
   
   
   beq $a0, $a1, exit
   
exit:
  li $v0,10
  syscall
   
   
   
   