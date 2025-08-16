# cp2025

modif 1
modif 2
modif 3

1977
Kosugi, M. and T. Teranishi, 1977, 
“Construction of a Curve Segment with Two Circular Arcs”,
 Transactions of the IECE of Japan, section E, vol. E60, No 11, p. 684 

2006
AUTONOMOUS NAVIGATION AND OBSTACLE AVOIDANCE FOR UNMANNED SURFACE VEHICLES
Jacoby Larson, Michael Bruch, and John Ebken 

 Also, since A* uses a cost analysis at each step, inserting an added cost for proximity to obstacles was a natural process. 
 This cost allows the USV to set a safety barrier around obstacles, which can also be adjusted for different obstacles.
 This cost analysis also can be extended for other costs such as direction, shipping lanes, soft obstacles, route time, etc. 
 
 

2007
Advances in Autonomous Obstacle Avoidance for Unmanned Surface Vehicles 
Jacoby Larson, Michael Bruch, Ryan Halterman, John Rogers, Robert Webster


2009
Real Time Path Planning and Obstacle Avoidance for Security Related USVs Operating in Harbour Fields
Giuseppe Casalino, DIST, University of Genoa, Genoa/Italy, casalino@dist.unige.it  
Alessio Turetta, DIST, University of Genoa, Genoa/Italy, turetta@dist.unige.it  
Enrico Simetti, DIST, University of Genoa, Genoa/Italy, simetti@dist.unige.it  

Aggarwal and Fujimura (1994) showed that adding a third dimension of time 
and plotting the location of the moving obstacles along that three-dimensional space 
helps with finding a more optimal solution;
we decided to use this idea in our implementation of the collision checking routine.  

In order to take into account the moving obstacles, 
in Larson et al. (2006,2007) the authors find a particular moment in time 
where the obstacle is of greatest threat for the motion of the USV, 
for example by calculating the minimum distance between the two objects in time along their respective path. 
Then they proceed to build the so called projected obstacle area (POA), 
which is the area the moving obstacle could occupy at that time in the future; 
this area is then saved into the occupancy grid, 
which means that a projection from the space (x,y,t) to the plane (x,y) was carried out, 
making possible to find a solution to the original avoidance problem within seconds. 
There is however no guarantee about the optimality of the solution, in fact it could even be unacceptable. 
This is the reason why there is need for a second layer that implements an extremely fast reactive obstacle avoidance system. 
However, the previous procedure increases the likelihood of collision avoidance making the job of the reactive system easier. 
This is very similar to what is done in Rathbun et al. (2002). 