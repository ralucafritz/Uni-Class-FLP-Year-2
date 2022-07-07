/*
    FRITZ RALUCA-MIHAELA
    GRUPA 243
    FLP - L01
*/

/*
    bigger/2 si is_bigger/2
*/

bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).

is_bigger(X,Y) :- 
    bigger(X,Y);
    bigger(X,Z), is_bigger(Z,Y).


/*
    EXERCITIUL 2:

    female/1
*/

female(mary).
female(sandra).
female(juliet).
female(lisa).

/*
    male/1
*/

male(peter).
male(paul).
male(dony).
male(bob).
male(harry).

/*
    parents/2
*/

parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dony).
parent(mary, sandra).

/*
    Relationships:
    
    father_of/2
    mother_of/2
    grandfather_of/2
    grandmother_of/2
    siter_of/2
    brother_of/2
    aunt_of/2
*/

father_of(X,Y) :-
    male(X),
    parent(X,Y).

mother_of(X,Y) :-
    female(X),
    parent(X,Y).

grandfather_of(X,Y) :-
    father_of(X,Z),
    parent(Z,Y).

grandmother_of(X,Y) :-
    mother_of(X,Z),
    parent(Z,Y).

sister_of(S,P) :-
    female(S),
    parent(Z,S),
    parent(Z,P),
    S \= P.

brother_of(B,P) :-
    male(B),
    parent(Z, B),
    parent(Z, P),
    B \= P.

aunt_of(A,P) :-
    sister_of(X,A),
    parent(X,P).

/*
    EXERCITIUL 3:
    not_parent/2
*/

/* asta da si valorile pt X si Y */

person(X) :- 
    female(X);
    male(X).
not_parent(X,Y) :- 
    person(X), 
    person(Y), 
    \+ parent(X,Y).

/*
    distance/3
*/

distance((X1,Y1),(X2,Y2),D) :- 
    D is sqrt((X2-X1)**2 + (Y2-Y1)**2).
