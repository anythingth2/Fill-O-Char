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
        mov     h,0h
iterateByHeight:
        
        call    startIterateByWidth             ;call inside for loop
        
        mov     dx,0                            ;if h % 2 == 0 
        mov     al,h                            
        cbw
        mov     cx,2
        div     cx
        cmp     dx,0
        je      mod2equal0clear
        jne     mod2notequal0clear
backIf:
        inc     h                               
        mov     ch,hei
        cmp     h,ch

        jl      iterateByHeight
        
        ret
startIterateByWidth:
        mov     w,0h
iterateByWidth:

        mov     dh,wid                            ;dh = row 
        sub     dh,currentPos
        sub     dh,1
        
        mov     dl,h                            ;dl = column             
        call    printO                          ;print 'O'                   
        
        mov     dx,0                            ;if h % 2 == 0 
        mov     al,h                            
        cbw
        mov     cx,2
        div     cx
        cmp     dx,0
        je      mod2equal0
        jne     mod2notequal0

back:
        ; mov     cx,4E20h
        mov     cx,1A00h
        call    sleep                           ;sleep                   

        inc     w
        mov     ch,wid
        cmp     w,ch
        

        jl      iterateByWidth
        
        ret
mod2equal0:
        inc     currentPos
        jmp     back
mod2notequal0:
        dec     currentPos
        jmp     back

mod2equal0clear:
        sub     currentPos,1
        ; dec     currentPos
        jmp     backIf
mod2notequal0clear:
        add     currentPos,1
        ; inc     currentPos
        jmp     backIf


printO: 
        mov     ah,02h  
        mov     bh,0h                        ;move cursor
        int     10h

        mov     ah,0Ah                          ;print O
        mov     al,'O'
        mov     bh,0h
        mov     cx,1h
        int     10h

        ret

sleep:
        nop
        loop    sleep
        ret
        end     main