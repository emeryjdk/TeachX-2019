settings.outformat = "pdf";       //Enable to output pdf files directly.
settings.outformat = "prc";     //Enable to output prc files to load into TeX
import solids;                    //Enables filling and drawing of surfaces of revolution
import three;											//Enables 3D plotting
size(7.5cm,0);
viewportmargin=4mm;
currentprojection=orthographic(
camera=(9,6,2),
up=(0,0,1),
target=(0,0,0),
zoom=0.8,
center=true); 										//Center puts rotation at center.
pen color=blue+white+opacity(0.8);		//High opacity - for solid sphere slices.
pen color2=blue+white+opacity(0.8);   //Low opacity - for full atoms.
pen color3=green+blue+white+opacity(0.4);   //Medium opacity - for middle atom.
pen colorVoid=gray+white+opacity(0.8);

real r=1;												  //Atomic radius
real a=4*r/sqrt(3);								//Lattice Parameter
real sf=0.5;
real sf2=sf*0.29;

pair F(real x) {return (x,sqrt(r^2-x^2));}		//Equation for a unit circle in 2D - for rotation.

path p1=graph(F,0,-r,operator ..)--(-r,0)--(0,0)--cycle;   //Create path to be rotated.
path3 p31=rotate(90,Y)*path3(p1);													 //Rotate path 90 degrees about Y.

render render=render(compression=0.5,merge=true); 				 //Set render field. 0.5 is low resolution.

triple p000 = a*(0,0,0);
triple p100 = a*(1,0,0);
triple p010 = a*(0,1,0);
triple p001 = a*(0,0,1);
triple p110 = a*(1,1,0);
triple p101 = a*(1,0,1);
triple p011 = a*(0,1,1);
triple p111 = a*(1,1,1);
triple phhh = a*(1/2,1/2,1/2);
triple ph3hh = a*(3/2,1/2,1/2);

draw(p000--p010--p110--p100--cycle,black+linewidth(0.5));
//top
draw(p001--p011--p111--p101--cycle,black+linewidth(0.5));
//z-lines
draw(p000--p001,black+linewidth(0.5));
draw(p010--p011,black+linewidth(0.5));
draw(p100--p101,black+linewidth(0.5));
draw(p110--p111,black+linewidth(0.5));

//Create transparent unit spheres to represent full atoms. Corners:
draw(shift(0,0,0)*scale(sf*r,sf*r,sf*r)*unitsphere, color, render);
draw(shift(a,0,0)*scale(sf*r,sf*r,sf*r)*unitsphere, color, render);
draw(shift(0,a,0)*scale(sf*r,sf*r,sf*r)*unitsphere, color, render);
draw(shift(0,0,a)*scale(sf*r,sf*r,sf*r)*unitsphere, color, render);
draw(shift(a,a,0)*scale(sf*r,sf*r,sf*r)*unitsphere, color, render);
draw(shift(0,a,a)*scale(sf*r,sf*r,sf*r)*unitsphere, color, render);
draw(shift(a,0,a)*scale(sf*r,sf*r,sf*r)*unitsphere, color, render);
draw(shift(a,a,a)*scale(sf*r,sf*r,sf*r)*unitsphere, color, render);
//BCC atom
draw(shift(a/2,a/2,a/2)*scale(sf*r,sf*r,sf*r)*unitsphere, color2, render);
//draw(shift(a/2,3a/2,a/2)*scale(sf*r,sf*r,sf*r)*unitsphere, color3, render);

triple phq0 = a*(1/2,1/4,0);
triple pqh0 = a*(1/4,1/2,0);
triple p3qh0 = a*(3/4,1/2,0);
triple ph3q0 = a*(1/2,3/4,0);
triple ph0q = a*(1/2,0,1/4);
triple ph03q = a*(1/2,0,3/4);
triple pq0h = a*(1/4,0,1/2);
triple p3q0h = a*(3/4,0,1/2);
triple p0hq = a*(0,1/2,1/4);
triple p0h3q = a*(0,1/2,3/4);
triple p0qh = a*(0,1/4,1/2);
triple p03qh = a*(0,3/4,1/2);


draw(shift(phq0)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(pqh0)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(p3qh0)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(ph3q0)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(ph0q)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(ph03q)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(pq0h)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(p3q0h)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(p0hq)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(p0h3q)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(p0qh)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(p03qh)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);

draw(shift(0,0,a)*shift(phq0)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(0,0,a)*shift(pqh0)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(0,0,a)*shift(p3qh0)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(0,0,a)*shift(ph3q0)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(0,a,0)*shift(ph0q)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(0,a,0)*shift(ph03q)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(0,a,0)*shift(pq0h)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(0,a,0)*shift(p3q0h)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(a,0,0)*shift(p0hq)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(a,0,0)*shift(p0h3q)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(a,0,0)*shift(p0qh)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);
draw(shift(a,0,0)*shift(p03qh)*scale(sf2*r,sf2*r,sf2*r)*unitsphere, colorVoid, render);

//Squares for visualization.
draw(ph0q--pq0h--ph03q--p3q0h--cycle,black+linewidth(0.5));
draw(p0hq--p03qh--p0h3q--p0qh--cycle,black+linewidth(0.5));
draw(phq0--p3qh0--ph3q0--pqh0--cycle,black+linewidth(0.5));
draw(shift(0,a,0)*(ph0q--pq0h--ph03q--p3q0h--cycle),black+linewidth(0.5));
draw(shift(a,0,0)*(p0hq--p03qh--p0h3q--p0qh--cycle),black+linewidth(0.5));
draw(shift(0,0,a)*(phq0--p3qh0--ph3q0--pqh0--cycle),black+linewidth(0.5));

//Directions
draw((a-sf2*r/sqrt(2),3a/4+sf2*r/sqrt(2),a/2)--((3a/4+sf2*r/sqrt(2),a-sf2*r/sqrt(2),a/2)),red+linewidth(1),ArcArrow3());
draw((a,3a/4-sf2*r/sqrt(2),a/2+sf2*r/sqrt(2))--((a,a/2+sf2*r/sqrt(2),3a/4-sf2*r/sqrt(2))),red+linewidth(1),ArcArrow3());
draw((a,3a/4-sf2*r/sqrt(2),a/2-sf2*r/sqrt(2))--((a,a/2+sf2*r/sqrt(2),a/4+sf2*r/sqrt(2))),red+linewidth(1),ArcArrow3());

//label("$O$",(0,0,0),NW);

//xaxis3(Label("$x$",1),xmax=a+1,Arrow3);
//yaxis3(Label("$y$",1),ymax=a+1,Arrow3);
//zaxis3(Label("$z$",1),zmax=a+1,Arrow3);