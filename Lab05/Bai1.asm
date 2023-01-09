	.data
array1:	.word 	5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1:	.word 	10

array2:	.byte	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2:	.word	16

array3:	.space	8
size3:	.word	8

newline:	.asciiz	"\n"

# Print array1
	.text
la $t0,array1		# Address of array1 first element
la $t1,40($t0)		# Address of array1 last element
Loop:
beq $t0,$t1, endLoop

li $v0, 1
lw $a0,($t0)
syscall

addi $t0,$t0,4		# address of the next element

li $v0,4
la $a0,newline
syscall

j Loop

endLoop:
# Print array2
la $s2,array2      	# Address of array1 first element
la $s3,16($s2)     	# Address of array1 last element
move $t0,$s2       	# $t0 -> &array
loop2: 
lb $a0,($t0)		# load byte
li $v0,1
syscall
addi $t0, $t0,1

li $v0,4
la $a0,newline
syscall

bne $t0,$s3,loop2

# Gan gia tri vao array3[i] = array2[i] + array2[size2-1-i]
la $s4,array3			#
la $s5,32($s4)  
move $t0,$s4			# array3
move $t1,$s2			#array2
subi $t2,$s3,4			
loop3:
lb $t3,($t1)    
lw $t4,($t2)    
add $t5,$t3,$t4 
sw $t5,($t0)    
addi $t0,$t0,4  
addi $t1,$t1,1
subi $t2,$t2,4 
bne $t0,$s5,loop3

# Xuat gia tri theo index
li $v0,5	         
syscall
beq $v0,1,assign1    
bne $v0,1,arr2       
assign1:
move $t0,$s0         
j next               
arr2:
beq $v0,2,assign2    
bne $v0,2,arr3       
assign2:
move $t0,$s2         
j next               
arr3:
move $t0,$s4         
j next               
next:
li $v0,5	         
syscall
sll $t1,$v0,2        
add $t2,$t1,$t0	     
lw $a0,($t2)         
li $v0,1             
syscall

