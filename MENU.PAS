
uses rgraph, help2, wormtpu, wormgame, help13h, helpfont, games, smix,
     detect, fxms;

var
   c : byte;
   x, y : integer;
   mx, my, k : integer;
   anim : boolean;
   defp, p : paltype;
   infoa, infop1, infop2, infot : string;
   nra, nrs, nrp1, nrp2, nrt : byte;

procedure wstep;
begin
     for x:= 0 to 319 do
     for y:= 0 to 199 do putpixel(x,y,round((x*0.1)+(y*0.1)),1);
     for x:= 1 to 3 do
     for y:= 1 to 20 do
     begin
          outtextxy(x+75,y+30,3,20,x xor y+40,1,'ROBALE',false);
     end;
end;

procedure paleta;
var
   i : integer;
begin
     for i:= 0 to 65 do
     begin
          setcol(i,i,i div 2,0);
     end;
     setcol(64,65,4 div 2,64);
     setcol(65,25,25,25);
     setcol(66,45,45,45);
     setcol(73,0,0,255);
     setcol(72,0,0,253);
end;

procedure ogien;
begin
     if anim then
     begin
     for x:= 1 to 319 do
     for y:= 88 to 200 do
     begin
          if (getpixel(x,y,2)<>63) then
          begin
               c:=getpixel(x,y+1,2);
               if c>5 then
               begin
                    putpixel(x+random(4)-2,y,c xor random(2)-1,2);
               end
               else putpixel(x,y,0,2);
          end;
     end;
     end;
end;

begin
initgraph(3);
sounds:=false;
if sounds then initsounds;
initnewkeyint;
getpal13h(defp);
paleta;
{wstep;}
bar(0,0,320,200,1,2);
outtextxy(80,30,2,2,63,2,'POJEDYNEK',false);
outtextxy(80,45,2,2,63,2,'  OPCJE',false);
outtextxy(80,60,2,2,63,2,'  AUTOR',false);
outtextxy(80,75,2,2,63,2,' WYJSCIE',false);
outtextxy(80,63,2,2,31,2,'    .',false);
mousewindow(0,0,639,199);
setmousepos(320,100);
anim:=true;
infoa:='ON';
infop1:='100';
infop2:='100';
infot:='60';
nra:=1;
nrs:=3;
nrp1:=1;
nrp2:=1;
nrt:=10;
repeat
      getmousepos(mx,my,k);
      rectangle(1,1,320,199,63,1);
      rectangle(2,2,319,198,63,1);
      mx:=mx div 2;
      line(-20,200,320,200,63,2);
      kursormouse(mx,my,1,1,40,true);
      pokazgrafike;
      bar(mx,my,mx+10,my+10,255,1);
      ogien;
      if mousein(mx,my,90,30,230,42) then
      begin outtextxy(80,30,2,2,80,2,'POJEDYNEK',false); end
      else begin outtextxy(80,30,2,2,63,2,'POJEDYNEK',false); end;
      if mousein(mx,my,120,30+15,200,42+15) then
      begin outtextxy(80,45,2,2,80,2,'  OPCJE',false); end
      else begin outtextxy(80,45,2,2,63,2,'  OPCJE',false); end;
      if mousein(mx,my,120,30+30,200,42+30) then
      begin outtextxy(80,60,2,2,80,2,'  AUTOR',false); end
      else begin outtextxy(80,60,2,2,63,2,'  AUTOR',false); end;
      if mousein(mx,my,120,30+45,200,42+45) then
      begin outtextxy(80,75,2,2,80,2,' WYJSCIE',false); outtextxy(80,63,2,2,78,2,'    .',false); end
      else begin outtextxy(80,75,2,2,63,2,' WYJSCIE',false); outtextxy(80,63,2,2,31,2,'    .',false); end;

      if mousein(mx,my,90,30,230,42) and (k=1) then
      begin
           if sounds then begin startsound(sound[21],21,false); end;
           clearlayer(1);
           clearlayer(2);
           clearlayer(3);
           opengfxfile('tlo3.gfx',0,3);
           opengfxfile('tlo.gfx',31,2);
           ruch:=false;
           ruch2:=false;
           if nrp1=1 then penergy:=100;
           if nrp1=2 then penergy:=200;
           if nrp1=3 then penergy:=300;
           if nrp1=4 then penergy:=400;
           if nrp1=5 then penergy:=500;
           if nrp1=6 then penergy:=600;
           if nrp1=7 then penergy:=700;
           if nrp1=8 then penergy:=800;
           if nrp1=9 then penergy:=900;
           if nrp1=10 then penergy:=1000;
           if nrp1=11 then penergy:=1200;
           if nrp1=12 then penergy:=1400;
           if nrp1=13 then penergy:=1600;
           if nrp1=14 then penergy:=1800;
           if nrp1=15 then penergy:=2000;
           if nrp1=16 then penergy:=4000;
           if nrp1=17 then penergy:=6000;
           if nrp1=18 then penergy:=8000;
           if nrp1=19 then penergy:=10000;
           if nrp1=20 then penergy:=20000;
           if nrp2=1 then cenergy:=100;
           if nrp2=2 then cenergy:=200;
           if nrp2=3 then cenergy:=300;
           if nrp2=4 then cenergy:=400;
           if nrp2=5 then cenergy:=500;
           if nrp2=6 then cenergy:=600;
           if nrp2=7 then cenergy:=700;
           if nrp2=8 then cenergy:=800;
           if nrp2=9 then cenergy:=900;
           if nrp2=10 then cenergy:=1000;
           if nrp2=11 then cenergy:=1200;
           if nrp2=12 then cenergy:=1400;
           if nrp2=13 then cenergy:=1600;
           if nrp2=14 then cenergy:=1800;
           if nrp2=15 then cenergy:=2000;
           if nrp2=16 then cenergy:=4000;
           if nrp2=17 then cenergy:=6000;
           if nrp2=18 then cenergy:=8000;
           if nrp2=19 then cenergy:=10000;
           if nrp2=20 then cenergy:=20000;
           if nrt=1 then exittime:=2;
           if nrt=2 then exittime:=5;
           if nrt=3 then exittime:=8;
           if nrt=4 then exittime:=10;
           if nrt=5 then exittime:=15;
           if nrt=6 then exittime:=20;
           if nrt=7 then exittime:=25;
           if nrt=8 then exittime:=40;
           if nrt=9 then exittime:=50;
           if nrt=10 then exittime:=60;
           exitgame:=false;
           koniec_tury_p1:=false;
           koniec_tury_p2:=false;
           randomize;
           put_players(random(150)+10,0,random(130)+170,0);
           bar(0,0,320,200,0,1);
           openfnttekst('data\litt.fnt',120,90,8,round(20*2+0.5),1,'LOADING...',_rgraph);
           rectangle(1,1,320,199,63,1);
           rectangle(2,2,319,198,63,1);
           player1_put;
           player2_put;
           setpal13h(defp);
           bar(0,0,320,200,255,1);
           repeat
                 koniec_tury_p1:=false;
                 player1_game;
                 koniec_tury_p1:=true;
                 koniec_tury_p2:=false;
                 player2_game;
                 koniec_tury_p2:=true;
           until exitgame;
           if exitgame then
           begin
                closegraph;
                if sounds then begin freesounds; end;
                halt;
           end;
           bar(0,0,320,200,255,1);
           bar(0,0,320,200,0,2);
           bar(0,0,320,200,255,3);
           paleta;
      end;

      if mousein(mx,my,120,30+15,200,42+15) and (k=1) then
      begin
           if sounds then begin startsound(sound[21],21,false); end;
           outtextxy(80,30,2,2,255,2,'POJEDYNEK',false);
           outtextxy(80,45,2,2,255,2,'  OPCJE',false);
           outtextxy(80,60,2,2,255,2,'  AUTOR',false);
           outtextxy(80,75,2,2,255,2,' WYJSCIE',false);
           outtextxy(80,63,2,2,255,2,'    .',false);
           outtextxy(35,15,2,2,63,2,'   O P C J E',false);
           openfnttekst('data\litt.fnt',7,35,8,63,2,'ANIMACJA OGNIA: '+infoa,_rgraph);
           openfnttekst('data\litt.fnt',7,55,8,63,2,'ENERGIA P1: '+infop1,_rgraph);
           openfnttekst('data\litt.fnt',7,65,8,63,2,'ENERGIA P2: '+infop2,_rgraph);
           openfnttekst('data\litt.fnt',7,75,8,63,2,'CZAS TURY: '+infot,_rgraph);
           rectangle(287,35,295,43,63,2);
           rectangle(287,55,295,63,63,2);
           rectangle(287,65,295,73,63,2);
           rectangle(287,75,295,83,63,2);
           rectangle(297,35,305,43,63,2);
           rectangle(297,55,305,63,63,2);
           rectangle(297,65,305,73,63,2);
           rectangle(297,75,305,83,63,2);
           openfnttekst('data\litt.fnt',280,35,8,63,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',280,55,8,63,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',280,65,8,63,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',280,75,8,63,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',290,35,8,63,2,'+',_rgraph);
           openfnttekst('data\litt.fnt',290,55,8,63,2,'+',_rgraph);
           openfnttekst('data\litt.fnt',290,65,8,63,2,'+',_rgraph);
           openfnttekst('data\litt.fnt',290,75,8,63,2,'+',_rgraph);
           repeat
                 getmousepos(mx,my,k);
                 rectangle(1,1,320,199,63,1);
                 rectangle(2,2,319,198,63,1);
                 mx:=mx div 2;
                 line(-20,200,320,200,63,2);
                 kursormouse(mx,my,1,1,40,true);
                 pokazgrafike;
                 bar(mx,my,mx+10,my+10,255,1);
                 if mousein(mx,my,287,35,295,43) then
                 begin openfnttekst('data\litt.fnt',280,35,8,80,2,'-',_rgraph) end
                 else begin openfnttekst('data\litt.fnt',280,35,8,63,2,'-',_rgraph); end;
                 if mousein(mx,my,287,55,295,63) then
                 begin openfnttekst('data\litt.fnt',280,55,8,80,2,'-',_rgraph) end
                 else begin openfnttekst('data\litt.fnt',280,55,8,63,2,'-',_rgraph); end;
                 if mousein(mx,my,287,65,295,73) then
                 begin openfnttekst('data\litt.fnt',280,65,8,80,2,'-',_rgraph) end
                 else begin openfnttekst('data\litt.fnt',280,65,8,63,2,'-',_rgraph); end;
                 if mousein(mx,my,287,75,295,83) then
                 begin openfnttekst('data\litt.fnt',280,75,8,80,2,'-',_rgraph) end
                 else begin openfnttekst('data\litt.fnt',280,75,8,63,2,'-',_rgraph); end;
                 if mousein(mx,my,297,35,305,43) then
                 begin openfnttekst('data\litt.fnt',290,35,8,80,2,'+',_rgraph) end
                 else begin openfnttekst('data\litt.fnt',290,35,8,63,2,'+',_rgraph); end;
                 if mousein(mx,my,297,55,305,63) then
                 begin openfnttekst('data\litt.fnt',290,55,8,80,2,'+',_rgraph) end
                 else begin openfnttekst('data\litt.fnt',290,55,8,63,2,'+',_rgraph); end;
                 if mousein(mx,my,297,65,305,73) then
                 begin openfnttekst('data\litt.fnt',290,65,8,80,2,'+',_rgraph) end
                 else begin openfnttekst('data\litt.fnt',290,65,8,63,2,'+',_rgraph); end;
                 if mousein(mx,my,297,75,305,83) then
                 begin openfnttekst('data\litt.fnt',290,75,8,80,2,'+',_rgraph) end
                 else begin openfnttekst('data\litt.fnt',290,75,8,63,2,'+',_rgraph); end;

                 if mousein(mx,my,287,35,295,43) and (k=1) and (nra>1) then
                 begin
                      bar(7,35,250,43,255,2);
                      openfnttekst('data\litt.fnt',7,35,8,63,2,'ANIMACJA OGNIA: '+infoa,_rgraph);
                      nra:=nra-1;
                      if nra=1 then begin infoa:='ON'; anim:=false; end;
                      if nra=2 then begin infoa:='OFF'; anim:=true; end;
                 end;
                 if mousein(mx,my,297,35,305,43) and (k=1) and (nra<2) then
                 begin
                      bar(7,35,250,43,255,2);
                      openfnttekst('data\litt.fnt',7,35,8,63,2,'ANIMACJA OGNIA: '+infoa,_rgraph);
                      nra:=nra+1;
                      if nra=1 then begin infoa:='ON'; anim:=false; end;
                      if nra=2 then begin infoa:='OFF'; anim:=true; end;
                 end;


                 if mousein(mx,my,287,55,295,63) and (k=1) and (nrp1>0) then
                 begin
                      bar(7,55,250,63,255,2);
                      openfnttekst('data\litt.fnt',7,55,8,63,2,'ENERGIA P1: '+infop1,_rgraph);
                      nrp1:=nrp1-1;
                      if nrp1=1 then infop1:='100';
                      if nrp1=2 then infop1:='200';
                      if nrp1=3 then infop1:='300';
                      if nrp1=4 then infop1:='400';
                      if nrp1=5 then infop1:='500';
                      if nrp1=6 then infop1:='600';
                      if nrp1=7 then infop1:='700';
                      if nrp1=8 then infop1:='800';
                      if nrp1=9 then infop1:='900';
                      if nrp1=10 then infop1:='1000';
                      if nrp1=11 then infop1:='1200';
                      if nrp1=12 then infop1:='1400';
                      if nrp1=13 then infop1:='1600';
                      if nrp1=14 then infop1:='1800';
                      if nrp1=15 then infop1:='2000';
                      if nrp1=16 then infop1:='4000';
                      if nrp1=17 then infop1:='6000';
                      if nrp1=18 then infop1:='8000';
                      if nrp1=19 then infop1:='10000';
                      if nrp1=20 then infop1:='20000';
                 end;
                 if mousein(mx,my,297,55,305,63) and (k=1) and (nrp1<21) then
                 begin
                      bar(7,55,250,63,255,2);
                      openfnttekst('data\litt.fnt',7,55,8,63,2,'ENERGIA P1: '+infop1,_rgraph);
                      nrp1:=nrp1+1;
                      if nrp1=1 then infop1:='100';
                      if nrp1=2 then infop1:='200';
                      if nrp1=3 then infop1:='300';
                      if nrp1=4 then infop1:='400';
                      if nrp1=5 then infop1:='500';
                      if nrp1=6 then infop1:='600';
                      if nrp1=7 then infop1:='700';
                      if nrp1=8 then infop1:='800';
                      if nrp1=9 then infop1:='900';
                      if nrp1=10 then infop1:='1000';
                      if nrp1=11 then infop1:='1200';
                      if nrp1=12 then infop1:='1400';
                      if nrp1=13 then infop1:='1600';
                      if nrp1=14 then infop1:='1800';
                      if nrp1=15 then infop1:='2000';
                      if nrp1=16 then infop1:='4000';
                      if nrp1=17 then infop1:='6000';
                      if nrp1=18 then infop1:='8000';
                      if nrp1=19 then infop1:='10000';
                      if nrp1=20 then infop1:='20000';
                 end;

                 if mousein(mx,my,287,65,295,73) and (k=1) and (nrp2>0) then
                 begin
                      bar(7,65,250,73,255,2);
                      openfnttekst('data\litt.fnt',7,65,8,63,2,'ENERGIA P2: '+infop2,_rgraph);
                      nrp2:=nrp2-1;
                      if nrp2=1 then infop2:='100';
                      if nrp2=2 then infop2:='200';
                      if nrp2=3 then infop2:='300';
                      if nrp2=4 then infop2:='400';
                      if nrp2=5 then infop2:='500';
                      if nrp2=6 then infop2:='600';
                      if nrp2=7 then infop2:='700';
                      if nrp2=8 then infop2:='800';
                      if nrp2=9 then infop2:='900';
                      if nrp2=10 then infop2:='1000';
                      if nrp2=11 then infop2:='1200';
                      if nrp2=12 then infop2:='1400';
                      if nrp2=13 then infop2:='1600';
                      if nrp2=14 then infop2:='1800';
                      if nrp2=15 then infop2:='2000';
                      if nrp2=16 then infop2:='4000';
                      if nrp2=17 then infop2:='6000';
                      if nrp2=18 then infop2:='8000';
                      if nrp2=19 then infop2:='10000';
                      if nrp2=20 then infop2:='20000';
                 end;
                 if mousein(mx,my,297,65,305,73) and (k=1) and (nrp2<21) then
                 begin
                      bar(7,65,250,73,255,2);
                      openfnttekst('data\litt.fnt',7,65,8,63,2,'ENERGIA P2: '+infop2,_rgraph);
                      nrp2:=nrp2+1;
                      if nrp2=1 then infop2:='100';
                      if nrp2=2 then infop2:='200';
                      if nrp2=3 then infop2:='300';
                      if nrp2=4 then infop2:='400';
                      if nrp2=5 then infop2:='500';
                      if nrp2=6 then infop2:='600';
                      if nrp2=7 then infop2:='700';
                      if nrp2=8 then infop2:='800';
                      if nrp2=9 then infop2:='900';
                      if nrp2=10 then infop2:='1000';
                      if nrp2=11 then infop2:='1200';
                      if nrp2=12 then infop2:='1400';
                      if nrp2=13 then infop2:='1600';
                      if nrp2=14 then infop2:='1800';
                      if nrp2=15 then infop2:='2000';
                      if nrp2=16 then infop2:='4000';
                      if nrp2=17 then infop2:='6000';
                      if nrp2=18 then infop2:='8000';
                      if nrp2=19 then infop2:='10000';
                      if nrp2=20 then infop2:='20000';
                 end;

                 if mousein(mx,my,287,75,295,83) and (k=1) and (nrt>0) then
                 begin
                      bar(7,75,250,83,255,2);
                      openfnttekst('data\litt.fnt',7,75,8,63,2,'CZAS TURY: '+infot,_rgraph);
                      nrt:=nrt-1;
                      if nrt=1 then infot:='2';
                      if nrt=2 then infot:='5';
                      if nrt=3 then infot:='8';
                      if nrt=4 then infot:='10';
                      if nrt=5 then infot:='15';
                      if nrt=6 then infot:='20';
                      if nrt=7 then infot:='25';
                      if nrt=8 then infot:='40';
                      if nrt=9 then infot:='50';
                      if nrt=10 then infot:='60';
                 end;
                 if mousein(mx,my,297,75,305,83) and (k=1) and (nrt<11) then
                 begin
                      bar(7,75,250,83,255,2);
                      openfnttekst('data\litt.fnt',7,75,8,63,2,'CZAS TURY: '+infot,_rgraph);
                      nrt:=nrt+1;
                      if nrt=1 then infot:='2';
                      if nrt=2 then infot:='5';
                      if nrt=3 then infot:='8';
                      if nrt=4 then infot:='10';
                      if nrt=5 then infot:='15';
                      if nrt=6 then infot:='20';
                      if nrt=7 then infot:='25';
                      if nrt=8 then infot:='40';
                      if nrt=9 then infot:='50';
                      if nrt=10 then infot:='60';
                 end;
                 ogien;
           until k=2;
           bar(2,2,318,80,0,2);
           openfnttekst('data\litt.fnt',7,35,8,255,2,'ANIMACJA OGNIA: '+infoa,_rgraph);
           openfnttekst('data\litt.fnt',7,55,8,255,2,'ENERGIA P1: '+infop1,_rgraph);
           openfnttekst('data\litt.fnt',7,65,8,255,2,'ENERGIA P2: '+infop2,_rgraph);
           openfnttekst('data\litt.fnt',7,75,8,255,2,'CZAS TURY: '+infot,_rgraph);
           rectangle(287,35,295,43,255,2);
           rectangle(287,45,295,53,255,2);
           rectangle(287,55,295,63,255,2);
           rectangle(287,65,295,73,255,2);
           rectangle(287,75,295,83,255,2);
           rectangle(297,35,305,43,255,2);
           rectangle(297,45,305,53,255,2);
           rectangle(297,55,305,63,255,2);
           rectangle(297,65,305,73,255,2);
           rectangle(297,75,305,83,255,2);
           openfnttekst('data\litt.fnt',280,35,8,255,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',280,45,8,255,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',280,55,8,255,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',280,65,8,255,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',280,75,8,255,2,'-',_rgraph);
           openfnttekst('data\litt.fnt',290,35,8,255,2,'+',_rgraph);
           openfnttekst('data\litt.fnt',290,45,8,255,2,'+',_rgraph);
           openfnttekst('data\litt.fnt',290,55,8,255,2,'+',_rgraph);
           openfnttekst('data\litt.fnt',290,65,8,255,2,'+',_rgraph);
           openfnttekst('data\litt.fnt',290,75,8,255,2,'+',_rgraph);
           outtextxy(80,30,2,2,63,2,'POJEDYNEK',false);
           outtextxy(80,45,2,2,63,2,'  OPCJE',false);
           outtextxy(80,60,2,2,63,2,'  AUTOR',false);
           outtextxy(80,75,2,2,63,2,' WYJSCIE',false);
           outtextxy(80,63,2,2,31,2,'    .',false);
      end;
      if mousein(mx,my,120,30+30,200,42+30) and (k=1) then
      begin
           if sounds then begin startsound(sound[21],21,false); end;
           outtextxy(80,30,2,2,255,2,'POJEDYNEK',false);
           outtextxy(80,45,2,2,255,2,'  OPCJE',false);
           outtextxy(80,60,2,2,255,2,'  AUTOR',false);
           outtextxy(80,75,2,2,255,2,' WYJSCIE',false);
           outtextxy(80,63,2,2,255,2,'    .',false);
           outtextxy(35,15,2,2,63,2,'   A U T O R',false);
           outtextxy(30,45,2,2,63,2,'Michal Rygielski',false);
           outtextxy(30,45,2,2,63,2,'     -',false);
           openfnttekst('data\litt.fnt',37,70,8,63,2,'e-mail: REGi007@poczta.onet.pl',_rgraph);
           repeat
                 getmousepos(mx,my,k);
                 rectangle(1,1,320,199,63,1);
                 rectangle(2,2,319,198,63,1);
                 mx:=mx div 2;
                 line(-20,200,320,200,63,2);
                 kursormouse(mx,my,1,1,40,true);
                 pokazgrafike;
                 bar(mx,my,mx+10,my+10,255,1);
                 ogien;
           until k=2;
           bar(2,2,318,80,0,2);
           outtextxy(80,30,2,2,63,2,'POJEDYNEK',false);
           outtextxy(80,45,2,2,63,2,'  OPCJE',false);
           outtextxy(80,60,2,2,63,2,'  AUTOR',false);
           outtextxy(80,75,2,2,63,2,' WYJSCIE',false);
           outtextxy(80,63,2,2,31,2,'    .',false);
      end;
      if mousein(mx,my,120,30+45,200,42+45) and (k=1) then
      begin
           if sounds then begin startsound(sound[21],21,false); end;
           czekaj(300);
           closegraph;
           if sounds then begin freesounds; end;
           halt;
      end;
until true=false;
setoldkeyint;
closegraph;
if sounds then begin freesounds; end;
end.