; note frequencies (based on official MIDI tuning) for
; MIDI note numbers 0-127
; Obviously rounded to integers which makes for some really
; shoddy intervals in the lower octaves
; generated with the ruby script included (gen_midi_freqs.rb)
; comments contain midi notes
; (c) Jan Krutisch
; LICENSE: MIT, see LICENSE file

midi_frequencies:
	.dw 8, 9, 9, 10; 0, 1, 2, 3
	.dw 10, 11, 12, 12; 4, 5, 6, 7
	.dw 13, 14, 15, 15; 8, 9, 10, 11
	.dw 16, 17, 18, 19; 12, 13, 14, 15
	.dw 21, 22, 23, 24; 16, 17, 18, 19
	.dw 26, 28, 29, 31; 20, 21, 22, 23
	.dw 33, 35, 37, 39; 24, 25, 26, 27
	.dw 41, 44, 46, 49; 28, 29, 30, 31
	.dw 52, 55, 58, 62; 32, 33, 34, 35
	.dw 65, 69, 73, 78; 36, 37, 38, 39
	.dw 82, 87, 92, 98; 40, 41, 42, 43
	.dw 104, 110, 117, 123; 44, 45, 46, 47
	.dw 131, 139, 147, 156; 48, 49, 50, 51
	.dw 165, 175, 185, 196; 52, 53, 54, 55
	.dw 208, 220, 233, 247; 56, 57, 58, 59
	.dw 262, 277, 294, 311; 60, 61, 62, 63
	.dw 330, 349, 370, 392; 64, 65, 66, 67
	.dw 415, 440, 466, 494; 68, 69, 70, 71
	.dw 523, 554, 587, 622; 72, 73, 74, 75
	.dw 659, 698, 740, 784; 76, 77, 78, 79
	.dw 831, 880, 932, 988; 80, 81, 82, 83
	.dw 1047, 1109, 1175, 1245; 84, 85, 86, 87
	.dw 1319, 1397, 1480, 1568; 88, 89, 90, 91
	.dw 1661, 1760, 1865, 1976; 92, 93, 94, 95
	.dw 2093, 2217, 2349, 2489; 96, 97, 98, 99
	.dw 2637, 2794, 2960, 3136; 100, 101, 102, 103
	.dw 3322, 3520, 3729, 3951; 104, 105, 106, 107
	.dw 4186, 4435, 4699, 4978; 108, 109, 110, 111
	.dw 5274, 5588, 5920, 6272; 112, 113, 114, 115
	.dw 6645, 7040, 7459, 7902; 116, 117, 118, 119
	.dw 8372, 8870, 9397, 9956; 120, 121, 122, 123
	.dw 10548, 11175, 11840, 12544; 124, 125, 126, 127
