	.data
array1:	.word 	5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1:	.word 	10

array2:	.byte 	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2:	.word	16

array3:	.space	8
size3:	.word	8

newline:	.asciiz	"\n"
space:	.asciiz	" "
error: 	.asciiz	"Khong the truy cap"
.text
la $s0, array1	
la $s1,40($s0)	 
move $t0,$s0    
 
loop:
lw $a0,($t0)     
li $v0,1         
syscall

li $v0,4
la $a0,space
syscall

addi $t0, $t0,4  
bne $t0,$s1,loop 

li $v0,4
la $a0,newline
syscall

#in mang array2
la $s2,array2    
la $s3,16($s2)   
move $t0,$s2     
loop1: 
lb $a0,($t0)  
li $v0,1
syscall

li $v0,4
la $a0,space
syscall
      
addi $t0, $t0,1
bne $t0,$s3,loop1

li $v0,4
la $a0,newline
syscall
# gan gia tri vao mang 3
la $s4,array3			# array3.begin()
la $s5,8($s4)   		# array3.end()
move $t0,$s4			# array3.begin()
move $t1,$s2			# array2.begin()
subi $t2,$s3,1	 		# array2.end()

loop2:
lb $t3,($t1)     			# array2[i]
lb $t4,($t2)     			# array2[size2 - 1 - i]
add $t5,$t3,$t4  		#array2[i] + array2[size2 - 1 - i]
sb $t5,($t0)     		#array3[i] = array2[i] + array2[size2 - 1 - i]
addi $t0,$t0,1   		#array3
addi $t1,$t1,1   		#array2
subi $t2,$t2,1   		# -i
bne $t0,$s5,loop2		# i==array3.end() =>stop

# In ra gia tri cua mang 3
la $t0,array3	

loop3:
lb $a0,($t0)
li $v0,1
syscall

li $v0,4
la $a0,space
syscall

addi $t0,$t0,1
bne $t0,$s5,loop3

li $v0,4
la $a0,newline
syscall

# 2 c
li $v0,5	          		# 1,2,3
syscall
bgt $v0,3,error1
ble $v0,0,error1

beq $v0,1,assign1     
bne $v0,1,arr2        
assign1:
move $t0,$s0          
j next1 
            
arr2:
beq $v0,2,assign2
bne $v0,2,arr3        
assign2:
move $t0,$s2          
j next2
       
arr3:
move $t0,$s4          
j next2 
                      
next1:
li $v0,5	          
syscall
bge $v0,10,error1
sll $t1,$v0,2      		#offset of index   
add $t2,$t1,$t0	      
lw $a0,($t2)          
li $v0,1              
syscall
j exit
   
next2:
li $v0,5	          
syscall
bge $v0,16,error1
move $t1,$v0      		#offset of index   
add $t2,$t1,$t0	      
lb $a0,($t2)          
li $v0,1              
syscall
j exit

error1:
li $v0,4
la $a0,error
syscall

exit: