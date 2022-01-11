array EQU 0x20000000
size EQU 16

	EXPORT __main
	AREA my_code, CODE
	ENTRY 
	
__main 
	LDR R0, =(array)		;; Pointer to array 
	LDR R1, =(size)			;; N 
	MOV R2, #4				;; i
LOOP	
	;;;;;;;; for (i=1; i < n; i++)
	LDR R3, [R0, R2]		;; key
	SUB R4, R2, #4 			;; j 
WHILE 
	;;;;;;;; while (j >= 0 && arr[j] > key)
	LDR R6, [R0, R4]
	ADD R4, R4, #4
	STR R6, [R0, R4]
	SUB R4, R4, #8
	;;;;;;;;
	CMP R4, #0 				;; j >= 0
	BCS SECOND  
	B FINAL
SECOND 
	LDR R5, [R0, R4] 
	CMP R5, R3 				;; arr[j] >= key
	BHI WHILE
FINAL
	ADD R4, R4, #4 
	STR R3, [R0, R4]
	;;;;;;;;
	ADD R2, R2, #4 
	SUB R1, R1, #4 
	CMP R2, R1 
	ADD R1, R1, #4
	BLS LOOP 
	
HERE B HERE
END