delta(A,B,C,Wynik) :-
	Wynik is B * B - 4*A*C.

kwadrat(A,B,C,Wynik) :-
	delta(A,B,C,D),
	Wynik is (-B + sqrt(D))/(2*A);
	delta(A,B,C,D),
	Wynik is (-B - sqrt(D))/(2*A).
