
% dane

rodzina(
	osoba(jan, kowalski,data(5,kwiecien,1946),pracuje(tpsa,3000)),
	osoba(anna,kowalski,data(8,luty,1949),    pracuje(szkola,1500)), 
	[
		osoba(maria,kowalski,data(20,maj,1973),pracuje(argo_turist,4000)),
		osoba(pawel,kowalski,data(15,listopad,1979),zasilek)
	]
	).
       
rodzina(
	osoba(krzysztof, malinowski, data(24,lipiec,1950), bezrobocie),
	osoba(klara, malinowski, data(9,styczen,1951), pracuje(kghm,8000)),
	[
		osoba(monika, malinowski, data(19,wrzesien,1980), bezrobocie)
	]
	).

rodzina(
	osoba(mateusz, nowak,data(2,kwiecien,1950),pracuje(google,4000)),
	osoba(joanna, nowak,data(1,listopad,1948),pracuje(kiosk,1500)), 
	[
		osoba(tomasz,nowak,data(29,maj,1980),pracuje(kiosk,2000)),
		osoba(pawel,nowak,data(7,czerwiec,1977),zasilek)
	]
	).

% zaleznosci

maz(X) :-
	rodzina(X,_,_).

zona(X) :-
	rodzina(_,X,_).

dziecko(X) :-
	rodzina(_,_,Dzieci),
	nalezy(X,Dzieci).

istnieje(Osoba) :-
	maz(Osoba);
	zona(Osoba);
	dziecko(Osoba).

data_urodzenia(osoba(_,_,Data,_),Data).

pensja(osoba(_,_,_,pracuje(_,P)),P).
pensja(osoba(_,_,_,zasilek),500).
pensja(osoba(_,_,_,bezrobocie),0).

zarobki([],0).
zarobki([Osoba|Lista],Suma) :-
	pensja(Osoba,S),
	zarobki(Lista,Reszta),
	Suma is S + Reszta.

% narzedzia
nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

% ODPOWIEDZI

% jakie są osoby w bazie?
% istnieje(X).

% jakie są dzieci w bazie?
% dziecko(X).

% pokazać pensje wszystkich osób
% bagof(X,istnieje(X),L),zarobki(L,Z).

% jakie dzieci urodzone w 1979r.?
% dziecko(X),data_urodzenia(X,data(_,_,U)),U<1979,false.
% Alternatywnie@ dziecko(osoba(X,Y,data(_,_,1979),_)).

% znaleźć wszystkie żony, które pracują
% zona(osoba(X,Y,_,pracuje(_,_))).

% znaleźć osoby urodzone przed 1950 r, których pensja jest mniejsza niż 3000
% istnieje(X),data_urodzenia(X,data(_,_,U)),U<1950,pensja(X,P),P<3000.
% Alternatywnie@ istnieje(osoba(X,Y,data(_,_,U),pracuje(_,P))),U < 1950,P < 3000.
