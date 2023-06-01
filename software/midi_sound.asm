; simple demo of reading MIDI input from UART1 and
; using the VDP sound command to play back notes
; Written on the Agon Light using ez80asm
; (c) Jan Krutisch
; LICENSE: MIT, see LICENSE file
.assume adl=1
.org 40000h

	MACRO moscall fun
	ld a, fun
	RST.lil $08
	ENDMACRO

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

	ld hl, intro
	ld bc, 0
	ld a, 0
	rst.lil $18


main_loop:
	moscall $17
	call play_note
	jr main_loop

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

play_note:
	cp a, $90
	ret nz

	moscall $17 ; read note
	ld b, a
	
	moscall $17 ; read volume (currently ignored)
	ld c, a
	
	ld hl, midi_frequencies
	ld de, 0
	ld e, b
	sla e ; double note offset to get from byte to word offset. Whee binary maths!
	
	; lookup frequency
	add hl, de
	ld de, (hl)
	
	ld ix, sound_command
	; we're in 24 bit mode, so ld (ix+d), de would overwrite a third byte
	; Pretty sure this could be addressed with an opcode suffix, but I don't
	; feel confident that I understand what's going on.
	ld (ix+6),e
	ld (ix+7),d
	ld hl, sound_command
	ld bc, 10
	ld a, 0
	rst.lil $18

; exit
	ret	

; configuration for the serial init. 31250 is the (slightly weird) MIDI baud rate
; rest is 8 bits, 1 stop bit, no parity, no hardware flow control, no interrupts
; See https://github.com/breakintoprogram/agon-docs/wiki/MOS-API#0x15-mos_uopen

serial_struct:
	.dl 31250
	.db 8,1,0,0,0

; static VDP sound command. frequency will be injected in bytes 6 and 7
; see https://github.com/breakintoprogram/agon-docs/wiki/VDP#vdu-23-0-vpd-commands
; Note that setting volume (byte 5) much higher leads to distortion.
; Note that waveform is currently ignored in VDP code.

sound_command:
	.db 23, 0, $85, 0, 0, $80
	.dw 0, $60

; banner
intro:
	.db "Agon StoopidSynth. Receives on CH1",10,13,0

.include "utils.inc"
.include "midi_notes.inc"

