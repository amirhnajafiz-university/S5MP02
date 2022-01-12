	AREA myData, DATA, READWRITE 

target  EQU 12
memory 	EQU 0x0000100
size 	EQU 100 

LEFT 	RN r6 
RIGHT   RN r7 
MID 	RN r8 

	EXPORT __main
	AREA my_code, CODE, READONLY
	ENTRY 
	
__main 
	LDR r4, =(memory)	 ;; array memory address 
	LDR LEFT, =0 		 ;; start of array
	LDR RIGHT, =(size)   ;; end of array 
	SUB RIGHT, RIGHT, #1 ;; starting from the end house of array
	LDR MID, =0 
	LDR r0, =(target)	 ;; the number we look for 
	LDR r1, =0 			 ;; place where we should store the result
	
LOOP 
	;;;;;;;;; while l <= r
	;;;;;;;;;
	CMP LEFT, RIGHT
	BLS BODY 
	B HERE 
BODY 
	ADD MID, LEFT, RIGHT 
	LDR r9, =2 
	UDIV MID, MID, r9    ;; calculating the mid=(left+right)/2
	
	MOV r9, r4
	ADD r9, r9, MID 	 
	LDRB r10, [r9]       ;; loading one byte of array
	
	CMP r10, r0			 ;; if A[n] == T
	BNE ELSE_IF			 ;; if A[n] != T
	MOV r1, r9			 ;; save the address in R1
	B HERE
ELSE_IF
	BHI ELSE_BODY 		 ;; if A[n] < T
	ADD LEFT, MID, #1
	B LOOP
ELSE_BODY 
	SUB RIGHT, MID, #1   ;; if A[n] > T
	B LOOP
	
HERE B HERE 
	END