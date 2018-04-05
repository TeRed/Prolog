kolor(zielony).
kolor(czerwony).
kolor(niebieski).

panstwo(polska).
panstwo(bialorus).
panstwo(ukraina).
% panstwo(slowacja).
% panstwo(czechy).

sasiad(polska,bialorus).
sasiad(polska,ukraina).
sasiad(polska,slowacja).
sasiad(polska,czechy).

sasiad(bialorus,ukraina).
sasiad(ukraina,slowacja).
sasiad(slowacja,czechy).

koloruj(L) :-
	setof(X,panstwo(X),W),
	lista(W,L),
	write(W).

obecne(L) :-
	sasiad(F,G),
	member([F,K1],L),
	member([G,K2],L),
	K1 \= K2,
	sasiad(I,J),
	member([I,K3],L),
	member([J,K4],L),
	K3 \= K4.

lista([],[]).
lista([A|L],[[A,X]|R]) :-
	kolor(X),
	lista(L,R).

nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).
	
	
	
