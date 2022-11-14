.data
	newline:	.asciiz "\n"
	string1:	.asciiz "So lon hon la: "
	string2:	.asciiz "Tong, hieu, tich, thuong cua 2 so lan luot la: "
.text

li $v0,5
syscall
addi $t0,$v0,0	#a
li $v0,5
syscall
addi $t1,$v0,0	#b

sle $t2,$t0,$t1		# t1=1 if t1<=t2 => t1>t2 if t0=0 
beq $t2,$zero,endif	#if(a<b)
li $v0,4
la $a0,string1
syscall
addi $a0,$t1,0
li $v0,1
syscall
li $v0,4
la $a0,newline
syscall
j continue

endif:
li $v0,4
la $a0,string1
syscall
add $a0,$t0,0
li $v0,1
syscall
li $v0,4
la $a0,newline
syscall

continue:
li $v0,4
la $a0,string2
syscall
la $a0,newline
syscall

add $a0,$t0,$t1	#sum
li $v0,1
syscall
li $v0,4
la $a0,newline
syscall

sub	$a0,$t0,$t1	#sub
li $v0,1
syscall
li $v0,4
la $a0,newline
syscall

mul $a0,$t0,$t1	#mul
li $v0,1
syscall
li $v0,4
la $a0,newline
syscall

div  $a0,$t0,$t1	#div
li $v0,1
syscall
li $v0,4
la $a0,newline
syscall