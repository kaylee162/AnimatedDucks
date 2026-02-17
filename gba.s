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
	.file	"gba.c"
	.text
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	subs	lr, r3, #0
	ble	.L1
	cmp	r2, #0
	ble	.L1
	mov	ip, #0
	ldr	r3, .L9
	rsb	r1, r1, r1, lsl #4
	add	r1, r2, r1, lsl #4
	ldr	r3, [r3]
	add	r1, r1, r0
	add	r0, r3, r1, lsl #1
	rsb	r2, r2, r2, lsl #31
.L4:
	add	r1, r0, r2, lsl #1
.L3:
	ldrh	r3, [sp, #4]
	strh	r3, [r1], #2	@ movhi
	cmp	r1, r0
	bne	.L3
	add	ip, ip, #1
	cmp	lr, ip
	add	r0, r0, #480
	bne	.L4
.L1:
	ldr	lr, [sp], #4
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	ldr	r3, [r3]
	add	r2, r3, #76800
.L12:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L12
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L18:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L18
	mov	r2, #67108864
.L19:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L19
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L27
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L29
.L27:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L29:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L27
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM) 15.2.0"
