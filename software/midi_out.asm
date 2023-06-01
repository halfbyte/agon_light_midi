; Simple example of using UART 1 to output MIDI
; Needs a MIDI circuit (see hardware folder)
; Written on the Agon Light using ez80asm
; (c) Jan Krutisch
; LICENSE: MIT, see LICENSE file

.assume adl=1
.org 40000h

	macro moscall fun
	ld A, fun
	RST.lil $08
	endmacro

	jp setup

; MOS header

	.align 64
	.db "MOS", 0, 1

setup:	
	; save registers
	push af
	push bc
	push de
	push ix
	push iy

	ld ix, serial_struct
	moscall $15

send:
	ld c, 6 ; length of the midi data
	ld hl, midi
send_loop:
	ld a, (hl)
	push bc
	push hl
	;call send_byte
	call print_hex
	pop hl
	pop bc
	inc hl
	dec c
	jp nz, send_loop

close:
	moscall $16

shutdown:
	; restore registers
	pop iy
	pop ix
	pop de
	pop bc
	pop af

	ld hl, 0
	; return to MOS
	ret


send_byte:
	push af
	ld c,a
	moscall $18
	pop af
	call print_hex
	ret

midi:
	.db 0x90,0x40,0x7f,0x80,0x40,0x00

serial_struct:
	.dl 31250
	.db 8,1,0,0,0

.include "utils.inc"
