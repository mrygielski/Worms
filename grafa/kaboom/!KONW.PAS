Uses FGraphB;
Var P:Tpaleta;
    pl:String;
    x,y:integer;
Begin
     pl:='boom4';
     initfgraph;
     getpal(p);
     loadgif(pl+'.gif',1);
     movebuf2screen;
     ekran2pal(0,0,294,69,p,1);
     setpal(p);
     movebuf2screen;
     SaveAsPaintFile(0,0,294,69,pl+'.gfx',1);
     readln;
     closefgraph;
End.