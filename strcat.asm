section .data
    q1:db "enter string :"
    lq1:equ $-q1
     q2:db "enter second string :"
    lq2:equ $-q2

section .bss  
  var resb 255
  bar resb 255
  res resb 400

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

           mov ecx,0
    lp1:  mov al,[var+ecx]
          cmp al,10
          je lab
          mov [res+ecx],al
          inc ecx
          jmp lp1
    
    lab:mov edx,0
    lp2:mov al,[bar+edx]
        cmp al,10
        je lab2
        mov [res+ecx],al
        inc ecx
        inc edx
        jmp lp2

   lab2:mov byte[res+ecx],10
       jmp print

   print:mov ecx,res
          mov edx,255
          mov eax,4
          mov ebx,1
          int 80h       

          mov eax,1
          mov ebx,1
          int 80h