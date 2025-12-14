	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__X_L__	= 0x20
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.text.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.L__stack_usage = 0
	#r24 generic value
	#r23 reference inner
	ldi r23, lo8(0xff)

	# PB5 as output
	ldi r24, lo8(0x20)
	out 0x04, r24

	ldi r24, lo8(0x20)
	out 0x05, r24

.loop:
	rjmp .loop

	.size	main, .-main
	.ident	"GCC: (GNU) 15.1.0"
