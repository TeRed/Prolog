kolor(zielony).
kolor(czerwony).
kolor(niebieski).

koloruj(Pol,Bel,Ukr,Slo,Cze) :-
	kolor(Pol),
	kolor(Bel),
	kolor(Ukr),
	kolor(Slo),
	kolor(Cze),
	Pol \= Bel,
	Pol \= Ukr,
	Pol \= Slo,
	Pol \= Cze,
	Bel \= Ukr,
	Slo \= Ukr,
	Slo \= Cze.
