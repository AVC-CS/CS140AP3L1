
# Title:  					Filename:
# Author:  				Date:
# Description:
# Input:
# Output:
# 
# int num[3] = {1,2,3};
# int N = 3;
# int sum = 0;
# int i = 0;
# while(i<N ) { 
#	sum += num[i]
# 	i += 1
# }

################# Data segment #####################
.data
	num: 	.word	1, 2, 3	# $t0 : addres of num
	N:		.word	3			# $t2 : N
	sum:	.word	0			# $t3 : sum	
################# Code segment #####################
.text
.globl main
main:  	
	la		$t0, num		# load address of num to t0
	lw		$t2, N 			# $t2 = N 	

	ori		$t1, $0, 0
	ori		$t3, $0, 0

loop:	
	slt		$t4, $t1, $t2	# i < N  
	beq		$t4, $0, exit

	add		$t5, $t5, $t0 
	lw		$t5, 0($t5)
	add		$t3, $t5, $t3
	addi 	$t1, $t1, 1
	sll 	$t5, $t1, 2
	j 		loop	
exit:
    sw      $t3, sum

	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 10  # Exit program
	syscall
