# Nhap vao so phan tu n
li $v0,5
syscall
addi $t0,$v0,0

addi $s2,$s2,0		#int Sum=0
addi $s1,$s1,$t0		#int n
add $s0,$s0,1			#int i=1
Loop: sle $t0,$s0,$s1
beq $t0,$zero, exit
add $s2,$s2,$s0
addi $s0,$s0,1
j Loop
exit:

# Xuat ra so lon nhat va nho nhat trong mang
# Tinh tong tat ca cac phan tu trong mang
# in ra gia tri cua mang theo index

