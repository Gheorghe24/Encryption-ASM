%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor eax, eax
    xor ebx, ebx
    mov eax, esi


loop:
    mov ebx, 0
    add bl, byte[esi]
    ;adaug in bl caracterul din plain
    add ebx , edx
    cmp ebx, 90
    jg scadere
loop2:
    mov [edi], ebx
    dec ecx
    inc esi ;parcurg esi si edi
    inc edi
    cmp ecx, 0 ;verific daca am criptat toate elementele
    je exit
    jmp loop
  ; cazul in care trec peste 'Z'  
  ;am nevoie sa mai scad cu 26 si apoi trec in labelul care imi pune in edi
scadere:
sub ebx, 26
jmp loop2
    
    
    
    




    ;; Your code ends here
    
    ;; DO NOT MODIFY
exit:
    popa
    leave
    ret
    
    ;; DO NOT MODIFY
