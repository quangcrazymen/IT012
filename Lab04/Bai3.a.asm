.data
	buffer:	.word 1
	newline:	.asciiz "\n"
	string0: .asciiz "Ki tu vua nhap: "
	string1: 	.asciiz "Ky tu truoc: "
	string2:	.asciiz "Ky tu sau: "
	invalidChar: .asciiz "invalid type"
	char: 	.word 1
.text
# ki tu char => 47<char<58 or 64<char<91or  96<char<123

li $v0,8
li $a1,2
la $a0,buffer
syscall
lw $s0,($a0)	#char (load content in add in $a0 to $s0, $s0.type=int)

li $v0,4
la $a0,string0
syscall
	
la $a0,buffer	#print char
syscall

la $a0,newline
syscall

#check if valid
sgtu $t0,$s0,47
slti $t1,$s0,58		#47<a<58
and $s1,$t0,$t1

sgtu $t2,$s0,64
slti $t3,$s0,91		#64<a<91
and $s2,$t2,$t3

sgtu $t4,$s0,96
slti $t5,$s0,123		#96<a<123
and $s3,$t4,$t5

or $s4,$s1,$s2		# $s4=(47<a<58)||(64<a<91)
or $s5,$s4,$s3		# $s5 = $s4 ||(96<a<123)

beqz $s5,invalid

li $v0,4
la $a0,string1
syscall

li $v0,4
subi $s1,$s0,1		#prev char
la $a0,char		# $a0.type=address
sw $s1,($a0)		# $s1(int)->$a0(address)
syscall

la $a0,newline
syscall

la $a0,string2
syscall

addi $s1,$s0,1
la $a0,char		#next char
sw $s1,($a0)
syscall

j done
invalid:
li $v0,4
la $a0,invalidChar
syscall

done:
