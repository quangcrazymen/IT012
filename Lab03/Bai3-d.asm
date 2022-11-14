#BAI3-D
li $v0,5
syscall
addi $t0,$v0,0
li $v0,5
syscall
addi $t1,$v0,0
add $a0,$t0,$t1
li $v0,1
syscall

