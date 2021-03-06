trzeci([A,B,C|Reszta],C).

porownaj([A,B,C,D|L]) :-
	C == D,
	write('Yes'), !.

porownaj([A,B,C,D|L]) :-
	C \= D,
	write('No').

porownaj2([_,_,C,C|_]).

zamien([A,B,C,D|L],X) :-
	X=[A,B,D,C|L].

nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.

a2b([],[]).
a2b([a|Ta],[b|Tb]) :- 
   a2b(Ta,Tb).

sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).

nalezy1(X,L) :-
	sklej(_,[X|_],L).

ostatni(Element,Lista) :-
	sklej(_,[Element],Lista), !.

ostatni2(Element,[Element]).
ostatni2(Element,[_|Lista]) :-
	ostatni2(Element,Lista).

dodaj(X,L,[X|L]).

usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).

wstaw(X,L,Duza) :-
	usun(X,Duza,L).

nalezy2(X,L) :-
	usun(X,L,_).

%8

zawiera(S,L) :-
	sklej(_,L2,L),
	sklej(S,_,L2).
	
%9

permutacja([],[]).
permutacja([X|L],P) :-
	permutacja(L,L1),
	wstaw(X,L1,P).
 
permutacja2([],[]).
permutacja2(L,[X|P]) :-
	usun(X,L,L1),
	permutacja2(L1,P).

%10

odwroc([],[]).
odwroc([H|T],L) :-
	odwroc(T,R),
	sklej(R,[H],L).



