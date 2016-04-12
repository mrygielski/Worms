Uses FGraphB;
Var P:Tpaleta;
    pl:String;
    x,y:integer;
Begin
     pl:='r3b_1';
     initfgraph;
     getpal(p);
     loadgif(pl+'.gif',1);
     movebuf2screen;
     ekran2pal(0,0,6,6,p,1);
     setpal(p);
     movebuf2screen;
     SaveAsPaintFile(0,0,6,6,pl+'.gfx',1);
     readln;
     closefgraph;
End.