c_to_f :-
    write('Write temp in celsius'),
    read(Temp),
    process(Temp).

process(stop) :- !.
process(Temp):-
    F is Temp*(9/5) + 32,
    write('Temp in fahrenheit is '),write(F),nl.
