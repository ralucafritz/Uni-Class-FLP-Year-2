/*
    FRITZ RALUCA-MIHAELA
    GRUPA 243
    FLP - L02
*/

cls :- write('\33\[2J').

/*
    parents/2
*/

parent(dean,bob).
parent(jane,bob).
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
    ancestor_of/2
*/

ancestor_of(X,Y) :- 
    parent(X,Y).
ancestor_of(X,Y) :- 
    parent(X,Z),
    ancestor_of(Z,Y).

/*
    Exercitiul 1:

    fib/2
*/

fib(0, 1).
fib(1, 1).
fib(N, Res) :-
	N1 is N - 1,
	N2 is N - 2,
	fib(N1, Res1),
	fib(N2, Res2),
	Res is Res1 + Res2.

/*
    Exercitiul 2:

    square/2
*/

squareAux(N, N, N, Ch) :-
    write(Ch).
squareAux(N, I, N, Ch) :-
    write(Ch),
    nl,
    I1 is I+1,
    squareAux(N, I1, 1, Ch).
squareAux(N, I, J, Ch) :-
    write(Ch),
    J1 is J+1,
    squareAux(N, I, J1, Ch).

square(N,Ch) :-
    squareAux(N, 1, 1, Ch).

/*
    elements_of/2
*/

element_of(X, [X | _]).
element_of(X, [_ | Tail]) :- element_of(X, Tail).

/* 
    concat_lists/3
*/

concat_lists([], List, List).
concat_lists([Elem | List1], List2, [Elem | List3]) :- 
    concat_lists(List1, List2, List3).

/*
    Exercitiul 3:
    A) all_a/1
*/

all_a([a]).
all_a([a | T]) :-
    all_a(T).

/*
    B) trans_a_b/2
*/

trans_a_b([a],[b]).
trans_a_b([a | T1], [b | T2]) :- 
    trans_a_b(T1,T2).

/*
    Exercitiul 4:
    A) scalarMult/3
*/

scalarMult(_, [], []).
scalarMult(X, [H1 | T1], [H2 | T2]) :-
    H2 is H1 * X,
    scalarMult(X, T1, T2).

/*
    B) dot/3
*/

dot([],[], 0).
dot([H1 | T1], [H2 | T2], Res) :-
    dot(T1, T2, Res1),
    Res is Res1 + H1*H2.

/*
    Exercitiul 5:
    max/2
*/

max([X], X).

max([H | T], Max) :-
    max(T, TailMax),
    H > TailMax,
    Max = H.

max([H | T], Max) :-
    max(T, TailMax),
    H =< TailMax,
    Max = TailMax.

/*
    Exercitiul 6:
    palindrome/1
*/

palindromeReverse(X) :- 
    reverse(X, X).

reverse_of([], L, L).
reverse_of([H1 | T1], LAux, LR) :-
	reverse_of(T1, [H1 | LAux], LR).

reverse_of(List, ListResult) :-
	reverse_of(List, [], ListResult).

palindrome(X) :-
    reverse_of(X, X).

/* 
    Exercitiul 7:
    remove_duplicates/2
*/

remove_duplicates([],[]).
remove_duplicates([H|T], LR) :-
    member(H,T),
    remove_duplicates(T,LR).
remove_duplicates([H | T], [H | TR]) :-
    not(member(H,T)),
    remove_duplicates(T, TR).

/*
    Exercitiul 8:
    replace/4
*/

replace([],_,_,[]).
replace([H | T], X, Y, [H2 | LR]) :-
    replace(T, X, Y, LR),
    not(X is H),
    H2 = H.
replace([H | T], X, Y, [H2 | LR]) :-
    replace(T, X, Y, LR),
    X is H,
    H2 = Y.