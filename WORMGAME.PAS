
unit wormgame;

interface

uses help2, helpfont, rgraph, wormtpu, games, smix, detect, fxms, dos;

var
   ppx1, ppy1, ppx2, ppy2 : integer;
   exitgame : boolean;
   timeture : stoper;
   tt : longint;
   exittime : byte;
   sounds : boolean;

procedure player1_game;
procedure player2_game;
procedure player1_put;
procedure player2_put;
procedure put_players(ppx1, ppy1, ppx2, ppy2 : integer);

implementation

procedure put_players(ppx1, ppy1, ppx2, ppy2 : integer);
begin
     px:=ppx1;
     py:=ppy1;
     px2:=ppx2;
     py2:=ppy2;
end;

procedure player1_put;
begin
     defaultpos;
     pozycja_p1:='prawo';
     lufa_poz:='\';
     x_pocisku:=0;
     y_pocisku:=4;
     anim:=1;
     bron:='bazuka';
     rectangle(1,1,320,200,15,2);
     bar(1,150,30,200,29,2);
     bar(7,160,9,190,23,2);
     bar(20,160,22,190,23,2);
     putpixel(20,190,12,2);
     putpixel(21,190,12,2);
     putpixel(22,190,12,2);
     rectangle(1,150,30,200,15,2);
     bar(30,150,70,200,29,2);
     rectangle(30,150,70,200,15,2);
     if penergy in[0..9] then po:=15;
     if penergy in[10..99] then po:=11;
     if (penergy>99) and (penergy<999) then po:=9;
     if (penergy>999) and (penergy<9999) then po:=6;
     if (penergy>9999) and (penergy<99999) then po:=3;
     if cenergy in[0..9] then co:=15;
     if cenergy in[10..99] then co:=11;
     if (cenergy>99) and (cenergy<999) then co:=9;
     if (cenergy>999) and (cenergy<9999) then co:=6;
     if (cenergy>9999) and (cenergy<99999) then co:=3;
     openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
     openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
     openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
     openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
     openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
     openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
     openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
     openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
     line(320,31,320,158,12,2);
     mousewindow(0,0,639,199);
     colp:=26;
     putpixel(7,190-round(we),1,2);
     putpixel(8,190-round(we),1,2);
     putpixel(9,190-round(we),1,2);
     repeat
           if anim=3 then anim:=1;
           if (granica(px,py+1,2)) then begin ruch:=false; py:=py+1; end else begin ruch:=true; end;
           player1(px,py,2);
           player2(px2,py2,2);
           pokazgrafike;
           player1_0(px,py,2);
     until ruch;
end;

procedure player2_put;
begin
     defaultpos;
     pozycja_p2:='lewo';
     lufa_poz2:='\';
     x_pocisku:=0;
     y_pocisku:=4;
     anim2:=1;
     bron2:='bazuka';
     rectangle(1,1,320,200,15,2);
     bar(1,150,30,200,29,2);
     bar(7,160,9,190,23,2);
     bar(20,160,22,190,23,2);
     putpixel(20,190,12,2);
     putpixel(21,190,12,2);
     putpixel(22,190,12,2);
     rectangle(1,150,30,200,15,2);
     bar(30,150,70,200,29,2);
     rectangle(30,150,70,200,15,2);
     if penergy in[0..9] then po:=15;
     if penergy in[10..99] then po:=11;
     if (penergy>99) and (penergy<999) then po:=9;
     if (penergy>999) and (penergy<9999) then po:=6;
     if (penergy>9999) and (penergy<99999) then po:=3;
     if cenergy in[0..9] then co:=15;
     if cenergy in[10..99] then co:=11;
     if (cenergy>99) and (cenergy<999) then co:=9;
     if (cenergy>999) and (cenergy<9999) then co:=6;
     if (cenergy>9999) and (cenergy<99999) then co:=3;
     openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
     openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
     openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
     openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
     openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
     openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
     openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
     openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
     line(320,31,320,158,12,2);
     mousewindow(0,0,639,199);
     colp:=26;
     putpixel(7,190-round(we),1,2);
     putpixel(8,190-round(we),1,2);
     putpixel(9,190-round(we),1,2);
     repeat
           if anim2=3 then anim2:=1;
           if (granica(px2,py2+1,2)) then begin ruch2:=false; py2:=py2+1; end else ruch2:=true;
           player1(px,py,2);
           player2(px2,py2,2);
           pokazgrafike;
           player2_0(px2,py2,2);
     until ruch2;
end;

procedure player1_game;
begin
     timeture.start;
     repeat
           if penergy<0 then exitgame:=true;
           if cenergy<0 then exitgame:=true;
           getmousepos(mx,my,k);
           mx:=mx div 2;
           kursormouse(mx,my,1,1,0,true);
           if anim=3 then anim:=1;
           if (granica(px,py+1,2)) then begin ruch:=false; py:=py+1; end else begin ruch:=true; end;
           player1(px,py,2);
           player2(px2,py2,2);
           putpixel(7,190-round(we),1,2);
           putpixel(8,190-round(we),1,2);
           putpixel(9,190-round(we),1,2);
           openfnttekst('data\time.fnt',0,5,10,14,2,'TIME: '+numstr(timeture.stop),_rgraph);
           openfnttekst('data\bold.fnt',90,5,7,14,2,'PLAYER 1',_rgraph);
           pokazgrafike;
           bar(6,6,180,17,255,2);
           putpixel(7,190-round(we),23,2);
           putpixel(8,190-round(we),23,2);
           putpixel(9,190-round(we),23,2);
           bar(mx,my,mx+10,my+10,255,1);
           player1_0(px,py,2);
           {obsluga broni}
           if (we>21) and (we<30) then begin lufa_poz:='/'; y_pocisku:=0; end;
           if (we>11) and (we<20) then begin lufa_poz:='-'; y_pocisku:=2; end;
           if (we>0) and (we<10) then begin lufa_poz:='\'; y_pocisku:=4; end;
           if keydown[upscan] and (we<30) then we:=we+1;
           if keydown[downscan] and (we>0) then
           begin
                we:=we-1;
           end;
           {poryszanie sie gracza 1}
           if ruch and (keydown[rightscan] and not keydown[downscan] and not keydown[upscan] and not keydown[leftscan] and
           not keydown[scanof('a')] and not keydown[scanof('z')] and not keydown[scanof('x')] and granica(px+1,py,2)) then
           begin pozycja_p1:='prawo';px:=px+1; anim:=anim+1; end;
           if ruch and (keydown[leftscan] and not keydown[downscan] and not keydown[upscan] and not keydown[rightscan] and
           not keydown[scanof('a')] and not keydown[scanof('z')] and not keydown[scanof('x')] and granica(px-1,py,2)) then
           begin pozycja_p1:='lewo'; px:=px-1; anim:=anim+1; end;
           if pozycja_p1='prawo' then x_pocisku:=0;
           if pozycja_p1='lewo' then begin x_pocisku:=-7; end;
           if ruch and keydown[scanof('s')] and licznik_mocy then
           begin
                t:=t-we;
                vx:=de;
                xr:=px+8;
                yr:=py+2;
                putpixel(7,190-round(we),1,2);
                putpixel(8,190-round(we),1,2);
                putpixel(9,190-round(we),1,2);
                player1(px,py,2);
                if (bron='pistolet') then
                begin if sounds then startsound(sound[8],8,false); vy0:=1.0; de:=10; vx:=de; end else vy0:=0.0;
                if (bron='laser') then begin vy0:=1.0; de:=10; vx:=de; end else begin vy0:=0.0; end;
                if pozycja_p1='prawo' then
                begin
                if bron='rakiety' then
                begin
                if sounds then startsound(sound[5],5,true);
                ilelaser:=0;
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr+vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      putpixel(x+x_pocisku,y+y_pocisku,colp,2);
                      putpixel(x+x_pocisku,y+y_pocisku+2,colp,2);
                      putpixel(x+x_pocisku,y+y_pocisku+4,colp,2);
                      pokazgrafike;
                      putpixel(x+x_pocisku,y+y_pocisku,255,2);
                      putpixel(x+x_pocisku,y+y_pocisku+2,255,2);
                      putpixel(x+x_pocisku,y+y_pocisku+4,255,2);
                      if (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                      (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8)
                      then
                      begin
                           if bron='rakiety' then cenergy:=cenergy-(random(200)+125);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           randomize;
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y<2) or (y>198)
                or (getpixel(x+x_pocisku,y+y_pocisku+3,2)in[1..254]) or
                (getpixel(x+x_pocisku,y+y_pocisku+5,2)in[1..254]) or
                (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8);
                stopsound(5);
                ilelaser:=0;
                end;
                if bron='laser' then
                begin
                if sounds then startsound(sound[6],6,false);
                ilelaser:=0;
                repeat
                      inc(ilelaser);
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr+vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      line(px+x_pocisku+7,py+y_pocisku+2,x+x_pocisku,y+y_pocisku,colp,2);
                      pokazgrafike;
                      line(px+x_pocisku+7,py+y_pocisku+2,x+x_pocisku,y+y_pocisku,255,2);
                      if (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                      (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8)
                      then
                      begin
                           if bron='laser' then cenergy:=cenergy-(random(100)+80);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[254..254])
                or (x<2) or (x>318) or (y<2) or (y>198) or (ilelaser=30) or
                (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8);
                ilelaser:=0;
                end else
                begin
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr+vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      putpixel(x+x_pocisku,y+y_pocisku,colp,2);
                      pokazgrafike;
                      putpixel(x+x_pocisku,y+y_pocisku,255,2);
                      if (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                      (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8)
                      then
                      begin
                           if bron='bazuka' then cenergy:=cenergy-(random(50)+25);
                           if bron='granat' then cenergy:=cenergy-(random(70)+45);
                           if bron='plazma' then cenergy:=cenergy-random(10)+2;
                           if bron='pistolet' then cenergy:=cenergy-(random(60)+30);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y<2) or (y>198) or
                ((x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8));
                end;
                end;
                if pozycja_p1='lewo' then
                begin
                if bron='rakiety' then
                begin
                if sounds then startsound(sound[5],5,true);
                ilelaser:=0;
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr-vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      putpixel(x+x_pocisku,y+y_pocisku,colp,2);
                      putpixel(x+x_pocisku,y+y_pocisku+2,colp,2);
                      putpixel(x+x_pocisku,y+y_pocisku+4,colp,2);
                      pokazgrafike;
                      putpixel(x+x_pocisku,y+y_pocisku,255,2);
                      putpixel(x+x_pocisku,y+y_pocisku+2,255,2);
                      putpixel(x+x_pocisku,y+y_pocisku+4,255,2);
                      if (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                      (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8)
                      then
                      begin
                           if bron='rakiety' then cenergy:=cenergy-(random(200)+125);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y<2) or (y>198)
                or (getpixel(x+x_pocisku,y+y_pocisku+3,2)in[1..254]) or
                (getpixel(x+x_pocisku,y+y_pocisku+5,2)in[1..254]) or
                (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8);
                stopsound(5);
                ilelaser:=0;
                end;
                if bron='laser' then
                begin
                if sounds then startsound(sound[6],6,false);
                repeat
                      inc(ilelaser);
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr-vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      line(px+x_pocisku+7,py+y_pocisku+2,x+x_pocisku,y+y_pocisku,colp,2);
                      pokazgrafike;
                      line(px+x_pocisku+7,py+y_pocisku+2,x+x_pocisku,y+y_pocisku,255,2);
                      if (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                      (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8)
                      then
                      begin
                           if bron='laser' then cenergy:=cenergy-(random(100)+80);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[254..254])
                or (x<2) or (x>318) or (y<2) or (y>198) or (ilelaser=20) or
                (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8);
                ilelaser:=0;
                end else
                begin
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr-vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      putpixel(x+x_pocisku,y+y_pocisku,colp,2);
                      pokazgrafike;
                      putpixel(x+x_pocisku,y+y_pocisku,255,2);
                      if (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                      (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8)
                      then
                      begin
                           if bron='bazuka' then cenergy:=cenergy-(random(50)+25);
                           if bron='granat' then cenergy:=cenergy-(random(70)+45);
                           if bron='plazma' then cenergy:=cenergy-random(10)+2;
                           if bron='pistolet' then cenergy:=cenergy-(random(60)+30);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y<2) or (y>198);
                end;
                end;
                if bron='bazuka' then
                begin
                     if sounds then startsound(sound[1],1,false);
                     kaboom(90,6,'boom1',false);
                end;
                if bron='granat' then
                begin
                     if sounds then startsound(sound[2],2,false);
                     kaboom(90,4,'boom3',false);
                end;
                if bron='plazma' then
                begin
                     if sounds then startsound(sound[14],14,false);
                     kaboom(50,3,'boom2',true);
                end;
                if bron='pistolet' then
                begin
                     kaboom(50,1,'boom3',false);
                     randomize;
                     i:=random(4)+1;
                     if i=1 then if sounds then startsound(sound[10],10,false);
                     if i=2 then if sounds then startsound(sound[11],11,false);
                     if i=3 then if sounds then startsound(sound[12],12,false);
                     if i=4 then if sounds then startsound(sound[13],13,false);
                end;
                if bron='rakiety' then
                begin
                     if sounds then startsound(sound[4],4,false);
                     kaboom(50,4,'boom3',false);
                     kaboom(50,4,'boom3',false);
                     kaboom(50,4,'boom3',false);
                end;
                player1(px,py,2);
                rectangle(1,1,320,200,15,2);
                line(320,31,320,158,12,2);
                defaultpos;
                pokazgrafike;
                de:=0;
                bar(20,160,22,190,23,1);
                putpixel(20,190,12,1);
                putpixel(21,190,12,1);
                putpixel(22,190,12,1);
                bar(10,13,70,25,255,2);
                koniec_tury_p1:=true;
           end;
           {skok}
           if ruch and keydown[scanof('a')] and (pozycja_p1='prawo') then
           begin
                t:=t-15;
                vx:=0.5;
                xr:=px;
                yr:=py-1;
                pozycja_p1:='prawo';
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr+vx*dt;
                      py:=round(yr);
                      px:=round(xr);
                      player1(px,py,2);
                      pokazgrafike;
                      player1_0(px,py,2);
                      if (keydown[rightscan]) then
                      begin
                           xr:=xr+0.1;
                      end;
                      if (keydown[leftscan]) then
                      begin
                           xr:=xr-0.1;
                      end;
                until (granica2(round(px)-5,round(py)-5,2)) or (getpixel(round(px)+7,round(py)+5,2) in[1..254]);
                defaultpos;
           end;
           if ruch and keydown[scanof('a')] and (pozycja_p1='lewo') then
           begin
                t:=t-15;
                vx:=0.5;
                xr:=px;
                yr:=py-1;
                pozycja_p1:='lewo';
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr-vx*dt;
                      py:=round(yr);
                      px:=round(xr);
                      player1(px,py,2);
                      pokazgrafike;
                      player1_0(px,py,2);
                      if (keydown[rightscan]) then
                      begin
                           xr:=xr+0.1;
                      end;
                      if (keydown[leftscan]) then
                      begin
                           xr:=xr-0.1;
                      end;
                until (granica2(round(px),round(py)-5,2)) or (getpixel(round(px),round(py)+5,2) in[1..254]);
                defaultpos;
           end;
           if ruch and keydown[scanof('z')] then pozycja_p1:='lewo';
           if ruch and keydown[scanof('x')] then pozycja_p1:='prawo';

           czekaj(1);

           {menu weapons}
           if ruch and mousein(mx,my,319,31,319,148) then
           begin
                openpfile(290,30,'gfx\weapons\weapons.gfx',0,1);
                player1(px,py,2);
                line(320,31,320,158,12,1);
                pokazgrafike;
                exitweapons:=false;
                repeat
                      getmousepos(mx,my,k);
                      mx:=mx div 2;
                      kursormouse(mx,my,1,1,0,true);
                      pokazgrafike;
                      openpfile(290,30,'gfx\weapons\weapons.gfx',0,1);
                      if mousein(mx,my,290,31,319,44) and (k=1) then begin bron:='bazuka'; exitweapons:=true; colp:=26; end;
                      if mousein(mx,my,290,45,319,60) and (k=1) then begin bron:='atom'; exitweapons:=true; colp:=14; end;
                      if mousein(mx,my,290,61,319,76) and (k=1) then begin bron:='granat'; exitweapons:=true; colp:=6; end;
                      if mousein(mx,my,290,77,319,92) and (k=1) then begin bron:='plazma'; exitweapons:=true; colp:=10; end;
                      if mousein(mx,my,290,93,319,108) and (k=1) then begin bron:='pistolet'; exitweapons:=true; colp:=28; end;
                      if mousein(mx,my,290,109,319,124) and (k=1) then begin bron:='laser'; exitweapons:=true; colp:=12;
                      backgr:=true; end;
                      if mousein(mx,my,290,125,319,141) and (k=1) then begin bron:='rakiety'; exitweapons:=true; colp:=15; end;
                      if mousein(mx,my,290,142,319,158) and (k=1) then begin bron:='nalot'; exitweapons:=true; colp:=9; end;
                until not mousein(mx,my,290,31,319,148) or exitweapons;
                bar(mx,my,mx+10,my+10,255,1);
                bar(290,30,319,158,255,1);
                line(320,31,320,158,255,1);
                if bron='atom' then
                begin
                repeat
                      getmousepos(mx,my,k);
                      mx:=mx div 2;
                      kursormouse(mx,my,1,2,0,true);
                      player1(px,py,2);
                      pokazgrafike;
                      bar(mx,my,mx+10,my+10,255,1);
                until (k=2) and (getpixel(mx,my,2)=255);
                y:=1;
                x:=mx;
                if sounds then startsound(sound[9],9,false);
                if sounds then startsound(sound[7],7,true);
                repeat
                      y:=y+1;
                      player1(px,py,2);
                      putpixel(x,y,colp,2);
                      pokazgrafike;
                      putpixel(x,y,255,2);
                      if (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                      (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8)
                      then
                      begin
                           if bron='atom' then cenergy:=cenergy-(random(500)+225);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y>198) or
                (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8);
                stopsound(7);
                if sounds then startsound(sound[3],3,true);
                if sounds then startsound(sound[0],0,true);
                if sounds then startsound(sound[1],1,true);
                kaboomatom(90,5,false);
                earthquake;
                for i:= 0 to 50 do
                begin
                     circle(x,y,i,255,2);
                     circle(x-1,y,i,255,2);
                end;
                stopsound(3);
                stopsound(0);
                stopsound(1);
                line(320,31,320,158,12,1);
                bron:='bazuka';
                rectangle(1,1,320,200,15,2);
                koniec_tury_p1:=true;
                end;
                if bron='nalot' then
                begin
                repeat
                      getmousepos(mx,my,k);
                      mx:=mx div 2;
                      kursormouse(mx,my,1,2,0,true);
                      player1(px,py,2);
                      pokazgrafike;
                      bar(mx,my,mx+10,my+10,255,1);
                until (k=2) and (getpixel(mx,my,2)=255);
                y:=1;
                x:=mx;
                if sounds then startsound(sound[9],9,false);
                if sounds then startsound(sound[7],7,true);
                if sounds then startsound(sound[7],7,true);
                if sounds then startsound(sound[7],7,true);
                repeat
                      y:=y+1;
                      player1(px,py,2);
                      putpixel(x,y,colp,2);
                      putpixel(x-10,y,colp,2);
                      putpixel(x-20,y,colp,2);
                      pokazgrafike;
                      putpixel(x,y,255,2);
                      putpixel(x-10,y,255,2);
                      putpixel(x-20,y,255,2);
                      if (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                      (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8)
                      then
                      begin
                           if bron='nalot' then cenergy:=cenergy-(random(300)+125);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y>198) or (getpixel(x+x_pocisku-10,y+y_pocisku+1,2)in[1..254])
                or (getpixel(x+x_pocisku-20,y+y_pocisku+1,2)in[1..254])
                or (x+x_pocisku>px2-4) and (x+x_pocisku<px2+8) and
                (y+y_pocisku>py2-4) and (y+y_pocisku<py2+8);
                stopsound(7);
                stopsound(7);
                stopsound(7);
                if sounds then startsound(sound[2],2,false);
                if sounds then startsound(sound[3],3,false);
                if sounds then startsound(sound[4],4,false);
                for i:= 0 to 20 do
                begin
                     circle(x,y,i,255,2);
                     circle(x-1,y,i,255,2);
                     circle(x-10,y,i,255,2);
                     circle(x-1-10,y,i,255,2);
                     circle(x-20,y,i,255,2);
                     circle(x-1-20,y,i,255,2);
                end;
                line(320,31,320,158,12,1);
                bron:='bazuka';
                koniec_tury_p1:=true;
                end;
           end;

           if keydown[1] then exitgame:=true;
           if (timeture.stop=exittime+1) then koniec_tury_p1:=true;
     until koniec_tury_p1 or exitgame;
end;

procedure player2_game;
begin
     timeture.start;
     repeat
           if penergy<0 then exitgame:=true;
           if cenergy<0 then exitgame:=true;
           getmousepos(mx,my,k);
           mx:=mx div 2;
           kursormouse(mx,my,1,1,0,true);
           if anim2=3 then anim2:=1;
           if (granica(px2,py2+1,2)) then begin ruch2:=false; py2:=py2+1; end else ruch2:=true;
           player2(px2,py2,2);
           player1(px,py,2);
           putpixel(7,190-round(we2),1,2);
           putpixel(8,190-round(we2),1,2);
           putpixel(9,190-round(we2),1,2);
           openfnttekst('data\time.fnt',0,5,10,14,2,'TIME: '+numstr(timeture.stop),_rgraph);
           openfnttekst('data\bold.fnt',90,5,7,14,2,'PLAYER 2',_rgraph);
           pokazgrafike;
           bar(6,6,180,17,255,2);
           putpixel(7,190-round(we2),23,2);
           putpixel(8,190-round(we2),23,2);
           putpixel(9,190-round(we2),23,2);
           bar(mx,my,mx+10,my+10,255,1);
           player2_0(px2,py2,2);
           {obsluga bron2i}
           if (we2>21) and (we2<30) then begin lufa_poz2:='/'; y_pocisku:=0; end;
           if (we2>11) and (we2<20) then begin lufa_poz2:='-'; y_pocisku:=2; end;
           if (we2>0) and (we2<10) then begin lufa_poz2:='\'; y_pocisku:=4; end;
           if keydown[upscan] and (we2<30) then we2:=we2+1;
           if keydown[downscan] and (we2>0) then
           begin
                we2:=we2-1;
           end;
           {poryszanie sie gracza 1}
           if ruch2 and (keydown[rightscan] and not keydown[downscan] and not keydown[upscan] and not keydown[leftscan] and
           not keydown[scanof('a')] and not keydown[scanof('z')] and not keydown[scanof('x')] and granica(px2+1,py2,2)) then
           begin pozycja_p2:='prawo';px2:=px2+1; anim2:=anim2+1; end;
           if ruch2 and (keydown[leftscan] and not keydown[downscan] and not keydown[upscan] and not keydown[rightscan] and
           not keydown[scanof('a')] and not keydown[scanof('z')] and not keydown[scanof('x')] and granica(px2-1,py2,2)) then
           begin pozycja_p2:='lewo'; px2:=px2-1; anim2:=anim2+1; end;
           if pozycja_p2='prawo' then x_pocisku:=0;
           if pozycja_p2='lewo' then begin x_pocisku:=-7; end;
           if ruch2 and keydown[scanof('s')] and licznik_mocy2 then
           begin
                t:=t-we2;
                vx:=de2;
                xr:=px2+8;
                yr:=py2+2;
                putpixel(7,190-round(we2),1,2);
                putpixel(8,190-round(we2),1,2);
                putpixel(9,190-round(we2),1,2);
                player2(px2,py2,2);
                if (bron2='pistolet') then
                begin if sounds then startsound(sound[8],8,false); vy0:=1.0; de2:=10; vx:=de2; end else vy0:=0.0;
                if (bron2='laser') then begin vy0:=1.0; de2:=10; vx:=de2; end else begin vy0:=0.0; end;
                if pozycja_p2='prawo' then
                begin
                if bron2='rakiety' then
                begin
                if sounds then startsound(sound[5],5,true);
                ilelaser:=0;
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr+vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      putpixel(x+x_pocisku,y+y_pocisku,colp,2);
                      putpixel(x+x_pocisku,y+y_pocisku+2,colp,2);
                      putpixel(x+x_pocisku,y+y_pocisku+4,colp,2);
                      pokazgrafike;
                      putpixel(x+x_pocisku,y+y_pocisku,255,2);
                      putpixel(x+x_pocisku,y+y_pocisku+2,255,2);
                      putpixel(x+x_pocisku,y+y_pocisku+4,255,2);
                      if (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                      (y+y_pocisku>py-4) and (y+y_pocisku<py+8)
                      then
                      begin
                           if bron2='rakiety' then penergy:=penergy-(random(200)+125);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y<2) or (y>198)
                or (getpixel(x+x_pocisku,y+y_pocisku+3,2)in[1..254]) or
                (getpixel(x+x_pocisku,y+y_pocisku+5,2)in[1..254]) or
                (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                (y+y_pocisku>py-4) and (y+y_pocisku<py+8);
                stopsound(5);
                ilelaser:=0;
                end;
                if bron2='laser' then
                begin
                if sounds then startsound(sound[6],6,false);
                ilelaser:=0;
                repeat
                      inc(ilelaser);
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr+vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      line(px2+x_pocisku+7,py2+y_pocisku+2,x+x_pocisku,y+y_pocisku,colp,2);
                      pokazgrafike;
                      line(px2+x_pocisku+7,py2+y_pocisku+2,x+x_pocisku,y+y_pocisku,255,2);
                      if (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                      (y+y_pocisku>py-4) and (y+y_pocisku<py+8)
                      then
                      begin
                           if bron2='laser' then penergy:=penergy-(random(100)+80);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[254..254])
                or (x<2) or (x>318) or (y<2) or (y>198) or (ilelaser=30) or
                (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                (y+y_pocisku>py-4) and (y+y_pocisku<py+8);
                ilelaser:=0;
                end else
                begin
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr+vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      putpixel(x+x_pocisku,y+y_pocisku,colp,2);
                      pokazgrafike;
                      putpixel(x+x_pocisku,y+y_pocisku,255,2);
                      if (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                      (y+y_pocisku>py-4) and (y+y_pocisku<py+8)
                      then
                      begin
                           if bron2='bazuka' then penergy:=penergy-(random(50)+25);
                           if bron2='granat' then penergy:=penergy-(random(70)+45);
                           if bron2='plazma' then penergy:=penergy-random(10)+2;
                           if bron2='pistolet' then penergy:=penergy-(random(60)+30);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y<2) or (y>198) or
                ((x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                (y+y_pocisku>py-4) and (y+y_pocisku<py+8));
                end;
                end;
                if pozycja_p2='lewo' then
                begin
                if bron2='rakiety' then
                begin
                if sounds then startsound(sound[5],5,true);
                ilelaser:=0;
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr-vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      putpixel(x+x_pocisku,y+y_pocisku,colp,2);
                      putpixel(x+x_pocisku,y+y_pocisku+2,colp,2);
                      putpixel(x+x_pocisku,y+y_pocisku+4,colp,2);
                      pokazgrafike;
                      putpixel(x+x_pocisku,y+y_pocisku,255,2);
                      putpixel(x+x_pocisku,y+y_pocisku+2,255,2);
                      putpixel(x+x_pocisku,y+y_pocisku+4,255,2);
                      if (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                      (y+y_pocisku>py-4) and (y+y_pocisku<py+8)
                      then
                      begin
                           if bron2='rakiety' then penergy:=penergy-(random(200)+125);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y<2) or (y>198)
                or (getpixel(x+x_pocisku,y+y_pocisku+3,2)in[1..254]) or
                (getpixel(x+x_pocisku,y+y_pocisku+5,2)in[1..254]) or
                (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                (y+y_pocisku>py-4) and (y+y_pocisku<py+8);
                stopsound(5);
                ilelaser:=0;
                end;
                if bron2='laser' then
                begin
                if sounds then startsound(sound[6],6,false);
                repeat
                      inc(ilelaser);
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr-vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      line(px2+x_pocisku+7,py2+y_pocisku+2,x+x_pocisku,y+y_pocisku,colp,2);
                      pokazgrafike;
                      line(px2+x_pocisku+7,py2+y_pocisku+2,x+x_pocisku,y+y_pocisku,255,2);
                      if (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                      (y+y_pocisku>py-4) and (y+y_pocisku<py+8)
                      then
                      begin
                           if bron2='laser' then penergy:=penergy-(random(100)+80);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[254..254])
                or (x<2) or (x>318) or (y<2) or (y>198) or (ilelaser=20) or
                (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                (y+y_pocisku>py-4) and (y+y_pocisku<py+8);
                ilelaser:=0;
                end else
                begin
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr-vx*dt;
                      y:=round(yr);
                      x:=round(xr);
                      putpixel(x+x_pocisku,y+y_pocisku,colp,2);
                      pokazgrafike;
                      putpixel(x+x_pocisku,y+y_pocisku,255,2);
                      if (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                      (y+y_pocisku>py-4) and (y+y_pocisku<py+8)
                      then
                      begin
                           if bron2='bazuka' then penergy:=penergy-(random(50)+25);
                           if bron2='granat' then penergy:=penergy-(random(70)+45);
                           if bron2='plazma' then penergy:=penergy-random(10)+2;
                           if bron2='pistolet' then penergy:=penergy-(random(60)+30);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y<2) or (y>198);
                end;
                end;
                if bron2='bazuka' then
                begin
                     if sounds then startsound(sound[1],1,false);
                     kaboom(90,6,'boom1',false);
                end;
                if bron2='granat' then
                begin
                     if sounds then startsound(sound[2],2,false);
                     kaboom(90,4,'boom3',false);
                end;
                if bron2='plazma' then
                begin
                     if sounds then startsound(sound[14],14,false);
                     kaboom(50,3,'boom2',true);
                end;
                if bron2='pistolet' then
                begin
                     kaboom(50,1,'boom3',false);
                     randomize;
                     i:=random(4)+1;
                     if i=1 then if sounds then startsound(sound[10],10,false);
                     if i=2 then if sounds then startsound(sound[11],11,false);
                     if i=3 then if sounds then startsound(sound[12],12,false);
                     if i=4 then if sounds then startsound(sound[13],13,false);
                end;
                if bron2='rakiety' then
                begin
                     if sounds then startsound(sound[4],4,false);
                     kaboom(50,4,'boom3',false);
                     kaboom(50,4,'boom3',false);
                     kaboom(50,4,'boom3',false);
                end;
                player2(px2,py2,2);
                rectangle(1,1,320,200,15,2);
                line(320,31,320,158,12,2);
                defaultpos;
                pokazgrafike;
                de2:=0;
                bar(20,160,22,190,23,1);
                putpixel(20,190,12,1);
                putpixel(21,190,12,1);
                putpixel(22,190,12,1);
                bar(10,13,70,25,255,2);
                koniec_tury_p2:=true;
           end;
           {skok}
           if ruch2 and keydown[scanof('a')] and (pozycja_p2='prawo') then
           begin
                t:=t-15;
                vx:=0.5;
                xr:=px2;
                yr:=py2-1;
                pozycja_p2:='prawo';
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr+vx*dt;
                      py2:=round(yr);
                      px2:=round(xr);
                      player2(px2,py2,2);
                      pokazgrafike;
                      player2_0(px2,py2,2);
                      if (keydown[rightscan]) then
                      begin
                           xr:=xr+0.1;
                      end;
                      if (keydown[leftscan]) then
                      begin
                           xr:=xr-0.1;
                      end;
                until (granica2(round(px2)-5,round(py2)-5,2)) or (getpixel(round(px2)+7,round(py2)+5,2) in[1..254]);
                defaultpos;
           end;
           if ruch2 and keydown[scanof('a')] and (pozycja_p2='lewo') then
           begin
                t:=t-15;
                vx:=0.5;
                xr:=px2;
                yr:=py2-1;
                pozycja_p2:='lewo';
                repeat
                      t:=t+dt;
                      vy:=vy0+a*t;
                      yr:=yr+vy*dt;
                      xr:=xr-vx*dt;
                      py2:=round(yr);
                      px2:=round(xr);
                      player2(px2,py2,2);
                      pokazgrafike;
                      player2_0(px2,py2,2);
                      if (keydown[rightscan]) then
                      begin
                           xr:=xr+0.1;
                      end;
                      if (keydown[leftscan]) then
                      begin
                           xr:=xr-0.1;
                      end;
                until (granica2(round(px2),round(py2)-5,2)) or (getpixel(round(px2),round(py2)+5,2) in[1..254]);
                defaultpos;
           end;
           if ruch2 and keydown[scanof('z')] then pozycja_p2:='lewo';
           if ruch2 and keydown[scanof('x')] then pozycja_p2:='prawo';

           czekaj(1);

           {menu weapons}
           if ruch2 and mousein(mx,my,319,31,319,148) then
           begin
                openpfile(290,30,'gfx\weapons\weapons.gfx',0,1);
                player2(px2,py2,2);
                line(320,31,320,158,12,1);
                pokazgrafike;
                exitweapons:=false;
                repeat
                      getmousepos(mx,my,k);
                      mx:=mx div 2;
                      kursormouse(mx,my,1,1,0,true);
                      pokazgrafike;
                      openpfile(290,30,'gfx\weapons\weapons.gfx',0,1);
                      if mousein(mx,my,290,31,319,44) and (k=1) then begin bron2:='bazuka'; exitweapons:=true; colp:=26; end;
                      if mousein(mx,my,290,45,319,60) and (k=1) then begin bron2:='atom'; exitweapons:=true; colp:=14; end;
                      if mousein(mx,my,290,61,319,76) and (k=1) then begin bron2:='granat'; exitweapons:=true; colp:=6; end;
                      if mousein(mx,my,290,77,319,92) and (k=1) then begin bron2:='plazma'; exitweapons:=true; colp:=10; end;
                      if mousein(mx,my,290,93,319,108) and (k=1) then begin bron2:='pistolet'; exitweapons:=true; colp:=28;end;
                      if mousein(mx,my,290,109,319,124) and (k=1) then begin bron2:='laser'; exitweapons:=true; colp:=12;
                      backgr:=true; end;
                      if mousein(mx,my,290,125,319,141) and (k=1) then begin bron2:='rakiety'; exitweapons:=true; colp:=15;end;
                      if mousein(mx,my,290,142,319,158) and (k=1) then begin bron2:='nalot'; exitweapons:=true; colp:=9; end;
                until not mousein(mx,my,290,31,319,148) or exitweapons;
                bar(mx,my,mx+10,my+10,255,1);
                bar(290,30,319,158,255,1);
                line(320,31,320,158,255,1);
                if bron2='atom' then
                begin
                repeat
                      getmousepos(mx,my,k);
                      mx:=mx div 2;
                      kursormouse(mx,my,1,2,0,true);
                      player1(px,py,2);
                      pokazgrafike;
                      bar(mx,my,mx+10,my+10,255,1);
                until (k=2) and (getpixel(mx,my,2)=255);
                y:=1;
                x:=mx;
                if sounds then startsound(sound[9],9,false);
                if sounds then startsound(sound[7],7,true);
                repeat
                      y:=y+1;
                      player1(px,py,2);
                      putpixel(x,y,colp,2);
                      pokazgrafike;
                      putpixel(x,y,255,2);
                      if (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                      (y+y_pocisku>py-4) and (y+y_pocisku<py+8)
                      then
                      begin
                           if bron2='atom' then penergy:=penergy-(random(500)+225);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y>198) or
                (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                (y+y_pocisku>py-4) and (y+y_pocisku<py+8);
                stopsound(7);
                if sounds then startsound(sound[3],3,true);
                if sounds then startsound(sound[0],0,true);
                if sounds then startsound(sound[1],1,true);
                kaboomatom(90,5,false);
                earthquake;
                for i:= 0 to 50 do
                begin
                     circle(x,y,i,255,2);
                     circle(x-1,y,i,255,2);
                end;
                stopsound(3);
                stopsound(0);
                stopsound(1);
                line(320,31,320,158,12,1);
                bron2:='bazuka';
                rectangle(1,1,320,200,15,2);
                koniec_tury_p2:=true;
                end;
                if bron2='nalot' then
                begin
                repeat
                      getmousepos(mx,my,k);
                      mx:=mx div 2;
                      kursormouse(mx,my,1,2,0,true);
                      player2(px2,py2,2);
                      pokazgrafike;
                      bar(mx,my,mx+10,my+10,255,1);
                until (k=2) and (getpixel(mx,my,2)=255);
                y:=1;
                x:=mx;
                if sounds then startsound(sound[9],9,false);
                if sounds then startsound(sound[7],7,true);
                if sounds then startsound(sound[7],7,true);
                if sounds then startsound(sound[7],7,true);
                repeat
                      y:=y+1;
                      player2(px2,py2,2);
                      putpixel(x,y,colp,2);
                      putpixel(x-10,y,colp,2);
                      putpixel(x-20,y,colp,2);
                      pokazgrafike;
                      putpixel(x,y,255,2);
                      putpixel(x-10,y,255,2);
                      putpixel(x-20,y,255,2);
                      if (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                      (y+y_pocisku>py-4) and (y+y_pocisku<py+8)
                      then
                      begin
                           if bron2='nalot' then penergy:=penergy-(random(300)+125);
                           bar(30,150,70,200,29,2);
                           rectangle(30,150,70,200,15,2);
                           if penergy in[0..9] then po:=15;
                           if penergy in[10..99] then po:=11;
                           if (penergy>99) and (penergy<999) then po:=9;
                           if (penergy>999) and (penergy<9999) then po:=6;
                           if (penergy>9999) and (penergy<99999) then po:=3;
                           if cenergy in[0..9] then co:=15;
                           if cenergy in[10..99] then co:=11;
                           if (cenergy>99) and (cenergy<999) then co:=9;
                           if (cenergy>999) and (cenergy<9999) then co:=6;
                           if (cenergy>9999) and (cenergy<99999) then co:=3;
                           openfnttekst('data\litt.fnt',26,155,6,26,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',26,156,6,27,2,'PLAYER',_rgraph);
                           openfnttekst('data\litt.fnt',po+26,165,6,12,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',po+26,166,6,4,2,numstr(penergy),_rgraph);
                           openfnttekst('data\litt.fnt',29,177,6,26,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',29,178,6,27,2,' CPU',_rgraph);
                           openfnttekst('data\litt.fnt',co+26,187,6,12,2,numstr(cenergy),_rgraph);
                           openfnttekst('data\litt.fnt',co+26,188,6,4,2,numstr(cenergy),_rgraph);
                           i:=random(6)+1;
                           if i=1 then if sounds then startsound(sound[15],15,false);
                           if i=2 then if sounds then startsound(sound[16],16,false);
                           if i=3 then if sounds then startsound(sound[17],17,false);
                           if i=4 then if sounds then startsound(sound[18],18,false);
                           if i=5 then if sounds then startsound(sound[19],19,false);
                           if i=6 then if sounds then startsound(sound[20],20,false);
                      end;
                until (getpixel(x+x_pocisku,y+y_pocisku+1,2)in[1..254])
                or (x<2) or (x>318) or (y>198) or (getpixel(x+x_pocisku-10,y+y_pocisku+1,2)in[1..254])
                or (getpixel(x+x_pocisku-20,y+y_pocisku+1,2)in[1..254])
                or (x+x_pocisku>px-4) and (x+x_pocisku<px+8) and
                (y+y_pocisku>py-4) and (y+y_pocisku<py+8);
                stopsound(7);
                stopsound(7);
                stopsound(7);
                if sounds then startsound(sound[2],2,false);
                if sounds then startsound(sound[3],3,false);
                if sounds then startsound(sound[4],4,false);
                for i:= 0 to 20 do
                begin
                     circle(x,y,i,255,2);
                     circle(x-1,y,i,255,2);
                     circle(x-10,y,i,255,2);
                     circle(x-1-10,y,i,255,2);
                     circle(x-20,y,i,255,2);
                     circle(x-1-20,y,i,255,2);
                end;
                line(320,31,320,158,12,1);
                bron2:='bazuka';
                koniec_tury_p2:=true;
                end;
           end;
           if keydown[1] then exitgame:=true;
           if (timeture.stop=exittime+1) then koniec_tury_p2:=true;
     until koniec_tury_p2 or exitgame;
end;

end.