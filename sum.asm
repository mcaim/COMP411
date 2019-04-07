# Add the first five integers 

.text 0x3000
.globl main
main:
     add   $8,$0,$0     # sum = 0
     add   $9,$0,$0     # for (i = 0; ...
loop:
     add   $8,$8,$9     # sum = sum + i;
     addi  $9,$9,1      # for (...; ...; i++
     slti  $10,$9,5     # for (...; i<5;
     bne   $10,$0,loop
end: 
     ori   $v0, $0, 10     # system call 10 for exit
     syscall               # we are out of here.