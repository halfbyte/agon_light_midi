; Util to print hex numbers
; (c) Jan Krutisch
; LICENSE: MIT, see LICENSE file

print_hex:
  ; save registers
	push bc
	push de
	push hl
	; save in c
	ld c,a
	
  ; shift upper nybble down
	srl a
	srl a
	srl a
	srl a
	call print_digit

  ; reload full byte
	ld a,c
  ; mask lower nybble
	ld b,0x0F
	and b
	call print_digit

  ; restore registers
 	pop hl
	pop de
	pop bc
  
  ; return

	ret

print_digit:
	
	ld hl, hexchars
  ; initialise full 24 bit register
	ld de, 0
  ; load offset into lowest byte
	ld e,a
	add hl, de
  ; print char
	ld a,(hl)
	rst.lil 0x10
	
	ret

hexchars:
	.db "0123456789ABCDEF"
