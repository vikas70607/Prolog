%Member operation
list_member(X,[X,_]).
list_member(X,[_|TAIL]):- list_member(X,TAIL).

%Length Calculation
list_length([],0).
list_length([_|TAIL],N):- list_length(TAIL,N1), N is N1 + 1.

%Concatenation
list_concat([],L,L).
list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3).

%Deletion
list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

%Append into list
list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).
list_append(A,T,T) :- list_member(A,T),!.
list_append(A,T,[A|T]).

%Insertion
list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).
list_insert(X,L,R) :- list_delete(X,R,L).

%Reverse
list_concat([],L,L).
list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3).
list_rev([],[]).
list_rev([Head|Tail],Reversed) :-
   list_rev(Tail, RevTail),list_concat(RevTail, [Head],Reversed).

%Union
list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).
list_union([X|Y],Z,W) :- list_member(X,Z),list_union(Y,Z,W).
list_union([X|Y],Z,[X|W]) :- \+ list_member(X,Z), list_union(Y,Z,W).
list_union([],Z,Z).

%Intersection
list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).
list_intersect([X|Y],Z,[X|W]) :-
   list_member(X,Z), list_intersect(Y,Z,W).
list_intersect([X|Y],Z,W) :-
   \+ list_member(X,Z), list_intersect(Y,Z,W).
list_intersect([],Z,[]).
