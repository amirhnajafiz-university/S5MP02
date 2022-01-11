memory EQU 0x20000000
size EQU 16 

	EXPORT __main
	AREA my_code, CODE
	ENTRY 
	
__main 
	LDR SP, =(memory + size) ; Stack pointer
	LDR R0, =10 			 ; number 
	LDR R1, =3				 ; divider 
	STMFD SP!, {R0-R1} 
	MOV R8, SP;				 ; main stack 
	LDR SP, =(memory + 8)	 ; func stack 
	STMFD SP!, {R0-R1}
	BL FUNC 
	LDMFD SP!, {R2, R3}
	MOV SP, R8 				 ; restoring values
	LDMFD SP!, {R0-R1}
HERE B HERE

FUNC 
	LDMFD SP!, {R0-R1}
	MOV R2, #0  ; target
	MOV R3, #0  ; remain
LOOP
	;;;;;; while R0 >= R1 
	SUB R0, R0, R1 
	ADD R2, R2, #1
	;;;;;;
	CMP R0, R1
	BCS LOOP 
	MOV R3, R0
	STMFD SP!, {R2, R3}
	BX LR
	END