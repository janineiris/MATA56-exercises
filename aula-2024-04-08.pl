% LISTAS
%

cabeca([C|_],C).

segundo([_,S|_],S).

cauda([_|R],R).

cons(X,L,[X|L]).


membro(X,[X|_]).
membro(X,[_|R]) :- membro(X,R).

/*
?- membro(2,[2,3]).
?- membro(a,[a,b,c,d,e]).
?- membro(a,[a,b,c,d,a]).
?- membro(X,[a,b,c,d,a]).
?- membro(a,L).
?- membro([3,Y],[[1,a],[2,m],[3,z],[4,v],[3,p]]).
*/

% remove uma ocorr�ncia de X em L
remova(_,[],[]) :- !.
remova(X,[X|R],R) :- !.
remova(X,[Y|R],[Y|W]) :- X \== Y, remova(X,R,W).



% Mescle duas listas L1 e L2 em uma lista ordenada L
%
% mescle(+L1,+L2, -L).

mescle([],L2,L2) :- !.
mescle(L1,[],L1) :- !.
mescle([X1|R1],[X2|R2],[X1|R]) :- X1 =< X2, mescle(R1,[X2|R2],R),!.
mescle([X1|R1],[X2|R2],[X2|R]) :- mescle([X1|R1],R2,R).


% Divide um lista L em duas listas balanceadas L1 e L2
%
% divide(+L,-L1,-L2).

divide([],[],[]) :- !.
divide([X],[X],[]) :- !.
divide([X,Y|R],[X|R1],[Y|R2]) :- divide(R,R1,R2).


% Merge Sort
%
mergesort([],[]) :- !.
mergesort([X],[X]) :- !.
mergesort(L,LO) :- divide(L,L1,L2),
                   mergesort(L1,LO1),
                   mergesort(L2,LO2),
                   mescle(LO1,LO2,LO).


% Insertion sort

isort([],[]).
isort([X|Y],Z) :- isort(Y,W),coloque(X,W,Z).

coloque(N,[],[N]) :- !.
coloque(N,[X|R],[N,X|R]) :- N < X, !.
coloque(N,[X|R],[X|W]) :- coloque(N,R,W).


% Aula dia 8/04
isort2([],_,[]).
isort2([X|Y],TC,Z) :- isort2(Y,TC,W),coloque2(X,W,TC,Z).

coloque2(N,[],_,[N]) :- !.
coloque2(N,[X|R],TC,[N,X|R]) :- call(TC,N,X),!.
coloque2(N,[X|R],TC,[X|W]) :- coloque2(N,R,TC,W).

isort2(L,LO) :- isort2(L,<,LO).




% isort gen�rico com termo de compara��o TC e extrato de chave KEY
isort3([],_,_,[]).
isort3([X|Y],TC,KEY,Z) :- isort3(Y,TC,KEY,W),
                          coloque3(X,W,TC,KEY,Z).

coloque3(N,[],_,_,[N]) :- !.
coloque3(N,[X|R],TC,KEY,[N,X|R]) :- call(KEY,N,NC),
                                    call(KEY,X,XC),
                                    call(TC,NC,XC),!.
coloque3(N,[X|R],TC,KEY,[X|W]) :- coloque3(N,R,TC,KEY,W).



isort3(L,LO) :- isort3(L,<,identity,LO).
identity(X,X).


soma1(X,Y) :- Y is X+1.


mapeiaLista(_,[],[]) :- !.
mapeiaLista(G,[X|R],[M|RM]) :- call(G,X,M),mapeiaLista(G,R,RM).



mapeiaLista(_,[]) :- !.
mapeiaLista(G,[X|R]) :- call(G,X),mapeiaLista(G,R).


mapeia1(_,[]) :- !.
mapeia1(G,[X|R]) :- call(G,X), mapeia1(G,R).
