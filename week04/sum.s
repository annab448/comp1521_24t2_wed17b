	.text
main:
	# Frame:    [$ra]
	# Uses:     [$v0, $a0, $a1, $a2, $a3]
	# Clobbers: [$v0, $a0, $a1, $a2, $a3]
	#
	# Locals:      
	#   - $a0	result
	#
	# Structure:    
	#   main
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]
main__prologue:
	begin
	push	$ra
main__body:
	li	$a0, 11
	li	$a1, 13
	li	$a2, 17
	li	$a3, 19
	jal	sum4		# int result = sum4(11, 13, 17, 19);

	move	$a0, $v0
	li	$v0, 1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

main__epilogue:
	pop	$ra
	end

	li	$v0, 0
	jr	$ra

sum2:
	# Frame:    [n\a]
	# Uses:     [$v0, $a0, $a1]
	# Clobbers: [$v0]
	#
	# Locals:      
	#   None
	#
	# Structure:    
	#   sum2
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]
	#
	# Arguments
	# $a0: x
	# $a1: y
sum2__prologue:
sum2__body:
	add	$v0, $a0, $a1	
sum2__epilogue:
	jr	$ra

sum4:
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals: 
	#   - $s0 res1
	#   - $s1 res2
	#
	# Structure
	#   sum4
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]
	# Args
	# $a0 = a, $a1 = b, $a2 = c, $a3 = d
sum4__prologue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2
sum4__body:
	move	$s1, $a2	# c = $s1
	move	$s2, $a3

	jal	sum2		# int res1 = sum2(a, b);
	move	$s0, $v0	# $s0 = res1

	move	$a0, $s1
	move	$a1, $s2
	jal	sum2		# int res2 = sum2(c, d);

	move	$a0, $s0
	move	$a1, $v0	
	jal	sum2		# $v0 = sum2 (res1, res2);
	
sum4__epilogue:
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr	$ra


