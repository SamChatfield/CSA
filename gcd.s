.data
.align 2
    input1: .asciiz "\nEnter first number: "
    input2: .asciiz "\nEnter second number: "
    cr: .asciiz "\n"
    errmsg: .asciiz "\nError - must enter a positive integer\n"

.text
.globl main
    main:
        INPUT:
            li $v0,4 # ask for first number
                la $a0,input1
                syscall
                li $v0,5
                syscall
                move $a0,$v0
            li $v0,4 # ask for second number
                la $a1,input2
                syscall
                li $v0,5
                syscall
                move $a1,$v0