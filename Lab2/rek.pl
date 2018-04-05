fibo(0,0).
fibo(1,1).
fibo(Number,Result) :-
	Number > 1,
	FirstArg is Number-1,
	SecondArg is FirstArg-1,
	fibo(FirstArg,FirstR),
	fibo(SecondArg,SecondR),
	Result is FirstR + SecondR.
