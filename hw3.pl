% Caroline Danzi
% Dr. Zmuda
% CSE 465 Comparative Programming Languages
% Homework 3 - Prolog
% Note: I worked with Kyle B. and discussed design ideas.

% The real root(s) of Ax^2+Bx+C=0 are returned in the listen
% ROOTS
% If just kx^2, there is only one root and it is zero.
quadratic(_, 0, 0, [0]) :- !.
% If taking the square root of a negative number, sqrt_over_2a will fail so we should just return the empty list.
quadratic(A, B, C, ROOTS) :- \+ sqrt_over_2a(A, B, C, _), ROOTS = []. 
% Otherwise, we should compute -b/2a and sqrt(b^2 - 4ac)/2a, then find the two roots 
quadratic(A, B, C, ROOTS) :- neg_b_over_2a(A, B, X), sqrt_over_2a(A, B, C, Y), P is X + Y, N is X - Y, ROOTS = [P, N].
neg_b_over_2a(A, B, Result) :- X is 0 - B, Y is 2 * A, Result is X / Y.
sqrt_over_2a(A, B, C, Result) :- X is B * B, Y is 4 * A * C, Z is X - Y, Z >= 0, W is sqrt(Z), T is 2 * A, Result is W / T.


% The minimum and maximum values of the integer list, LST,
% are returned in the second parameter.
minmax([], []).
minmax([H], [H, H]) :- !.
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

sum([], 0).
sum([H | T], SUM) :- sum(T, X), SUM is X + H.

% S1, S2, and S3 are flat lists representing a set of integers. 
% S3 is the union of S1 and S2.
union([], [], []).
union([], L, L).
% if S2 already has H, do not add it to S3
union([H|T], S2, S3) :- contains(S2, H), union(T, S2, S3).
% if S2 does not have H, add it to S3
union([H|T], S2, [H|S3]) :- \+ contains(S2, H), union(T, S2, S3).

% add an element X to Result only if it does not appear in LST
addNoDups(X, LST, Result) :- contains(LST, X), Result = LST.
addNoDups(X, LST, Result) :- \+ contains(LST, X), Result = [X | LST].

% based on contains0 class code
contains([H|_], X) :- H = X, !.
contains([_|T] , X) :- contains(T, X).

% Succeeds if LST is a list of integers in ascending order.
% issorted(LST) :- LST=[], fail.
issorted([]).
issorted([_]).
issorted([H | [N | T]]) :- H =< N, issorted([N | T]).

% Given any combination of input parameters, finds
% consistent variable instatiations.
% format: location(99553,'Akutan','AK','Aleutians East',54.143,-165.7854).
getStateInfo(Place, State, Zip) :- location(Zip, Place, State, _, _, _).

% succeeds if P1 and P2 are Mth cousins N times removed.
% Insert of fictional family tree for testing.
mthCousinNTimesRemoved(P1, P2, M, N) :- P1=abe, P2=jeremy, M=8, N=5.