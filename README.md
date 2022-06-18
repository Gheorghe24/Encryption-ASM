# Encryption-ASM

Simple Cipher
-------------
We took 2 cases:

in which the encrypted character passes over 'Z' or when it remains between A and Z
In the case above, I have a label that drops by 26
Then I edit this amount and check if I put all the elements

Points
-------

2.1  Points-distance

I move into 2 registers of size "short", the first and the next x, I compare them and see which one is bigger (if they are not equal).
I go from the biggest to the smallest and that's the distance.
If they are equal, they do the same thing only for the 2 y
    
2.2 Road

I save the elements in the structure in 2 registers (first the first x and then the second). Then I will iterate until I finish the points

I check which coordinates are equal (x or y) and then subtract the largest from the other.
This is the calculated distance that I move in the vector according to the position with which I travel, as requested.

2.3 is_square:

I use several global variables, so as not to use registers in vain and to make my work easier.
Scroll through the elements in the vector
In the case of distance 0, I automatically write in the vector that it is square (I have the successful label)

I used the fact that the sum of odd numbers is a perfect square and I checked if at some point the sum is equal to that number. If it is equal, it is a square number, otherwise it is not.

The code in C will be:
for(sum = 0; i = 1; sum < n; i+=2) {
    sum+=i
    if sum == n
    //it is square
}
    //it isn't

Beaufort Encryption
-------------------
I declare several global variables: key length, text length, key position, and text position.
I start scrolling through the text

Subtract from the character in the key the character in the text. I check to see if the first letter is "bigger" than the second.
I then have a label for the "unhappy" case, the difference is less than 0.
Here I also use the properties of the "straight board" and add 26 to get to the position I need

In "next" I iterate the variables in which I save the positions, I move the calculated character [the address where I need to put the encrypted text], I check if I haven't reached the end of those 2 texts (the text and the key).
For the key, I go through it again from the beginning
Ptu text stop the program.

Spiral Encryption
-----------------
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






