section .data
    q1:db "enter first string"
    lq1:equ $-q1
    q2:db "enter second string :"
    lq2:equ $-q2
    msg1:db "string equal"
    lmsg1:equ $-msg1
    msg2:db "string not equal"
    lmsg2:equ $-msg2
section .bss
   var resb 255
   bar resb 255

section .code
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
           

           mov ecx,q2
           mov edx,lq2
           mov eax,4
           mov ebx,1
           int 80h

           mov ecx,bar
           mov eax,3
           mov ebx,0
           mov edx,255
           int 80h 
         
         mov esi,var
         mov edi,bar 
         mov ecx,255
         cld 
          repe cmpsb
          jecxz equal

          mov ecx,msg2
          mov edx,lmsg2
          mov eax,4
          mov ebx,1
         int 80h
          jmp exit

 equal: mov ecx,msg1
        mov edx,lmsg1
        mov eax,4
        mov ebx,1
        int 80h
        jmp exit

exit :mov eax,1
      mov ebx,1
      int 80h

 

 

          