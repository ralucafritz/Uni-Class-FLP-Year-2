##### Fritz Raluca-Mihaela G243
# <center> FLP </center>
## <center> Laboratorul 4 </center>

Zebra puzzle  
Countdown

### Problema 1 - Zebra puzzle

Avem 5 case cu 5 atribute fiecare. 
+ Numarul
+ Nationalitatea celui care locuieste in casa 
+ Culoare
+ Animalul de companie 
+ Bautura preferata 
+ Tigari

```prolog
casa(Numar,Nationalitate,Culoare,Animal,Bautura,Tigari).
```

Trebuie sa determinam ce nationalitate are posesorul zebrei, stiind un set de constrangeri:
``` markdown
1. Sunt cinci case. 
2. Englezul locuieste in casa rosie. 
3. Spaniolul are un caine. 
4. In casa verde se bea cafea. 
5. Ucraineanul bea ceai. 
6. Casa verde este imediat in dreapta casei bej. 
7. Fumatorul de ”Old Gold” are melci. 
8. In casa galbena se fumeaza ”Kools”. 
9. In casa din mjloc se bea lapte.
10. Norvegianul locuieste in prima casa. 
11. Fumatorul de ”Chesterfields” locuieste langa cel care are o vulpe. 
12. ”Kools” sunt fumate in casa de langa cea in care se tine calul. 
13. Fum˘atorul de ”Lucky Strike” bea suc de portocale. 
14. Japonezul fumeaza ”Parliaments”.
15. Norvegianul locuieste langa casa albastra. 
```
```prolog
la_dreapta(X, Y) :- 
    X is Y + 1. 
la_stanga(X, Y) :- 
    la_dreapta(Y, X).
langa(X, Y) :- 
    la_dreapta(X, Y); 
    la_stanga(X, Y).
solutie(Strada, PosesorZebra) :-
    Strada = [  casa(1,_,_,_,_,_), 
                casa(2,_,_,_,_,_), 
                casa(3,_,_,_,_,_), 
                casa(4,_,_,_,_,_), 
                casa(5,_,_,_,_,_)
            ], 
            member(casa(_,englez,rosie,_,_,_), Strada), 
            member(casa(_,spaniol,_,caine,_,_), Strada), 
            member(casa(_,_,verde,_,cafea,_), Strada), 
            member(casa(_,ucrainean,_,_,ceai,_), Strada) 
            member(casa(A,_,verde,_,_,_), Strada), 
            member(casa(B,_,bej,_,_,_), Strada), 
            la_dreapta(A, B), 
            member(casa(_,_,_,melci,_,'Old Gold'), Strada), 
            member(casa(C,norvegian,_,_,_,_), Strada), 
            member(casa(D,_,albastra,_,_,_), Strada),
            langa(C, D), 
            ...
            member(casa(_,PosesorZebra,_,zebra,_,_),Strada).
            ```
```
Pentru a rula, intrebarea pentru Prolog este:
```prolog
?- solutie(Strada, PosesorZebra). Strada = ...
PosesorZebra = japonez
```

### Problema 2: Countdown

Pornind de la o lista de litere din alfabet
- nu neaparat unice
- sa se gaseasca cel mai lung cuvant din limba engleza
- care se poate forma cu respectivele litere
- nu trebuie neaparat toate literele utilizate
- [b,x,c,y,l,a,r,e,s]

Pentru a include fisierul in programul nostru:
```prolog
:- include('words.pl').

% word/1
word(hello).
word(something).
```

Predicate utile:
```prolog
atom_chars/2 
atom_chars(Word, Letters) are ca efect % obtinerea 
    listei de litere in Letters pentru cuvantul Word 
atom_chars(hello, X). 
X = [h, e, l, l, o].

select/3
select(+Elem, +List, -ListR). 
    elimina prima aparitie a lui Elem in List 
    si intoarce rezultatul in ListR 

select(8, [1,3,8,5,8,9], LR).
LR = [1,3,5,8,9]
```

Solutie:
 Prima solutie ar fi sa generam toate cuvintele posibile, utilizand lista de litere primita.

$L$ - lista de litere $\exists \sigma\in S_{lenght(L)}$ astfel incat $\sigma(L) = w \in KB$.  

Pot exista litere in lista pe care sa nu le folosesc. Inseamna ca pot genera toate permutarile luand o litera din lista, doua litere, ..., n litere din lista.  
  
$Nr = \sum_{i}A_{N}^{i} > \sum_{i}C_{N}^{i}=2^N$ 

Un prim pas ar fi sa verific daca o lista de litere acopera o alta lista de litere. cover/2
cover(
    [b,a,e,s,c],
    [c,a,b,l,e,s]
    ). 
```prolog
[b | [a, e, s, c]]
[c, a, b, l, e, s] => [c, a, l, e, s] 

[a, e, s, c] 
[c, a, l, e, s]

% returneaza True daca 
% prima lista poate acoperi a doua lista 

:- include('words.pl').

cover([], _). 
cover([H | T], L) :- 
    select(H, L, R), 
    cover(T, R).

solution(ListLetters, Word, Score) :-
    word(Word), 
    atom_chars(Word, Letters), 
    length(Letters, Score), 
    cover(Letters, ListLetters).

search_solution(_, 'no solution', 0). 
search_solution(ListLetters, Word, X) :-
    solution(ListLetters, Word, X).
search_solution(ListLetters, Word, X) :-
    Y is X - 1,
    search_solution(ListLetters, Word, Y).

topsolution(ListLetters, Word) :-
    length(ListLetters, Score), 
    search_solution(ListLetters, Word, Score).

?- topsolution([y,c,a,l,b,e,o,s,x], X).

```