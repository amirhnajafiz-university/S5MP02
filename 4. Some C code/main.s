memory EQU 0x20000000
size EQU 16 

	EXPORT __main
	AREA my_code, CODE, READONLY
	ENTRY 
	
__main 
	LDR R0, =0
	LDR R1, =0
	LDR R2, =2 
	LDR R3, =5
	LDR R4, =0
	LDR SP, =(memory + size) 
	STMFD SP!, {R0-R1}
	MOV R8, SP		;; Main stack 
	LDR SP, =(memory + 8)
	STMFD SP!, {R0-R1}
	BL FUNC 
	LDMFD SP!, {R1}
	MOV SP, R8 
	LDMFD SP!, {R0-R1}
HERE B HERE

FUNC 
	LDMFD SP!, {R0-R1}
	LDR R5, =0
	LDR R6, =1
LOOP 
	;;;;;;;;; while R5 != R1 
	MUL R6, R6, R0
	;;;;;;;;;
	ADD R5, R5, #1 
	CMP R5, R1 
	BNE LOOP
	STMFD SP!, {R6}
	BX LR
	END