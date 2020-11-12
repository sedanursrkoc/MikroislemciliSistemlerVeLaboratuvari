		ORG 00H
		SJMP BASLA
		ORG 0BH
KESME:	
		SETB TR0
		RETI
		ORG 30H
BASLA:	MOV P1,#0FFH
		CLR A 
		MOV P2,A
		MOV P3,00H
		MOV R1,#4
BAS:	JB P1.0,BAS
		MOV IE,#82H
		MOV A,#0x2D
		MOV P2,A
		CLR P1.1
		SETB TR0
		ACALL BEKLE
		SETB P1.1
		MOV A,#0x2D
		MOV P2,A
		CLR P1.2
		ACALL BEKLE
		SETB P1.2
		MOV A,#0x06
		MOV P2,A
		CLR P1.3
		ACALL BEKLE
		SETB P1.3
		MOV A,#0x5F
		MOV P2,A
		CLR P1.4
		ACALL BEKLE
		SETB P1.4
		DJNZ R1,BAS
		ACALL BEKLE2
		MOV R1,#4
		SJMP BAS
BIRAK:	JNB P1.0,BIRAK
		CLR A
		MOV P2,#000H
BEKLE:	
	SN: 	MOV R0,#2
			MOV TMOD,#00H
	SAY:	MOV TH0,#63H
			MOV TL0,#18H
	KONTROL:JNB TF0,KONTROL
			DJNZ R0,SAY
			RET
BEKLE2:	
	SN2: 	MOV R0,#100
			MOV TMOD,#00H
	SAY2:	MOV TH0,#63H
			MOV TL0,#18H
	KONTROL2:JNB TF0,KONTROL2
			DJNZ R0,SAY2
			RET
END			