N_SIZE=10

# $t0	i
# $t3	numbers[i]
	.text
main:

loop_init:
	li	$t0, 0		# i = 0
loop_cond:
	bge	$t0, N_SIZE, loop_end
loop_body:
	# get &numbers[i]
	la	$t1, numbers	# $t1 = &numbers[0]
	mul	$t2, $t0, 4	# $t2 = i * sizeof(int)
	add	$t1, $t1, $t2	# $t1 = &numbers[i]

	lw	$t3, ($t1)	# $t3 = numbers[i]

	bgez	$t3, loop_step

	add	$t3, $t3, 42

loop_step:
	addi	$t0, $t0, 1	# i++
	b	loop_cond
loop_end:

	li	$v0, 0		# return 0
	jr	$ra


	.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9		# int numbers[N_SIZE] = {0, 1, 2, -3, 4, -5, 6, -7, 8    , 9};
