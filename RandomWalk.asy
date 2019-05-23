settings.outformat = "pdf";       //Enable to output pdf files directly.
//settings.outformat = "prc";     //Enable to output prc files to load into TeX
import solids;                    //Enables filling and drawing of surfaces of revolution
import three;											//Enables 3D plotting
size(10cm,10cm);
currentprojection=orthographic(
camera=(12,6,2),
up=(0,0,1),
target=(0,0,0),
zoom=0.8,
center=true); 										//Center puts rotation at center.
defaultrender.merge=true; 				 //About 12 seconds to load in Adobe.
defaultrender.tessellate=true;   // What. Loads up in 2 sec????


triple p001 = (0, 0, 0);
triple p002 = (0, 1, 0);
triple p003 = (0, 1, 1);
triple p004 = (0, 1, 0);
triple p005 = (0, 2, 0);
triple p006 = (1, 2, 0);
triple p007 = (1, 2, -1);
triple p008 = (1, 1, -1);
triple p009 = (1, 2, -1);
triple p010 = (1, 2, -2);
triple p011 = (1, 3, -2);
triple p012 = (2, 3, -2);

begingroup3("Random Walk");
draw((p001--p002),black+linewidth(1),Arrow3,name="One");
draw((shift(0,-0.05,0)*p002--shift(0,-0.05,0)*p003),black+linewidth(1),Arrow3);
draw((shift(0,0.05,0)*p003--shift(0,0.05,0)*p004),black+linewidth(1),Arrow3);
draw((p004--p005),black+linewidth(1),Arrow3);
draw((p005--p006),black+linewidth(1),Arrow3);
draw((p006--p007),black+linewidth(1),Arrow3);
draw((shift(0,0,0.05)*p007--shift(0,0,0.05)*p008),black+linewidth(1),Arrow3);
draw((shift(0,0,-0.05)*p008--shift(0,0,-0.05)*p009),black+linewidth(1),Arrow3);
draw((p009--p010),black+linewidth(1),Arrow3);
draw((p010--p011),black+linewidth(1),Arrow3);
draw((p011--p012),black+linewidth(1),Arrow3);
draw((p001--p012),red+dashed+linewidth(1),Arrow3);
endgroup3();

begingroup3("Labels");
label("$\alpha$",(p001--p002),S,black);
label("$r$",(p008--p009),4S,red);
endgroup3();

