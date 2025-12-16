#
# 9600 baud rate 8 data bits, 1 stop bit example
#

#define R22_VAL		lo8(0x20)

	.file	"main.S"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__X_L__	= 0x20
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1

	.section	.rodata,"a",@progbits
	.align 2
.const:
	.string "Hello world"

	#.text
	.section	.text.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.L__stack_usage = 0
	# r28, r29 STACK
	#r27 Xh
	#r26 Xl - counter
	#r24 generic value
	#r23 value to compare with

	# create a stack
	push r28
	push r29
	in r28, __SP_L__
	in r29, __SP_H__
	sbiw r28, 0x10

	# timers
	ldi r23, lo8(0xff)
	ldi r22, R22_VAL

	# PB5 as output
	ldi r24, lo8(0x20)
	out 0x04, r24

	ldi r24, lo8(0x00)
	out 0x05, r24

	# baud rate
	ldi r16, lo8(103)
	ldi r17, lo8(0x00)
	sts 0xc4, r16
	sts 0xc5, r17

	# UCSrC - USART 8 data 1 stop bit
	ldi r16, 0x06 
	sts 0xc2, r16

	# UCSrB - only TX enable
	ldi r16, 0x08 
	sts 0xc1, r16

	# UCSrA are mostly flags
.loop:
	# led toggle
	in r20, 0x05
	ldi r19, 0x20
	cp r19, r20
	breq  .led_off
	rjmp .led_on

.led_on:
	ldi r24, lo8(0x20)
	sts 0x25, r24
	rjmp .continue

.led_off:
	ldi r24, lo8(0x0)
	sts 0x25, r24	
	rjmp .continue

.continue:
	#lds r16, 0xc0
	#sbis r16, 5
	#rjmp .loop
	# TODO implement locking

	# write to uart
	ldi r25, 0x61
	sts 0xc6, r25

	# delay
	ldi r28, 0
	ldi r27, 0
	ldi r26, 0
.for1:
	adiw r26, 0x01
	cp r26, r23
	cpc r27, r23
	brne .for1
	adiw r28, 0x01
	cp r28, r22
	brne .for1

	rjmp .loop

	.size	main, .-main
	.ident	"GCC: (GNU) 15.1.0"
