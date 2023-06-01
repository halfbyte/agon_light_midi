; simple test for util functions and a couple
; of things I needed to validate
; Written on the Agon Light using ez80asm
; (c) Jan Krutisch
; LICENSE: MIT, see LICENSE file

.assume adl=1
.org 40000h

	macro moscall fun
	ld A, fun
	RST.lil $08
	endmacro


	jp SETUP

; MOS header

	.align 64
	db "MOS", 0, 1

SETUP:	
	push af
	push bc
	push de
	push ix
	push iy

	ld hl, text
	ld bc, 0
	ld a, 0
	RST.lil $18

	ld a, 10
	call print_hex
	ld a, $FF
	call print_hex
	ld a, $80
	call print_hex
	ld a, 10
	rst.lil $10
	ld a, 13
	rst.lil $10


shutdown:

	pop iy
	pop ix
	pop de
	pop bc
	pop af

	ld hl, 0

	RET


text:
	.db "Hello World",0

.include "utils.inc"
