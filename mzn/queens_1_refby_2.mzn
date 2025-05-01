int: n = 4;
include "alldifferent.mzn";

% queens 1

% queen in column i is in row q[i]
predicate Q1(array [1..n] of var 1..n: q) =
  alldifferent(q)                       /\  % distinct rows
  alldifferent([ q[i] + i | i in 1..n]) /\  % distinct diagonals
  alldifferent([ q[i] - i | i in 1..n]) ;   % upwards+downwards

% queens 2

predicate Q2(array [1..n] of array[1..2] of var 1..n: q2) =
  alldifferent([ q2[i][1] | i in 1..n]) /\
  alldifferent([ q2[i][2] | i in 1..n]) /\
  alldifferent([ q2[i][1]+q2[i][2] | i in 1..n]) /\
  alldifferent([ q2[i][1]-q2[i][2] | i in 1..n]) ;
  
% Q1 refined by Q2

constraint true /\
  forall (q1,q2,q3,q4 in 1..n) (Q1([q1,q2,q3,q4]) ->
    exists (r1,c1,r2,c2,r3,c3,r4,c4 in 1..n) ( Q2([[r1,c1],[r2,c2],[r3,c3],[r4,c4]]) /\
      c1 = 1 /\ r1 = q1 /\
      c2 = 2 /\ r2 = q2 /\
      c3 = 3 /\ r3 = q3 /\
      c4 = 4 /\ r4 = q4
    )
  );
  
% Q2 refined by Q1
constraint true \/
  forall (r1,c1,r2,c2,r3,c3,r4,c4 in 1..n) ( Q2([[r1,c1],[r2,c2],[r3,c3],[r4,c4]]) ->
    exists (q1,q2,q3,q4 in 1..n) (Q1([q1,q2,q3,q4]) /\
      c1 = 1 /\ r1 = q1 /\
      c2 = 2 /\ r2 = q2 /\
      c3 = 3 /\ r3 = q3 /\
      c4 = 4 /\ r4 = q4
    )
  );
