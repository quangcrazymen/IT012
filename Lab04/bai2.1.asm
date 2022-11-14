.data
.text
addi $s0,$s0,2	#i
addi $s1,$s1,2	#j
addi $s2,$s2,3	#f
addi $t0, $t0, 10	#g
addi $t1, $t1, 4	#h
bne  $s0,$s1,else	#if(i==j) (branch if not equal)
add $s2,$t0,$t1	#f=g+h
j done
else:
sub $s2,$t0,$t1	#f=g-h
done: