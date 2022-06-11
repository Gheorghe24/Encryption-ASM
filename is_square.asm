%include "../include/io.mac"

section .data
    length dd 0
    i dd 1
    copy dd 0

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    mov dword[length], eax
    dec dword[length]
    xor eax, eax
    
parcurgere:
    xor edx, edx
    mov edx, dword[ebx + 4*eax]
    mov dword[copy], edx
    cmp dword[copy], 0
    je reusit
    xor edx, edx
    mov dword[i], 1 ;initializez iteratorul cu 1, de fapt prima cifra impara

verificare:
    add edx, dword[i];adun cu 2 ca sa aflu celelalte numere impare
    add dword[i], 2
    cmp edx, dword[copy] ;verific daca este egal cu numarul, mai mic sau mai mare 
    ;si merg in labelurile specifice
    je reusit
    jg fail
    jl verificare

continuare:
    inc eax
    ;verific daca nu cumva am ajuns la final
    cmp eax, dword[length]
    jle parcurgere
    jg exit

;cazul in care numarul e patrat perfect
reusit:
    mov dword[ecx + 4*eax], 1
    jmp continuare 

;nu este patrat perfect
fail:
    mov dword[ecx + 4*eax], 0
    jmp continuare



    ;; Your code ends here
    
    ;; DO NOT MODIFY
exit:
    popa
    leave
    ret
    ;; DO NOT MODIFY