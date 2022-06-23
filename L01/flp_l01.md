# <center> Prolog </center>

## <center> Laboratorul 1 </center>


- limbaj pt programare logica
- bazat pe logica de ord1.
- bazat pe clauzele Horn

---

### Sintaxa limbajului Prolog

- constante
  - atomi  
        - incep cu litera mica   
          `[a-z]([a-z][A-Z])*`   
      	- sunt incadrati in apostroafe
   - constante numerice (22, -15, 17.3, -100.2)
- variabile
	- incep cu litera mare
	- sau incep cu _

Exemple de atomi: 

    a, aA, a_exp. etc
	b, bA, ...... etc
				  
Un program Prolog este format din 
- facts (reguli de derivare dar fara Body)
- reguli de derivare    
  `Head :- Body` => Head daca Body  
  `Body -> Head` => Body implica Head
	- cele 2 forme sunt echivalente			

---
### Exercitiul 1:

***FACTS:***
```prolog
		bigger(elephant, horse)
		bigger(horse, donkey)
		bigger(donkey, dog)
		bigger(donkey, monkey)
```

[aritate -> ari = numar de argumente]()  
`%bigger/2` => aritate = 2
	
***REGULI DE DERIVARE:***
`%is_bigger/2`
```prolog		
        is_bigger(X,Y) :- bigger(X,Y)
		                sau
        is_bigger(X,Y) :- bigger(X,Z), is_bigger(Z,Y)
```		
		
daca avem is_bigger(whale,dog) => chiar daca nu avem in baza de cunostinte toate datele => NU DA EROARE => [FALSE]()
```prolog
	bigger(whale,_) -> orice ar fi whale e mai mare 
		
    :-   ==  <- (implicatie)
    , 	 ==  and ^ (conjunctie)
    ; 	 ==  or V 
	\= 	 ==  !=
	\+ 	 ==  not
```
---

### Exercitiul 2:

Avem definite:*

```prolog
female/1
male/1
parent/2
female(mary)
male(peter)
male(harry)
male(bob)
parent(bob,harry)
parent(mary,harry)
```
		
	
*Se cere sa definim urmatoarele reguli:*
	
1) father_of/2
	```prolog
	father_of(X,Y) :-
	    male(X),
	    parent(X,Y).
	```

2) mother_of/2
	```prolog
	mother_of(X,Y) :-
    	female(X),
    	parent(X,Y).
	```

3) grandfather_of/2
	```prolog
	grandfather_of(X,Y) :-
    	father_of(X,Z),
    	parent(Z,Y).
	```
	
4) grandmother_of/2
	```prolog
	grandmother_of(X,Y) :-
	mother_of(X,Z),
    parent(Z,Y).
	```
		
5) sister_of/2
    ```prolog   
	sister_of(S,P) :-
	    female(S),
	    parent(Z,S),
	    parent(Z,P),
	    S \= P.
	```
S \= P ====== S != P
	
6) brother_of/2
	```prolog
    brother_of(B,P) :- 
		male(B), 
		parent(Z,B), 
		parent(Z,P), B \=P
	```
7) aunt_of/2
        
    ```prolog    
	distance((X1,Y1),(X2,Y2),D) :- 
	    D is sqrt((X2-X1)**2 + (Y2-Y1)**2).
	```

### Exercitiul 3:

```prolog
person(X) :- 
	female(X);
	male(X).
	
not_parent(X,Y) :- 
	person(X), 
	person(Y), 
	\+ parent_of(X,Y).
```

### Apel

```prolog
?- sister_of(mary, lisa).
true/false
?- sister_of(mary, X)
solutie valida
; 
solutie valida
.
.
.
false
>?- sister_of(X, lisa)
>?- sister_of(X,Y) -> toate perechile (X,Y) care indeplinesc relatia
```
---

## SWI_Prolog


- consola
- File 
  - Consult
- se incarca fisierul cu extensia .pl
  - ?- 
  -  se pot pune intrebari
- Codul se poate scrie in orice IDE


---

#### OPERATORI ARITMETICI
- operatori pentru unificare
```prolog
	=
	\=
```

- operatori aritmetici
```prolog
	=:= => ==
	=\= -> !=
	// 	=> impartire intreaga
	mod => restul impartii intregi

	2 ** 5  =  30+2 FALSE
	2 ** 5 =:= 30+2 TRUE

```

***FARA => si <=***

- operatori de comparatie 
```prolog
	<
	>
	>=
	=<
```	
- is/2
	- arg1 - constanta numerica / variabila
	- arg2 - trb sa fie o expresie aritmetica fara variabile reinstantiate
```	prolog
	8 is 3+5 true
	X is 3+5 X=8
	8 is 3+X nu este valabil
	sqrt/1
	abs/1
	min/2
	max/2
	2**5 = 32
```

---

### Exercitiul 4 (pdf)
Sa se calculeze distanta in plan dintre 2 puncte
```prolog
	distance/3
	distance(+P1, +P2, -Dist)
	distance((0,0),(3,4),D)
	D=5.0
	distance((X1,Y1),(X2,Y2),D) := D is sqrt((X2-X1)**2+(Y2-Y1)**2)
```