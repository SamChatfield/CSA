.data
.align 2
    input1: .asciiz "\nEnter first number: "
    input2: .asciiz "\nEnter second number: "
    cr: .asciiz "\n"

.text
.globl main
    main:
        # Ask for first number
        li $v0,4
        la $a0,input1
        syscall
        # Read the first number
        li $v0,5
        syscall
        move $s0,$v0
        # Ask for second number
        li $v0,4
        la $a0,input2
        syscall
        # Read the second number
        li $v0,5
        syscall
        move $s1,$v0
        # j EXIT
    GCD:
        # Compute GCD of two numbers
        
    EXIT:
        li $v0,10
        syscall