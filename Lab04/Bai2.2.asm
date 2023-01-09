addi $s2,$s2,0	#int Sum=0
addi $s1,$s1,10	#int N=5
add $s0,$s0,1		#int i=1
Loop:  sle $t0,$s0,$s1		#set less or equal (i<=N)
	beq $t0,$zero, exit	# i>N => exit
	add $s2,$s2,$s0		# Sum=Sum+i
	addi $s0,$s0,1		# i++
	j Loop
exit:
