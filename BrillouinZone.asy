  import three;
  import solids;
  import patterns;
  settings.toolbar=false;
	
size(22cm, 22cm);
currentprojection=orthographic(-6,-2,1);
currentlight=light(gray(0.4),specularfactor=3,viewport=false,
(-0.5,-0.25,0.45),
(0.5,-0.5,0.5),(0.5,0.5,0.75));

triple O=(0,0,0), X=(1,0,0), Y=(0,1,0), Z=(0,0,1);
draw(O--(-2.2,0,0),black,Arrow3);
draw(O--(0,-2.2,0),black,Arrow3);
draw(O--(0,0,2.2),black,Arrow3);
label("\huge$x$",scale3(1.1)*(-2.2,0,0),black);
label("\huge$y$",scale3(1.1)*(0,-2.2,0),black);
label("\huge$z$",scale3(1.1)*(0,0,2.05),black); 

//material unterfl=material(white+opacity(1),ambientpen=white);
material oberfl=material(white+opacity(0.6),ambientpen=white);

for (int n = -1; n <=1; n=n+2) {
    for (int l = 1; l <=1; l=l+2) {
        for (int m = -1; m <=1; m=m+2) {
        draw(rotate(90*l+45*(m+1),Z)*shift(1,1,n)*rotate(aTan(sqrt(2))*n,Y-X)*rotate(15,Z)*scale3(sqrt(2))*surface(polygon(6)), surfacepen=oberfl);
        }  
    }
}

draw(shift(-2,0,0)*rotate(45,X)*rotate(90,Y)*scale3(sqrt(2))*shift(-0.5,-0.5,0)*unitplane, surfacepen=oberfl,black+linewidth(0.2));
draw(shift(0,-2,0)*rotate(45,Y)*rotate(90,X)*scale3(sqrt(2))*shift(-0.5,-0.5,0)*unitplane, surfacepen=oberfl,black+linewidth(0.2));
draw(shift(0,0,2)*rotate(45,Z)*scale3(sqrt(2))*shift(-0.5,-0.5,0)*unitplane, surfacepen=oberfl,black+linewidth(0.2));

draw(O--(-1,-1,1),red + linewidth(2.0pt) + linetype(new real[] {2,2}));
draw(O--(0,-2,0),red + linewidth(2.0pt) + linetype(new real[] {2,2}));
draw((0,-2,0)--(-1,-2,0),red + linewidth(2.0pt));
draw((-1,-2,0)--(-1.5,-1.5,0),red + linewidth(2.0pt));
draw((-1.5,-1.5,0)--O,red + linewidth(2.0pt) + linetype(new real[] {2,2}));

label("\Huge$\Gamma$",(0,0,-0.15),red); 
label("\Huge$L$",(-0.9,-1.1,1),red);
label("\Huge$X$",(0,-2,-0.15),red);
label("\Huge$W$",(-1,-2,-0.15),red); 
label("\Huge$K$",(-1.5,-1.5,-0.15),red); 