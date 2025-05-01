enum D = {a,b,c,d}; % common

enum V = {x,y,z,v};
array[int] of V:     c1_con = [  x,y,z  ];
array[int,int] of D: c1_def = [| a,b,c |];
array[int] of V:     c2_con = [  y,v  ];
array[int,int] of D: c2_def = [| c,d |];
predicate P1_pred(array[V] of var D: val) =
  table(enum2int([val[name] | name in c1_con]), enum2int(c1_def)) /\
  table(enum2int([val[name] | name in c2_con]), enum2int(c2_def)) ;

% test
array[V] of var D: val;
constraint P1_pred(val);

% typage de P2 plus complexe
predicate P2_pred(array[1..3] of var D: w1, array[1..2] of var D: w2) =
  w1 = [a,b,c] /\ w2 = [c,d] ;

% P1 peut etre reduit a P2 :
constraint true \/
  forall(_x,_y,_z,_v in D)(P1_pred(array1d(V,[_x,_y,_z,_v])) ->
    exists(_w11,_w12,_w13,_w21,_w22 in D)(
      P2_pred([_w11,_w12,_w13],[_w21,_w22]) /\
      [_x,_y,_z,_v] = [_w11,_w12,_w13,_w22]
    )
  );
  
% P2 peut etre reduit a P1 :
constraint true \/
  forall(_w11,_w12,_w13,_w21,_w22 in D)(P2_pred([_w11,_w12,_w13],[_w21,_w22]) ->
    exists(_x,_y,_z,_v in D)(
      P1_pred(array1d(V,[_x,_y,_z,_v])) /\
      [_w11,_w12,_w13] = [_x,_y,_z] /\ [_w21,_w22] = [_y,_v]
    )
  );
