sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).

u3p(L,L1) :-
	sklej([_,_,_],L1,L).

u3o(L,L1) :-
	sklej(L1,[_,_,_],L).

u3po(L,L1) :-
	sklej([_,_,_|L1],[_,_,_],L).

parzysta([]).
parzysta([_|L]) :- nieparzysta(L).

nieparzysta([_]).
nieparzysta([_|L]) :- parzysta(L).

odwroc([],[]).
odwroc([H|T],L) :-
	odwroc(T,R),
	sklej(R,[H],L).

pal(L) :-
	odwroc(L,L).

przesun([A|L1],L2) :-
	sklej(L1, A, L2).

znaczy(0,zero).
znaczy(1,jeden).
znaczy(2,dwa).
znaczy(3,trzy).
znaczy(4,cztery).
znaczy(5,piec).
znaczy(6,szesc).
znaczy(7,siedem).
znaczy(8,osiem).
znaczy(9,dziewiec).

przeloz([],[]).
przeloz([X|L1],[Y|L2]) :-
	znaczy(X,Y),
	przeloz(L1,L2).

podzbior([],[]).
podzbior([_],[]).
podzbior(L,[A|Z]) :-
	sklej([_],[A|_],L),
	podzbior(L,Z).

podziel([],[],[]).
podziel([A],[A],[]).
podziel([A,B|R],[A|R1],[B|R2]) :- podziel(R,R1,R2).

splaszcz([],X).
splaszcz([A],X) :-
	write(A),
	sklej(_,[A],X).
splaszcz([A|L],X) :-
	splaszcz(A,X),
	splaszcz(L,X).




