# FUNDAMENTALS OF PROGRAMMING LANGUAGES UNIVERSITY LABS
## Repository contents

In this repository you can find all homeworks and resources regarding my `FUNDAMENTALS OF PROGRAMMING LANGUAGES` class that I attended during my 2nd year of University.

### Courses:

- [x] [Course 1](/Courses/C01.pdf)
- [x] [Course 2](/Courses/C02.pdf)
- [x] [Course 3](/Courses/C03.pdf)
- [x] [Course 4](/Courses/C04.pdf)
- [x] [Course 5](/Courses/C05.pdf)
- [x] [Course 6](/Courses/C06.pdf)
- [x] [Course 7](/Courses/C07.pdf)
- [x] [Course 8](/Courses/C08.pdf)
- [x] [Course 9](/Courses/C09.pdf)
- [x] [Course 10](/Courses/C10.pdf)
- [x] [Course 11](/Courses/C11.pdf)
- [x] [Course 12](/Courses/C12.pdf)
- [x] [Course 13](/Courses/C13.pdf)
- [x] [Course 14](/Courses/C14.pdf)

### Laboratories:

- [x] [Laboratory 1](/L01)
- [x] [Laboratory 2](/L02)
- [x] [Laboratory 3](/L03)
- [x] [Laboratory 4](/L04)
- [x] [Laboratory 5](/L05.pl)
- [x] [Laboratory 6](/L06)
- [x] [Laboratory 7](/L07.pdf)
- [x] [Laboratory 8](/L08)
- [x] [Laboratory 9](/L09.pdf)
- [x] [Laboratory 10](/L10.pdf)
- [x] [Laboratory 11](/L11.pdf)
- [x] [Laboratory 12](/L12.pdf)

### Seminaries:

- [x] [Seminary 1](/S01.pdf)
- [x] [Seminary 2](/S02.pdf)
- [x] [Seminary 3](/S03.pdf)
- [x] [Seminary 4](/S04.pdf)

## EXTRA

- [x] [Special exam meeting](/ConsultatieFLP.pdf)

- [x] [Prolog Exam Problem](#problema-1)



### Problema 1

`listare_angajati` care primeste ca parametrii :
    - `ListaAngajati` = o lista de angajati de forma `angajat(nume, salariu)`
    - `SalariuPrag` = salariu folosit ca prag pentru a compara salariile mai mici ca acesta
    - `ListaRezultat` = lista rezultat ce va returna la final lista angajatilor care au salariul sub `SalariuPrag`.

Exemplu:
```prolog
?- listare_angajati([angajat(ion,1000), angajat(mihai, 1200), angajat(mirela,4000), angajat(ioana,3500)], 2000, R).
R = [ion, mihai].
```

### Rezolvare:

```prolog
listare_angajati([],_,[]).
listare_angajati([angajat(Nume, Salariu) | T], SalariuPrag, ListaRezultat) :-
    listare_angajati(T, SalariuPrag, ListaRezultat1),
    Salariu < SalariuPrag -> modifListaRez(Nume, ListaRezultat1, ListaRezultat);
                             ListaRezultat = ListaRezultat1.
                            

modifListaRez(Nume, [], LR) :-
    LR = [Nume].
modifListaRez(Nume, ListaRezultat, LR) :-
    append([Nume], ListaRezultat, LR).
```

#### Teste:

```prolog
?- listare_angajati([angajat(ana,500), angajat(maria, 1000), angajat(marcela,900), angajat(ioana,1500)], 2500, R).
R = [ana, maria, marcela, ioana].

EXPLICATIE - toti angajatii au salariile sub prag

?- listare_angajati([angajat(ana,500),  angajat(ioana,3500)], 3000, R).
R = [ana].
 
EXPLICATIE- doar ana are salariul sub prag

?- listare_angajati([angajat(ana,2500), angajat(maria, 3000), angajat(marcela,4900), angajat(ioana,5500)], 1000, R).
true. 

EXPLICATIE- ruleaza, dar lista rezultat este vida.
```
