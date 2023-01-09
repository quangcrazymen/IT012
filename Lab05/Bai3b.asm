.data
string1:	.asciiz	"Mang nhap vao"
string2:	.asciiz	"Mang sau khi so sanh"
newline:	.asciiz	"\n"
space:	.asciiz	" "

.text
li $v0,5            			# input
syscall

move $t2,$v0        		# n
move $a0,$t2			
sll $a0,$a0,2       		# number of bytes to allocate on the heap
li $v0,9	        
syscall

move $s3,$v0       		# s3 -> &A
sll $t3,$t2,2	    		# offset
add $t3,$s3,$t3     		# last element A
add $t1,$s3,$0      		# first element A
move $t0,$t1

#nhap tung phan tu
loop: li $v0,5
syscall
sw $v0,($t0)        
add $t0,$t0,4       		
bne $t3,$t0,loop		# *pt ! = A.end()

# in mang A
move $t0,$t1

loop3:
lw $a0,($t0)
li $v0,1
syscall

li $v0,4
la $a0,space
syscall

addi $t0,$t0,4 
bne $t0,$t3,loop3

li $v0,4
la $a0,newline
syscall

li $s0,2            			# i = 2
li $s1,1	 			# j = 1
move $t4,$s0        
move $t5,$s1        
sll $t4,$t4,2	    		# offset i
sll $t5,$t5,2       		#offset j
add $t4,$t4,$s3	    	# A[i]
bgt $s0,$s1,assign  	# i > j => assign 
sw $s0,($t4)        		# A[i] = i
j exit              			
assign:sw $s1,($t4) 	# A[j]=j
exit:

# Xuat cac gia tri cua mang A
move $t0,$t1

loop4:
lw $a0,($t0)
li $v0,1
syscall

li $v0,4
la $a0,space
syscall

addi $t0,$t0,4 
bne $t0,$t3,loop4

li $v0,4
la $a0,newline
syscall