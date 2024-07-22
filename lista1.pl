% Q1
concatenar([], L, L).
concatenar(L, [], L).
concatenar([X|R], L2, [X|L]) :- concatenar(R, L2, L).

% Q2
concatenarInv([], L, L).
concatenarInv(L, [], L).
concatenarInv(L1, [X|R], [X|L]) :- concatenarInv(L1, R, L).

% Q3
concatenarQ3([], []).
concatenarQ3([[]| R], L) :- concatenarQ3(R, L).
concatenarQ3([ [X|Rinterno] | Rexterno ], [X|L]) :- concatenarQ3([Rinterno|Rexterno], L).

% Q4
mesclando(L, [], L).
mesclando([], L, L).
mesclando([X|R], L2, [X|L]) :- mesclando(L2, R, L).

% Q5
adicionarFinal(X, [], [X]).
adicionarFinal(X, [Y|R], [Y|L]) :- adicionarFinal(X, R, L).

% Q6
inverter([], []).
inverter([X], [X]).
inverter([X|R], L) :- inverter(R, Z), adicionarFinal(X, Z, L).

% Q7
is_list([_|__]).
is_list([]).
inverterLG([], []).
inverterLG([X], [X]) :- not(is_list(X)).
inverterLG([X], [L]) :- is_list(X), inverterLG(X, L).
inverterLG([X|R], L) :- inverterLG(R, Z), adicionarFinal(X,Z, L).

% Q8
parear(_, [], []).
parear(X, [Y|R], [[X,Y]|L]) :- parear(X, R, L).

% Q9
pares([], []).
pares([_], []).
pares([X|R], Z) :- parear(X, R, Z), pares(R, []), !.
pares([X|R], LL) :- parear(X, R, Z), pares(R, L), concatenar(Z, L, LL).


