
# Data stored in memory
       .data
value:				# a value stored in memory
	.word  7		
result:				# where result is stored
	.word 0

# The program
       .text
	lui $1, 0x1234

addiu $1, $1, 0xABCD