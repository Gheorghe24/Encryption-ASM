%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .data
    length dd 0

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    mov dword[length], ecx
    dec dword[length]
    xor ecx, ecx
parcurgere:
    xor edx, edx
    ;salvez x-ul curent si urmator din vectorul de structura
    mov dx, [eax + point_size * ecx + point.x]
    inc ecx
    cmp dx, [eax + point_size * ecx + point.x]
    jl printx1
    je equal_x
    sub dx, [eax + point_size * ecx + point.x]
    dec ecx
    mov dword[ebx + ecx*4], edx
    jmp final
final:
    inc ecx
    cmp ecx, dword[length]
    ;verific daca am ajuns la final
    je exit
    jmp parcurgere

equal_x:
    xor edx, edx
    dec ecx
    ;x-urile sunt egale,deci salvez y si scad din cel mai mare pe cel mai mic
    mov dx, [eax + point_size * ecx + point.y]
    inc ecx
    cmp dx, [eax + point_size * ecx + point.y]
    jl printy1
    sub dx, [eax + point_size * ecx + point.y]
    dec ecx
    ;mut in ebx distanta calculata
    mov dword[ebx + ecx*4], edx
    jmp final

printx1:
    xor edx, edx
    ; aici stiu ca y sunt egali si x_curent mai mic decat urmatorul
    mov dx, [eax + point_size * ecx + point.x]
    dec ecx
    sub dx, [eax + point_size * ecx + point.x]
    ;scad din cel mai mare
    mov dword[ebx + ecx*4], edx
    jmp final

printy1:
    xor edx, edx
    mov dx, [eax + point_size * ecx + point.y]
    dec ecx
    sub dx, [eax + point_size * ecx + point.y]
    mov dword[ebx + ecx*4], edx
    jmp final



exit:
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    ;; DO NOT MODIFY