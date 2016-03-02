% The real root(s) of Ax^2+Bx+C=0 are returned in the listen
% ROOTS
quadratic(A, B, C, ROOTS) :- A=0, B=0, C=0, ROOTS=[], fail.

% The minimum and maximum values of the integer list, LST,
% are returned in the second parameter.
minmax([], []).
minmax([H], [H, H]).
minmax(LST, [MIN, MAX]) :- min(LST, MIN), max(LST, MAX).

min([N], N).
min([H | T], MIN) :- min(T, Y), H =< Y, MIN is H.
min([H | T], MIN) :- min(T, Y), H > Y, MIN is Y.

max([N], N).
max([H | T], MAX) :- max(T, Y), H >= Y, MAX is H.
max([H | T], MAX) :- max(T, Y), H < Y, MAX is Y.

% Two flat lists of equal length are zipped into a new
% list - the third parameter ZIP.
% zip(L1, L2, ZIP) :- L1=[], L2=[], ZIP=[], fail.
zip([], [], []).
zip([H1 | T1], [H2 | T2], ZIP) :- zip(T1, T2, Y), append([[H1, H2]], Y, ZIP).

% Succeeds if the list of integers can be cleved into two
% sections that both sum to the same value.
splitable([], [], []).
splitable(LST, L1, L2) :- append(L1, L2, LST), sum(L1, X), sum(L2, Y), X = Y.
% :- sum(left half) = sum(right half)

sum([], 0).
sum([H | T], SUM) :- sum(T, X), SUM is X + H.

% S1, S2, and S3 are flat lists representing a set of integers. 
% S3 is the union of S1 and S2.
union(S1, S2, S3) :- S1=[], S2=[], S3=[], fail.

% Succeeds if LST is a list of integers in ascending order.
% issorted(LST) :- LST=[], fail.
issorted([]).
issorted([_]).
issorted([H | [N | T]]) :- H =< N, issorted([N | T]).

% Given any combination of input parameters, finds
% consistent variable instatiations.
getStateInfo(Place, State, Zip) :- Place='Oxford', State='OH', Zip=45056, fail.

% succeeds if P1 and P2 are Mth cousins N times removed.
% Insert of fictional family tree for testing.
mthCousinNTimesRemoved(P1, P2, M, N) :- P1=abe, P2=jeremy, M=8, N=5.