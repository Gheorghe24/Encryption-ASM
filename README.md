
Task 1:
Am luat 2 cazuri:
in care caracterul criptat trece peste 'Z' sau cand ramane intre A si Z
Ptu cazul de mai sus am un label in care scad cu 26
Apoi pun in edi aceasta suma si verific daca am pus toate elementele

Task2:

2.1 Points-distance
    Mut in 2 registre de marimea "short", primul si urmatorul x, le compar si vad care e mai mare(daca nu sunt egale).
    Scad din cel mai mare pe cel mai mic si asta e distanta.
    In cazul in care sunt egale, fac acelasi lucru doar ca ptu cei 2 y
2.2 Road
salvez in 2 registre elementele din structura(mai intai primul x si apoi cel de-al doilea).Apoi o sa iterez pana termin punctele
Verific ce coordonate sunt egale(x sau y) si apoi scad din cel mai mare pe celalalt.
Aceasta este distanta calculata pe care o mut in vector in functie de pozitia cu care parcurg,asa cum s-a cerut.(salvez in ecx un iterator pana la len)
2.3 is_square
Folosesc mai multe variabile globale, ptu a nu folosi registre in zadar si sa imi usurez munca.
Parcurg elementele din vector 
Ptu cazul cu distanta 0, ii scriu automat in vector ca este patrat(am labelul reusit)
Am folosit faptul ca suma numerelor impare este un patrat perfect si am verificat daca la un moment dat suma este egala cu acel numar.Daca e egala, e numar patrat, altfel nu e.
Codul in c ar fi ceva de genul:
for(sum = 0; i = 1; sum < n; i+=2) {
    sum+=i
    if sum == n
    e patrat perfect
}
    nu e patrat perfect

Taskul 3:
Declar cateva variabile globale: lungimea cheii, lungimea textului,pozitia din cheie si pozitia din text.
Incep parcurgerea textului
Scad din caracterul din cheie, caracterul din text. Verific daca nu cumva prima litera e mai "mare" decat cea de-a 2-a.
Am apoi un label ptu cazul "nefericit", diferenta este mai mica ca 0.
Aici ma folosesc si de proprietatile "tabulei recta" si adun cu 26 ca sa ajung la pozitia la care am nevoie
In "continuare" iterez variabilele in care salvez pozitiile, mut in esi caracterul calculat[adresa la care e nevoie sa pun textul criptat], verific daca nu am ajuns la finalul acelor 2 texte (textul si cheia).
Ptu cheie, o parcurg iarasi de la inceput
Ptu text opresc programul.

Taskul 4:
Incep prin a declara cateva variabile globale:indici cu care parcurg linia, indici cu care parcurg coloana,numarul de linii pe care il parcurg in matrice si numarul de coloane, num(marimea coloanei/matricei)
Am un iterator ptu acele 4 cazuri si un iterator in care salvez pozitia din text
Cele 4 cazuri sunt:
parcurg prima linie
parcurg ultima coloana
parcurg ultima linie
parcurg prima coloana(de jos in sus)
Acestea sunt 4 structuri "for" care se parcurg intr-o directie
Practic, impart matricea in limite sau parti(patrate) si am un label care se repeta pana nu parcurge toate elementele din matrice
Pentru acest task,am facut codul in c care ar arata cam asa
Sper sa se inteleaga mult mai bine, restul este scris foarte detaliat in comentarii
k = 0 ;index ptu inceputul liniei
m = nr de elemente de pe linie/coloana, index ptu finalul liniei
l = 0 index ptu inceputul coloanei
n  e acelasi index doar ptu finalul coloanei
        i - iterator
while (k < m && l < n) {

        for (i = l; i < n; ++i) {
            mov edx, a[k][i] + caracterul din string
        }
        k++;
 
        
        for (i = k; i < m; ++i) {
            mov edx, a[i][n - 1] + caracterul din string 
        }
        n--;
 
        
        if (k < m) {
            for (i = n - 1; i >= l; --i) {
                mov edx, a[m - 1][i] + caracterul din string 
            }
            m--;
        }
 
        if (l < n) {
            for (i = m - 1; i >= k; --i) {
                mov edx, a[i][l] + caracterul din string 
            }
            l++;
        }
    }





# Encryption-ASM
