
# x: $t0

main:

count3_loop_init:
	li	$t0, 24		# x = 24;
count3_loop_cond:
	bge	$t0, 42, count3_loop_end	# if (x >= 42) goto end;
	
	li	$v0, 1	# printf("%d\n", x);
	move	$a0, $t0
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

count3_loop_step:
	add	$t0, $t0, 3	# x += 3;
	b	count3_loop_cond

count3_loop_end:

	jr	$ra	# return;
