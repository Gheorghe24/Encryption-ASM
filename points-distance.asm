%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor edx, edx
    mov cx, [ebx + point.x]
    mov dx, [ebx + point_size + point.x]
    cmp cx,dx
    jg printx2
    jl printx1
    xor ecx, ecx
    xor edx, edx
    mov cx, [ebx + point.y]
    mov dx, [ebx + point_size + point.y]
    cmp cx,dx
    jg printx2
    jl printx1
;scad din cel mai mare pe cel mai mic,nu conteaza daca e x sau y
; si mut valoarea in eax
printx2:
    sub cx, dx
    mov [eax], cx
    jmp exit
printx1:
    sub dx, cx
    mov [eax], dx
    jmp exit




    ;; Your code ends here
    
    ;; DO NOT MODIFY
exit:
    popa
    leave
    ret

    ;; DO NOT MODIFY