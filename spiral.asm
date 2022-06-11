%include "../include/io.mac"

section .data
    rowindex dd 0
    columnindex dd 0
    numbercol dd 0
    numberrow dd 0
    iter dd 0
    iter_while dd 0
    num dd 0
section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    mov dword[numbercol], eax
    mov dword[numberrow], eax
    mov dword[num], eax
    xor eax, eax
    mov dword[rowindex],0
    mov dword [columnindex],0
    mov dword [iter_while],0
    
parcurgere:
    mov eax,dword[numberrow]
    cmp dword[rowindex],eax ;k<m
    jge exit
    mov eax,dword[numbercol] ;l<n
    cmp dword[columnindex],eax ;
    jge exit

    ;comparatii prin care vad daca am parcurs toate pozitiile din matrice
    ;incepe prima parcurgere pe linie
    ; initializez indexul cu indexul cu indexul de coloane

    push ebx
    mov ebx,dword[columnindex]
    mov dword[iter], ebx
    pop ebx
first_row:
    mov eax,dword[numbercol]
    cmp dword[iter],eax
    jge next

    ;ma intreb de fiecare data daca nu am parcurs toata linia
    ;pun in stiva adresa de la primul element din matrice
    push ecx
    mov eax, dword[iter_while]
    mov ch,byte[ebx + eax]
    mov [edx],ch ;adaug in ebx caracterul din text corespunzator
    push edx 
    ;pun pe stiva edx ptu ca voi inmulti ulterior si am nevoie de edx

    mov eax,dword[rowindex]
    mov ecx, dword[num] 
    ;ptu a ajunge la pozitia din matrice ma folosesc de formula:
    ;num*iterator pe linie + iterator din label 
    mul ecx
    add eax, dword[iter] ;k*num + i
    pop edx
    pop ecx
    push ebx

    ;adaug elementul corespunzator din matrice
    xor ebx,ebx
    mov bl,byte[ecx + eax*4]
    add [edx],ebx
    inc edx
    ;ma misc mai departe in edx[stringul criptat]
    pop ebx

    ;incrementez iteratorii
    inc dword[iter]
    inc dword[iter_while]
    jmp first_row

next:
;maresc k
    inc dword[rowindex] ;k
    ; fix ca in prima parcurgere,egalez iter cu k 
    mov eax,dword[rowindex]
    mov dword[iter], eax ;incepand de la k

last_column:
    mov eax, dword[numberrow]
    cmp dword[iter],eax
    jge next2

    ;ma intreb daca nu am parcurs toate elementele de pe coloana
    push ecx
    push edx
    mov ecx, dword[iter]
    mov eax, dword[num]
    
    mul ecx ;fac iarasi formula ca sa ajung la elementul din matrice
    add eax,dword[numbercol]
    dec eax; adaug n-1,numarul de indexi pe linii ramasi
    mov ecx, dword[iter_while]
    push eax

   xor eax, eax
    mov al,byte[ebx + ecx]
    xor ecx, ecx
    mov cl,al
    pop eax
    pop edx
    ;pun in string caracterul din text
    mov byte[edx],cl

    pop ecx
    push ebx
    xor ebx,ebx
    mov bl,byte[ecx + eax*4]
    add [edx],bl
    ;adaug numarul din matrice, aflat pe pozitia 
    inc edx
    ;ma mut pe urmatoarea pozitie in stringul criptat
    pop ebx

    inc dword[iter]
    inc dword[iter_while]
    jmp last_column

next2:
    dec dword[numbercol];n
    mov eax, dword[numberrow] ;m
    cmp eax, dword[rowindex]
    jle next3
    ; deja am in eax n

    mov eax, dword[numbercol]
    mov dword[iter], eax
    dec dword[iter]
     ;incepand de la n -1
    dec dword[numberrow] ;m

last_row:
    mov eax, dword[columnindex] ;l
    cmp dword[iter],eax
    jl next3
    push ecx
    push edx
    mov eax,dword[numberrow] ;m-1
    mov ecx, dword[num] ;n
    mul ecx
    add eax, dword[iter]
    push eax
    mov eax, dword[iter_while]
    mov ch, byte[ebx + eax] ;valoarea din string
    pop eax
    pop edx
    mov [edx],ch
    pop ecx
    push ebx
    mov bh, byte[ecx + eax*4]
    add [edx], bh
    pop ebx
    inc dword[iter_while]
    inc edx
    dec dword[iter]
    jmp last_row

next3:
    mov eax, dword[columnindex] ;l
    cmp eax, dword[numberrow] ;n
    jge exit
    inc dword[columnindex] ;marim l
    mov eax, dword[numberrow]; m
    mov dword[iter], eax
    dec dword[iter] ; i = m - 1

first_column:
    mov eax, dword[rowindex] ;k
    cmp dword[iter],eax
    jl parcurgere
    push ecx
    push edx
    mov eax, dword[iter]
    mov ecx, dword[num] ;n
    mul ecx
    add eax, dword[columnindex]
    dec eax 
    ;mai sus am crescut l si acum am nevoie de valoarea precedenta

    push eax 
    ;pun pe stiva rezultatul inmultirii
    mov eax, dword[iter_while]
    mov ch, byte[ebx + eax] ;valoarea din string
    pop eax
    pop edx
    mov [edx],ch
    pop ecx 
    ;scot din stiva adresa de inceput a matricii
    
    push ebx
    mov bh, byte[ecx + eax*4]
    add [edx], bh
    pop ebx
    inc dword[iter_while]
    inc edx
    dec dword[iter]
    jmp first_column    
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
exit:
    popa
    leave
    ret
    ;; DO NOT MODIFY
