#BAI 3-C
.data
	# allocate space for 20 bytes
	buffer: .space 20
.text
# System call 8
li $v0,8
# Number of characters are allowed to be input
li $a1,100
# load byte space
la $a0,buffer
syscall
# Syscall to print value
li $v0,4
syscall
