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
	#r28 Yl - overfow
	#r27 Xh
	#r26 Xl - counter
	#r24 generic value
	#r23 reference inner
	ldi r23, lo8(0xff)

	# PB5 as output
	ldi r24, lo8(0x20)
	out 0x04, r24

	ldi r24, lo8(0x00)
	out 0x05, r24

.loop:
	# led off
	ldi r24, lo8(0x00)
	out 0x05, r24

	# delay
	ldi r27, 0
	ldi r26, 0
.for1:
	adiw r26, 0x01
	cpi r26, 0xff
	cpc r27, r23
	brne .for1

	# led on
	ldi r24, lo8(0x20)
	out 0x05, r24

	# delay
	ldi r27, 0
	ldi r26, 0
.for2:
	adiw r26, 0x01
	cpi r26, 0xff
	cpc r27, r23
	brne .for2

	rjmp .loop

.error:
	# led on
	ldi r24, lo8(0x20)
	out 0x05, r24
	rjmp .error

	.size	main, .-main
	.ident	"GCC: (GNU) 15.1.0"
