/*
	main.s assembly file
*/

.section .init
.globl _start
_start:

b main

.section .text
main:
mov sp,#0x8000

/* set GPIO function (init) */
pinNum .req r0
pinFunc .req r1
mov pinNum,#16
mov pinFunc,#1
bl io_gpio_Init
.unreq pinNum
.unreq pinFunc

loop$:

pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#0 /* pin off, led on */
bl io_gpio_Set
.unreq pinNum
.unreq pinVal

decr .req r0
mov decr,#0x3F0000
wait0$:
	sub decr,#1
	cmp decr,#0
	bne wait0$
.unreq decr

pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#1	/* pin on, led off */
bl io_gpio_Set
.unreq pinNum
.unreq pinVal

decr .req r0
mov decr,#0x3F0000
wait1$:
	sub decr,#1
	cmp decr,#0
	bne wait1$
.unreq decr

b loop$
