import three;

defaultrender.merge=true; 				  
defaultrender.tessellate=true;      

size(7.5cm,0);


begingroup3("Boundaries");
draw(surface((-1,0,0)--(1,0,0)--(1,0,2)--(-1,0,2)--cycle),red+white+opacity(0.7));
draw(((-1,0,0)--(1,0,0)--(1,0,2)--(-1,0,2)--cycle),black+linewidth(0.5));

draw(surface((-1,0,0)--(0,sqrt(3),0)--(0,sqrt(3),2)--(-1,0,2)--cycle),red+white+opacity(0.7));
draw(((-1,0,0)--(0,sqrt(3),0)--(0,sqrt(3),2)--(-1,0,2)--cycle),black+linewidth(0.5));

draw(surface((1,0,0)--(0,sqrt(3),0)--(0,sqrt(3),2)--(1,0,2)--cycle),red+white+opacity(0.7));
draw(((1,0,0)--(0,sqrt(3),0)--(0,sqrt(3),2)--(1,0,2)--cycle),black+linewidth(0.5));
endgroup3();

//Surface 1
//From https://tex.stackexchange.com/questions/370045/drawing-3d-filled-triangle-with-parabolic-edges-in-asymptote
triple A1=(0,0,2);
triple B1=(-0.5,sqrt(3)/2,2);
triple C1=(-1,0,2.5);
triple MAB1=(-0.25,sqrt(3)/4,2); //mid-edge (AB)
triple MAC1=(-0.5,0,2.3); // mid-edge
triple MBC1=(-1+0.75/2,0.75*sqrt(3)/2,2.3); 
triple Eu=(0,sqrt(3)/3,1.4);

path3 gc11=(A1..MAB1..B1); 
path3 gc21=(B1..MBC1..C1);
path3 gc31=(C1..MAC1..A1);
path3 gc41 = (A1--Eu--B1--cycle);
path3 gc51 = ((-1,0,2)--C1..MAC1..A1--cycle);
path3 gc61 = ((-1,0,2)--C1..MBC1..B1--cycle);

// Recover the different tangents in A, B, C to construct a cycle-path3,
path3 gc1=point(gc11,0){dir(gc11,0)}..{dir(gc11,2)}point(gc11,2){dir(gc21,0)}..{dir(gc21,2)}point(gc21,2){dir(gc31,0)}..{dir(gc31,2)}point(gc31,2)..cycle;

draw(surface(patch(gc1)),red+white+opacity(0.7));
draw(gc21); draw(gc31); draw(A1--Eu--B1);
draw(surface(gc41),red+white+opacity(0.7));
draw(surface(gc51),red+white+opacity(0.7));
draw(surface(gc61),red+white+opacity(0.7));

//Surface 2
//From https://tex.stackexchange.com/questions/370045/drawing-3d-filled-triangle-with-parabolic-edges-in-asymptote
triple A2=(0,0,2);
triple B2=(0.5,sqrt(3)/2,2);
triple C2=(1,0,2.5);
triple MAB2=(0.25,sqrt(3)/4,2); 
triple MAC2=(0.5,0,2.3);
triple MBC2=(1-0.75/2,0.75*sqrt(3)/2,2.3); 


path3 gc12=(A2..MAB2..B2); 
path3 gc22=(B2..MBC2..C2);
path3 gc32=(C2..MAC2..A2);
path3 gc42 = (A2--Eu--B2--cycle);
path3 gc52 = ((1,0,2)--C2..MAC2..A2--cycle);
path3 gc62 = ((1,0,2)--C2..MBC2..B2--cycle);

// Recover the different tangents in A, B, C to construct a cycle-path3,
path3 gc2=point(gc12,0){dir(gc12,0)}..{dir(gc12,2)}point(gc12,2){dir(gc22,0)}..{dir(gc22,2)}point(gc22,2){dir(gc32,0)}..{dir(gc32,2)}point(gc32,2)..cycle;

draw(surface(patch(gc2)),red+white+opacity(0.7));
draw(gc22); draw(gc32); draw(A2--Eu--B2);
draw(surface(gc42),red+white+opacity(0.7));
draw(surface(gc52),red+white+opacity(0.7));
draw(surface(gc62),red+white+opacity(0.7));

//Surface 3
//From https://tex.stackexchange.com/questions/370045/drawing-3d-filled-triangle-with-parabolic-edges-in-asymptote
triple A3=(-0.5,sqrt(3)/2,2);
triple B3=(0.5,sqrt(3)/2,2);
triple C3=(0,sqrt(3),2.5);
triple MAB3=(0.25,sqrt(3)-sqrt(3)/2,2); 
triple MAC3=(-0.25,sqrt(3)-sqrt(3)/4,2.3);
triple MBC3=(0.25,sqrt(3)-sqrt(3)/4,2.3); 

path3 gc13=(A3..MAB3..B3); 
path3 gc23=(B3..MBC3..C3);
path3 gc33=(C3..MAC3..A3);
path3 gc43 = (A3--Eu--B3--cycle);
path3 gc53 = ((0,sqrt(3),2)--C3..MAC3..A3--cycle);
path3 gc63 = ((0,sqrt(3),2)--C3..MBC3..B3--cycle);

// Recover the different tangents in A, B, C to construct a cycle-path3,
path3 gc3=point(gc13,0){dir(gc13,0)}..{dir(gc13,2)}point(gc13,2){dir(gc23,0)}..{dir(gc23,2)}point(gc23,2){dir(gc33,0)}..{dir(gc33,2)}point(gc33,2)..cycle;

draw(surface(patch(gc3)),red+white+opacity(0.7));
draw(gc23); draw(gc33); draw(A3--Eu--B3);
draw(surface(gc43),red+white+opacity(0.7));
draw(surface(gc53),red+white+opacity(0.7));
draw(surface(gc63),red+white+opacity(0.7));

//Labels
label("$A$",(-1,0,0),-3X-1.5*Y-2Z,black);
label("$B$",(1,0,0),-2Y+2X-2Z,black);
label("$C$",(0,sqrt(3),0),1Y-2Z,black);

label("$e_1$",(0,0,2),-1X-2Y,black);
label("$e_3$",(-0.5,sqrt(3)/2,2),-2X+1Y,black);
label("$e_2$",(0.5,sqrt(3)/2,2),2X+2Y,black);
label("$E$",Eu,-Z,black);

label("$T$",(-1,0,1),3Y,black);









