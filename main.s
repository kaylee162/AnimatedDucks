	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Resting Ducks\000"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #67108864
	mov	r4, #0
	ldr	lr, .L4
	ldr	r5, .L4+4
	sub	sp, sp, #8
	mov	r3, #8
	strh	lr, [ip]	@ movhi
	mov	r2, #108
	str	r4, [sp]
	mov	r1, #16
	mov	r0, #20
	ldr	r6, .L4+8
	strb	r4, [r5]
	mov	lr, pc
	bx	r6
	mov	r1, #16
	mov	r0, #20
	ldr	r2, .L4+12
	mov	r3, #31744
	ldr	r6, .L4+16
	mov	lr, pc
	bx	r6
	ldr	r3, .L4+20
	str	r4, [r5, #4]
	mov	lr, pc
	bx	r3
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	.LANCHOR0
	.word	drawRectangle
	.word	.LC0
	.word	drawString
	.word	initializeDucks
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Animated Ducks\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, fp, lr}
	ldr	r4, .L28
	ldr	r3, .L28+4
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r7, .L28+8
	ldrh	r3, [r4, #8]
	ldr	r8, .L28+12
	ldr	r5, .L28+16
	ldr	r10, .L28+20
	ldr	r6, .L28+24
.L7:
	strh	r3, [r4, #10]	@ movhi
	ldrb	r9, [r4]	@ zero_extendqisi2
	ldrh	r3, [r6, #48]
	cmp	r9, #0
	strh	r3, [r4, #8]	@ movhi
	bne	.L25
	mov	lr, pc
	bx	r8
	ldr	fp, .L28+8
.L11:
	mov	r1, r9
	mov	r0, fp
	add	r9, r9, #1
	mov	lr, pc
	bx	r5
	cmp	r9, #5
	add	fp, fp, #8
	bne	.L11
	ldrh	r3, [r4, #10]
	tst	r3, #8
	ldrh	r3, [r4, #8]
	beq	.L7
	ands	r2, r3, #8
	bne	.L7
	mov	r3, #1
	mov	r1, #16
	mov	r0, #20
	str	r2, [sp]
	strb	r3, [r4]
	mov	r2, #108
	mov	r3, #8
	mov	lr, pc
	bx	r10
	ldr	r3, .L28+28
	mov	r1, #16
	mov	r0, #20
	ldr	r2, .L28+32
	ldr	ip, .L28+36
	mov	lr, pc
	bx	ip
	ldrh	r3, [r4, #8]
	b	.L7
.L25:
	cmp	r9, #1
	beq	.L9
.L26:
	ldrh	r2, [r6, #48]
	ldrh	r1, [r6, #48]
	cmp	r9, #1
	strh	r2, [r4, #10]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	bne	.L26
.L9:
	ldr	r3, [r4, #4]
	cmp	r3, #24
	add	r3, r3, #1
	strne	r3, [r4, #4]
	beq	.L27
.L14:
	mov	lr, pc
	bx	r8
	mov	r9, #0
	ldr	fp, .L28+8
.L15:
	mov	r1, r9
	mov	r0, fp
	add	r9, r9, #1
	mov	lr, pc
	bx	r5
	cmp	r9, #5
	add	fp, fp, #8
	bne	.L15
	ldrh	r3, [r4, #10]
	tst	r3, #8
	ldrh	r3, [r4, #8]
	beq	.L7
	ands	r2, r3, #8
	bne	.L7
	mov	r3, #8
	mov	r1, #16
	mov	r0, #20
	str	r2, [sp]
	strb	r2, [r4]
	mov	r2, #108
	mov	lr, pc
	bx	r10
	mov	r3, #31744
	mov	r1, #16
	mov	r0, #20
	ldr	r2, .L28+40
	ldr	ip, .L28+36
	mov	lr, pc
	bx	ip
	ldrh	r3, [r4, #8]
	b	.L7
.L27:
	mov	r3, #0
	ldr	r1, .L28+44
	ldr	lr, [r7]
	ldm	r1, {r0, r1}
	ldrh	ip, [r7, #4]
	str	lr, [r7, #32]
	stm	r7, {r0, r1}
	ldr	r1, .L28+48
	ldr	r2, [r7, #8]
	ldm	r1, {r0, r1}
	str	r3, [r4, #4]
	strh	ip, [r7, #36]	@ movhi
	ldrh	r3, [r7, #12]
	ldr	ip, .L28+52
	str	r2, [r7, #24]
	stm	ip, {r0, r1}
	strh	r3, [r7, #28]	@ movhi
	b	.L14
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.word	initialize
	.word	ducks
	.word	waitForVBlank
	.word	drawDuck
	.word	drawRectangle
	.word	67109120
	.word	815
	.word	.LC1
	.word	drawString
	.word	.LC0
	.word	ducks+32
	.word	ducks+24
	.word	ducks+8
	.size	main, .-main
	.text
	.align	2
	.global	goToRest
	.syntax unified
	.arm
	.type	goToRest, %function
goToRest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, lr}
	ldr	lr, .L32
	sub	sp, sp, #8
	str	ip, [sp]
	mov	r3, #8
	strb	ip, [lr]
	mov	r2, #108
	mov	r1, #16
	mov	r0, #20
	ldr	r4, .L32+4
	mov	lr, pc
	bx	r4
	mov	r3, #31744
	mov	r1, #16
	mov	r0, #20
	ldr	r2, .L32+8
	ldr	r4, .L32+12
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	drawRectangle
	.word	.LC0
	.word	drawString
	.size	goToRest, .-goToRest
	.align	2
	.global	goToAnimate
	.syntax unified
	.arm
	.type	goToAnimate, %function
goToAnimate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, #1
	mov	r5, #0
	ldr	ip, .L36
	sub	sp, sp, #12
	str	r5, [sp]
	mov	r3, #8
	strb	lr, [ip]
	mov	r2, #108
	mov	r1, #16
	mov	r0, #20
	ldr	r4, .L36+4
	mov	lr, pc
	bx	r4
	mov	r1, #16
	mov	r0, #20
	ldr	r3, .L36+8
	ldr	r2, .L36+12
	ldr	r4, .L36+16
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.word	drawRectangle
	.word	815
	.word	.LC1
	.word	drawString
	.size	goToAnimate, .-goToAnimate
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L44
	ldr	r3, [r2, #4]
	cmp	r3, #24
	beq	.L39
	add	r3, r3, #1
	str	r3, [r2, #4]
	bx	lr
.L39:
	push	{r4, lr}
	mov	lr, #0
	ldr	r3, .L44+4
	ldr	ip, [r3]
	add	r1, r3, #32
	ldm	r1, {r0, r1}
	str	ip, [r3, #32]
	ldrh	r4, [r3, #4]
	ldr	ip, [r3, #8]
	stm	r3, {r0, r1}
	str	lr, [r2, #4]
	add	r1, r3, #24
	ldrh	r2, [r3, #12]
	ldm	r1, {r0, r1}
	strh	r4, [r3, #36]	@ movhi
	str	ip, [r3, #24]
	strh	r2, [r3, #28]	@ movhi
	add	r3, r3, #8
	stm	r3, {r0, r1}
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.word	ducks
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r5, .L50
	ldr	r6, .L50+4
.L47:
	mov	r1, r4
	mov	r0, r5
	add	r4, r4, #1
	mov	lr, pc
	bx	r6
	cmp	r4, #5
	add	r5, r5, #8
	bne	.L47
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	ducks
	.word	drawDuck
	.size	drawGame, .-drawGame
	.align	2
	.global	reverseDucks
	.syntax unified
	.arm
	.type	reverseDucks, %function
reverseDucks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	add	r2, r3, #32
	ldm	r2, {r0, r1}
	ldr	r2, [r3]
	str	lr, [sp, #-4]!
	str	r2, [r3, #32]
	add	ip, r3, #24
	ldrh	r2, [r3, #4]
	ldrh	lr, [r3, #12]
	stm	r3, {r0, r1}
	ldm	ip, {r0, r1}
	ldr	ip, [r3, #8]
	strh	r2, [r3, #36]	@ movhi
	add	r2, r3, #8
	strh	lr, [r3, #28]	@ movhi
	stm	r2, {r0, r1}
	str	ip, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L55:
	.align	2
.L54:
	.word	ducks
	.size	reverseDucks, .-reverseDucks
	.align	2
	.global	swap
	.syntax unified
	.arm
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r1
	mov	r2, r0
	str	lr, [sp, #-4]!
	ldrh	ip, [r0, #4]
	ldr	lr, [r0]
	ldm	r1, {r0, r1}
	stm	r2, {r0, r1}
	str	lr, [r3]
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
	.size	swap, .-swap
	.global	state
	.global	frameCounter
	.global	oldButtons
	.global	buttons
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 1
state:
	.space	1
	.space	3
	.type	frameCounter, %object
	.size	frameCounter, 4
frameCounter:
	.space	4
	.type	buttons, %object
	.size	buttons, 2
buttons:
	.space	2
	.type	oldButtons, %object
	.size	oldButtons, 2
oldButtons:
	.space	2
	.ident	"GCC: (devkitARM) 15.2.0"
