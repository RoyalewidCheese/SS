section .data
    q1:db "enter string :"
    lq1:equ $-q1

section .bss  
  var resb 255

section .data
   global _start:
   _start:mov ecx,q1
          mov edx,lq1
          mov eax,4
          mov ebx,1
          int 80h

            mov ecx,var
          mov eax,3
           mov ebx,0
           mov edx,255
           int 80h 

           mov ecx,0
    toggle:mov al,[var+ecx]
           cmp al,10
           je print
           cmp al,122
           jge store
           cmp al,64
           jle store
           xor al,32

 store: mov [var+ecx],al
        inc ecx
        jmp toggle

print: mov ecx,var
          mov edx,255
          mov eax,4
          mov ebx,1
          int 80h

          mov eax,1
          mov ebx,1
          int 80h
