section .data 
   q1:db "enter string : "
   l:equ $-q1

section .bss 
   string resb 255
   revstr resb 255

section .code 
  global _start:
   _start: mov ecx,q1
            mov edx,l
            call printstring
   
   mov ecx,revstr
   call readstring
   
   push -1
   mov ecx,0

lp: mov al,[string+ecx]
   cmp al,10
   je lab
   push ax
   inc ecx
   jmp lp

lab:mov ecx,0
lp1: pop ax
     cmp al,-1
     je print
     mov [revstr+ecx],al
     inc ecx
     jmp lp1

print:mov ecx,revstr
      mov edx,255
      call printstring
      jmp exit

exit:mov eax,1
     mov ebx,1
     int 80h

printstring:mov eax,4
            mov ebx,1
            int 80h
            ret 

readstring:mov eax,3
           mov ebx,0
           mov edx,255
           int 80h
           ret