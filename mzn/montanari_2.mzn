% recherche d'une relation ternaire non binarisable

set of int : D = 1..2;
array[D,D,D] of var bool : R123;
array[D,D,D] of var bool : _R123_;

array[D,D] of var bool : R12;
array[D,D] of var bool : R13;
array[D,D] of var bool : R23;

% projections

constraint forall (i,j in D) (R12[i,j] = exists(k in D)(R123[i,j,k]));
constraint forall (i,k in D) (R13[i,k] = exists(j in D)(R123[i,j,k]));
constraint forall (j,k in D) (R23[j,k] = exists(i in D)(R123[i,j,k]));

% reconstruction

constraint forall (i,j,k in D) (_R123_[i,j,k] = (R12[i,j] /\ R23[j,k] /\ R13[i,k]));

% UNSAT
%constraint not( forall (i,j,k in D) (R123[i,j,k] -> _R123_[i,j,k]) );
% SAT
%constraint R123 != _R123_;
% UNSAT
constraint sum(R123) = sum(_R123_)-5; % 4 est SAT
