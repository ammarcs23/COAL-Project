.data
A: .word 5, 10, 15, 20, 25
msg: .asciiz "Array elements: "
space: .asciiz " "

.text
.globl main

main:
    li $v0, 4
    la $a0, msg
    syscall

    la $t0, A
    li $t1, 0

print_loop:
    beq $t1, 5, exit

    lw $t2, 0($t0)

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, space
    syscall

    addi $t0, $t0, 4
    addi $t1, $t1, 1

    j print_loop

exit:
    li $v0, 10
    syscall
