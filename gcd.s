.data
.align 2
    input1: .asciiz "\nEnter first number: "
    input2: .asciiz "\nEnter second number: "
.text
.globl main

main:
    INPUT:
        ## Ask for first number
        li $v0,4
        la $a0,input1
        syscall
        ## Read the first number
        li $v0,5
        syscall
        move $s0,$v0 # Store m in s0
        ## Ask for second number
        li $v0,4
        la $a0,input2
        syscall
        ## Read the second number
        li $v0,5
        syscall
        move $s1,$v0 # Store n in s1
        jal GCD # Jump to main GCD code
    OUTPUT:
        move $a0,$v0 # Move result to a0 for printing
        li $v0,1 # Set syscall to print int
        syscall
        j EXIT
GCD:
    ## Compute GCD of two numbers
    bgtz $s1,REC
    j RET
    REC:
        # Recursion of gcd calculation - old m:$t0, old n:$t1
        move $t0,$s0
        move $t1,$s1
        
        addi $sp,$sp,-12
        sw $t0,8($sp)
        sw $t1,4($sp)
        sw $ra,0($sp)
        
        move $s0 $t1 # New m is: old n
        rem $s1,$t0,$t1 # New n is: old m `mod` old n
        jal GCD
        
        lw $t0,8($sp)
        lw $t1,4($sp)
        lw $ra,0($sp)
        addi $sp,$sp,12
    RET:
        move $v0,$s0 # Move result to v0 for returning and output
        jr $ra
EXIT:
    li $v0,10
    syscall