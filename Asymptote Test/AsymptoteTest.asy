settings.outformat = "pdf";       //Enable to output pdf files directly.
//settings.outformat = "prc";     //Enable to output prc files to load into TeX
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

//Unitcube
//draw(unitcube,green);

//Unitcone
//draw(shift(2,3,4)*scale(5,20,7)*unitcone,paleblue);

//Arrows and stuff
//draw((0,0,0)--(1,1,1),green,Arrows3);
//draw((0,1,0)--(1,0,1),blue,Bars3);

//Now with labels!
currentprojection=perspective(1/3,-1,1/2);
draw((0,0,0)--(1,0,0)--(1,1,0)--(0,1,0)--cycle,red);
draw((0,0,0)--(0,0,1),red);
draw((0,1,0)--(0,1,1),red);
draw((1,1,0)--(1,1,1),red);
draw((1,0,0)--(1,0,1),red);
draw((0,0,1)--(1,0,1)--(1,1,1)--(0,1,1)--cycle,red);
draw((0,0,0)--(1,0,0)--(1,1,0)--cycle,red);
draw((0,0,0)--(1,1,0)--(1,1,1)--cycle,blue);
label("$o$",(0,0,0),NW);
label("$x=1$",(0.5,0,0),S);
label("$y=1$",(1,1,0.5),E);
label("$z=1$",(1,0.5,0),SE);
label("$c$",(0.5,0.5,0.5),N);