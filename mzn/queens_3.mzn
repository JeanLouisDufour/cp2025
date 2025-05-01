int: n = 8;
array [1..n,1..n] of var 0..1: qb;

%constraint forall (i in 1..n) (sum (j in 1..n) (qb[i,j]) = 1);
%constraint forall (j in 1..n) (sum (i in 1..n) (qb[i,j]) = 1);
%constraint forall (k in 2..2*n) (sum (i,j in 1..n where i+j=k) (qb[i,j]) <= 1);
%constraint forall (k in 1-n..n-1) (sum (i,j in 1..n where i-j=k) (qb[i,j]) <= 1);

constraint forall (i in 1..n) (count (j in 1..n) (qb[i,j]=1) = 1);
constraint forall (j in 1..n) (count (i in 1..n) (qb[i,j]=1) = 1);
constraint forall (k in 2..2*n) (count (i,j in 1..n where i+j=k) (qb[i,j]=1) <= 1);
constraint forall (k in 1-n..n-1) (count (i,j in 1..n where i-j=k) (qb[i,j]=1) <= 1);