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
bl gpio_Init
.unreq pinNum
.unreq pinFunc

loop$:

pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#0 /* pin off, led on */
bl gpio_Set
.unreq pinNum
.unreq pinVal

mov r2,#0x3F0000
wait0$:
sub r2,#1
cmp r2,#0
bne wait0$

pinNum .req r0
pinVal .req r1
mov pinNum,#16
mov pinVal,#1	/* pin on, led off */
bl gpio_Set
.unreq pinNum
.unreq pinVal

mov r2,#0x3F0000
wait1$:
sub r2,#1
cmp r2,#0
bne wait1$

b loop$