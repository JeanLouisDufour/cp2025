% Rather than specifying a solution in terms of which column the queen of each row is in,
% we might just as well give it in terms of which square each of the queens is in.
% Therefore, associate a variable zf with each of the q queens,
% and let each variable take a value indicating the square in which it will be placed.
% Labeling the squares in some way from 1 to g2, the domains are thus {1 2 . . g2}, the same for each variable.

include "alldifferent.mzn";

int: n = 8;
array [1..n] of array[1..2] of var 1..n: q2;

constraint alldifferent([ q2[i][1] | i in 1..n]);
constraint alldifferent([ q2[i][2] | i in 1..n]);
constraint alldifferent([ q2[i][1]+q2[i][2] | i in 1..n]);
constraint alldifferent([ q2[i][1]-q2[i][2] | i in 1..n]);
