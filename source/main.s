/*
	main.s assembly file
*/

.section .init
.globl _start
_start:

ldr r0,=0x20200000	/* GPIO controller address */

/* Ready GPIO for instructions
mov r1,#1
lsl r1,#18	/* 1 << 18 : logical shift left 18 places in binary */
str r1,[r0,#4]	/* val(r1) -> address(val(r0)+4) */

loop$:

mov r1,#1
lsl r1,#16	/* 16th pin */
str r1,[r0,#40]	/* 40 turns pins off */

mov r2,#0x3F0000
wait1$:
sub r2,#1
cmp r2,#0
bne wait1$	/* if cmp was !=, goto wait1$ */

mov r1,#1
lsl r1,#16	/* 16th pin */
str r1,[r0,#28]	/*28 turns pins on */

mov r2,#0x3F0000
wait1$:
sub r2,#1
cmp r2,#0
bne wait1$

b loop$
