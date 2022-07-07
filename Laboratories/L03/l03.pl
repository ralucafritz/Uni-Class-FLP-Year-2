/*
    FRITZ RALUCA-MIHAELA
    GRUPA 243
    FLP - L03
*/

cls :- write('\33\[2J').

/*
    Exercitiul 1:
    cuvinte incrucisate
    crosswd/6
*/

word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagran,a,n,a,g,r,a,n).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crosswd(V1, V2, V3, H1, H2, H3) :-
    word(V1, _, A, _, B, _, C, _),
    word(V2, _, D, _, E, _, F, _),
    word(V3, _, G, _, H, _, I, _),
    word(H1, _, A, _, D, _, G, _),
    word(H2, _, B, _, E, _, H, _),
    word(H3, _, C, _, F, _, I, _).

/*
    Exercitiul 2:
    baza de date
    year/2,
*/

born(jan, date(20,3,1977)).
born(jeroen, date(2,2,1992)).
born(joris, date(17,3,1995)).
born(jelle, date(1,1,2004)).
born(joan, date(24,12,0)).
born(joop, date(30,4,1989)).
born(jannecke, date(17,3,1993)).
born(jaap, date(16,11,1995)).

year(Year,Person) :-
    born(Person, date(_,_,Year)).

/*
    before/2
*/

before(date(D1,M1,Y1),date(D2,M2,Y2)) :-
    Y1 < Y2;
    Y1 =:= Y2, M1 < M2;
    Y1 =:= Y2, M1 =:= M2, D1 < D2.

/*
    older/2
*/

older(P1,P2) :-
    born(P1,X),
    born(P2,Y),
    before(X,Y).

/*
    Exercitiul 3:
    drumurile intr-un labiring
    path/2
*/

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

path(P1,P2) :- connected(P1,P2).
path(P1,P2) :-
    connected(P1,P3),
    path(P3,P2).

connectedLoop(1,2).
connectedLoop(2,1).
connectedLoop(1,3).
connectedLoop(3,4).

pathLoop(X, Y, V) :-
    connectedLoop(X,Y);
    not(member(X,V)),
    connectedLoop(X,Z),
    pathLoop(Z, Y, [X | V]).

/*
    Exercitiul 4:
    numere naturale
    0 : []
    1 : [x]
    2 : [x,x]
    3 : [x,x,x]
    4 : [x,x,x,x]

    a. successor/2
*/

succesor(P, [x | P]).
/*
    b. plus/3
*/

plus_v1([], L2, L2).
plus_v1([H | T], L2, Res) :-
    plus_v1(T,L2,Res1),
    Res = [H | Res1].

plus(L1,L2,Res) :-
    append(L1,L2,Res).

/*
    c. times/3
*/
times([],_,[]).
times([x | T], L2, LR) :-
        times(T, L2, RTail),
        plus(L2, RTail, LR).
/*
    Exercitiul 5:
    element_at/3
*/

element_at([H | _], 1, H).
element_at([_ | T], N, Result) :-
    Index is N-1,
    element_at(T, Index, Result).

/*
    Exercitiul 6:
    Animale
    mutant/1
    name/2
*/

animal(alligator). 
animal(tortue).
animal(caribou).
animal(ours).
animal(cheval).
animal(vache).
animal(lapin).

mutant(X) :-
    animal(Y),
    animal(Z),
    Y \= Z,
    name(Y,Ny),
    name(Z,Nz),
    append(Y1,Y2,Ny),
    Y2 \= [],
    append(Y2, _,Nz),
    append(Y1,Nz,Nx),
    name(X,Nx).