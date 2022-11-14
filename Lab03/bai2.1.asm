.data
	var1:	.word 23
	var2: 	.byte 4
.text
	
# add
li $t0,10
li $t1,3000000
li $t2,100000
li $s0, -7
li $s1, 5
add $t0,$t0,$t1

# addi
addi $t0,$t0,100000

# addu
addu $t0,$t1,$t2

# addiu
addiu $t3,$t1,100000000000

sub $t3,$t1,$t2

and $t3,$s0,$s1

andi $t3,$s0,12

or $t3,$s0,$s1

nor $t3,$s0,$s1

sw $t1,var1

lw $s2, var1

slt $t4,$s1,$s0

sltiu $s0,$s1,23

la $s5,var2
sw $t1,($s5)
