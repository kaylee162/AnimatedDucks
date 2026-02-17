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
	.file	"text.c"
	.text
	.align	2
	.global	drawChar
	.syntax unified
	.arm
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L12
	push	{r4, r5, lr}
	rsb	r1, r1, r1, lsl #4
	ldr	lr, .L12+4
	ldr	r4, [ip]
	add	r2, r2, r2, lsl #1
	add	r1, r0, r1, lsl #4
	add	lr, lr, r2, lsl #4
	add	r4, r4, r1, lsl #1
	add	r5, r0, #6
.L2:
	mov	r1, r4
	sub	r2, lr, #48
.L4:
	ldrb	ip, [r2]	@ zero_extendqisi2
	add	r2, r2, #6
	cmp	ip, #0
	strhne	r3, [r1]	@ movhi
	cmp	r2, lr
	add	r1, r1, #480
	bne	.L4
	add	r0, r0, #1
	cmp	r0, r5
	add	lr, r2, #1
	add	r4, r4, #2
	bne	.L2
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	videoBuffer
	.word	fontdata_6x8+48
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L14
	mov	r6, r1
	mov	r4, r0
.L16:
	mov	r0, r4
	mov	r1, r6
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L16
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString, .-drawString
	.ident	"GCC: (devkitARM) 15.2.0"
