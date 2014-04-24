/*
	io/gpio.s
*/

/*
	function gpio.Address()
	returns address of GPIO
*/
.globl gpio_Address
gpio_Address:
	ldr r0,=0x20200000
	mov pc,lr

/*
	function gpio.Set()
	initiates gpio for input
*/
.globl gpio_Init
gpio_Init:
	/* if r0 < 53 & > 7 */
	cmp r0,#53
		cmpls r0,#7
			movhi pc,lr
	push {lr}
	mov r2,r0
	bl gpio_Address
	
	functionLoop$:
		/* if r2 > 9 */
		cmp r2,#9
			subhi r2,#10
			addhi r0,#4
			bhi functionLoop$
	
	/* Multiply by 3 w/ lsl & add*/
	add r2, r2,lsl #1
	lsl r1,r2
	str r1,[r0]
	pop {pc}


/*
	function gpio.Set
	returns 
*/
.globl gpio_Set
gpio_Set:
	pinNum .req r0
	pinVal .req r1
	
	cmp pinNum,#53
		movhi pc,lr
	push {lr}
	mov r2,pinNum
	.unreq pinNum
	pinNum .req r2
	bl gpio_Address
	gpioAddr .req r0

	pinBank .req r3
	lsr pinBank,pinNum,#5
	lsl pinBank,#2
	add gpioAddr,pinBank
	.unreq pinBank
	
	and pinNum,#31
	setBit .req r3
	mov setBit,#1
	lsl setBit,pinNum
	.unreq pinNum
	
	teq pinVal,#0
	.unreq pinVal
	streq setBit,[gpioAddr,#40]
	strne setBit,[gpioAddr,#28]
	.unreq setBit
	.unreq gpioAddr
	pop {pc}
