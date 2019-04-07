	.data
	.align 4

move:	.asciiz "Move disk "
from:	.asciiz " from Peg "
to:	.asciiz " to Peg "
new_line: .asciiz "\n"

 
        .text
        .globl main
main:
	add 	$fp, $zero, $sp	
 			
 
        li 	$2,5 # read  input
        syscall			
 
	add 	$a0, $zero, $v0	
	addi 	$a1, $zero, 1		
	addi 	$a2, $zero, 3		
	addi 	$a3, $zero, 2		
	jal 	hanoi			
 
Exit:
        li 	$2,10			
        syscall                        
 

hanoi:
	addi	$sp,$sp,-4		
	sw	$ra,($sp)		
	addi	$sp,$sp,-4		
	sw	$fp,($sp)		
	addi	$sp,$sp,-4		
	sw	$s0,($sp)		
	addi	$sp,$sp,-4		 
	sw	$s1,($sp)		
	addi	$sp,$sp,-4		
	sw	$s2,($sp)		
	addi	$sp,$sp,-4		
	sw	$s3,($sp)		
	addi	$sp,$sp,-4		
	addi	$fp, $sp, 32		
	beq	$a0, $zero, zero	
	sw	$a0,($sp)		
	addi	$sp,$sp,-4		
	sw	$a1,($sp)		
	addi	$sp,$sp,-4		
	sw	$a2,($sp)		
	addi	$sp,$sp,-4		
	sw	$a3,($sp)		
	addi	$sp,$sp,-4		 	
	addi	$a0,$a0,-1		
	add	$t2, $zero,$a2		
	add	$a2, $zero, $a3	
	add	$a3, $zero, $t2		
	jal	hanoi			
	
	addi	$sp,$sp,4			
	lw	$s0,($sp)		
	addi	$sp,$sp,4			
	lw	$s1,($sp)		
	addi	$sp,$sp,4			
	lw	$s2,($sp)		
	addi	$sp,$sp,4			
	lw	$s3,($sp)		
 

	li 	$v0, 4       			
	la 	$a0, move   			
	syscall
	
	li 	$2,1                        
        add 	$4, $zero, $s3                     
	syscall
	
	li 	$v0, 4       		
	la 	$a0, from    		
	syscall
	
	li 	$v0, 1       			
	add 	$a0,$zero, $s2    			
	syscall
	
	li 	$v0, 4       			
	la 	$a0, to    			
	syscall
	
	li 	$v0, 1       			
	add 	$a0, $zero, $s1    			
	syscall
	
	li 	$v0, 4       			
	la 	$a0, new_line    			
	syscall

	addi 	$a0,$s3,-1		
	add 	$a1, $zero, $s0	
	add 	$a2, $zero, $s1	
	add 	$a3, $zero, $s2	
	jal 	hanoi	
			
zero:
	addi	$sp,$sp,4		
	lw	$s3,($sp)		
	addi	$sp,$sp,4		
	lw	$s2,($sp)		
	addi	$sp,$sp,4		
	lw	$s1,($sp)		
	addi	$sp,$sp,4		
	lw	$s0,($sp)		
	addi	$sp,$sp,4		
	lw	$fp,($sp)		
	addi	$sp,$sp,4		
	lw	$ra,($sp)		
	addi	$sp,$sp,4		
	jr 	$ra			