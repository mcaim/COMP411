#---------------------------------
# Lab 5: Pixel Conversion
#
# Name: Aidan McRitchie
#
# --------------------------------
# Below is the expected output.
# 
# Converting pixels to grayscale:
# 0
# 1
# 2
# 34
# 5
# 67
# 89
# Finished.
# -- program is finished running --
#---------------------------------

.data 0x0
  startString:  .asciiz "Converting pixels to grayscale:\n"
  finishString: .asciiz "Finished."
  newline:      .asciiz "\n"
  pixels:       .word   0x00010000, 0x010101, 0x6,      0x3333,
                        0x030c,     0x700853, 0x294999, -1

.text 0x3000

main:
  ori $v0, $0, 4        # System call code 4 for printing a string
  ori $a0, $0, 0x0      # address of startString is in $a0
  syscall               # print the string


#------- INSERT YOUR CODE HERE -------
#
#
# Write a loop that reads the array pixels using "lw",
#   one word at a time, until a -1 is encountered, which
#   indicates the end of the array.


ori $a3, $0, 0x0  #i = 0

loop:   
    lw $t1, pixels($a3) #load pixel at index whatever
    beq $t1, -1, exit  #if -1 then exit
    addi $t4, $0, 3    #used for divide by 3
    sll $t2, $t1, 8   
    srl $a0, $t2, 24    
    sll $t2, $t1, 16
    srl $a1, $t2, 24   
    sll $t2, $t1, 24
    srl $a2, $t2, 24    
    jal rgb_to_gray
    mflo $v0       
    or $a0, $0, $v0
    ori $v0, $0, 1
    syscall
    ori $v0, $0, 4
    ori $a0, $0, 43
    syscall
    addi $a3, $a3, 4   # Increment index by 4
    j loop

# Each pixel value is a word, of the form 0x00RRGGBB,
#   so your program here should take the rightmost 2 hexits (8 bits)
#   and use that as the blue value, the next 2 hexits as green, and
#   the next 2 hexits as red.  The leftmost 2 hexits are not needed,
#   and will be zero.
#
# Hint:  Use the andi instruction to extract relevant bits
#   from the pixel value.  For example, andi $2, $3, 0x0000000F
#   extracts that rightmost hexit of $3 and places it in $2.
#   This is because ANDing a bit with 1 keeps the bit value, but
#   ANDing a bit with 0 turns it to 0.
#
# After extracting the R, G and B values into $a0, $a1 and $a3,
#   you must then call the procedure rgb_to_gray below using
#   "jal rgb_to_gray", which will compute and return the gray
#   value.
#
# Your code should then print this gray value on the terminal,
#   before moving on to the next pixel value.  For printing,
#   you will need to use a MIPS system call available in MARS.
#   Specifically, it is syscall 1.  The code to print an integer,
#   say the number 47, is like this:
#
#     ori $v0, $0, 1  // put 1 in $v0 to indicate which syscall
#     ori $a0, $0, 47 // put value to be printed in $a0
#     syscall         // and then execute "syscall"
#
# Continue looping through the array "pixels", until a -1 is
#   encountered, at which point you should exit your loop.
#
# There is already code below that prints the final message "Finished.",
#   and terminate the program.
#
#
#------------ END CODE ---------------


exit:

  ori $v0, $0, 4        # System call code 4 for printing a string
  ori $a0, $0, 33       # address of finishString is in $a0; we computed this
                        # simply by counting the number of chars in startString,
                        # including the \n and the terminating \0

  syscall               # print the string

  ori $v0, $0, 10       # System call code 10 for exit
  syscall               # exit the program

rgb_to_gray:  
    add $t1, $a0, $a1
    add $t1, $t1, $a2
    div $t1, $t4
    mflo $v0
                    # procedure to calculate gray = (red + green + blue) / 3
                        # red is in $a0, green is in $a1, blue is in $a2
                        # gray should be computed in $v0 (return value)
                        # there is no need to use a stack

#------- INSERT YOUR CODE HERE -------
#
# Simply add instructions here to calculate
#   gray = (red + green + blue) / 3
#
#   i.e., $v0 = ($a0 + $a1 + $a2) / 3
#
#  That's it!
#
#------------ END CODE ---------------



  jr $ra                # return to main