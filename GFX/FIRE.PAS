
uses crt;

procedure init13h; assembler;
asm
   mov ax, 13h
   int $10
end;

procedure close13h; assembler;
asm
   mov ax, 03h
   int $10
end;

procedure putpixel(x, y : integer; c : byte);
begin
     mem[$a000:320*y+x]:=c;
end;

function getpixel(x, y : integer) : byte;
begin
     getpixel:=mem[$a000:320*y+x];
end;

procedure paleta;
var
   i : integer;
begin
     for i:= 0 to 63 do
     begin
          port[$3C8]:=i;
          port[$3C9]:=i;
          port[$3C9]:=i div 2;
          port[$3C9]:=0;
     end;
end;

var
   x, y : integer;
   c : byte;

begin
init13h;
paleta;
for x:= 40 to 280 do putpixel(x,190,63);
repeat
      for x:= 5 to 315 do
      for y:= 165 to 195 do
      begin
           if (getpixel(x,y)<>63) then
           begin
                c:=getpixel(x,y+1);
                if c>5 then
                begin
                     putpixel(x+random(5)-2,y,c-random(5)-1);
                end
                else putpixel(x,y,0);
           end;
      end;
      delay(50);
until keypressed;
close13h;
end.