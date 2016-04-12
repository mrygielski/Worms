
unit wormtpu;

interface

uses rgraph, games, smix, detect;

{grafika}
procedure opengfxfile(plik : string; tlo, l : byte);
procedure openpfile(x1, y1 : integer; plik : string; tlo, l : byte);
procedure openpfile0(x1, y1 : integer; plik : string; tlo, c, l : byte);
procedure openpfile_p2(x1, y1 : integer; plik : string; tlo, l : byte);
procedure openpfile0_p2(x1, y1 : integer; plik : string; tlo, c, l : byte);
procedure openpfileanim(x1, y1 : integer; plik : string; nr : byte; tlo, l : byte);
procedure openpfileanim0(x1, y1 : integer; plik : string; nr : byte; tlo, c, l : byte);
procedure openpfileanim_1(x1, y1 : integer; plik : string; nr : byte; tlo, l : byte);
procedure openpfileanim0_1(x1, y1 : integer; plik : string; nr : byte; tlo, c, l : byte);
procedure openpfileanimmenu(x1, y1 : integer; plik : string; nr : byte; tlo, l : byte);
{gra}

const
     a : real = 0.1;
     getmaxx = 320;
     getmaxy = 200;
     ilesound = 21;

var
   x, y : integer;
   xr, yr : real;
   vx, vy : real;
   t, dt : real;
   vy0 : real;
   stop_moc : boolean;
   boomanim, xboom : byte;
   we, de : real;
   we2, de2 : real;
   px, py : integer;
   px2, py2 : integer;
   i, j : integer;
   bron : string;
   bron2 : string;
   mx, my, k : integer;
   penergy, cenergy : integer;
   po, co : byte;
   zasieg : byte;
   x_pocisku, y_pocisku : shortint;
   anim : byte;
   anim2 : byte;
   ruch : boolean;
   ruch2 : boolean;
   lufa_poz : string; {1 /  2 -  3 \}
   pozycja_p1 : string;
   lufa_poz2 : string; {1 /  2 -  3 \}
   pozycja_p2 : string;
   exitweapons : boolean;
   colp : byte;
   backgr : boolean;
   ilelaser : byte;
   koniec_tury_p1, koniec_tury_p2 : boolean;

procedure defaultpos;
procedure kursormouse(x, y : integer; l, nr, ii : byte; jest : boolean);
function granica(x, y, l : integer) : boolean;
function granica2(x, y, l : integer) : boolean;
procedure player1(x, y : integer; l : byte);
procedure player1_0(x, y : integer; l : byte);
procedure player2(x, y : integer; l : byte);
procedure player2_0(x, y : integer; l : byte);
function licznik_mocy : boolean;
function licznik_mocy2 : boolean;
procedure kaboom(delay, do_ : byte; name : string; endcage : boolean);
procedure kaboomatom(delay, do_ : byte; endcage : boolean);
{sound}

var
   sbversion : string[10];
   baseio : word;
   irq, dma, dma16 : byte;
   oldexitproc : pointer;
   sound : array[0..ilesound] of psound;

procedure ourexitproc; far;
procedure initsounds;
procedure freesounds;
{inne}
procedure earthquake;

implementation

{grafika}
procedure opengfxfile(plik : string; tlo, l : byte);

var
   f : file;
   b : array[0..319] of byte;
   x, y : integer;

begin
     assign(f,plik);
     reset(f,1);
     for x:=0 to 199 do
     begin
          blockread(f,b,320);
          for y:=0 to 319 do if b[y]<>tlo then putpixel(y,x,b[y],l);
     end;
     close(f);
end;

procedure openpfile(x1, y1 : integer; plik : string; tlo, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
     reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          for xx:=1 to rx do if buf[xx]<>tlo then putpixel(xx+x1,yy+y1,buf[xx],l);
     end;
     close(f);
end;

procedure openpfile0(x1, y1 : integer; plik : string; tlo, c, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
     reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          for xx:=1 to rx do if buf[xx]<>tlo then putpixel(xx+x1,yy+y1,c,l);
     end;
     close(f);
end;

procedure openpfile_p2(x1, y1 : integer; plik : string; tlo, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
     reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          for xx:=1 to rx do if buf[xx]<>tlo then
          begin
               putpixel(xx+x1,yy+y1,buf[xx]*255 xor 255 * 5,l);
          end;
     end;
     close(f);
end;

procedure openpfile0_p2(x1, y1 : integer; plik : string; tlo, c, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
     reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          for xx:=1 to rx do if buf[xx]<>tlo then putpixel(xx+x1,yy+y1,c,l);
     end;
     close(f);
end;

procedure openpfileanim(x1, y1 : integer; plik : string; nr : byte; tlo, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
     reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          if nr=1 then for xx:=1 to 26 do if buf[xx]<>tlo then putpixel(xx+x1,yy+y1,buf[xx],l);
          if nr=2 then for xx:=26 to 51 do if buf[xx]<>tlo then putpixel(xx+x1-25,yy+y1,buf[xx],l);
          if nr=3 then for xx:=52 to 77 do if buf[xx]<>tlo then putpixel(xx+x1-2*25,yy+y1,buf[xx],l);
          if nr=4 then for xx:=78 to 103 do if buf[xx]<>tlo then putpixel(xx+x1-3*25,yy+y1,buf[xx],l);
          if nr=5 then for xx:=104 to 129 do if buf[xx]<>tlo then putpixel(xx+x1-4*25,yy+y1,buf[xx],l);
          if nr=6 then for xx:=130 to 156 do if buf[xx]<>tlo then putpixel(xx+x1-5*25,yy+y1,buf[xx],l);
     end;
     close(f);
end;

procedure openpfileanim0(x1, y1 : integer; plik : string; nr : byte; tlo, c, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
     reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          if nr=1 then for xx:=1 to 26 do if buf[xx]<>tlo then putpixel(xx+x1,yy+y1,c,l);
          if nr=2 then for xx:=26 to 51 do if buf[xx]<>tlo then putpixel(xx+x1-25,yy+y1,c,l);
          if nr=3 then for xx:=52 to 77 do if buf[xx]<>tlo then putpixel(xx+x1-2*25,yy+y1,c,l);
          if nr=4 then for xx:=78 to 103 do if buf[xx]<>tlo then putpixel(xx+x1-3*25,yy+y1,c,l);
          if nr=5 then for xx:=104 to 129 do if buf[xx]<>tlo then putpixel(xx+x1-4*25,yy+y1,c,l);
          if nr=6 then for xx:=130 to 156 do if buf[xx]<>tlo then putpixel(xx+x1-5*25,yy+y1,c,l);
     end;
     close(f);
end;

procedure openpfileanim_1(x1, y1 : integer; plik : string; nr : byte; tlo, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
     reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          if nr=1 then for xx:=1 to 49 do if buf[xx]<>tlo then putpixel(xx+x1,yy+y1,buf[xx],l);
          if nr=2 then for xx:=50 to 98 do if buf[xx]<>tlo then putpixel(xx+x1-49,yy+y1,buf[xx],l);
          if nr=3 then for xx:=99 to 147 do if buf[xx]<>tlo then putpixel(xx+x1-2*49,yy+y1,buf[xx],l);
          if nr=4 then for xx:=148 to 196 do if buf[xx]<>tlo then putpixel(xx+x1-3*49,yy+y1,buf[xx],l);
          if nr=5 then for xx:=197 to 245 do if buf[xx]<>tlo then putpixel(xx+x1-4*49,yy+y1,buf[xx],l);
     end;
     close(f);
end;

procedure openpfileanim0_1(x1, y1 : integer; plik : string; nr : byte; tlo, c, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
     reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          if nr=1 then for xx:=1 to 49 do if buf[xx]<>tlo then putpixel(xx+x1,yy+y1,c,l);
          if nr=2 then for xx:=50 to 98 do if buf[xx]<>tlo then putpixel(xx+x1-49,yy+y1,c,l);
          if nr=3 then for xx:=99 to 147 do if buf[xx]<>tlo then putpixel(xx+x1-2*49,yy+y1,c,l);
          if nr=4 then for xx:=148 to 196 do if buf[xx]<>tlo then putpixel(xx+x1-3*49,yy+y1,c,l);
          if nr=5 then for xx:=197 to 245 do if buf[xx]<>tlo then putpixel(xx+x1-4*49,yy+y1,c,l);
     end;
     close(f);
end;

procedure openpfileanimmenu(x1, y1 : integer; plik : string; nr : byte; tlo, l : byte);

var
   f : file;
   b, rx, ry : byte;
   xx, yy : integer;
   buf : array[1..321] of byte;
   w, d : word;

begin
     assign(f,plik);
          reset(f,1);
     blockread(f,buf,2,w);
     rx:=buf[1];
     ry:=buf[2];
     for yy:=1 to ry do
     begin
          blockread(f,buf,rx,w);
          if nr=1 then for xx:=1 to 79 do if buf[xx]<>tlo then putpixel(xx+x1,yy+y1,buf[xx],l);
          if nr=2 then for xx:=80 to 159 do if buf[xx]<>tlo then putpixel(xx+x1-80,yy+y1,buf[xx],l);
          if nr=3 then for xx:=160 to 237 do if buf[xx]<>tlo then putpixel(xx+x1-80*2,yy+y1,buf[xx],l);
     end;
     close(f);
end;

{gra}
procedure defaultpos;
begin
     x:=getmaxx div 2;
     y:=132;
     x:=38;
     xr:=x;
     yr:=y-10;
     t:=0.0;
     dt:=0.250;
     vx:=4;
     zasieg:=10;
     vy0:=0.0;
     backgr:=true;
end;

procedure kursormouse(x, y : integer; l, nr, ii : byte; jest : boolean);

const
     cursormouse : array[1..10, 1..10] of byte =
     ((032,033,032,033,032,033,032,255,255,255),
      (033,032,033,032,033,032,255,255,255,255),
      (032,033,032,033,032,255,255,255,255,255),
      (033,032,033,032,033,032,255,255,255,255),
      (032,033,032,033,032,033,032,255,255,255),
      (033,032,255,032,033,032,033,032,255,255),
      (032,255,255,255,032,033,032,033,032,255),
      (255,255,255,255,255,032,033,032,033,032),
      (255,255,255,255,255,255,032,033,032,033),
      (255,255,255,255,255,255,255,032,033,255));
     cursormouse_put : array[1..10, 1..10] of byte =
     ((012,033,032,033,032,033,032,255,255,012),
      (033,012,033,032,033,032,255,255,012,255),
      (032,033,012,033,032,255,255,012,255,255),
      (033,032,033,012,033,032,012,255,255,255),
      (032,033,032,033,012,012,032,255,255,255),
      (033,032,255,032,012,012,033,032,255,255),
      (032,255,255,012,032,033,012,033,032,255),
      (255,255,012,255,255,032,033,012,033,032),
      (255,012,255,255,255,255,032,033,012,033),
      (012,255,255,255,255,255,255,032,033,012));

var
   i, j : integer;

begin
     if jest then
     begin
          if nr=1 then
          begin
               for i:= 1 to 10 do
               for j:= 1 to 10 do if cursormouse[i,j]<>255 then putpixel(i+x,j+y,cursormouse[i,j]+ii,l);
          end;
          if nr=2 then
          begin
               for i:= 1 to 10 do
               for j:= 1 to 10 do if cursormouse_put[i,j]<>255 then putpixel(i+x,j+y,cursormouse_put[i,j],l);
          end;
     end;
end;

function granica(x, y, l : integer) : boolean;

var
   a, b : integer;

begin
     if pozycja_p1='prawo' then
     begin
          for a:= 2 to 6 do
          for b:= 2 to 6 do
          if (getpixel(a+x,b+y,l) in[1..254]) then
          begin
               granica:=false;
          end;
     end;
     if pozycja_p1='lewo' then
     begin
          for a:= 3 to 6 do
          for b:= 3 to 6 do
          if (getpixel(a+x,b+y,l) in[1..254]) then
          begin
               granica:=false;
          end;
     end;
     if pozycja_p2='prawo' then
     begin
          for a:= 2 to 6 do
          for b:= 2 to 6 do
          if (getpixel(a+x,b+y,l) in[1..254]) then
          begin
               granica:=false;
          end;
     end;
     if pozycja_p2='lewo' then
     begin
          for a:= 3 to 6 do
          for b:= 3 to 6 do
          if (getpixel(a+x,b+y,l) in[1..254]) then
          begin
               granica:=false;
          end;
     end;
end;

function granica2(x, y, l : integer) : boolean;

var
   a, b : integer;

begin
     for a:= 1 to 7 do
     for b:= 1 to 7 do
     if (getpixel(a+x,b+y,l)=255) then
     begin
          granica2:=false;
     end;
end;

procedure player1(x, y : integer; l : byte);
begin
     if (pozycja_p1='prawo') and (lufa_poz='/') then
     begin
          if anim=1 then openpfile(px,py,'gfx\player\r1b.gfx',31,l);
          if anim=2 then openpfile(px,py,'gfx\player\r1b_1.gfx',31,l);
     end;
     if (pozycja_p1='prawo') and (lufa_poz='-') then
     begin
          if anim=1 then openpfile(px,py,'gfx\player\r2b.gfx',31,l);
          if anim=2 then openpfile(px,py,'gfx\player\r2b_1.gfx',31,l);
     end;
     if (pozycja_p1='prawo') and (lufa_poz='\') then
     begin
          if anim=1 then openpfile(px,py,'gfx\player\r3b.gfx',31,l);
          if anim=2 then openpfile(px,py,'gfx\player\r3b_1.gfx',31,l);
     end;
     if (pozycja_p1='lewo') and (lufa_poz='/') then
     begin
          if anim=1 then openpfile(px,py,'gfx\player\l1b.gfx',31,l);
          if anim=2 then openpfile(px,py,'gfx\player\l1b_1.gfx',31,l);
     end;
     if (pozycja_p1='lewo') and (lufa_poz='-') then
     begin
          if anim=1 then openpfile(px,py,'gfx\player\l2b.gfx',31,l);
          if anim=2 then openpfile(px,py,'gfx\player\l2b_1.gfx',31,l);
     end;
     if (pozycja_p1='lewo') and (lufa_poz='\') then
     begin
          if anim=1 then openpfile(px,py,'gfx\player\l3b.gfx',31,l);
          if anim=2 then openpfile(px,py,'gfx\player\l3b_1.gfx',31,l);
     end;
end;

procedure player1_0(x, y : integer; l : byte);
begin
     if (pozycja_p1='prawo') and (lufa_poz='/') then
     begin
          if anim=1 then openpfile0(px,py,'gfx\player\r1b.gfx',31,255,l);
          if anim=2 then openpfile0(px,py,'gfx\player\r1b_1.gfx',31,255,l);
     end;
     if (pozycja_p1='prawo') and (lufa_poz='-') then
     begin
          if anim=1 then openpfile0(px,py,'gfx\player\r2b.gfx',31,255,l);
          if anim=2 then openpfile0(px,py,'gfx\player\r2b_1.gfx',31,255,l);
     end;
     if (pozycja_p1='prawo') and (lufa_poz='\') then
     begin
          if anim=1 then openpfile0(px,py,'gfx\player\r3b.gfx',31,255,l);
          if anim=2 then openpfile0(px,py,'gfx\player\r3b_1.gfx',31,255,l);
     end;
     if (pozycja_p1='lewo') and (lufa_poz='/') then
     begin
          if anim=1 then openpfile0(px,py,'gfx\player\l1b.gfx',31,255,l);
          if anim=2 then openpfile0(px,py,'gfx\player\l1b_1.gfx',31,255,l);
     end;
     if (pozycja_p1='lewo') and (lufa_poz='-') then
     begin
          if anim=1 then openpfile0(px,py,'gfx\player\l2b.gfx',31,255,l);
          if anim=2 then openpfile0(px,py,'gfx\player\l2b_1.gfx',31,255,l);
     end;
     if (pozycja_p1='lewo') and (lufa_poz='\') then
     begin
          if anim=1 then openpfile0(px,py,'gfx\player\l3b.gfx',31,255,l);
          if anim=2 then openpfile0(px,py,'gfx\player\l3b_1.gfx',31,255,l);
     end;
end;

procedure player2(x, y : integer; l : byte);
begin
     if (pozycja_p2='prawo') and (lufa_poz2='/') then
     begin
          if anim2=1 then openpfile_p2(px2,py2,'gfx\player\r1b.gfx',31,l);
          if anim2=2 then openpfile_p2(px2,py2,'gfx\player\r1b_1.gfx',31,l);
     end;
     if (pozycja_p2='prawo') and (lufa_poz2='-') then
     begin
          if anim2=1 then openpfile_p2(px2,py2,'gfx\player\r2b.gfx',31,l);
          if anim2=2 then openpfile_p2(px2,py2,'gfx\player\r2b_1.gfx',31,l);
     end;
     if (pozycja_p2='prawo') and (lufa_poz2='\') then
     begin
          if anim2=1 then openpfile_p2(px2,py2,'gfx\player\r3b.gfx',31,l);
          if anim2=2 then openpfile_p2(px2,py2,'gfx\player\r3b_1.gfx',31,l);
     end;
     if (pozycja_p2='lewo') and (lufa_poz2='/') then
     begin
          if anim2=1 then openpfile_p2(px2,py2,'gfx\player\l1b.gfx',31,l);
          if anim2=2 then openpfile_p2(px2,py2,'gfx\player\l1b_1.gfx',31,l);
     end;
     if (pozycja_p2='lewo') and (lufa_poz2='-') then
     begin
          if anim2=1 then openpfile_p2(px2,py2,'gfx\player\l2b.gfx',31,l);
          if anim2=2 then openpfile_p2(px2,py2,'gfx\player\l2b_1.gfx',31,l);
     end;
     if (pozycja_p2='lewo') and (lufa_poz2='\') then
     begin
          if anim2=1 then openpfile_p2(px2,py2,'gfx\player\l3b.gfx',31,l);
          if anim2=2 then openpfile_p2(px2,py2,'gfx\player\l3b_1.gfx',31,l);
     end;
end;

procedure player2_0(x, y : integer; l : byte);
begin
     if (pozycja_p2='prawo') and (lufa_poz2='/') then
     begin
          if anim2=1 then openpfile0_p2(px2,py2,'gfx\player\r1b.gfx',31,255,l);
          if anim2=2 then openpfile0_p2(px2,py2,'gfx\player\r1b_1.gfx',31,255,l);
     end;
     if (pozycja_p2='prawo') and (lufa_poz2='-') then
     begin
          if anim2=1 then openpfile0_p2(px2,py2,'gfx\player\r2b.gfx',31,255,l);
          if anim2=2 then openpfile0_p2(px2,py2,'gfx\player\r2b_1.gfx',31,255,l);
     end;
     if (pozycja_p2='prawo') and (lufa_poz2='\') then
     begin
          if anim2=1 then openpfile0_p2(px2,py2,'gfx\player\r3b.gfx',31,255,l);
          if anim2=2 then openpfile0_p2(px2,py2,'gfx\player\r3b_1.gfx',31,255,l);
     end;
     if (pozycja_p2='lewo') and (lufa_poz2='/') then
     begin
          if anim2=1 then openpfile0_p2(px2,py2,'gfx\player\l1b.gfx',31,255,l);
          if anim2=2 then openpfile0_p2(px2,py2,'gfx\player\l1b_1.gfx',31,255,l);
     end;
     if (pozycja_p2='lewo') and (lufa_poz2='-') then
     begin
          if anim2=1 then openpfile0_p2(px2,py2,'gfx\player\l2b.gfx',31,255,l);
          if anim2=2 then openpfile0_p2(px2,py2,'gfx\player\l2b_1.gfx',31,255,l);
     end;
     if (pozycja_p2='lewo') and (lufa_poz2='\') then
     begin
          if anim2=1 then openpfile0_p2(px2,py2,'gfx\player\l3b.gfx',31,255,l);
          if anim2=2 then openpfile0_p2(px2,py2,'gfx\player\l3b_1.gfx',31,255,l);
     end;
end;

function licznik_mocy : boolean;
var
   i : real;
begin
     player1(px,py,2);
     repeat
           de:=de+0.2;
           line(20,190,20,190-round(de*2.9),12,1);
           line(21,190,21,190-round(de*2.9),12,1);
           line(22,190,22,190-round(de*2.9),12,1);
           pokazgrafike;
     until (de>10.0) or (not keydown[scanof('s')]);
end;

function licznik_mocy2 : boolean;
var
   i : real;
begin
     player2(px,py,2);
     repeat
           de2:=de2+0.2;
           line(20,190,20,190-round(de2*2.9),12,1);
           line(21,190,21,190-round(de2*2.9),12,1);
           line(22,190,22,190-round(de2*2.9),12,1);
           pokazgrafike;
     until (de2>10.0) or (not keydown[scanof('s')]);
end;

procedure kaboom(delay, do_ : byte; name : string; endcage : boolean);

var
   path : string;

begin
     if name='boom1' then path:='gfx\kaboom\boom1.gfx';
     if name='boom2' then path:='gfx\kaboom\boom2.gfx';
     if name='boom3' then path:='gfx\kaboom\boom3.gfx';
     boomanim:=0;
     repeat
           inc(boomanim);
           if boomanim=1 then xboom:=0;
           if boomanim=2 then xboom:=1;
           if boomanim=3 then xboom:=2;
           if boomanim=4 then xboom:=3;
           if boomanim=5 then xboom:=4;
           if boomanim=6 then xboom:=5;
           openpfileanim(x-12-xboom,y-8,path,boomanim,31,2);
           pokazgrafike;
           openpfileanim0(x-12-xboom,y-8,path,boomanim,31,255,2);
           czekaj(delay);
     until boomanim=do_;
     if endcage then openpfileanim(x-12-xboom,y-8,path,boomanim,31,2);
     boomanim:=0;
end;

procedure kaboomatom(delay, do_ : byte; endcage : boolean);

var
   path : string;

begin
     path:='gfx\kaboom\boom4.gfx';
     boomanim:=0;
     repeat
           inc(boomanim);
           if boomanim=1 then xboom:=12;
           if boomanim=2 then xboom:=12;
           if boomanim=3 then xboom:=12;
           if boomanim=4 then xboom:=12;
           if boomanim=5 then xboom:=12;
           openpfileanim_1(x-12-xboom,y-60,path,boomanim,31,2);
           pokazgrafike;
           openpfileanim0_1(x-12-xboom,y-60,path,boomanim,31,255,2);
           czekaj(delay);
     until boomanim=do_;
     if endcage then openpfileanim_1(x-12-xboom,y-60,path,boomanim,31,2);
     boomanim:=0;
end;

{sound}

procedure OurExitProc;
var
   i: byte;
begin
     for i := 0 to 5 do
       if Sound[i] <> nil then FreeSound(Sound[i]);
     ShutdownSharing;
     ExitProc := OldExitProc; {Chain to next exit procedure}
end;

procedure initsounds;
begin
      GetSettings(BaseIO, IRQ, DMA, DMA16);
      InitSB(BaseIO, IRQ, DMA, DMA16);
      if SixteenBit
        then write(''){16bit}
        else write('');{8 bit}
      if AutoInit
        then {writeln('Auto-initialized')}
        else ;{writeln('Single-cycle');}
      InitMixing;
      InitXMS;
      InitSharing;
      if not(OpenSoundResourceFile('SOUND.DAT'))
      then
           begin
                writeln('Sound library file not found!');
                Halt(0);
           end;
      LoadSound(Sound[0],'ATOM');
      LoadSound(Sound[1],'BOOM1');
      LoadSound(Sound[2],'BOOM2');
      LoadSound(Sound[3],'BOOM3');
      LoadSound(Sound[4],'BOOM4');
      LoadSound(Sound[5],'GUN2');
      LoadSound(Sound[6],'LASER');
      LoadSound(Sound[7],'LECI');
      LoadSound(Sound[8],'CANNON');
      LoadSound(Sound[9],'AIR');
      LoadSound(Sound[10],'OD1');
      LoadSound(Sound[11],'OD2');
      LoadSound(Sound[12],'OD3');
      LoadSound(Sound[13],'OD4');
      LoadSound(Sound[14],'PLAZMA');
      LoadSound(Sound[15],'HELP1');
      LoadSound(Sound[16],'HELP2');
      LoadSound(Sound[17],'HELP3');
      LoadSound(Sound[18],'HELP4');
      LoadSound(Sound[19],'HELP5');
      LoadSound(Sound[20],'HELP6');
      LoadSound(Sound[21],'CLIK');
      CloseSoundResourceFile;
      OldExitProc := ExitProc;
      ExitProc := @OurExitProc;
end;

procedure freesounds;
var i:integer;
begin
      ShutdownMixing;
      ShutdownSB;
      for i := 0 to ilesound do FreeSound(Sound[i]);
      ShutdownSharing;
end;

{inne}

procedure earthquake;

var
   oko : integer;

begin
     oko:=0;
     repeat
           portw[$3d4]:=8;
           portw[$3d5]:=round(random(1000)+900*cos(Pi*Oko/10));;
           repeat
           until (portw[$03da] and 8) = 0;
     repeat until (portw[$03da] and 8) = 8;
     inc(Oko);
     until oko>200;
     portw[$3d4]:=8;
     portw[$3d5]:=0;
end;

begin
end.