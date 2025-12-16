	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.rodata
.LC0:
	.string	"abcdefgh"
	.text
.global	main
	.type	main, @function
main:
	push r28
	push r29
	rcall .
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 3 */
/* stack size = 5 */
.L__stack_usage = 5
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	std Y+2,r25
	std Y+1,r24
	ldd r24,Y+1
	ldd r25,Y+2
	movw r30,r24
	ldd r24,Z+2
	std Y+3,r24
.L2:
	nop
	rjmp .L2
	.size	main, .-main
	.ident	"GCC: (GNU) 15.1.0"
.global __do_copy_data
