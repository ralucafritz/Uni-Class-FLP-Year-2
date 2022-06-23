##### Fritz Raluca-Mihaela G243
# <center> Prolog </center>
## <center> Laboratorul 6 - Seminar 1 </center>


Recapitularea Logicii propozitionale 
Doua abordari: 
- semantica
  - adevar
  - tautologie -> adevar universal
  - simbol: |=
- sintaxa
  - teorema
  - o proprietate poate fi demonstrata
  - simbol: |-

Ex:  
|= φ inseamna φ tautologie  
|- φ inseamna φ demonstrabila sau φ teorema  

In logica propozitionala, pentru a verifica daca o formula φ este tautologie, este suficient sa ii construim tabelul de adevar:  
| p | ¬p | | p | q | p `/\` q | | p | q | p `\/` q | | p | q | p → q |
|---|----|-|---|---|--------|-|---|---|--------|-|---|---|-------|
| 0 | 1 | | 0 | 0 | 0 | | 0 | 0 | 0 | | 0 | 0 | 1 |
| 1 | 0 | | 0 | 1 | 0 | | 0 | 1 | 1 | | 0 | 1 | 1 |
|   |   | | 1 | 0 | 0 | | 1 | 0 | 1 | | 1 | 0 | 0 |
|   |   | | 1 | 1 | 1 | | 1 | 1 | 1 | | 1 | 1 | 1 |

e : Var → {0, 1}   
e+ : Form → {0, 1} extinde functia e pe formule  

e+(v) = e(v)   
e+(p `/\` q) =  e+(p) `/\` e+(q)  
e+(p → q) + e+(p) → e+(q)  

Ce inseamna cand φ este tautologie?  
  - are 1 pe toata coloana
Ce inseamnca cand φ este satisfiabila?  
  - are cel putin un 1 pe coloana

### Exercitiul 1:
Aratati ca urmatoarea forumla este o tautologie.

v<sub>1</sub> `\/` v<sub>2</sub> → v<sub>3</sub> ↔ (v<sub>1</sub>→v<sub>3</sub>) `/\` (v<sub>2</sub>→v<sub>3</sub>)  
A ↔ B   
Cate variabile propozitionale am?   
3:  
- v<sub>1</sub> 
- v<sub>2</sub>
- v<sub>3</sub>  
Cate lini am in tablelul de adevar?  
3 variabile `=>`  2<sup>3</sup> = 8  

| v<sub>1</sub> | v<sub>2</sub> | v<sub>3</sub> | v<sub>1</sub>`\/`v<sub>2</sub> | v<sub>1</sub> `\/` v<sub>2</sub> → v<sub>3</sub> = A | v<sub>1</sub> → v<sub>3</sub> | v<sub>2</sub> → v<sub>3</sub> | (v<sub>1</sub>→v<sub>3</sub>) `/\` (v<sub>2</sub>→v<sub>3</sub>) = B | A ↔ B |
|---|---|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
| 0 | 0 | 1 | 0 | 1 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 1 |
| 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 1 |
| 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 1 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |

Pe coloana A ↔ B am obtinut doar 1, ceea ce inseamna ca formula A ↔ B este o tautologie.

#### Axiome:
(A1) φ → (ψ → φ)  
(A2) (φ →(ψ → χ)) → ((φ → ψ) → (φ → χ))  
(A3) (¬ψ → ¬φ) → (φ → ψ)  
![](/L06/echivalent.jpg)  
![](/L06/teoremaDeductieNaturala+Reguli.jpg)  
Traducere sistem de reguli:   
| Reguli de introducere / conjunctie | Reguli de eliminare |
|-----------------------|---------------------|
| (1) φ `True`, (2) ψ `True` din (1) si (2) `=>` φ `/\`ψ `True` | (1) φ `/\`ψ `True` `=>` φ `True`, (2) φ `/\`ψ `True` `=>` ψ `True`
| cutie: presupun φ `True` si demonstram ca ψ e `True` `=>` φ → ψ | (1) φ `True`, (2) φ → ψ `True` din (1) si (2) `=>` ψ `True
| (1) φ `True` `=>` φ `\/` ψ `True` (2) ψ `True` `=>` φ `\/` ψ `True` | (1) φ `\/` ψ `True`, (2) cutie: presupunem φ `True` si demonstram ca χ e `True`, (3) cutie: presupunem ψ `True` si demonstram ca χ e `True` din (1),(2) si (3)`=>` χ `True` |
| cutie: presupun φ `True` si ajungem la o contradictie ┴ `=>` presupunere falsa `=>` ¬φ `True` | (1) φ `True` (2) ¬φ `True` din (1) si (2) `=>` contradictie ┴
| φ `True` `=>` ¬ ¬ φ `True` | ¬ ¬ φ `True` `=>` φ `True` 
| **TND**: la orice pas al dem φ sau ¬φ este `True` | din absurditate pot sa deduc orice ┴ => φ

### Deductie naturala:
### Exercitiul 2: 

a) (p `/\` q) `/\` r, s`/\`t `|-` q `/\`s  
`|-` = sistem sintactic => sistem deductiv   

(p `/\` q) `/\` r, s`/\`t = SECVENT  

Demonstrez ca   
  - (p `/\` q) `/\` r, s`/\`t  
este un secvent valid pentru   
  - q `/\`s  
ceea ce inseamna  ca formula q `/\`s se poate demonstra din ipotezele:  
  - (p `/\` q) `/\` r  
  - s`/\`t  
utilizand sistemul deductiei naturale.  

Demonstratie:
| No. | formula |  |
|-----|---------|--|
| (1) | (p /\ q) /\ r       | ipoteza
| (2) | s/\t                | ipoteza
| (3) | p /\ q              | `/\`e(1) = eliminam `/\` pe linia (1) `=>` p /\ q `True`
| (4) | q                   | `/\`e2(3) = eliminam `/\` pe linia (3)`=>` q `True`
| (5) | s                   | `/\`e1(2) = eliminam `/\` pe linia (2)`=>` s `True` 
| (6) | q `/\` s            | `/\`i(4,5) = introducem `/\` intre liniile (4) si (5) `=>` q `/\` s `True`

b) p, ¬¬(q`/\`r) `|-` ¬¬p `/\` r  
p, ¬¬(q`/\`r) = SECVENT  

Trebuie sa demonstram ¬¬p `/\` r  

Demonstratie:
| No. | formula |  |
|-----|---------|--|
| (1) | p                   | ipoteza
| (2) | ¬¬(q`/\`r)          | ipoteza
| (3) | ¬¬p                 | ¬¬i(1) = introducem dubla negatie in (1) `=>` ¬¬ p `True`
| (4) | q`/\`r              | ¬¬e1(2) = eliminam dubla negatie in (2)`=>` q `/\` r  `True`
| (5) | r                   | `/\`e2(4) = eliminam `/\` din (4) `=>` r `True`
| (6) | ¬¬p `/\` r          | `/\`i(3,5) = introducem `/\` intre liniile (3) si (5) `=>` ¬¬p `/\` r `True`

c) p `/\` q → r `|-` p → (q → r)  

p `/\` q → r = SECVENT  

Trebuie sa demonstram p → (q → r)  

Demonstratie:
| No. | formula |  |
|-----|---------|--|
| (1) | p `/\` q → r        | ipoteza
| (2) | `│`p                | asumptie = presupunem: p `True`
| (3) | `│` `│` q           | asumptie  = presupunem: q `True`
| (4) | `│` `│` p `/\`q     | `/\`i(2,3) = introducem `/\` intre liniile (2) si (3) `=>` p `/\` q `True`
| (5) | `│` `│` r           | →e(1,4) = eliminam implicatia → dintre liniile (1) si (4) => r `True`
| (6) | `│` q → r           | →i(3-5) = introducem implicatia → intre liniile (3)-(5) => q → r `True`
| (7) | p → q → r           | →i(2-6) = introducem implicatia → intre liniile (2)-(6) => p → q → r `True`

d) p `/\` (q `\/` r) `|-` (p `/\` q) `\/` (p `/\` r)  
p `/\` (q `\/` r) = SECVENT  
Trebuie sa demonstram (p `/\` q) `\/` (p `/\` r)  

Demonstratie:  
| No. | formula |  |
|-----|---------|--|
| (1) | p `/\` (q `\/` r)               | ipoteza
| (2) | p                               | `/\`e(1)
| (3) | q `\/` r                        | `\/`e(1)
| (4) | `│` q                           | prima asumptie = presupunem q `True`
| (5) | `│` p `/\` q                    | `/\`i(2,4) =  introducem `/\` intre liniile (2) si (4) `=>` p `/\` q `True`
| (6) | `│`(p `/\` q) `\/` (p `/\` r)   | `\/`i1(5) = introducem `\/` in linia (5) `=>` (p `/\` q) `\/` (p `/\` r)`True`
|-----|---------------------------------|--------------------
| (7) | `│` r                           | a doua asumptie = presupunem r `True`
| (8) | `│` p `/\` r                    | `/\`i(2,7) = introducem `/\` intre liniile (2) si (7) `=>` p `/\` r `True`
| (9) | `│`(p `/\` q) `\/` (p `/\` r)   | `\/`i1(8) = introducem `\/` in linia (8) `=>` (p `/\` q) `\/` (p `/\` r)`True`
|-----|---------------------------------|--------------------
| (10)| (p `/\` q) `\/` (p `/\` r)      | `\/`e(3, 4-6, 7-9) = eliminare `\/` dintre liniile (3), (4-6) si (7-9)

e) p → q, p → ¬ q `|-` ¬ p  

p → q, p → ¬ q = SECVENT  

Trebuie sa demonstram ¬ p  
 
Demosntratie: 
| No. | formula |  |
|-----|---------|--|
| (1) | p → q                               | ipoteza
| (2) | p → ¬ q                             | ipoteza
| (3) | `│`p                                | asumptie = presupunem p `True`
| (4) | `│`q                                | →e(1,3) = eliminam → dintre liniile (2) si (3) `=>` q `True`
| (5) | `│`¬q                               | →e(2,3) = eliminam → dintre liniile (2) si (3) `=>` ¬q `True`
| (6) | `│`                                 | ¬e(4,5) = eliminam ¬ din liniile (5) `=>` ABSURDITATE ⊥ (q si ¬q erau adevarate in acelasi timp => contradictie `=>` ¬p `True`)
| (7) | ¬p                                  | ¬i(3-6) = introducem ¬ in calupul liniilor (3)-(6) `=>` ¬ p `True`

### Exercitiul 3:

Sa se demonstreze urmatoarele reguli in deductie naturala:  
- Modus tollends:  
p → q `True`, dar ¬ q `True` `=>` ¬p   
- reductio ad absurdum (RAA):  
cutie:  
`│`¬p  
`│`.  
`│`.  
`│`⊥  
----- `=>` RAA   
`=>` p `True`  


a) p → q, ¬q  `|-` ¬p  


Demonstratie:
| No. | formula |  |
|-----|---------|--|
| (1) | p → q                       | ipoteza
| (2) | ¬q                          | ipoteza
| (3) | `│` p                       | asumptie
| (4) | `│` q                       | →e(1)
| (5) | `│` ⊥                       | ¬e(2,4)
| (6) | ¬p                          | ¬i(3-5)

b) ¬p → ⊥ `|-` p  

Demonstratie:
| No. | formula |  |
|-----|---------|--|
| (1) | ¬p → ⊥                      | ipoteza
| (2) | `│` ¬p                      | asumptie
| (3) | `│` ⊥                       | →e(1,2)    
| (4) | ¬¬p                         | ¬i(2-3)
| (5) | p                           | ¬¬e(4)

### Exercitiul 4:

fie n `>=` 1 si φ<sub>1</sub>,....,φ<sub>n</sub>, φ formule. Demosntrati ca:
`|-` φ<sub>1</sub> → (φ<sub>2</sub> → (....→ (φ<sub>n</sub> → φ)...))  

atunci   
φ<sub>1</sub>, φ<sub>2</sub>,..., φ<sub>n</sub> `|-` φ  

Solutie:   

Adaugam pe rand φ<sub>1</sub>, φ<sub>2</sub>,..., φ<sub>n</sub> ca sucventi valizi si aplicam mereu regula de →e.  

##### Pasul 1: adaug φ<sub>1</sub> ca secvent valid.  

| No. | formula |  |
|-----|---------|--|
| (1) | φ<sub>1</sub>                                                           | ipoteza Pas1
| (2) | φ<sub>1</sub> → (φ<sub>2</sub> → (....→ (φ<sub>n</sub> → φ)...))        | ipoteza
| (3) | (φ<sub>2</sub> → (....→ (φ<sub>n</sub> → φ)...))                        | →e(1,2)

Asta inseamna ca:  

φ<sub>1</sub> `|-`  (φ<sub>2</sub> → (....→ (φ<sub>n</sub> → φ)...))

##### Pasul 2: adaug φ<sub>2</sub> ca secvent valid....
##### Dupa n-1 pasi, obtin ca:
φ<sub>1</sub>, φ<sub>2</sub>, φ<sub>3</sub>, φ<sub>n-1</sub> `|-` φ<sub>n</sub> → φ

##### Il adaug pe φ<sub>n</sub> ca secvent valid:

| No. | formula |  |
|-----|---------|--|
| (1) | φ<sub>n</sub>                                                           | ipoteza Pas1
| (2) | φ<sub>n</sub> → φ                                                       | ipoteza
| (3) | φ                                                                       | →e(1,2)

##### Si obtin ca:
φ<sub>1</sub>, φ<sub>2</sub>,..., φ<sub>n</sub> `|-` φ  

### Exercitiul 5:

Sa se scrie reguli de introducere si eliminare a echivalentei logice in deductia naturala.  

↔ i ↔ e  

p ↔ q ~ (p → q) `/\` (q → p)  
Reguli de introducere si eliminare:  
![](/L06/echivalent.jpg)  

### Exercitiul 6:

(i1) Toti scriitorii care inteleg natura umana sunt intelepti.    
(i2) Un scriitor care este poet adevarat poate trezi sentimente puternice.     
(i3) Shakespeare este scriitorul care a scris "Hamlet".     
(i4) Un scriitor care trezeste sentimente puternice intelege natura umana.     
(i5) Numai un poet adevarat putea scrie "Hamlet".    

Shakespeare este intelept.  

Solutie:  

p `/\` q → r ~ p → (q → r)  

(i1) Scriitor(W) `/\` NaturaUmana(HN) → Intelept(C)   
(i2) Scriitor → (PoetAdevarat(Poet) → SentimentePuternice(SP))  
(i3) Shakespeare → Scriitor /\ Hamlet(H)  
(i4) Scriitor → (Sentimenteputernice → NaturaUmana)  
(i5) PoetAdevarat → Hamlet  
(c) Shakespeare → Intelept  

`|-` S → C  

| No. | formula |  |
|-----|---------|--|
| (1) | W `/\` HM → C                       | ipoteza 
| (2) | W → (Peot → SP)                     | ipoteza 
| (3) | S → W `/\` H                        | ipoteza 
| (4) | W → (SP → HN)                       | ipoteza 
| (5) | Poet → H                            | ipoteza 
| (6) | `│` S                               | asumptie
| (7) | `│` W `/\` H                        | →e(3,6)
| (8) | `│` W                               | `/\`e1(7)
| (9) | `│` H                               | `/\`e2(7)
| (10)| `│` SP → HN                         | →e(8,4)
| (11)| `│` Poet → SP                       | →e(8,2)
| (12)| `│` Poet                            | →e(9,5)
| (13)| `│` SP                              |→e(11,12)
| (14)| `│` HN                              |→e(10,13)
| (15)| `│` W `/\` HN                       | `/\`i(8,14)
| (16)| `│` C                               | →e(1,15)
| (17)| S → C                               | →i(16)

