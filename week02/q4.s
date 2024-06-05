
	.text
# x $t0
# y $t1

main:
	la	$a0, prompt	# printf("Enter a number: ");
	li	$v0, 4
	syscall

	li	$v0, 5		# scanf("%d", &x);
	syscall
	move	$t0, $v0	# x in $t0

	mul	$t1, $t0, $t0	# y = x * x;

	move	$a0, $t1	# printf("%d\n", y);
	li	$v0, 1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

	li	$v0, 0		# return 0;
	jr	$ra

	.data
prompt:
	.asciiz	"Enter a number: "
	
