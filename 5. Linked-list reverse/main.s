	AREA myData, DATA, READWRITE 

size 	EQU 8 		;; size of each node 4*(8)
pointer EQU 4		;; index of the pointer 4*(4)

HEAD 		RN r4	;; linked list head
NEWHEAD     RN r5	;; linked list head after reverse

CURRENT 	RN r6 
NEXT  		RN r7 
PREV		RN r8 

TEMP1       RN r9
TEMP2       RN r10

	EXPORT __main
	AREA my_code, CODE, READONLY
	ENTRY 
	
__main 
	MOV CURRENT, HEAD 
	MOV PREV, #0 
	MOV NEXT, #0 
	
WHILE 
	;;;;;;; while current != nil
	LDR TEMP2,   [CURRENT, #4]  ;; current.next
	LDR NEXT,    [TEMP2] 			 ;; next = current.next
	STR PREV,    [TEMP2]		     ;; current.next = prev
	MOV PREV, CURRENT 				 ;; prev = current
	MOV CURRENT, NEXT				 ;; current = next
	;;;;;;;
	LDR TEMP2, [CURRENT]
	CMP TEMP2, #0
	BNE WHILE 
	MOV NEWHEAD, PREV
	
HERE B HERE 
	END