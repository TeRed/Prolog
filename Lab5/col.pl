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
	lista(W,L).

lista([],[]).
lista([A|L],[[A,X]|R]) :-
	kolor(X),
	lista(L,R).
