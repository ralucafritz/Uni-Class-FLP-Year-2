/*
    FRITZ RALUCA-MIHAELA
    GRUPA 243
    FLP - L04
*/

/*
    Problema 1:
    Zebra Puzzle
*/

/*
    1) la_dreapta(X,Y)
*/
/*
    2) la_stanga(X,Y)
*/
/*
    3) langa(X,Y)
*/
/*
    solutie(Strada,PosesorZebra)
*/

la_dreapta(X, Y) :- 
    X is Y + 1. 
la_stanga(X, Y) :- 
    la_dreapta(Y, X).
langa(X, Y) :- 
    la_dreapta(X, Y); 
    la_stanga(X, Y).

/*
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
*/

solutie(PosesorZebra, Strada) :-
% 1
    Strada = [
                casa(1,_,_,_,_,_), 
                casa(2,_,_,_,_,_), 
                casa(3,_,_,_,_,_), 
                casa(4,_,_,_,_,_), 
                casa(5,_,_,_,_,_)
            ], 
% 2
            member(casa(_, englez, rosu, _, _, _), Strada), 
% 3
            member(casa(_, spaniol,_, caine, _, _), Strada),
% 4
            member(casa(_, _, verde,_, cafea, _), Strada), 
% 5
            member(casa(_, ucrainean, _, _, ceai, _), Strada), 
% 6
            member(casa(A, _, verde ,_, cafea, _), Strada), 
            member(casa(B, _,bej, _, _, _), Strada), 
            la_dreapta(A,B),
% 7            
            member(casa(_, _, _, melci, _, oldGold), Strada),
% 8  
            member(casa(G, _, galben, _, _, kools), Strada),
% 9  
            member(casa(3, _, _,  _, lapte, _), Strada),
% 10
            member(casa(1, norvegian, _, _, _, _),Strada),
% 11            
            member(casa(E, _, _, _, _, chesterFields), Strada),
            member(casa(F, _, _, vulpe, _, _), Strada),
            langa(E,F),
% 12
            member(casa(H, _, _, cal, _, _), Strada),
            langa(G,H),
% 13
            member(casa(_, _, _, _, sucDePortocale, luckyStrike), Strada),
% 14
	        member(casa(_, japonez, _, _, _, parliaments), Strada),
% 15
            member(casa(C,norvegian,_,_,_,_), Strada),
            member(casa(D,_,albastru,_,_,_), Strada),
            langa(C,D),
            
            member(casa(_,PosesorZebra,_,zebra,_,_), Strada).

