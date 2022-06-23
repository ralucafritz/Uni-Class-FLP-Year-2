# <center> Prolog </center>
## <center> Laboratorul 2 </center>

#### Recapitulare Laborator 1
```prolog
Sintaxa Prolog:
- constante 
  - numerice
  - atomi
- variabile

atomii sunt identificatori 
- care incep cu litera mica
- intre apostroafe

variabile
- incep cu litera mare
- incepu cu _

Exemple: 
- bigger/2, is_bigger/2
- female/1, male/1, parent/2
```

#### Laboratorul 2 -> Recursivitate si Liste


---


### <center> Recursivitate </center>

```prolog
parent/2

ancestor_of/2
ancestor_of(X,Y) :- parent(X,Y).                    -> caz de oprire
ancestor_of(X,Y) :- parent(X,Z), acestor_of(Z,Y).   -> apelul recursiv
```

### Exercitiul 1

Sa se defineasca predicatul fib/2, care primeste un N si returneaza al N-lea termen al sirului lui Fibonacci

F<sub> 0 </sub> = 1  
F<sub> 1 </sub> = 1
F<sub> n</sub> = F<sub> n-1 </sub> + F<sub> n-2 </sub>
```prolog
% fib(+N, -Res)
fib(0,1).
fib(1,1).
fib(N,Res) :- 
        N1 is N-1,
        N2 is N-2, 
        fib(N1, Res1), 
        fib(N2, Res2).
        Res is Res1 + Res2.
```

`% fb(N-1,Res1) + fib(N-2,Res2)` -> [NU AM VOIE SA FAC UN APEL IN FORMA ACEASTA]()

![](/L02/243_2_2.png)

`Tema Bonus`: implementarea eficienta cu memorizare a sirului de fib

### Predicatele write/1, nl/0

`write/1` = scrie argumentul la stdout
`nl/0` = afiseaza o line noua la stdout

`cls :- write('\33\[2J').` = comandade clear screen


#### Exercitiul 2

Sa se defineasca predicatul square/2, care primeste un N si un caracter de exemplu square(3, `*`) -> va afisa:

    * * *
    * * *
    * * *

```prolog
% squareAux(+Dim, +IndexLinie, +IndexColoana, +Ch).

squareAux(N, N, N, Ch) :-
	write(Ch).

squareAux(N, I, N, Ch) :-
	write(Ch),
	nl,
	I1 is I + 1,
	squareAux(N, I1, 1, Ch).

squareAux(N, I, J, Ch) :-
	write(Ch),
	J1 is J + 1,
	squareAux(N, I, J1, Ch).

square(N, Ch) :- 
	squareAux(N, 1, 1, Ch).

```

---

### <center> Liste </center>

`[ ]` = operatorul pentru liste 

    X = [elephant, dog, horse, donkey, monkey, whale]
    X = [dog, [], 1, f(Y)]
- o colectie de elemente de orice tip

```haskell
[Head | Tail]
(x: cs)
[Head | Tail] = [1,2,3,4,5]
Head = 1
Tail = [2,3,4,5]
```

- al doilea element dintr-o lista:
```prolog
(x:y:xs)
[_, X | _] = [dog, monkey, elephant] => X = monkey
```

### Predicate pe liste
``` prolog
element_of/2

element_of(+Elem, +list).
element_of(Elem, [Elem | _]).
element_of(Elem, [ _ | Tail)]) :- element_of(Elem, Tail).

%member/2 -> acelasi outcome ca element_of

% concat_lists/3
% concat_lists(+L1,+L2,_LR)
% concat_lists([1,2,3], [4,5,6], LR)
% LR = [1,2,3,4,5,6]
```
![](/L02/243_2_4.png)

```prolog
concat_lists([], L, L).
concat_lists([H1 | T1], L2, [H1 | T3]) :- concat_lists(T1, L2, T3).
```
Functii folositoare:
```prolog
length/2  -> lungimea listei
member/2  -> true daca primul argument se afla intr-o lista data in al doilea argument
append/3  -> identic concat_lists/3
last/2    -> true daca al doilea argument este identic cu ulitmul element al listei date ca prim argument
reverse/2 -> lista din al doilea argument este lista data ca prim argument, dar inversata 
```

#### Exercitiul 3
A) `all_a` - verificam daca o lista e formata doar din `a`
``` prolog

% all_a / 1
% all_a(+List) - returneaza true
% daca toate elementele din lista sunt a

all_a([a]).
all_a([a | T]) :- all_a(T).
```

test:
```prolog
?- all_a([a,a,a,a]).
true 

?- all_a([a,a,A,a]).
A = a ;
false.
```

B) `trans_a_b` 
```prolog
% trans_a_b / 2
% trans_a_b(ListDe_a, -ListDe_b).

trans_a_b([a], [b]).
trans_a_b([a | TI], [b | T0]) :- trans_a_b(T1,T0).
```

test:
```prolog
?- trans_a_b([a,a,a],L).
L = [b, b, b] ;
false.

?- trans_a_b([a,a,a],[b]).
false.

?- trans_a_b(L,[b,b]).
L = [a, a] ;
false.
```

#### Exercitiul 4
A) `scalarMult / 3` rezultatul inmultirii cu scalari al celui de-al doilea argument cu primul
```prolog
% scalarMult / 3
% scalarMult (=Scalar, +List, - List).
% scalarMult(3, [1,2,3], List).
% List = [3,6,9]

scalarMult(_, [], []).

scalarMult(_, [], []).
scalarMult(X, [H1 | T1], [H2 | T2]) :-
    H2 is H1 * X,
    scalarMult(X, T1, T2).
```
test:
```prolog
?- scalarMult(3, [1,2,3], Result)
Result = [3,6,9]

?- scalarMult(3,[2,7,4],Result).
Result = [6, 21, 12] 
```

B) `dot / 3`
``` prolog
% dot / 3 
% dot(+L1, +l2, -Res).
% suma produsului pe componente

dot([], [], 0).
dot( [H1 | T1], [H2, T2], Res) :-
        dot(T1, T2, Res1),
        Res is Res1 + H1 * H2.
```
test:
```prolog
?- dot([2,5,6],[3,4,1],Result).
Result = 32.
```

![](/L02/243_2_5.png)

#### Exercitiul 5
`max / 2` cauta elementul maxim intr-o lista
```prolog
% max / 2
% max dintr-o lista
% max(+List, -Max).

max([X], X).
max([H | T], Max) :-
        max(T, TailMax),
        H > TailMax,
        Max = H.
max([H | T], Max) :-
        max(T, TailMax),
        H =< TailMax,
        Max = TailMax.
```
test:
```prolog
?- max([4,2,6,8,1],Result).
Result = 8 .
```

#### Exercitiul 6
`palindrome / 1` verifica daca e palindrom sau nu 
`reverse` = predicat din PROLOG
```prolog
?- reverse([a,b,c,b,a], [a,b,c,b,a])
true
```
```prolog
% palindrome / 1 

palindrome(X) :- reverse(X, X).

% palindrome_of care foloseste reverse_of

% reverse_of(+ListInput, +ListAux, -ListResult).

reverse_of([], L, L).
reverse_of([H1 | T1], LAux, LR) :-
	reverse_of(T1, [H1 | LAux], LR).

reverse_of(List, ListResult) :-
	reverse_of(List, [], ListResult).

palindrome_of(X) :-
    reverse_of(X, X).

```
test:
```prolog
?- palindrome([a,b,c,b,a]).
true.
?- palindrome_of([a,b,c,b,a]).
true.
```
![](/243_2_5.png)

#### Exercitiul 7 
`remove_duplicates / 2` returneaza lista cu o singura aparitie pt fiecare element
```prolog
% remove_duplicates / 2

remove_duplicates([],[]).
remove_duplicates([H | TI], LR) :-
        member(H, TI),
        remove_duplicates(TI, LR).
remove_duplicates([H | TI], [H | TR]) :-
        not(member(H, TI)),
        remove_duplicates(TI, TR).
```
test:
```prolog
?- remove_duplicates([a,b,a,c,d,d], List).
List = [b, a, c, d] .
```

#### Exercitiul 8 

`replace / 4` inlocuieste => toate aparitiile elementului dat, ca prim argument, in lista, data ca al doilea al doilea argument, sunt inlocuite cu al treilea argument 
```prolog
replace([],_,_,[]).
replace([H | T], X, Y, [H2 | LR]) :-
    replace(T, X, Y, LR),
    not(X is H),
    H2 = H.
replace([H | T], X, Y, [H2 | LR]) :-
    replace(T, X, Y, LR),
    X is H,
    H2 = Y.
```

test:
```prolog
?- replace([1,2,3,4,3,5,6,3],3,x,List).
List = [1, 2, x, 4, x, 5, 6, x] 
```
