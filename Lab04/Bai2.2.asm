addi $s2,$s2,0	#int Sum=0
addi $s1,$s1,5	#int N=5
add $s0,$s0,1		#int i=1
Loop:  sle $t0,$s0,$s1
	beq $t0,$zero, exit
	add $s2,$s2,$s0
	addi $s0,$s0,1
	j Loop
exit: