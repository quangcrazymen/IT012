.data
error: 	.asciiz	"Khong the truy cap"

.text
#nhap n phan tu
li $v0,5                 
syscall
move $t2,$v0             	# n
move $a0,$t2             
sll $a0,$a0,2            	# number of bytes to allocate on the heap
li $v0,9                 			
syscall
move $t0,$v0             
sll $t3,$t2,2	         
add $t3,$t0,$t3          	#offset
add $t1,$t0,$0           	# $t1 -> array.begin()
#nhap tung phan tu
loop: li $v0,5           
syscall
sw $v0,($t1)             
add $t1,$t1,4            
bne $t3,$t1,loop         
# Cau a
lw $s2,($t0)	    		# A[0] = max
add $t1,$t0,4       
loop2:          
lw $s3,($t1)	    		#A[i]
bgt $s3,$s2,assign  	#A[i]>max -> assign
resume:             
addi $t1,$t1,4      		# next
bne $t3,$t1,loop2   
beq $t3,$t1,exit    
assign:
move $s2,$s3        		#max=A[i]
j resume            
exit:

#xuat max
move $a0,$s2        
li $v0,1
syscall

#xuat max
move $a0,$s2        
li $v0,1
syscall



add $t1,$t0,$0         
add $s0,$s0,$0	       # s0=Sum
#Sum 
loop1:
lw $s1,($t1)           
add $s0,$s0,$s1        	# Sum+=A[i]
addi $t1,$t1,4	       
bne $t3,$t1,loop1	   
#Xuat tong
move $a0,$s0
li $v0,1
syscall

#Nhap index
li $v0,5
syscall
move $t4,$v0	        	# i
sll $t4,$t4,2           		# offset
add $t4,$t4,$t0         	# &A[i]
# Xuat
lw $a0,($t4)
li $v0,1
syscall
