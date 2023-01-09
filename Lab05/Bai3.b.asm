.data
.text

# Nhap vao so phan tu n
li $v0,5
syscall
addi $t0,$v0,0
# Mang A
li $s0,0			# i
li $s1,0			# j
sw $s3,mangA	# &A

# if(i<j) A[i] = i
# else A[i] =j