% The real root(s) of Ax^2+Bx+C=0 are returned in the listen
% ROOTS
quadratic(A, B, C, ROOTS) :- A=0, B=0, C=0, ROOTS=[], fail.

% The minimum and maximum values of the integer list, LST,
% are returned in the second parameter.
minmax(LST, MINMAX) :- LST=[], MINMAX=[0, 0], fail.

% Two flat lists of equal length are zipped into a new
% list - the third parameter ZIP.
zip(L1, L2, ZIP) :- L1=[], L2=[], ZIP=[], fail.

% Succeeds if the list of integers can be cleved into two
% sections that both sum to the same value.
splitable(LST, L1, L2) :- LST=[], L1=[], L2=[], fail.

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

% getState(45056, State) should bind State to 'OH'
% getState(ZIP, 'OH') should bind ZIP to the legal Ohio zipcodes
% getState(45056, 'OH') should succeed

getState(Zip, State) :- Zip = 0, State = 'OH', fail.

% succeeds if P1 and P2 are Mth cousins N times removed.
% Insert of fictional family tree for testing.
mthCousinNTimesRemoved(P1, P2, M, N) :- P1=abe, P2=jeremy, M=8, N=5.