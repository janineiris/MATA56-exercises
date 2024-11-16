/*
Escreva em PROLOG as cláusulas liste(+N,?L) que lista N números em ordem decrescente de N para 1
?- liste(5, L).
   L = [5,4,3,2,1].
*/
liste(0, []).
liste(1, [1]).
liste(N, [N | L]) :- X is N - 1,
                    liste(X, L).

% aparentemente tem falha e loop infinito

/*
Escreva em PROLOG as cláusulas divide(+L,+N,?L1,?L2) que divide a lista L nas listas L1 e L2, sendo que os N primeiros elementos de L estarão em L1 e o restante em L2. Por exemplo:

?- divide([a,b,c,d,e,f,g,h,i,k],3,L1,L2).
L1 = [a,b,c],
L2 = [d,e,f,g,h,i,k].

 As cláusulas devem falhar se N for maior que o comprimento de L.
*/
divide([], _, [], []).
divide(L, 0, [], L).
divide([X|R], N, [X | L1], L2) :- M is N-1,
                                divide(R, M, L1, L2).

% falha para N < 0

/*
Escreva em PROLOG as cláusulas separe(:Pred,+L,?LPassou,?LFalhou),  que recebe uma lista L e o predicado :Pred  que é aplicado a cada elemento da lista, separando-os em duas listas: ?LPassou , a lista dos elementos que passaram o predicado; e, ?LFalhou , a lista dos elementos que falharam o predicado. Por exemplo:

% cria predicado para checar números pares

?- assert(even(X) :- mod(X,2) =:= 0).
true.

% separa os elementos pares da lista [1,2,3,4,5,7]

?- separe(even,[1,2,3,4,5,7],L1,L2).
L1 = [2,4],
L2 = [1,3,5,7].

 Na solução, você pode usar as meta-cláusulas call ou apply do PROLOG.
*/
separe(_, [], [], []).
separe(P, [X | R], [X | L1], L2) :- call(P, X),
                                separe(P, R, L1, L2), !.
separe(P, [X | R], L1, [X | L2]) :- separe(P, R, L1, L2).


/*
Escreva em PROLOG a cláusula decodifica(+LL,?L) que produz uma lista L a partir da decodificação de LL. LL é uma lista de listas, onde cada lista Li de LL contém um par [N,A] que diz quantas vezes o átomo A vai se repetir em L. Por exemplo:

 ?- decodifica( [[3,a],[2,b],[2,a],[1,d]] ,L).
L = [a, a, a, b, b, a, a, d].

 Você pode assumir a existência da cláusula append/3 do PROLOG.
*/
decodifica([], []).
decodifica([[0 | _] | R], L) :- decodifica(R, L).
decodifica([[XF, RF] | RR], [RF | L]):- X is XF-1,
                                        decodifica([[X, RF] | RR], L).

% entra em loop

/*
Escreva em PROLOG as cláusulas circule(+L,+N,?LR),  que recebe uma lista L e gira ciclicamente os seus elementos N vezes para esquerda, se N>0, ou para direita, se N<0 . Por exemplo:

?- circule([a,b,c,d,e,f,g,h],3,X).
X = [d,e,f,g,h,a,b,c]

?- circule([a,b,c,d,e,f,g,h],-2,X).
X = [g,h,a,b,c,d,e,f]

 Você pode assumir a existência das cláusulas append/3 do PROLOG.
*/
circule([], _, []).
circule(L, 0, L).
circule([X | R], N, L) :- N > 0,
                        M is N-1,
                        append(R, [X], LA),
                        circule(LA, M, L).!

 

% falta a parte negativa