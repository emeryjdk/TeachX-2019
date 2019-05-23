settings.outformat = "pdf";       //Enable to output pdf files directly.
//settings.outformat = "prc";     //Enable to output prc files to load into TeX
import solids;                    //Enables filling and drawing of surfaces of revolution
import three;											//Enables 3D plotting

size(7.5cm,0);
viewportmargin=4mm;
currentprojection=orthographic(
camera=(9,6,4),
up=(0,0,1),
target=(0,0,0),
zoom=0.8,
center=true);   //Center puts rotation at center

pen colorInter=grey+opacity(0.7);		//High opacity - for solid sphere slices.
pen colorInter2=grey+opacity(1);		//High opacity - for solid sphere slices.
pen colorFCC=blue+opacity(0.7);		  //Medium opacity - for solid sphere slices.
pen colorFCC2=blue+opacity(0.3);		//Low opacity - for solid sphere slices.
pen colorFCC3=blue+white+opacity(0.95);		//Highest opacity - for solid sphere slices.
pen colorFCC4=blue+opacity(0.1);		//Nearly transparent - for solid sphere slices.


real rFCC=1;												  //Atomic radius
real rInter=rFCC*0.414;
real aFCC=4*rFCC/sqrt(2);								//Lattice Parameter
real sf = 0.5;
real sf2 = 1.025;
real rsparse=rFCC*0.25;

pair F(real x) {return (x,sqrt(rFCC^2-x^2));}		//Equation for a unit circle in 2D - for rotation.
path p1=graph(F,0,-rFCC,operator ..)--(-rFCC,0)--(0,0)--cycle;   //Create path to be rotated.
path3 p31=rotate(90,Y)*path3(p1);	

defaultrender.merge=true; 				  //About 12 seconds to load in Adobe.
defaultrender.tessellate=true;      // What. Loads up in 2 sec????


//corner
triple p000 = aFCC*(0,0,0);
triple p100 = aFCC*(1,0,0);
triple p010 = aFCC*(0,1,0);
triple p001 = aFCC*(0,0,1);
triple p110 = aFCC*(1,1,0);
triple p101 = aFCC*(1,0,1);
triple p011 = aFCC*(0,1,1);
triple p111 = aFCC*(1,1,1);
//face-centered
triple phh0 = aFCC*(0.5,0.5,0.0);
triple phh1 = aFCC*(0.5,0.5,1.0);
triple ph0h = aFCC*(0.5,0.0,0.5);
triple ph1h = aFCC*(0.5,1.0,0.5);
triple p0hh = aFCC*(0.0,0.5,0.5);
triple p1hh = aFCC*(1.0,0.5,0.5);
triple ph13h = aFCC*(0.5,1,1.5);
//quarter-positioned
triple pqqq =   aFCC*(0.25,0.25,0.25);
triple p3qqq =  aFCC*(0.75,0.25,0.25);
triple p3qq3q = aFCC*(0.75,0.25,0.75);
triple p3q3qq = aFCC*(0.75,0.75,0.25);
triple pq3q3q = aFCC*(0.25,0.75,0.75);

begingroup3("Unit Cell");
draw(scale(aFCC,aFCC,aFCC)*unitbox);
//For octants, check out unitoctant.asy. I don't get how that patch command works to create s, where where it is grabbing octant1.
endgroup3();


begingroup3("Clipped Atoms");
draw(surface(shift(0,0,0)*revolution(p31,Z,270,360)),colorFCC3);
draw(surface(shift(aFCC,0,0)*revolution(p31,Z,0,90)),colorFCC3);
draw(surface(shift(0,aFCC,0)*revolution(p31,Z,180,270)),colorFCC3);
draw(surface(shift(aFCC,aFCC,0)*revolution(p31,Z,90,180)),colorFCC3);
draw(surface(shift(0,0,aFCC)*rotate(180,X)*rotate(270,Z)*revolution(p31,Z,270,360)),colorFCC3);
draw(surface(shift(aFCC,0,aFCC)*rotate(180,X)*rotate(90,Z)*revolution(p31,Z,0,90)),colorFCC3);
draw(surface(shift(0,aFCC,aFCC)*rotate(180,X)*rotate(90,Z)*revolution(p31,Z,180,270)),colorFCC3);
draw(surface(shift(aFCC,aFCC,aFCC)*rotate(180,X)*rotate(270,Z)*revolution(p31,Z,90,180)),colorFCC3);

//Create and translate edges for partial spheres.
surface s11=rotate(90,Y)*surface(p1); draw(s11,colorFCC3);
surface s12=rotate(180,Y)*rotate(-90,X)*surface(p1); draw(s12,colorFCC3);
surface s21=shift(aFCC,0,0)*rotate(90,Y)*surface(p1); draw(s21,colorFCC3);
surface s22=shift(aFCC,0,0)*rotate(90,Y)*rotate(-90,X)*surface(p1); draw(s22,colorFCC3);
surface s31=shift(0,aFCC,0)*rotate(90,Y)*rotate(180,X)*surface(p1); draw(s31,colorFCC3);
surface s32=shift(0,aFCC,0)*rotate(90,Y)*rotate(90,X)*surface(p1); draw(s32,colorFCC3);
surface s41=shift(aFCC,aFCC,0)*rotate(90,Y)*rotate(90,Z)*surface(p1); draw(s41,colorFCC3);
surface s42=shift(aFCC,aFCC,0)*rotate(90,Y)*rotate(-90,X)*surface(p1); draw(s42,colorFCC3);

surface sz11=shift(0,0,aFCC)*rotate(-90,Y)*surface(p1); draw(sz11,colorFCC3);
surface sz12=shift(0,0,aFCC)*rotate(-90,Y)*rotate(-90,X)*surface(p1); draw(sz12,colorFCC3);
surface sz21=shift(aFCC,0,aFCC)*rotate(270,Y)*rotate(90,X)*surface(p1); draw(sz21,colorFCC3);
surface sz22=shift(aFCC,0,aFCC)*rotate(90,Y)*rotate(270,Z)*surface(p1); draw(sz22,colorFCC3);
surface sz31=shift(0,aFCC,aFCC)*rotate(270,Y)*rotate(180,X)*surface(p1); draw(sz31,colorFCC3);
surface sz32=shift(0,aFCC,aFCC)*rotate(180,Y)*rotate(90,X)*surface(p1); draw(sz32,colorFCC3);
surface sz41=shift(aFCC,aFCC,aFCC)*rotate(270,Y)*rotate(90,X)*surface(p1); draw(sz41,colorFCC3);
surface sz42=shift(aFCC,aFCC,aFCC)*rotate(270,Y)*rotate(180,X)*surface(p1); draw(sz42,colorFCC3);

draw(shift(aFCC/2,aFCC/2,0)*unithemisphere, colorFCC3);
draw(shift(aFCC/2,aFCC/2,0)*unitdisk, colorFCC3);
draw(shift(aFCC/2,0,aFCC/2)*rotate(270,X)*unithemisphere, colorFCC3);
draw(shift(aFCC/2,0,aFCC/2)*rotate(270,X)*unitdisk, colorFCC3);
draw(shift(0,aFCC/2,aFCC/2)*rotate(90,Y)*unithemisphere, colorFCC3);
draw(shift(0,aFCC/2,aFCC/2)*rotate(90,Y)*unitdisk, colorFCC3);
draw(shift(aFCC,aFCC/2,aFCC/2)*rotate(270,Y)*unithemisphere, colorFCC3);
draw(shift(aFCC,aFCC/2,aFCC/2)*rotate(270,Y)*unitdisk, colorFCC3);
draw(shift(aFCC/2,aFCC,aFCC/2)*rotate(90,X)*unithemisphere, colorFCC3);
draw(shift(aFCC/2,aFCC,aFCC/2)*rotate(90,X)*unitdisk, colorFCC3);
draw(shift(aFCC/2,aFCC/2,aFCC)*rotate(180,Y)*unithemisphere, colorFCC3);
draw(shift(aFCC/2,aFCC/2,aFCC)*rotate(180,Y)*unitdisk, colorFCC3);
endgroup3();


//Create transparent unit spheres to represent full atoms.
begingroup3("Unit Cell Atoms - Reduced Sphere");
draw(shift(0,0,0)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0 0 0");
draw(shift(aFCC,0,0)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="1 0 0");
draw(shift(0,aFCC,0)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0 1 0");
draw(shift(0,0,aFCC)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0 0 1");
draw(shift(aFCC,aFCC,0)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="1 1 0");
draw(shift(0,aFCC,aFCC)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0 1 1");
draw(shift(aFCC,0,aFCC)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="1 0 1");
draw(shift(aFCC,aFCC,aFCC)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="1 1 1");
draw(shift(aFCC/2,aFCC/2,0)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0.5 0.5 0");
draw(shift(aFCC/2,0,aFCC/2)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0.5 0 0.5");
draw(shift(0,aFCC/2,aFCC/2)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0 0.5 0.5");
draw(shift(aFCC,aFCC/2,aFCC/2)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="1 0.5 0.5");
draw(shift(aFCC/2,aFCC,aFCC/2)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0.5 1 0.5");
draw(shift(aFCC/2,aFCC/2,aFCC)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0.5 0.5 1");
endgroup3();

//Create transparent unit spheres to represent full atoms.
begingroup3("Unit Cell Atoms - Hard Sphere");
draw(shift(0,0,0)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0 0 0");
draw(shift(aFCC,0,0)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="1 0 0");
draw(shift(0,aFCC,0)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0 1 0");
draw(shift(0,0,aFCC)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0 0 1");
draw(shift(aFCC,aFCC,0)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="1 1 0");
draw(shift(0,aFCC,aFCC)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0 1 1");
draw(shift(aFCC,0,aFCC)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="1 0 1");
draw(shift(aFCC,aFCC,aFCC)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="1 1 1");
draw(shift(aFCC/2,aFCC/2,0)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0.5 0.5 0");
draw(shift(aFCC/2,0,aFCC/2)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0.5 0 0.5");
draw(shift(0,aFCC/2,aFCC/2)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0 0.5 0.5");
draw(shift(aFCC,aFCC/2,aFCC/2)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="1 0.5 0.5");
draw(shift(aFCC/2,aFCC,aFCC/2)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0.5 1 0.5");
draw(shift(aFCC/2,aFCC/2,aFCC)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC4, name="0.5 0.5 1");
endgroup3();

//Atoms outside the unit cell.
begingroup3("Extra Unit Cell Atoms");
draw(shift(aFCC/2,aFCC,3*aFCC/2)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC,name="0.5 1 1.5");
draw(shift(aFCC/2,3*aFCC/2,aFCC)*scale(sf*rFCC,sf*rFCC,sf*rFCC)*unitsphere, colorFCC, name="0.5 1.5 1");
endgroup3();


begingroup3("Interstitial Atoms - Small");
draw(shift(aFCC/2,0,0)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0.5 0 0");
draw(shift(0,aFCC/2,0)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0 0.5 0");
draw(shift(aFCC,aFCC/2,0)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="1 0.5 0");
draw(shift(aFCC/2,aFCC,0)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0.5 1 0");

draw(shift(0,0,aFCC/2)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0 0 0.5");
draw(shift(aFCC,0,aFCC/2)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="1 0 0.5");
draw(shift(0,aFCC,aFCC/2)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0 1 0.5");
draw(shift(aFCC,aFCC,aFCC/2)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="1 1 0.5");
draw(shift(aFCC/2,aFCC/2,aFCC/2)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0.5 0.5 0.5");

draw(shift(aFCC/2,0,aFCC)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0.5 0 1");
draw(shift(0,aFCC/2,aFCC)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0 0.5 1");
draw(shift(aFCC,aFCC/2,aFCC)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="1 0.5 1");
draw(shift(aFCC/2,aFCC,aFCC)*scale(sf*rInter,sf*rInter,sf*rInter)*unitsphere, colorInter, name="0.5 1 1");
endgroup3();

begingroup3("Interstitial Atoms - Snug");
draw(shift(aFCC/2,0,0)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0.5 0 0");
draw(shift(0,aFCC/2,0)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0 0.5 0");
draw(shift(aFCC,aFCC/2,0)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="1 0.5 0");
draw(shift(aFCC/2,aFCC,0)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0.5 1 0");

draw(shift(0,0,aFCC/2)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0 0 0.5");
draw(shift(aFCC,0,aFCC/2)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="1 0 0.5");
draw(shift(0,aFCC,aFCC/2)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0 1 0.5");
draw(shift(aFCC,aFCC,aFCC/2)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="1 1 0.5");
draw(shift(aFCC/2,aFCC/2,aFCC/2)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0.5 0.5 0.5");

draw(shift(aFCC/2,0,aFCC)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0.5 0 1");
draw(shift(0,aFCC/2,aFCC)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0 0.5 1");
draw(shift(aFCC,aFCC/2,aFCC)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="1 0.5 1");
draw(shift(aFCC/2,aFCC,aFCC)*scale(rInter,rInter,rInter)*unitsphere, colorInter, name="0.5 1 1");
endgroup3();

//Full close-packed tetrahedron.
begingroup3("Close-packed Tetrahedron");
draw(shift(aFCC/2,aFCC/2,0)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC2, name="0.5 0.5 0");
draw(shift(aFCC/2,0,aFCC/2)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC2, name="0.5 0 0.5");
draw(shift(0,aFCC/2,aFCC/2)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC2, name="0 0.5 0.5");
draw(shift(aFCC,aFCC/2,aFCC/2)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC2, name="1 0.5 0.5");
draw(shift(aFCC/2,aFCC,aFCC/2)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC2, name="0.5 1 0.5");
draw(shift(aFCC/2,aFCC/2,aFCC)*scale(sf2*rFCC,sf2*rFCC,sf2*rFCC)*unitsphere, colorFCC2, name="0.5 0.5 1");
//draw(shift(aFCC/2,aFCC/2,aFCC/2)*scale(rInter,rInter,rInter)*unitsphere, colorInter2, name="0.5 0.5 0.5");
endgroup3();

//surfaces
begingroup3("1/2 1/2 1/2 Octahedron");
draw(surface(phh0--p1hh--ph1h--cycle),grey+opacity(.2));
draw((phh0--p1hh--ph1h--cycle)--cycle,black+linewidth(1));
draw(surface(phh0--ph0h--p1hh--cycle),grey+opacity(.2));
draw((phh0--ph0h--p1hh--cycle)--cycle,black+linewidth(1));
draw(surface(phh0---p0hh--ph1h--cycle),grey+opacity(.2));
draw((phh0--p0hh--ph1h--cycle)--cycle,black+linewidth(1));
draw(surface(phh0--p0hh--ph0h--cycle),grey+opacity(.2));
draw((phh0--p0hh--ph0h--cycle)--cycle,black+linewidth(1));

draw(surface(phh1--p1hh--ph1h--cycle),grey+opacity(.2));
draw((phh1--p1hh--ph1h--cycle)--cycle,black+linewidth(1));
draw(surface(phh1---ph0h--p1hh--cycle),grey+opacity(.2));
draw((phh1--ph0h--p1hh--cycle)--cycle,black+linewidth(1));
draw(surface(phh1--p0hh--ph1h--cycle),grey+opacity(.2));
draw((phh1--p0hh--ph1h--cycle)--cycle,black+linewidth(1));
draw(surface(phh1---p0hh--ph0h--cycle),grey+opacity(.2));
draw((phh1--p0hh--ph0h--cycle)--cycle,black+linewidth(1));
endgroup3();

begingroup3("1/2 1 1 Octahedron");
draw(surface(ph1h--p111--(aFCC/2,3aFCC/2,1aFCC)--cycle),grey+opacity(.2));
draw((ph1h--p111--(aFCC/2,3aFCC/2,1aFCC)--cycle),black+linewidth(1));
draw(surface(ph1h--p111--phh1--cycle),grey+opacity(.2));
draw((ph1h--p111--phh1--cycle),black+linewidth(1));
draw(surface(ph1h--phh1--p011--cycle),grey+opacity(.2));
draw((ph1h--phh1--p011--cycle),black+linewidth(1));
draw(surface(ph1h--p011--(aFCC/2,3aFCC/2,1aFCC)--cycle),grey+opacity(.2));
draw((ph1h--p011--(aFCC/2,3aFCC/2,1aFCC)--cycle),black+linewidth(1));

draw(surface((aFCC/2,aFCC,3aFCC/2)--p111--(aFCC/2,3aFCC/2,1aFCC)--cycle),grey+opacity(.2));
draw(((aFCC/2,aFCC,3aFCC/2)--p111--(aFCC/2,3aFCC/2,1aFCC)--cycle),black+linewidth(1));
draw(surface((aFCC/2,aFCC,3aFCC/2)--p111--phh1--cycle),grey+opacity(.2));
draw(((aFCC/2,aFCC,3aFCC/2)--p111--phh1--cycle),black+linewidth(1));
draw(surface((aFCC/2,aFCC,3aFCC/2)--phh1--p011--cycle),grey+opacity(.2));
draw(((aFCC/2,aFCC,3aFCC/2)--phh1--p011--cycle),black+linewidth(1));
draw(surface((aFCC/2,aFCC,3aFCC/2)--p011--(aFCC/2,3aFCC/2,1aFCC)--cycle),grey+opacity(.2));
draw(((aFCC/2,aFCC,3aFCC/2)--p011--(aFCC/2,3aFCC/2,1aFCC)--cycle),black+linewidth(1));
endgroup3();

//Labels and measures.
begingroup3("Atomic Radii and Lattice Parameters");
//draw((aFCC,rFCC,0)--(aFCC,aFCC,0),red+linewidth(1));
draw((aFCC,aFCC,0)--(aFCC,aFCC,aFCC),red+linewidth(1));
draw((aFCC,0,0)--(aFCC,rFCC,0),black+linewidth(1));
draw((aFCC,0,-0.02*aFCC)--(aFCC,0,0.02*aFCC),black+linewidth(1));
draw((aFCC,rFCC,-0.02*aFCC)--(aFCC,rFCC,0.02*aFCC),black+linewidth(1));
label("$a$",(aFCC,aFCC,aFCC/2),E,red);
label("$r_0$",(aFCC,rFCC/2,0),S,black);
label("$o$",(0,0,0),NW);
endgroup3();

begingroup3("Solution");
label("$4r_0$",(aFCC+0.2*aFCC,aFCC/2,aFCC/2),SE,red);
draw((aFCC,0,0)--(aFCC,aFCC,aFCC),red+linewidth(1));
endgroup3();

begingroup3("Axes");
draw((-0.2,0,0)--(1.5*aFCC,0,0),black+linewidth(1),ArcArrow3());
label("$a$",(1.5*aFCC,0,0),W,black);
draw((0,-0.2,0)--(0,1.5*aFCC,0),black+linewidth(1),ArcArrow3());
label("$b$",(0,1.5*aFCC,0),E,black);
draw((0,0,-0.2)--(0,0,1.5*aFCC),black+linewidth(1),ArcArrow3());
label("$c$",(0,0,1.5*aFCC),N,black);
endgroup3();
