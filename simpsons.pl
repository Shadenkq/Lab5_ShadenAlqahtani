
% FACTS

% Males
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Females
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent relationships
parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).


% RULES

% Father
father(X,Y) :-
    parent(X,Y),
    male(X).

% Mother
mother(X,Y) :-
    parent(X,Y),
    female(X).

% Son
son(X,Y) :-
    parent(Y,X),
    male(X).

% Daughter
daughter(X,Y) :-
    parent(Y,X),
    female(X).

% Brother
brother(X,Y) :-
    parent(P,X),
    parent(P,Y),
    male(X),
    X \= Y.

% Sister
sister(X,Y) :-
    parent(P,X),
    parent(P,Y),
    female(X),
    X \= Y.

% Grandfather
grandfather(X,Z) :-
    parent(X,Y),
    parent(Y,Z),
    male(X).

% Aunt
aunt(X,Z) :-
    parent(P,X),
    parent(P,Y),
    parent(Y,Z),
    female(X),
    X \= Y.

% Uncle
uncle(X,Z) :-
    parent(P,X),
    parent(P,Y),
    parent(Y,Z),
    male(X),
    X \= Y.

% Cousin
cousin(X,Z) :-
    parent(P,X),
    parent(Q,Z),
    parent(G,P),
    parent(G,Q),
    P \= Q,
    X \= Z.

% Ancestor
ancestor(X,Z) :-
    parent(X,Z).

ancestor(X,Z) :-
    parent(X,Y),
    ancestor(Y,Z).
