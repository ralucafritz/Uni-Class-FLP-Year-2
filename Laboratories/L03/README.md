##### Fritz Raluca-Mihaela G243
# <center> FLP </center>
## <center> Laboratorul 3 </center>


Laboratorul 1: 
- sintaxa limbajului Prolog 
- ce este un program in Prolog 
- exemple
Laboratorul 2: 
- recursivitate 
- liste 
concat_liste/3, reverse/3

Laboratorul 3: Cum raspunde Prolog intrebarilor?

---

### <center> Algoritm de unificare </center>

`Substitutia` este o functie partiala de la multimea variabilelor la multimea termenilor unui limbaj

sigma: `Var` -> `Trm(L)`

Spunem ca 2 termeni `t1` si `t2` unifica daca exista o substitutie theta astfel incat `theta(t1) = theta(t2)`.

##### Pasii algoritmului de unificare:
- scoate
- descompune
- rezolva
- final

##### Componente:
- operatie
- multimea solutiei (`S`)
- lista de rezolvat (`R`)

`x` = variabila
`t` = termen

`T[x/t]` sau `T[t/x]` sau `T[x <- t]` in termenul `T`, toate aparitiile lui `x` sunt inlocuite cu `t`

| OPERATIE | MULTIMEA SOLUTIEI | LISTA DE REZOLVAT |
|----------|-------------------|-------------------|
|          |  S                |  R                |
|  Initial	| multimea vida  |  t1=t1', t2=t2', ... tn=tn'                          |
|  SCOATE	| S 		 |  R', t = t                                           |        
|               | S  		 |  R'                                                  |        
|  DESCOMPUNE	| S              |  R', f(t1, t2, ..., tn) = f(t1', t2', ..., tn')      |        
|               | S		 |  R', t1=t1', t2=t2', ..., tn=tn'                     |        
|  REZOLVA	| S		 |  R', x=t sau t=x astfel incat x nu apare in t        |        
|		| x=t, S[t/x]	 |  R'[t/x]                                             |        
|  Final	| S 		 |  multimea vida                                       |        

S este unificatorul pentru termenii dati initial in multimea (lista) de rezolvat  

Algoritmul se termina cu succes daca in lista de rezolvat avem multimea vida, iar `S` este unificatorul.  

Algoritmul se termina cu `ESEC` daca:  
- incerc sa fac o unificare intre 2 simboluri de functii diferite
```markdown
        f(t1, t2,..., tn) = g(t1', t2',...., tk')
        ex: 30 + 2 = 2 ** 5
```

Exemplu:
``` prolog
constantele sunt simboluri de functii de aritate 0 

a = constanta
b = constanta

x = variabila
y = variabila

f = simbol de functie de aritate 1

a = f(x) ESEC
Y = f(x) OK
a = b    ESEC
X = Y    OK
g(X) = h(Y) ESEC
```
- daca ajung la o egalitate de forma `x = t` sau `t = x`, dar `x` apare in `t`

Exercitii pentru unificare:

```prolog
simboluri de variabile: x, y, z, u, v
constante: a, b, c
functii de aritate 1: h, g, (_)^(-1)
functii de aritate 2: f, +, *
functii de aritate 3: p
```

##### Exercitiul 1:
Sa se gaseasca un unificator pentru termenii
 - p(a, x, h(g(y))) 
 - p(z, h(z), h(u)).

Solutie:
| Mutlimea solutiei | Lista de rezolva | Operatia de aplicat |
|-------------------|------------------|---------------------|
|  multimea vida           |  p(a, x, h(g(y))) = p(z, h(z), h(u))	      |  DESCOMPUNERE
|  multimea vida           |  a=z, x=h(z), h(g(y))=h(u)                       |  DESCOMPUNERE
|  multimea vida           |  a=z, x=h(z), g(y) = u                           |  REZOLVA
|  z=a                     |  x=h(a), g(y)=u                                  |  REZOLVA
|  z=a, x=h(a)             |  g(y)=u                                          |  REZOLVA
|  z=a, x=h(a), u=g(y)     |  multimea vida                                   |  FINAL
`Am gasit unificatorul {z/a, x/h(a), u/g((y))}.`
Test in prolog:
```prolog
?- p(a,X,h(g(Y)))=p(Z,h(Z),h(U)).
X = h(a),
Z = a,
U = g(Y).

% unify_with_occurs_check -> predicat de unificare pentru verificare

?- unify_with_occurs_check(p(a,X,h(g(Y))),p(Z,h(Z),h(U))).
X = h(a),
Z = a,
U = g(Y).
```

##### Exercitiul 2:
Sa se gaseasca un unificator pentru termenii f(h(a), g(x)) si f(y, y).

Solutie:
| Mutlimea solutiei | Lista de rezolva | Operatia de aplicat |
|------------------------|------------------------|------------------------|
|  multimea vida          | f(h(a), g(x)) = f(y, y)        | DESCOMPUNERE
|  multimea vida          | h(a)=y, g(x)=y                 | REZOLVA
|  y=h(a)                 | g(x) = h(a)                    | ESEC

`nu exista un unificator pentru termenii f(h(a), g(x)) si f(y, y).`
Test:
```prolog
?- unify_with_occurs_check(f(h(a),g(x)),f(y,y)).
false.
```

##### Exercitiul 3:
Sa se gaseasca un unificator pentru termenii p(a, x, g(x)) = p(a, y, y).

| Mutlimea solutiei | Lista de rezolva | Operatia de aplicat |
|-------------------|------------------|---------------------|
|  multimea vida         |  p(a, x, g(x)) = p(a, y, y)                   |  DESCOMPUNERE
|  multimea vida         |  a=a, x=y, g(x)=y                             |  SCOATE
|  multimea vida         |  x=y, g(x)=y                                  |  REZOLVA
|  x=y                   |  g(y)=y                                       |  ESEC

`nu exista un unificator pentru termenii p(a, x, g(x)) si p(a, y, y).`
Test:
```prolog
?- unify_with_occurs_check(p(a, x, g(x)), p(a, y, y)).
false.
```

##### Exercitiul 4:
Sa se gaseasca un unificator pentru termenii x + (y * y) = (y * y) + z.
+(x + y * y) = +(y * y + z)
| Mutlimea solutiei | Lista de rezolva | Operatia de aplicat |
|-------------------|------------------|---------------------|
|  multimea vida          |   x + (y * y) = (y * y) + z                    |   DESCOMPUNERE
|  multimea vida          |   x=y*y, y*y=z                                 |   REZOLVA
|  x=y*y                  |   z=x                                          |   REZOLVA
|  x=y*y, z=x             |   multime vida                                 |   FINAL
`Am gasit unificatorul {X=Y*Y, Z=X}.`
Test:
```prolog
?- unify_with_occurs_check(X+Y*Y,Y*Y+Z).
X = Z, Z = Y*Y.
```

#### Tema:
- [x] `(x*y)*z = u*(u)^(-1)`

| Mutlimea solutiei      | Lista de rezolva                             | Operatia de aplicat |
|-------------------     |------------------                            |---------------------|
|  multimea vida         |  (x*y)*z = u*(u)^(-1)                        |    DESCOMPUNERE
|  multimea vida         |  x*y=u, z=(u)^(-1)                           |    REZOLVA
|  u=x*y                 |  z=(x*y)^(-1)                                |    REZOLVA
|  u=x*y, z=(x*y)^(-1)   |  multime vida                                |    FINAL

`Am gasit unificatorul {U=X*Y, Z=(X*Y)^(-1)}`

Test:
```prolog
?- unify_with_occurs_check((X*Y)*Z,U*(U)^(-1)).
Z =  (X*Y)^ -1,
U = X*Y.
```

---

### Exercitii din laborator:

#### 1. Crosswords

```prolog
word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).
word(enhance,e,n,h,a,n,c,e).

crossword(V1, V2, V3, H1, H2, H3) :- 
        word(V1, _, A, _, B, _, C, _),
        word(V2, _, D, _, E, _, F, _),
        word(V3, _, G, _, H, _, I, _),
        word(H1, _, A, _, D, _, G, _),
        word(H2, _, B, _, E, _, H, _),
        word(H3, _, C, _, F, _, I, _).

```
Test:
```prolog
?- crossword(V1, V2, V3, H1, H2, H3).
V1 = abalone,
V2 = anagram,
V3 = connect,
H1 = abandon,
H2 = elegant,
H3 = enhance ; --- press space
V1 = abandon,
V2 = elegant,
V3 = enhance,
H1 = abalone,
H2 = anagram,
H3 = connect ; --- press space
false.
```



#### 2. Baza de date

```prolog
born(jan, date(20,3,1977)).
born(jeroen, date(2,2,1992)).
born(joris, date(17,3,1995)).
born(jelle, date(1,1,2004)).
born(joan, date(24,12,0)).
born(joop, date(30,4,1989)).
born(jannecke, date(17,3,1993)).
born(jaap, date(16,11,1995)).

```
**a.** year/2
- Exemplu:

```prolog
?- year(1995,Person).
Person = joris ;
Person = jaap
```
- Rezolvare:
```prolog
year(Year, Person) :- 
        born(Person, date(_,_,Year)).
```
- Test:
```prolog
?- year(1995, Person).
Person = joris ;
Person = jaap.
```

**b.** before/2
- Rezolvare:
```prolog
before(date(D1, M1, Y1), date(D2, M2, Y2)) :-
        Y1 < Y2;
        Y1 =:= Y2, M1 < M2;
        Y1 =:= Y2, M1 =:= M2, D1 < D2.
```
- Test:
```prolog
?- before(date(31,1,1990), date(7,7,1990)).
true.

?- before(date(20, 4, 1998), date(7, 10, 1992)).
false.

?- before(date(20, 4, 1998), date(7, 10, 1998)).
true.

?- before(date(20, 4, 1998), date(7, 4, 1998)).
false.
```
**c.** older/2
- Rezolvare:
```prolog

older(X, Y) :-
         born(X, DateX),
         born(Y, DateY),
         before(DateX, DateY).
```
- Test:
```prolog
?- older(jannecke, X).
X = joris ;
X = jelle ;
X = jaap ;
false.

?- older(jan, X).
X = jeroen ;
X = joris ;
X = jelle ;
X = joop ;
X = jannecke ;
X = jaap ;
false.

?- older(joan, X).
X = jan ;
X = jeroen ;
X = joris ;
X = jelle ;
X = joop ;
X = jannecke ;
X = jaap ;
false.

```

#### 3. Labirint - connect/2
```prolog
connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

% path/2
% path(+Nod1, +Nod2) - true daca exista un drum de la `No1` la `Nod2`

path(X, Y) :- connected(X, Y).
path(X, Y) :- 
        connected(X, Z),
        path(Z, Y).
```
- Test:
```prolog    
?- path(5,10).
true.

?- path(1,X).
X = 2 ;
false.

?- path(X,13).
X = 12 ;
X = 5 ;
X = 15 ;
X = 6 ;
X = 11 ;
X = 16 ;
false.

?- path(6,13).
true 

```

#### TEMA: 
- [x] path cu drumuri ciclice
```prolog 
connectedLoop(1,2).
connectedLoop(2,1).
connectedLoop(1,3).
connectedLoop(3,4).

pathLoop(X, Y, V) :-
    connectedLoop(X,Y);
    not(member(X,V)),
    connectedLoop(X,Z),
    pathLoop(Z, Y, [X | V]).
```

#### 4. Numere naturale
```prolog
0 : []
1 : [x]
2 : [x,x]
3 : [x,x,x]
4 : [x,x,x,x]
```

**a.** successor/2
```prolog
succesor(R, [x|R]).
```
- Test:
```prolog  
?- succesor([x,x], Result).
Result = [x, x, x].

?- succesor([], Result).
Result = [x].
```
**b.** plus/3
```prolog  
plus_v1([], L2, L2).
plus_v1([H | T], L2, Res) :-
    plus_v1(T,L2,Res1),
    Res = [H | Res1].

plus(R1, R2, R) :-
    append(R1, R2, R).
```
- Test:

```prolog  
?- plus([x,x], [x,x,x], Result).
Result = [x, x, x, x, x].

?- plus([x,x], [x,x,x,x], Result).
Result = [x, x, x, x, x, x].

```
**c.** times/3
```prolog  
times([],_,[]).
times([x | T], L2, LR) :-
        times(T, L2, RTail),
        plus(L2, RTail, LR).
```
- Test:
```prolog  
?- times([x,x], [x,x,x], Result).
Result = [x, x, x, x, x, x].

?- times([x,x], [x,x,x,x], Result).
Result = [x, x, x, x, x, x, x, x].

?- times([x,x,x,x],[x,x,x,x,x,x],Result).
Result = [x, x, x, x, x, x, x, x, x|...].

?- times([x,x,x,x],[x,x,x,x,x,x],Result), length(Result,LR).
Result = [x, x, x, x, x, x, x, x, x|...],
LR = 24.
```

#### 5. Al n-lea element dintr-o lista

```prolog
% element_at/3
% element_at(+List, +Index, -ElemDePePozIndex).

element_at([H | _], 1, H).
element_at([_ | T], Index, Result) :-
    Index1 is Index - 1,
    element_at(T, Index1, Result).
```
- Test:
```prolog  
?- element_at([asd1,asd2,asd3],4,R).
false.

?- element_at([asd1,asd2,asd3],3,R).
R = asd3.

```

#### 6. Animale
```prolog
animal(alligator). 
animal(tortue).
animal(caribou).
animal(ours).
animal(cheval).
animal(vache).
animal(lapin)

% mutant/1

mutant(X) :-
   animal(Y),
   animal(Z),
   Y \= Z,
   name(Y, Ny),
   name(Z, Nz),
   append(Y1, Y2, Ny),
   append(Y2, _, Nz),
   Y2 \= [],
   append(Y1,Nz, Nx),
   name(X, Nx).

% sufix din Ny == prefix din Nz
% pentru fiecare lista, impart lista in prefix si sufix
% exista Y1 si Y2 astfel incat Y1 concatenat cu Y2 == Ny

```
- Test:
```prolog  
?- mutant(X).
X = alligatortue ;
X = caribours ;
X = chevalligator ;
X = chevalapin ;
X = vacheval ;
false.

```