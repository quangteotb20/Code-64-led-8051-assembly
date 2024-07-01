
org 0000h
ljmp MAIN

org 0003h
ljmp NGAT_2

org 0013h
ljmp NGAT

org 0030h
MAIN: 
setb EA
setb EX0
setb IT0
setb EX1
setb IT1 ; NGAT THeo CANh
setb PX1
mov P1, #01h
mov R5, #01h
mov R4, #01h
clr P3.1
clr P3.0
KT1: 
   clr P3.0 ;c? nh? interrupt
   clr C ;c? nh? chuy?n hi?u ?ng ngay l?p t?c
   cjne R5, #01H, KT2
   ;clr P3.0
   acall CTA
   sjmp KT1
KT2:
   cjne R5, #02H, KT3
   ;clr P3.0
   acall CTC
   sjmp KT2
KT3: 
   cjne R5, #03H, KT4
   ;clr P3.0
   acall CTB
   sjmp KT3
KT4: 
   cjne R5, #04H, KT5
   ;clr P3.0
   acall CTD
   sjmp KT4
KT5:
   cjne R5, #05H, KT6
   ;clr P3.0
   acall CTE
   sjmp KT5
KT6: 
   cjne R5, #06H, KT7
   ;clr P3.0
   acall CTF
   sjmp KT6
KT7: 
   cjne R5, #07H, KT8
   ;clr P3.0
   acall CTG
   sjmp KT7
KT8: 
   cjne R5, #08H, KT9
   ;clr P3.0
   acall CTH
   sjmp KT8
KT9:
   cjne R5, #09H, KT10
   ;clr P3.0
   acall CTI
   sjmp KT9
KT10: 
   cjne R5, #0AH, KT1
   ;clr P3.0
   acall CTJ
   sjmp KT10
sjmp $




;LED SÁNG CHAN LE
CTA:	
   ;mov R6, #1
   ;H1:	
   mov R7, #64
lap20: 
   mov R7, #32
   LED_CHAN: 
      
      setb P2.0
      clr P2.1
      nop
      setb P2.1
      clr P2.0
      clr P2.1
      nop
      setb P2.1
      clr P2.2
      nop
      setb P2.2
      call DELAY
      DJNZ R7, LED_CHAN
      mov R7, #32
    LED_LE:	
      clr P2.0
      clr P2.1
      nop
      setb P2.1
      setb P2.0
      clr P2.1
      nop
      setb P2.1
      clr P2.2
      nop
      setb P2.2
      call DELAY
      djnz R7, LED_LE
      ;djnz R6, H1
ret


;LED SÁNG DAN
CTB:
;mov R6, #2
;H2:
mov R7, #64
lap3: 
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap3
   clr P2.2
   nop
   setb P2.2
   nop
   mov R7, #64
lap4:
   setb P2.0
   clr P2.1
   nop
   setb P2.1
   clr P2.2
   nop
   setb P2.2
   call DELAY
   djnz R7, lap4
   ;djnz R6, H2
ret



;LED CHOP TAT
CTC:
;mov R6, #10
;loop: 
   mov R7, #64
lap5: 
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap5
   clr P2.2
   nop
   setb P2.2
   call DELAY
   mov R7, #64
lap6: 
   setb P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap6
   clr P2.2
   nop
   setb P2.2
   call DELAY
   ;djnz R6, loop
ret


;LED TRAI PHAI      
CTD:
   ;mov R6, #10
;loop2: 
   mov R7, #32
lap1: 
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap1
   clr P2.2
   nop
   setb P2.2
   call DELAY
   mov R7, #32
lap2: 
   setb P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap2
   clr P2.2
   nop
   setb P2.2
   call DELAY
   ;djnz R6, loop2
ret

      
      
CTE:
;mov R6, #3
;H3:
mov R7, #64
lap21: 
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap21
   clr P2.2
   nop
   setb P2.2
   nop
   mov R7, #8
lap7: 
   setb P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap7
   clr P2.2
   nop
   setb P2.2
   nop
   mov R7, #60
lap8:
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   clr P2.2
   nop
   setb P2.2
   call DELAY
   djnz R7, lap8
   ;djnz R6, H3
ret

CTF:
mov R7, #16
lap9: 
   setb P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap9
   clr P2.2
   nop
   setb P2.2
   call DELAY
   mov R7, #16
lap10:
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap10
   clr P2.2
   nop
   setb P2.2
   call DELAY
ret



;led tat dan
CTG:
mov R7,#64
lap11:
setb P2.0
clr P2.1
nop
setb P2.1
djnz R7, lap11
clr P2.2
nop
setb P2.2
mov R7, #64
lap12:
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   clr P2.2
   nop
   setb P2.2
   call DELAY
   djnz R7, lap12
   call DELAY
ret

CTH:
mov R6, #4
lap17:
setb P2.0
mov R3, #4
lap19:
clr P2.1
nop 
setb P2.1
nop
djnz R3, lap19
clr P2.2
nop
setb P2.2
acall DELAY
mov R7, #12
lap18:
clr P2.0
clr P2.1
nop
setb P2.1
clr P2.2
nop 
setb P2.2
acall DELAY
djnz R7, lap18
djnz R6, lap17
ret

   
CTI:
   mov R6, #2
loop2: 
   mov R7, #32
lapp1: 
   setb P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lapp1
   clr P2.2
   nop
   setb P2.2
   call DELAY
   mov R7, #64
lapp2: 
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lapp2
   clr P2.2
   nop
   setb P2.2
   call DELAY
   djnz R6, loop2

mov R6,#2
loop3:
   mov R7, #32
lap_giua: 
   setb P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap_giua
   clr P2.2
   nop
   setb P2.2
   mov R7, #32
lapp3: 
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lapp3
   clr P2.2
   nop
   setb P2.2
   call DELAY
   mov R7, #32
lapp4: 
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lapp4
   clr P2.2
   nop
   setb P2.2
   call DELAY
   djnz R6, loop3
ret

   
;LED 4 SÁNG CHAN LE
CTJ:	
mov R7, #4
lap15: 
   setb P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap15
   clr P2.2
   nop
   setb P2.2
   call DELAY
   mov R7, #4
lap16:
   clr P2.0
   clr P2.1
   nop
   setb P2.1
   djnz R7, lap16
   clr P2.2
   nop
   setb P2.2
   call DELAY
ret

DELAY:
KT_DELAY1: 
;**clr P3.0
   clr P3.1
   clr P3.4
   cjne R4, #01H, KT_DELAY2
   acall DELAY_THUONG
   sjmp thoatdelay
KT_DELAY2:
   cjne R4, #02H, KT_DELAY3
   acall DELAY_NHANH
   sjmp thoatdelay
KT_DELAY3: 
   cjne R4, #03H, KT_DELAY1
   acall DELAY_CHAM
   sjmp thoatdelay
thoatdelay:
nop
ret

DELAY_NHANH:
;MOV R0, #10
;L11:
MOV R1, #50
L21:
MOV R2, #50
L31:
jc Nhay_KT1
jb P3.4, KT_DELAY1
DJNZ R2, L31
DJNZ R1, L21                 
;DJNZ R0, L11
RET
 
DELAY_CHAM:
MOV R0, #10
L12:
MOV R1, #50
L22:
MOV R2, #50
L32:
jc Nhay_KT1
jb P3.4, KT_DELAY1
DJNZ R2, L32
DJNZ R1, L22                    
DJNZ R0, L12
RET
 
DELAY_THUONG:
;MOV R0, #10
;L13:
MOV R1, #100
L23:
MOV R2, #50
L33:
jc Nhay_KT1
jb P3.4, KT_DELAY1
DJNZ R2, L33
DJNZ R1, L23                    
;DJNZ R0, L13
RET

Nhay_KT1:
ljmp KT1
ret

NGAT:
   jb P3.0, nothing ;N?u nút dã dc ?n thì ko làm gì 
   setb P3.0 ;Ðánh d?u l?n ?n nút d?u tiên
   acall DELAY2
   mov A, R5
   cjne A, #0Ah, tang; n?u chua max thì nh?y t?i hàm tang
   mov A, #01h; reset l?i bi?n d?m
   mov R5, A
   sjmp thoat
  tang:
   inc R5
   sjmp thoat
  nothing:
   sjmp thoat
  thoat:
   ;mov A, R5 ;check th?c t? giá tr? bi?n d?m
   ;mov P1, A
   setb C
reti

NGAT_2:
   jb P3.1, nothing2
   setb P3.1
   acall DELAY2
   cjne R4, #03h, tang2
   mov A, #01h
   mov R4, A
   sjmp thoat2
  tang2:
   inc R4
   sjmp thoat2
  nothing2:
   sjmp thoat2
  thoat2:
   mov A, R4
   mov P1, A
   setb P3.4
reti

DELAY2:
MOV R0, #10
L14:
MOV R1, #100
L24:
MOV R2, #100
L34:
DJNZ R2, L34
DJNZ R1, L24                   
DJNZ R0, L14
RET

END
