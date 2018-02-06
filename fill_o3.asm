        .model  tiny

        .data
wid     db      19h                             ;window width
hei     db      50h                             ;window height
h       db      ?                               ;iterate width
w       db      ?                               ;iterate height
currentPos     db      ?                        ;store current cursor's position
        .code
        org     0100h

main:   
        
        
startIterateByHeight:                           
        mov     h,0h                            ;init iterate variable for outside loop
iterateByHeight:
        
        call    startIterateByWidth             ;call inside for loop
        
        ;if h % 2 == 0
        mov     dx,0                            ;clear dividend  
        mov     al,h                            ;load h to ax                 
        cbw
        mov     cx,2                            ;let 2 is divisor
        div     cx                              ;divide
        cmp     dx,0                            ;compare dividend is 0
        je      mod2equal0clear                 ;clear extra character
        jne     mod2notequal0clear              ;clear extra character
backIf:
        ;compare h,hei
        inc     h                               ;increment h           
        mov     ch,hei
        cmp     h,ch

        jl      iterateByHeight                 ;start new loop until h >= hei
        
        ret
startIterateByWidth:
        mov     w,0h
iterateByWidth:
        ;move cursor to dh,dl
        mov     dh,wid                           ;dh = row 
        sub     dh,currentPos                           
        sub     dh,1
        
        mov     dl,h                            ;dl = column             
        call    printO                          ;print 'O'                   
        
        ;if h % 2 == 0 
        mov     dx,0                            ;clear dividend 
        mov     al,h                            
        cbw                                     ;load h to ax
        mov     cx,2                            ;let 2 is divisor
        div     cx                              ;divide
        cmp     dx,0                            ;compare dividend is 0
        je      mod2equal0                      ;increment currentPos 
        jne     mod2notequal0                   ;decrement currentPos

back:

        mov     cx,1A00h                        ;set number of loop 
        call    sleep                           ;sleep                   

        inc     w
        mov     ch,wid
        cmp     w,ch
        

        jl      iterateByWidth                  ;set number of loop 
        
        ret
mod2equal0:
        ;increment currentPos
        inc     currentPos
        jmp     back
mod2notequal0:
        ;decrement currentPos
        dec     currentPos
        jmp     back

mod2equal0clear:
        ;decrement currentPos
        sub     currentPos,1
        jmp     backIf
mod2notequal0clear:
        ;increment currentPos
        add     currentPos,1

        jmp     backIf


printO: 
        mov     ah,02h  
        mov     bh,0h                           ;move cursor
        int     10h                             ;call move cursor interrupt

        mov     ah,0Ah                          ;print O
        mov     al,'O'
        mov     bh,0h
        mov     cx,1h
        int     10h                             ;call printO interrupt

        ret

sleep:
        nop                                     ;do nothing
        loop    sleep                           ;loop until cx is zero
        ret
        end     main