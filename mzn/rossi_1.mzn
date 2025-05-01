enum D2 = {a,b,c,d};
set of D2: D1 = {a,b,c};

% P1
enum V1 = {x,y,z};
array[int] of V1:     c_con = [  x,y,z  ];
array[int,int] of D1: c_def = [| a,b,c |];
predicate P1_pred(array[V1] of var D1: val) =
  table(enum2int([val[name] | name in c_con]), enum2int(c_def));

% Check P1 is SAT
%array[V1] of var D1: val1; constraint P1_pred(val1);

% P2
enum V2 = {x_,y_,z_, v};
array[int] of V2:     c1_con = [ x_,v  ];
array[int,int] of D2: c1_def = [| a,d |];
array[int] of V2:     c2_con = [ y_,v  ];
array[int,int] of D2: c2_def = [| b,d |];
array[int] of V2:     c3_con = [ z_,v  ];
array[int,int] of D2: c3_def = [| c,d |];
predicate P2_pred(array[V2] of var D2: val) =
  table(enum2int([val[name] | name in c1_con]), enum2int(c1_def)) /\
  table(enum2int([val[name] | name in c2_con]), enum2int(c2_def)) /\
  table(enum2int([val[name] | name in c3_con]), enum2int(c3_def)) ;

% Check P2 is SAT
%array[V2] of var D2: val2; constraint P2_pred(val2);

% P1 se reduit a P2 :
% version en dur
constraint true \/
  forall(_x,_y,_z in D1)(P1_pred(array1d(V1,[_x,_y,_z])) ->
    exists(_x_,_y_,_z_,_v in D2)(
      P2_pred(array1d(V2,[_x_,_y_,_z_,_v])) /\
      _x = _x_ /\ _y = _y_ /\ _z = _z_
    )
  );
% version inference
array[D2,D2,D2,D2] of var D1: x_from_P2;
array[D2,D2,D2,D2] of var D1: y_from_P2;
array[D2,D2,D2,D2] of var D1: z_from_P2;
constraint true \/
  forall(_x,_y,_z in D1)(P1_pred(array1d(V1,[_x,_y,_z])) ->
    exists(_x_,_y_,_z_,_v in D2)(
      P2_pred(array1d(V2,[_x_,_y_,_z_,_v])) /\
      _x = x_from_P2[_x_,_y_,_z_,_v] /\
      _y = y_from_P2[_x_,_y_,_z_,_v] /\
      _z = z_from_P2[_x_,_y_,_z_,_v]
    )
  );
  
% P2 ne se reduit pas à P1
%array[D1,D1,D1] of var D2: x__from_P1;
%array[D1,D1,D1] of var D2: y__from_P1;
%array[D1,D1,D1] of var D2: z__from_P1;
%array[D1,D1,D1] of var D2: v_from_P1;
array[D1,D1,D1] of array[1..4] of var D2: P2_from_P1;
constraint %true \/
  forall(_x_,_y_,_z_,_v in D2)(P2_pred(array1d(V2,[_x_,_y_,_z_,_v])) ->
    exists(_x,_y,_z in D1)(
      P1_pred(array1d(V1,[_x,_y,_z])) /\
%      _x_ = x__from_P1[_x,_y,_z] /\
%      _y_ = y__from_P1[_x,_y,_z] /\
%      _z_ = z__from_P1[_x,_y,_z] /\
%      _v  =  v_from_P1[_x,_y,_z]
      [_x_,_y_,_z_,_v] = P2_from_P1[_x,_y,_z]
    )
  ); 
