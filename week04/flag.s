	.text
FLAG_ROWS = 6
FLAG_COLS = 12

# $t0	row
# $t1	col
main:

	li	$t0, 0		# row = 0
row_loop:
	bge	$t0, FLAG_ROWS, row_loop_end

	li	$t1, 0		# col = 0
col_loop:
	bge	$t1, FLAG_COLS, col_loop_end	#  for (int col = 0; col < FLAG_COLS; col++)

	# printf("%c", flag[row][col]);
	mul	$t2, $t0, FLAG_COLS
	add	$t2, $t2, $t1
	lb	$a0, flag($t2)			# $t2 = flag[row][col]

	li	$v0, 11
	syscall
	

	addi	$t1, $t1, 1	# col++
	b	col_loop
col_loop_end:

	li	$v0, 11		# printf("\n");
	li	$a0, '\n'
	syscall

	add	$t0, $t0, 1	# row++
	b	row_loop
row_loop_end:
	jr	$ra

	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
