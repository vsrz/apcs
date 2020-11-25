program LegionsOfChaosv12(input, output);

uses crt, dos, graph, objects, views, menus, graphics, graph3, copyrite;

const
   black=0;
   dark_blue=1;
   green=2;
   cyan=3;
   red=4;
   purple=5;
   brown=6;
   grey=7;
   dark_grey=8;
   blue=9;
   light_green=10;
   light_blue=11;
   Light_red=12;
   Magenta=13;
   Yellow=14;
   White=15;
   mem=35;
   mem2=80;
   F5=chr(63);
   F7=chr(65);


type
	PlayerStats=record
	   dammax:byte;
	   damage:byte;
	   defense:byte;
	   HP:integer;
	   HPmax:integer;
	   magic:byte;
	   MP:integer;
	   MPmax:integer;
	   ToHit:byte;
	   NumberAttack:byte;
	   Exp:longint;
	   Level:byte;
	fire:string;
	firedamage:byte;
	bolt:string;
	boltdamage:byte;
	heal:string;
	healdamage:byte;
	full:string;
	fulldamage:byte;
	deth:string;
	dethdamage:byte;
	quak:string;
	quakdamage:byte;
	bliz:string;
	blizdamage:byte;
	dran:string;
	drandamage:byte;
	dranheal:byte;
	realname:string[17];
	name:string[mem];
	class:string[mem];
	money:longint;
	weapondamage:integer;
	  modifieddamage:integer;
	  attackdamage:integer;
	armordefense:integer;
	  modifieddefense:integer;
	weaponname:string;
	armorname:string;
     end;



var
{Other}
   ch:char;
   quit:boolean;
   cheat:string[75];
   cleanexit:boolean;
   cmd:char;
   cmd1:string[mem];
   cmd2:string[mem];
   cmd3:string[mem];
   cmd4:string[mem];
   cmd5:string[mem];
   cmd6:string[mem];
   cmd7:string[mem];
   cmd8:string[mem];
   cmd9:string[mem];
   line1:string[mem2];
   line2:string[mem2];
   line3:string[mem2];
   line4:string[mem2];
   line5:string[mem2];
   rand:boolean;
   gainedMONEY:longint;
   gainedEXP:longint;
   z:string[mem];

{Player Status var}
   debug:boolean;
   town:boolean;
{Weapon/Armor var}
{spells}

{Monster Status var}
   monsterchance:integer;
   monster:string[mem2];
   monsterdamage:integer;
   monsterHP:integer;
   monsterdefense:integer;
   monsternumberattack:byte;
   monstermagic:integer;
   monsterMP:integer;
   monsterToHit:byte;
   monsterweapon:string[mem2];
   monsterweapondamage:integer;
   monsterarmor:string[mem2];
   monsterarmordefense:integer;


function UpString(s:string):string;
 var c:longint;
	begin
     	for c:=1 to length(s) do
          	s[c]:=Upcase(s[c]);
          Upstring:=s;
     end;



procedure OpenGraph;

var
    GrDriver:integer;
    DrModo:integer;
    ErrCode:integer;

begin
    GrDriver:=detect;
    InitGraph (grDriver,drmodo,'c:\ritual\program\turbo');
    if ErrCode <> GrOK then
	writeln('Graphics error:', GraphErrorMsg (Errcode));

end;







procedure GetPlayerInformation(var p:PlayerStats);
	begin
	  textcolor(black);
	  textbackground(black);
	  clrscr;
	  gotoxy(1,1);
	  textcolor(yellow);
	  textbackground(blue);
	  writeln('                             Legions of Chaos v1.3                             ');
	  textbackground(black);
	     textcolor(dark_grey);
	    { writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');}
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  textcolor(yellow);
	  textbackground(blue);
	  writeln('                                                                               ');
	  gotoxy(18,7);
	  textbackground(red);
	  textcolor(white);
	  writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Question 1 ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
	  gotoxy(18,8);
	  writeln('³                                           ³');
	  gotoxy(18,9);
	  writeln('³ What is your real name?  (First and Last) ³');
	  gotoxy(18,10);
	  writeln('³                                           ³');
	  gotoxy(18,11);
	  writeln('³                                           ³');
	  gotoxy(18,12);
	  writeln('³                                           ³');
	  gotoxy(18,13);
	  writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
	  repeat
		gotoxy(20,12);
	       textbackground(black);
		  textcolor(white);
		  writeln('                                         ');
		  gotoxy(21,12);
		  readln(p.realname);
	       if p.realname='' then
		writeln(chr(7));
	  until p.realname<>'';
	  gotoxy(44,7);
	  textcolor(white);
	  textbackground(red);
	  writeln('2');
	  gotoxy(18,9);
	  writeln('³ What will your characters name be?        ³');
	  repeat
		  gotoxy(20,12);
		  textbackground(black);
		  textcolor(white);
		  writeln('                                         ');
		  gotoxy(21,12);
		  readln(p.name);
	       if p.name='' then
		writeln(chr(7));
	  until p.name<>'';
	  gotoxy(18,12);
	  textbackground(red);
	  textcolor(white);
	  writeln('³                                           ³');
	  gotoxy(44,7);
	  textcolor(white);
	  textbackground(red);
	  writeln('3');
	  repeat
	       textcolor(white);
	       textbackground(red);
	       gotoxy(18,8);
	       writeln('³ Choose a class ...                        ³');
	       gotoxy(18,9);
	       writeln('³ (W)arrior                                 ³');
	       gotoxy(18,10);
	       writeln('³ (R)ogue                                   ³');
	       gotoxy(18,11);
	       writeln('³ (S)orcerer                                ³');
	       gotoxy(38,12);
	       textbackground(black);
	       textcolor(white);
	       writeln('   ');
	       gotoxy(39,12);
	       ch:=readkey;
	  until (ch='w') or (ch='W') or (ch='r') or (ch='R') or (ch='s') or (ch='S');
	  case ch of
		'w','W': p.class:='Warrior';
	       'r','R': p.class:='Rogue';
	       's','S': p.class:='Sorcerer';
	  end;


	end;


procedure InitalizePlayerStats(var p:PlayerStats);
	begin
	randomize;
	  textcolor(blue);
	  gotoxy(1,1);
	  writeln('Initalizing combat sequence...');
	  textcolor(grey);
	  if p.class='Warrior' then
	       begin
		    p.Level:=1;
			p.damage:=random(20)+20; {20-40}
		    p.dammax:=50;
		    p.defense:=random(20)+50; {50-70}
				p.magic:=random(10)+1; {1-10}
		    p.HP:=random(25)+100; {100-125}
		    p.numberattack:=1;
	       end;
	  if p.class='Rogue' then
	       begin
		    p.Level:=1;
			p.damage:=random(20)+10; {10-30}
		    p.dammax:=40;
		    p.defense:=random(20)+30; {30-50}
		    p.magic:=random(10)+20; {20-30}
		    p.HP:=random(25)+80; {80-105}
		    p.numberattack:=2;
	       end;
	  if p.class='Sorcerer' then
		begin
		    p.Level:=1;
			p.damage:=random(10)+10; {10-20}
		    p.dammax:=30;
		    p.defense:=random(20)+20; {20-40}
		    p.magic:=random(30)+50; {50-80}
		    p.heal:='Healing';
		    p.healdamage:=random(15)+5; {5-20}
		    p.fire:='Fireball';
		    p.firedamage:=random(20)+p.magic; {1-20}
		    p.bolt:='Lightning Bolt';
				p.bliz:='Blizzard';
		    p.quak:='Earthquake';
		    p.full:='Full Healing';
		    p.deth:='Deathray';
		    p.dran:='Drain Life';
		    p.HP:=random(25)+50; {50-75}
		    p.numberattack:=1;
	       end;
	  p.Tohit:=45; {65%}
		p.HPmax:=p.HP;
	  p.MP:=p.magic*2;            {(magic) x 2}
	  p.MPmax:=p.MP;
	  p.weaponname:='Dagger';
	    p.weapondamage:=random(10)+1;
	    p.modifieddamage:=p.damage+p.weapondamage;
	  p.armorname:='Leather Armor';
	    p.armordefense:=random(5)+1;
	    p.modifieddefense:=p.armordefense+p.defense;
	  p.EXP:=0;
     end;

procedure GraphicWindow;
     begin
	     textbackground(black);
	  textcolor(white);
	  gotoxy(5,4);
	  writeln('ÚÄÄÄÄÄÄÄÄÄÄÄ´ Commands ÃÄÄÄÄÄÄÄÄÄÄÄ¿');
	  gotoxy(5,5);
	  writeln('³                                  ³');
	  gotoxy(5,6);
		writeln('³                                  ³');
	  gotoxy(5,7);
		writeln('³                                  ³');
	  gotoxy(5,8);
	  writeln('³                                  ³');
	  gotoxy(5,9);
	  writeln('³                                  ³');
	  gotoxy(5,10);
	  writeln('³                                  ³');
	  gotoxy(5,11);
	  writeln('³                                  ³');
	  gotoxy(5,12);
	  writeln('³                                  ³');
	  gotoxy(5,13);
	  writeln('³  ` - command console             ³');
	  gotoxy(5,14);
	  writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
	  gotoxy(7,5);
	  writeln(cmd1);
	  gotoxy(7,6);
	  writeln(cmd2);
	  gotoxy(7,7);
	  writeln(cmd3);
	  gotoxy(7,8);
	  writeln(cmd4);
	  gotoxy(7,9);
	  writeln(cmd5);
	  gotoxy(7,10);
	  writeln(cmd6);
	  gotoxy(7,11);
	  writeln(cmd7);
	  gotoxy(7,12);
	  writeln(cmd8);
	end;

procedure StatsWindow(var P:PlayerStats);
	begin
	  gotoxy(52,5);
	  textbackground(blue);
	  textcolor(white);
	  writeln('ÚÄÄÄÄÄÄ´ Stats ÃÄÄÄÄÄÄ¿');
	  gotoxy(52,6);
	  writeln('³ Dmg     HP     /    ³');
	  gotoxy(52,7);
	  writeln('³ Mag     MP     /    ³');
	  gotoxy(52,8);
	  writeln('³ Def                 ³');
	  gotoxy(52,9);
	  writeln('³ Lvl                 ³');
	  gotoxy(52,10);
	  writeln('³ Exp                 ³');
	  gotoxy(52,11);
	  writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
	  gotoxy(65,6);
	  writeln(p.HP);
	  gotoxy(70,6);
	  writeln(p.HPMax);
	  gotoxy(65,7);
	  writeln(p.MP);
	  gotoxy(70,7);
	  writeln(p.MPMax);
	  gotoxy(58,10);
	  writeln(p.EXP);
	  gotoxy(58,6);
	  writeln(p.modifieddamage);
	  gotoxy(58,7);
	  writeln(p.magic);
	  gotoxy(58,8);
	  writeln(p.modifieddefense);
	  gotoxy(58,9);
	  writeln(p.level);
	end;

procedure DrawMsgWindow;
	begin
	  gotoxy(5,17);
	  textbackground(red);
	  textcolor(white);
	  writeln('                                                                       ');
	  gotoxy(5,18);
	  writeln('                                                                       ');
	  gotoxy(5,19);
	  writeln('                                                                       ');
	  gotoxy(5,20);
	  writeln('                                                                       ');
	  gotoxy(5,21);
	  writeln('                                                                       ');
	gotoxy(7,17);
	  writeln(line1);
	gotoxy(7,18);
	  writeln(line2);
	gotoxy(7,19);
	  writeln(line3);
	gotoxy(7,20);
	  writeln(line4);
	gotoxy(7,21);
	  writeln(line5);
	end;

procedure DrawCommandWindow;
	begin
	gotoxy(50,14);
	  textcolor(grey);
	  textbackground(black);
	  writeln(' Command:            ');
	end;

procedure MainScreen(var p:playerstats);
	begin
	  textcolor(black);
	  textbackground(black);
	  clrscr;
	  clrscr;
	  gotoxy(1,1);
	  textcolor(yellow);
	  textbackground(blue);
	  writeln('                             Legions of Chaos v1.3                             ');
	  textbackground(black);
	     textcolor(dark_grey);
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  textcolor(yellow);
	  textbackground(blue);
	  writeln('                                  Ritual ''97                                   ');
	DrawMsgWindow;
	  StatsWindow(p);
	  GraphicWindow;
	  DrawCommandWindow;
	end;


procedure DebugHelp;
	begin
		clrscr;
	  textcolor(white);
	  writeln('Here are the commands for the Legions of Chaos v1.1 debug codes');
		writeln('I don''t know wether to call it a debug mode, or a cheat mode.');
	  writeln('Putting a number for a character value instead of characters will ');
	  writeln('crash the program.  Likewise, characters for a numeric value.');
	  writeln('Edit Name            = 1            Edit Attacks/Round   = C');
	writeln('Edit Class           = 2            Edit Weapon Name     = D');
		writeln('Edit Damage          = 3            Edit Weapon Damage   = E');
	  writeln('Edit Defense         = 4            Edit Modified WeapDmg= F');
	  writeln('Edit Magic           = 5            Edit Armor Name      = G');
	  writeln('Edit Real name       = 6            Edit Armor Defense   = H');
	  writeln('Edit HP Value        = 7            Edit Modified ArmrDef= I');
	  writeln('Edit MP Value        = 8            Edit Spell Abilities = J');
	  writeln('Edit Experience value= 9            Edit Money           = K');
	  writeln('Edit ToHit%          = 0            Edit ALL ATTRIBUTES  = Z');
	  WRITELN('Edit Attack Damage   = A');
	  writeln('Edit Armor Defense   = B');
	  writeln('');
	  writeln('');
	  writeln('');
	  writeln('');
	  writeln('');
	  writeln('');
	  writeln('');
	  readkey;
     end;

procedure GetAllSpells(var P:PlayerStats);
	begin
	  p.firedamage:=1;
	  p.boltdamage:=1;
		p.healdamage:=1;
	  p.fulldamage:=1;
	  p.dethdamage:=1;
	  p.quakdamage:=1;
	  p.blizdamage:=1;
	  p.drandamage:=1;
	  p.dranheal:=p.drandamage;
	  textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	  readkey;
     end;

procedure EditHealingSpell(var P:PlayerStats);
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(p.HealDamage);
	textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
     end;

procedure EditFireballSpell(var P:PlayerStats);
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(p.fireDamage);
		textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	  end;

Procedure EditLightningboltSpell(var P:PlayerStats);
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(p.boltDamage);
	     textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	   end;

procedure EditBlizzardSpell(var P:PlayerStats);
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(p.BlizDamage);
     textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	  end;

procedure EditEarthquakeSpell(var P:PlayerStats);
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(p.quakdamage);
	     textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	  end;

procedure EditFullHealingSpell(var P:PlayerStats);
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(p.FullDamage);
     textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	  end;

procedure EditDeathraySpell(var P:PlayerStats);
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(p.dethDamage);
	     textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	  end;

procedure EditDrainLifeSpell(var P:PlayerStats);
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(p.dranDamage);
	  p.dranheal:=p.drandamage;
	     textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	  end;

procedure EditAllSpells(var P:PlayerStats);
  var allspells:integer;
	begin
	gotoxy(1,24);
	  textcolor(light_red);
	  writeln('Enter new value:');
	  gotoxy(18,24);
	  textcolor(dark_grey);
	  readln(allspells);
	  p.healdamage:=allspells;
	  p.blizdamage:=allspells;
	  p.firedamage:=allspells;
	  p.boltdamage:=allspells;
	  p.fulldamage:=allspells;
	  p.quakdamage:=allspells;
	  p.drandamage:=allspells;
	  p.dethdamage:=allspells;
	     textcolor(green);
	  writeln('Why, you feel better already!'); delay(1000);
	   end;



procedure EditSpells(var P:PlayerStats);
  var ch:char;
	begin
	  repeat
	       p.bolt:='Lightning Bolt';
			p.bliz:='Blizzard';
	       p.quak:='Earthquake';
	       p.full:='Full Healing';
	       p.deth:='Deathray';
	       p.dran:='Drain Life';
	       p.heal:='Healing';
	       p.fire:='Fireball';
		     clrscr;
	     gotoxy(1,1);
	       textcolor(white);
	       writeln('This is a hard process, so please take the time to read all of the');
	       writeln('directions, not choosing to read them will result in a crash.');
	       writeln;
	       writeln('Get all the spells                           = 1');
	       writeln('Change the value of the HEALING spell        = 2');
	       writeln('Change the value of the FIREBALL spell       = 3');
	       writeln('Change the value of the LIGHTNING BOLT spell = 4');
	       writeln('Change the value of the BLIZZARD spell       = 5');
	       writeln('Change the value of the EARTHQUAKE spell     = 6');
	       writeln('Change the value of the FULL HEALING spell   = 7');
	       writeln('Change the value of the DEATHRAY spell       = 8');
	       writeln('Change the value of the DRAIN LIFE spell     = 9');
	       writeln('Change the value of the ALL spells           = 0');
	       writeln('Quit Altering Spell the Menu                 = Q');
		     writeln;
	       textcolor(light_red);
	       writeln('Your command master?');
	       gotoxy(22,16);
	       ch:=readkey;
		if ch='1' then GetAllSpells(p);
	       if ch='2' then EditHealingSpell(p);
	       if ch='3' then EditFireballSpell(p);
	       if ch='4' then EditLightningboltSpell(p);
	       if ch='5' then EditBlizzardSpell(p);
	       if ch='6' then EditEarthquakeSpell(p);
	       if ch='7' then EditFullHealingSpell(p);
	       if ch='8' then EditDeathraySpell(p);
	       if ch='9' then EditDrainLifeSpell(p);
	       if ch='0' then EditAllSpells(p);
		until (ch='Q') or (ch='q');

     end;




procedure EditALLAttributes(var P:PlayerStats);
  var z:byte;
	begin
	  gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(z);
	  p.HPmax:=z;
	  p.Mpmax:=z;
	  p.MP:=z;
	  p.HP:=z;
	  p.damage:=z;
	  p.modifieddamage:=z;
	  p.defense:=z;
	  p.modifieddefense:=z;
		p.dammax:=z;
	  p.weapondamage:=z;
	  p.tohit:=1;
	  p.magic:=z;
	  p.armordefense:=z;
	  p.healdamage:=z;
	  p.firedamage:=z;
	  p.boltdamage:=z;
	  p.blizdamage:=z;
	  p.quakdamage:=z;
	  p.fulldamage:=z;
	  p.dethdamage:=z;
	  p.drandamage:=z;
	  p.dranheal:=z;
	  p.EXP:=z;
     end;


procedure EditToHit(var P:PlayerStats);
	begin
		gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.ToHit);
     end;

procedure EditModifiedDefense(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.modifieddefense);
     end;




procedure EditModifiedDamage(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.ModifiedDamage);
     end;


procedure EditWeaponDamage(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.weapondamage);
     end;



procedure EditArmorName(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.Armorname);
     end;


procedure EditWeaponName(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.weaponname);
     end;


procedure EditAttacksPerRound(var P:PlayerStats);
	begin
		gotoxy(1,22);
	  textcolor(light_red);
	  writeln('This option is not fully implemented, you cannot modify it');
		readkey;
     end;



procedure EditAttackDamage(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter 1st Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.modifieddamage);
	  gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter 2nd Value:');
	  gotoxy(18,22);
	  textcolor(black);
	  writeln('                                                   ');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.dammax);
     end;


procedure EditEXP(var P:PlayerStats);

	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.EXP);
     end;

procedure EditMP(var P:PlayerStats);
 var  z:integer;
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(z);
	  p.MP:=z;
	  p.MPmax:=z;
     end;


procedure EditHP(var P:PlayerStats);
  var z:integer;
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(z);
	  p.HP:=z;
	  p.HPMax:=z;
     end;


procedure EditDamage(var P:PlayerStats);
	begin
		gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.Damage);
     end;


procedure EditMoney(var P:PlayerStats);
	begin
		gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.Money);
     end;

procedure EditRealName(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.realname);
     end;


procedure EditMagic(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.magic);
     end;

procedure EditArmorDefense(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.armordefense);
     end;



procedure EditDefense(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.defense);
     end;

procedure ChangeClass(var P:PlayerStats);
	begin
	gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.class);
	end;

procedure ChangeName(var P:PlayerStats);
	begin
	  gotoxy(1,22);
	  textcolor(light_red);
	  writeln('Enter new Value:');
	  textcolor(dark_grey);
	  gotoxy(18,22);
	  readln(p.name);
     end;


procedure DisplayPlayerStats(var debug:boolean; var P:PlayerStats);
  var key:char;
	begin
	repeat
	       clrscr;
	       gotoxy(1,22);
	       textcolor(black);
	       writeln('                                                            ');
	       gotoxy(1,23);
	       writeln('                                          ');
	       gotoxy(1,1);
	     textcolor(grey);
	     writeln('Here are your player stats:');
	       writeln;
	       writeln('Name    : ',p.name);
	       writeln('Class   : ',p.class);
	       writeln('Damage  : ',p.damage);
	       writeln('Defense : ',p.defense);
	       writeln('Magic   : ',p.magic);
	       writeln;
	       gotoxy(39,3);
	       writeln('          Your name: ',p.realname);
	       gotoxy(39,4);
	       writeln('          HP: ',p.HP,'/',p.HPmax);
	       gotoxy(39,5);
	       writeln('          MP: ',p.MP,'/',p.MPmax);
	       gotoxy(38,6);
	       writeln('          EXP: ',p.exp);
	       gotoxy(36,7);
	       writeln('          ToHit: ',100-p.tohit,'%');
	       writeln;
	       writeln('Attack Damage    : ',p.modifieddamage,'-',p.dammax);
	       writeln('Armor Defense    : ',p.modifieddefense);
	       writeln('Attacks per round: ',p.numberattack);
	       writeln;
	       writeln('Weapon           : ',p.weaponname);
	       writeln(' Damage          : ',p.weapondamage);
	       writeln(' Modified Damage : ',p.modifieddamage);
	       writeln;
	       writeln('Armor            : ',p.armorname);
	       writeln(' Defense         : ',p.armordefense);
	       writeln(' Modified Defense: ',p.modifieddefense);
	       gotoxy(39,9);
	       textcolor(grey);
	       writeln('          Gold: ');
	       gotoxy(55,9);
	       writeln(p.money);
	       gotoxy(39,11);
	       textcolor(white);
	       writeln('          Spells');
	       textcolor(grey);
	       gotoxy(49,12);
	       textcolor(dark_grey);
	     if p.healdamage>0 then
		     textcolor(grey)
	       else
		    begin
			       textcolor(dark_grey);
		    end;
	       writeln('Healing           ',p.healdamage);
	       gotoxy(49,13);
	       if p.firedamage>0 then
		     textcolor(grey)
	       else
		    begin
			       textcolor(dark_grey);
		    end;
	       writeln('Fireball          ',p.firedamage);
	       gotoxy(49,14);
	       if p.boltdamage>0 then
		     textcolor(grey)
	       else
		    begin
			       textcolor(dark_grey);
		    end;
	       writeln('Lightning Bolt    ',p.boltdamage);
	       gotoxy(49,15);
	       if p.blizdamage>0 then
		     textcolor(grey)
	       else
		    begin
			       textcolor(dark_grey);
		    end;
	       writeln('Blizzard          ',p.blizdamage);
	       gotoxy(49,16);
	       if p.quakdamage>0 then
		     textcolor(grey)
	       else
		    begin
			       textcolor(dark_grey);
		    end;
	       writeln('Earthquake        ',p.quakdamage);
	       gotoxy(49,17);
	       if p.fulldamage>0 then
		     textcolor(grey)
	       else
		    begin
			       textcolor(dark_grey);
		    end;
	       writeln('Full Healing      ',p.fulldamage);
	       gotoxy(49,18);
	       if p.dethdamage>0 then
		     textcolor(grey)
	       else
		    begin
			       textcolor(dark_grey);
		    end;
	       writeln('Deathray          ',p.dethdamage);
		     gotoxy(49,19);
	       if p.drandamage>0 then
		     textcolor(grey)
	       else
		    begin
			       textcolor(dark_grey);
		    end;
	       writeln('Drain Life        ',p.drandamage);
	       gotoxy(1,23);
	       textcolor(black);
	       if debug=false then
		       readln(cheat);
	       if (cheat='suck blue frog') or (cheat='Suck blue frog') or (debug=true) then
		     begin
			 debug:=true;
			gotoxy(1,21);
			 textcolor(blue);
			writeln('DEBUG MODE ACTIVATED');
			 gotoxy(1,23);
			 textcolor(black);
			 writeln('                                                       ');
			 gotoxy(1,23);
			 textcolor(dark_grey);
			 key:=readkey;
			if (key='q') or (key='Q') then debug:=false;
			if (key='h') or (key='H') or (key='?') then DebugHelp;
			if (key='1') then ChangeName(p);
			if key='2' then ChangeClass(p);
			 if key='3' then EditDamage(p);
			 if key='4' then EditDefense(p);
			 if key='5' then EditMagic(p);
			 if key='6' then EditRealname(p);
			 if key='7' then EditHP(p);
			 if key='8' then EditMP(p);
			 if key='9' then EditEXP(p);
			 if key='0' then EditToHit(p);
			 if (key='a') or (key='A') then EditAttackDamage(p);
			 if (key='b') or (key='B') then EditArmorDefense(p);
			 if (key='c') or (key='C') then EditAttacksPerRound(p);
					if (key='d') or (key='D') then EditWeaponName(p);
			 if (key='e') or (key='E') then EditWeaponDamage(p);
			 if (key='f') or (key='F') then EditModifiedDamage(p);
			 if (key='g') or (key='G') then EditArmorName(p);
			if (key='h') or (key='H') then EditArmorDefense(p);
					if (key='I') or (key='i') then EditModifiedDefense(p);
			 if (key='j') or (key='J') then EditSpells(p);
			 if (key='k') or (key='K') then EditMoney(p);
			if (key='z') or (key='Z') then EditALLAttributes(p);
		    end;
	  until debug=false;
		if rand=true then MainScreen(p);
     end;


Procedure UpdateStatsWindow(var P:PlayerStats);
	begin
	  gotoxy(52,5);
	  textbackground(blue);
	  textcolor(white);
	  writeln('ÚÄÄÄÄÄÄ´ Stats ÃÄÄÄÄÄÄ¿');
	  gotoxy(52,6);
	  writeln('³ Dmg     HP     /    ³');
	  gotoxy(52,7);
	  writeln('³ Mag     MP     /    ³');
	  gotoxy(52,8);
	  writeln('³ Def                 ³');
	  gotoxy(52,9);
	  writeln('³ Lvl                 ³');
	  gotoxy(52,10);
	  writeln('³ Exp                 ³');
	  gotoxy(52,11);
	  writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
	  gotoxy(65,6);
	  writeln(p.HP);
	  gotoxy(70,6);
	  writeln(p.HPMax);
	  gotoxy(65,7);
	  writeln(p.MP);
	  gotoxy(70,7);
	  writeln(p.MPMax);
	  gotoxy(58,10);
	  writeln(p.EXP);
	  gotoxy(58,6);
	  writeln(p.modifieddamage);
	  gotoxy(58,7);
	  writeln(p.magic);
	  gotoxy(58,8);
	  writeln(p.modifieddefense);
	  gotoxy(58,9);
	  writeln(p.level);
	end;



procedure UpdateDisplay(var p:PlayerStats);
	begin
	MainScreen(p);
	GraphicWindow;
	  UpdateStatsWindow(p);
	DrawMsgWindow;
     end;


procedure ClearLines(var p:playerstats);
	begin
		line1:='';
		line2:='';
		line3:='';
		line4:='';
		line5:='';
	  gotoxy(5,17);
	  textbackground(red);
	  writeln('                                                                         ');
	  gotoxy(5,18);
	  writeln('                                                                         ');
	  gotoxy(5,19);
	  writeln('                                                                         ');
	  gotoxy(5,20);
	  writeln('                                                                         ');
	  gotoxy(5,21);
	  writeln('                                                                         ');
		UpdateDisplay(p);
     end;

procedure ClearDisplay(var p:playerstats);
	begin
	cmd1:='                               ';
	  cmd2:='                               ';
	  cmd3:='                               ';
	  cmd4:='                               ';
	  cmd5:='                               ';
	  cmd6:='                               ';
	  cmd7:='                               ';
	  line1:='                                                             ';
		line2:='                                                             ';
		line3:='                                                             ';
		line4:='                                                             ';
		line5:='                                                             ';
	  gotoxy(5,17);
	  textbackground(red);
	  writeln('                                                                         ');
	  gotoxy(5,18);
	  writeln('                                                                         ');
	  gotoxy(5,19);
	  writeln('                                                                         ');
	  gotoxy(5,20);
	  writeln('                                                                         ');
	  gotoxy(5,21);
	  writeln('                                                                         ');
		UpdateDisplay(p);
     end;

procedure Writecmd8(var p:playerstats);
	begin
	  cleardisplay(p);
	  cmd8:='F10- Quit Game';
	updatedisplay(p);
	end;


procedure Clearcmd8(var p:playerstats);
	begin
	  ClearDisplay(p);
	cmd8:='                 ';
	  updatedisplay(p);
     end;


procedure GetSword;
 var x,a,z,s1,s2:integer; prefix1,suffix1,p1,p2:string;
	begin

		x:=random(109)+1;
	  case x of
		1..5: prefix1:='Fool''s';
	       6..10: prefix1:='Gold';
			11..15: prefix1:='Master''s';
	       16..20: prefix1:='King''s';
	       21..25: prefix1:='Weak';
	       26..30: prefix1:='Devils';
	       31..35: prefix1:='Magical';
	       36..40: prefix1:='Warrior''s';
	       41..45: prefix1:='Magician''s';
	       46..50: prefix1:='Idiot''s';
	       51..55: prefix1:='Gladiator''s';
	       56..60: prefix1:='Arch-Angel''s';
	       61..65: prefix1:='Careless';
	       66..70: prefix1:='Ruthless';
	       71..75: prefix1:='Silver';
	       76..80: prefix1:='Bronze';
	       81..85: prefix1:='Tin';
	       86..90: prefix1:='Dwarf''s';
	       91..95: prefix1:='Rogue''s';
	       96..100: prefix1:='Wizards';
	       101..105: prefix1:='Ritual''s';
	       106..110: prefix1:='Godly';
	  end;
	  if (prefix1='Ritual''s') and (suffix1='of Blood') then
	  else
	  begin
			z:=random(99)+1;
		  if z>40 then
			begin
			    a:=random(119)+1;
			    case a of
				1..5: suffix1:='of the Heavens';
				 6..10: suffix1:='of Light';
				 11..15: suffix1:='of the Ages';
				 16..20: suffix1:='of Death';
				 21..25: suffix1:='of Life';
				 26..30: suffix1:='of Health';
				 31..35: suffix1:='of Strength';
				 36..40: suffix1:='of Might';
				 41..45: suffix1:='of the Titans';
				 46..50: suffix1:='of Blood';
				 51..55: suffix1:='of the Weak';
				 56..60: suffix1:='of Carelessness';
				 61..65: suffix1:='of Balance';
				 66..70: suffix1:='of Magic';
				 71..75: suffix1:='of Mana';
				 76..80: suffix1:='of Defense';
				 81..85: suffix1:='of Precision';
				 86..90: suffix1:='of Perfection';
				 91..95: suffix1:='of Dislexia';
				 96..100: suffix1:='of the Moon';
				 101..105: suffix1:='of the Stars';
				 106..110: suffix1:='of Venus';
				 115..120: suffix1:='of Mystery';
			end;
				end;
	  end;
		gotoxy(6,19);
	  writeln('You got a new weapon!');
	gotoxy(6,20);
	  writeln('You got a ',prefix1,' sword ',suffix1,'!');
     end;

procedure GetArmor;
	begin

     end;

procedure GetSpell;
	begin
     end;

procedure GetTreasure;
	begin
     end;

procedure GainSpecial;
  var x:integer;
	begin
	x:=random(9)+1;
	  case x of
		1: GetSword;
	       2: GetArmor;
	       3: GetSpell;
	       4: GetSword;
	       5: GetArmor;
	       6: GetSpell;
	       7: GetSword;
	       8: GetArmor;
	       9: GetSpell;
	      10: GetTreasure;
	  end;
     end;



procedure QuitPrompt(var p:playerstats);
 var x:integer;
	begin
	  ClearDisplay(p);
	  UpdateDisplay(p);
		x:=random(99)+1;
	  case x of
		  0..20: line1:='Don''t touch that dial!';
	       50: line1:='If you quit, I will delete your character!';
		  21..40: line1:='Don''t even think about pressing that button!';
		  41..60: line1:='But you have to save the world first!';
		  61..80: line1:='Formatting drive C:  Press Y to confirm.';
		  81..100: line1:='Warning! If you press Y you will get a virus!';
	  end;
	  repeat
			line2:='             Quit(Y/N)?';
		  cmd1:=' Y - Quit';
		  cmd2:=' N - Continue';
		  UpdateDisplay(p);
		  ch:=readkey;
		  if (ch='y') or (ch='Y') then begin textbackground(0); textcolor(grey); clrscr; end;
	  until (ch='y') or (ch='Y') or (ch='N') or (ch='n');
     end;


procedure CastSpell(var p:playerstats);
 var s:string; z,y,x,a,b,c:integer;
	begin
		clearcmd8(p);
	  if town=true then
		begin
		cleardisplay(p);
		    cmd8:='F10- Quit Game';
		    line1:='This is not a good place to practice your spells...';
		    updatedisplay(p);
		    exit;
	       end;
	  line1:='Type in the name of the spell you want to cast.';
	  line2:='Make sure you type in the full name of the spell.';
	  if p.healdamage>0 then
		  cmd1:='Healing';
	  if p.firedamage>0 then
		  cmd2:='Fireball';
	  if p.boltdamage>0 then
		  cmd3:='Lightning Bolt';
	  if p.blizdamage>0 then
		cmd4:='Blizzard';
	  if p.quakdamage>0 then
		cmd5:='Earthquake';
	  if p.fulldamage>0 then
		cmd6:='Full Healing';
	  if p.dethdamage>0 then
		cmd7:='Deathray';
		if p.drandamage>0 then
		cmd8:='Drain Life';
	  updatedisplay(p);
	     textcolor(white);
	     textbackground(black);
		gotoxy(7,22);
	     writeln('Spell:                                                             ');
	     gotoxy(14,22);
	     textcolor(grey);
	     readln(s);
	  clearlines(p);
		if (s='healing') or (s='Healing') or (s='HEALING') then
		begin
		    if p.MP>9 then
			begin
				line1:='You cast healing!';
				    gotoxy(7,18);
				    z:=random(p.healdamage)+random(p.magic);
				    writeln('You have recovered ',z,' hitpoints,');
				    updatedisplay(p);
				    delay(1000);
			 end
		    else
			begin
				cleardisplay(p);
			      line1:='You do not have enough mana';
			      updatedisplay(p);
			      delay(1000);
			 end;
	       end;
	  if (s='Fireball') or (s='FireBall') or (s='FIREBALL') or (s='fireball') then
		begin
		  {  if MP<17}
	       end;
	  if (s='lightning bolt') or (s='Lightning bolt') or (s='Lightning Bolt') or (s='lightningbolt') or (s='bolt') then
		begin
	       end;
	  if (s='blizzard') or (s='Blizzard') or (s='BLIZZARD') then
		begin
	       end;
	  if (s='Earthquake') or (s='EarthQuake') or (s='EARTHQUAKE') or (s='earthquake') then
		begin
	       end;
	  if (s='Full Healing') or (s='full healing') or (s='Full healing') or (s='FULL HEALING') or (s='full') then
		begin
		line1:='You cast full healing!';
		    gotoxy(8,18);
		    writeln('You have fully recovered from your wounds');
		    p.HP:=p.HPmax;
		    updatedisplay(p);
		    delay(1000);
	       end;
	  if (s='Deathray') or (s='DeathRay') or (s='deathray') or (s='DEATHRAY') then
		begin
		    if p.MP>199 then
			begin
				line1:='You cast Deathray!';
				    p.MP:=p.MP-200;
				    gotoxy(8,18);
				    writeln('You zap the ',monster,'!');
				    updatedisplay(p);
				    delay(1000);
				    gotoxy(8,19);
				    writeln('You hit the ',monster,' for ',monsterHP,' damage!');
				    gotoxy(8,20);
			       monsterHP:=0;
				    writeln('You have killed the ',monster,'!');
				    delay(1000);
			 end
		    else
			begin
				line1:='You don''t have enough mana!';
			      updatedisplay(p);
			      delay(1000);
			 end;

	       end;
	  if (s='Drain Life') or (s='Drain life') or (s='drain life') or (s='drainlife') or (s='DRAIN LIFE') then
		begin
	       end;
	  gotoxy(7,22);
	  textbackground(black);
	     textcolor(dark_grey);
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  MainScreen(p);
	  UpdateDisplay(p);
		writecmd8(p);
     end;

procedure Load(var p:PlayerStats; var LoadSuccess:boolean);
	var x:integer; f:file of PlayerStats; z:string[8];
	begin
            LoadSuccess:=True;
	       textbackground(black);
	       clrscr;
  		  textcolor(white);
	       textbackground(blue);
	       gotoxy(3,22);
	       writeln('ÉÍÍ¹ Loading... ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
	       gotoxy(3,23);
	       writeln('º                                                                        º');
	       gotoxy(3,24);
	       writeln('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ½');
            gotoxy(1,1);
            textcolor(grey);
            textbackground(black);
            writeln('Enter the name of your character');
            readln(z);
	       textcolor(dark_grey);
	       textbackground(black);
  		  assign(F, z+'.dat');
            {$I-}
	       reset(f);
            {$I+}
            If IOresult=0 then
            	begin
	               for x:=5 to 25 do
		               begin
			               gotoxy(x,23);
			               write('±');
			               delay(50);
		               end;
	               for x:=26 to 45 do
	    	               begin
		 	              gotoxy(x,23);
			              write('±');
			              delay(50);
		               end;
	               read(f, p);
   		          for x:=46 to 60 do
		               begin
			  	        gotoxy(x,23);
			             write('±');
			             delay(50);
		               end;
	               close(f);
	               for x:=61 to 72 do
		        begin
			        gotoxy(x,23);
			         write('±');
			         delay(25);
		            end;
               end
            else
     		begin
                    textbackground(black);
                    clrscr;
                    textcolor(light_red);
                    LoadSuccess:=false;
               	if IOresult=2 then
                         writeln('Character not found!');
                    if IOresult=3 then
                    	writeln('Path not found');
                    if IOresult=5 then
                    	writeln('An error occured while trying to read that file');
                    if IOresult=6 then
                         begin
	                    	writeln('That save game was saved under a different');
                              writeln('paremeter, it cannot be restored.');
                         end;
               	if IOresult=8 then
                    	begin
                         	exit;
                              exit;
                              exit;
                              exit;
                              writeln('Not enough memory!');
                         end;
                    if IOresult=10 then
               		writeln('The savefile you are trying to restore is not a save file');
                    if IOresult=11 then
                    	writeln('The savefile you are trying to restore is not a save file');
                    if IOresult=18 then
                    	writeln('An unknown error has occured while trying to read that file')
                    else
                    	writeln('An unknown error has occured while trying to read that file');

     		end;
	end;


procedure LoadGame(var p:PlayerStats);
	var x:integer; f:file of PlayerStats; z:string[8];
	begin
	       textbackground(black);
	       clrscr;
  		  textcolor(white);
	       textbackground(blue);
	       gotoxy(3,22);
	       writeln('ÉÍÍ¹ Loading... ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
	       gotoxy(3,23);
	       writeln('º                                                                        º');
	       gotoxy(3,24);
	       writeln('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ½');
            gotoxy(1,1);
            textcolor(grey);
            textbackground(black);
            writeln('Enter the name of your character');
            readln(z);
	       textcolor(dark_grey);
	       textbackground(black);
  		  assign(F, z+'.dat');
            {$I-}
	       reset(f);
            {$I+}
            If IOresult=0 then
            	begin
	               for x:=5 to 25 do
		               begin
			               gotoxy(x,23);
			               write('±');
			               delay(50);
		               end;
	               for x:=26 to 45 do
	    	               begin
		 	              gotoxy(x,23);
			              write('±');
			              delay(50);
		               end;
	               read(f, p);
   		          for x:=46 to 60 do
		               begin
			  	        gotoxy(x,23);
			             write('±');
			             delay(50);
		               end;
	               close(f);
	               for x:=61 to 72 do
		        begin
			        gotoxy(x,23);
			         write('±');
			         delay(25);
		            end;
               end
            else
     		begin
                    textbackground(black);
                    clrscr;
                    textcolor(light_red);
               	if IOresult=2 then
                         writeln('Character not found!');
                    if IOresult=3 then
                    	writeln('Path not found');
                    if IOresult=5 then
                    	writeln('An error occured while trying to read that file');
                    if IOresult=6 then
                         begin
	                    	writeln('That save game was saved under a different');
                              writeln('paremeter, it cannot be restored.');
                         end;
               	if IOresult=8 then
                    	begin
                         	exit;
                              exit;
                              exit;
                              exit;
                              writeln('Not enough memory!');
                         end;
                    if IOresult=10 then
               		writeln('The savefile you are trying to restore is not a save file');
                    if IOresult=11 then
                    	writeln('The savefile you are trying to restore is not a save file');
                    if IOresult=18 then
                    	writeln('An unknown error has occured while trying to read that file')
                    else
                    	writeln('An unknown error has occured while trying to read that file');

     		end;
	end;

procedure SaveGame(var P:PlayerStats);
	var x:byte; f: file of PlayerStats; z:string[8];
	begin
	     textbackground(black);
	     clrscr;
	     textbackground(blue);
	     textcolor(white);
	     gotoxy(3,22);
	     writeln('ÉÍÍ¹ Saving... ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»');
	     gotoxy(3,23);
	     writeln('º                                                                        º');
	     gotoxy(3,24);
	     writeln('ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ½');
		z:=p.name;
          Assign(F, z+'.dat');
	     textbackground(black);
	     textcolor(dark_grey);
	     for x:=5 to 25 do
			begin
  			     gotoxy(x,23);
	         	     write('±');
			     delay(50);
		     end;
	     rewrite(F);
	     for x:=26 to 45 do
			begin
			     gotoxy(x,23);
			     write('±');
			     delay(50);
		     end;
	     write(F, p);
		for x:=46 to 60 do
			begin
				gotoxy(x,23);
   				write('±');
			     delay(50);
  		     end;
	     close(f);
	     for x:=61 to 72 do
			begin
				gotoxy(x,23);
			 	write('±');
			 	delay(25);
		     end;
	  end;

procedure Help;
 var x:integer;
	begin
  	  textbackground(black);
	  clrscr;
	  writeln(' F5 - Save Game');
	  writeln(' F7 - Restore Game');
	  writeln('F10 - Quit Game');
	  readkey;
     end;

procedure ConsoleWindow(var p:playerstats);
 var c:string;
     begin
	  rand:=true;
	  repeat
	       updatedisplay(p);
		  textcolor(white);
		  textbackground(black);
			gotoxy(7,22);
		  writeln(':                                                                  ');
		  gotoxy(8,22);
		  textcolor(grey);
		  readln(c);
          c:=upstring(c);
		if c='updatedisplay' then UpdateDisplay(p);
	     if (c='SAVEGAME') or (c='SAVE GAME') or (c='SAVE') then SaveGame(p);
		if (c='quitgame') or (c='quit game') then begin quit:=true; c:='exit'; end;
	     if (c='cast spell') or (c='castspell') or (c='CAST SPELL') then CastSpell(p);
		if (c='stats') or (c='playerstats') then DisplayPlayerStats(debug,p);
		if (c='?') or (c='help') or (c='HELP') or (c='Help') then Help;
	  until (c='exit') or (c='quit') or (c='Exit') or (c='Quit') or (c='') or (c='');
	  gotoxy(7,22);
	  textbackground(black);
	  textcolor(dark_grey);
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  MainScreen(p);
	  UpdateDisplay(p);
	  rand:=false;
	end;


procedure MonsterAttack(var p:playerstats);
  var z,y,x,a,b,c:integer;
     begin
	  x:=random(99)+1;
		if monsterHP>0 then
	       begin
		    if monstertohit<x then
			  begin
			      gotoxy(5,17);
				 writeln(monster,' attacks!');
			      z:=random(p.damage)+random(p.weapondamage);
			      z:=z-random(p.modifieddefense);
			      delay(1000);
			    if z<1 then
				     begin
					     gotoxy(8,18);
					     writeln(monster,' misses!');
					  delay(1000);
					  clearlines(p);
				     end
			      else
				    begin
					gotoxy(8,18);
					writeln(monster,' hits you with his ',monsterweapon,' for ',z,' damage!');
					p.HP:=p.HP-z;
					delay(1000);
					clearlines(p);
				   end;
			  end
		    else
			  begin
			      line2:='The monster misses!';
					  delay(1000);
			      clearlines(p);
			 end;
		end
	  else
     end;





procedure Attack(var p:playerstats);
 var z,y,x,a,b,c:integer;
     begin
	  ClearLines(p);
	  line1:='You attack!';
	  UpdateDisplay(p);
	  x:=random(99)+1;
	  delay(1000);
	  if p.tohit<x then
	       begin
			  z:=random(p.damage)+random(p.weapondamage);
			  z:=z-random(monsterdefense);
		    if z<1 then
			 begin
			      gotoxy(8,18);
			      writeln(monster,'''s armor is too strong!!!');
			      gotoxy(8,19);
			      writeln('You inflicted no damage!');
			      delay(1000);
			      ClearLines(p);
				MonsterAttack(p);
			 end
		    else
			 begin
				     gotoxy(8,18);
			      monsterHP:=monsterHP-z;
				    writeln('You hit ',monster,' for ',z,' damage!');
					delay(1000);
			       ClearLines(p);
			      MonsterAttack(p);
				if monsterHP>1 then MonsterAttack(p);
			 end;
	       end
	  else
	       begin
				line2:='  You missed!';
		    UpdateDisplay(p);
		    delay(1000);
		Monsterattack(p);
	       end;
     end;


procedure FightMonster(var p:playerstats);
  var command:char; x,y,z,a,b,c:integer;
	begin
	ClearDisplay(p);
	  gotoxy(6,17);
	  writeln('You have encountered ',monster,'!');
	  delay(1500);
	  repeat
	  cmd1:=' A - Attack';
	  cmd2:=' C - Cast Spell';
	  cmd3:=' R - Run';
	  UpdateDisplay(p);
	  gotoxy(60,14);
	  command:=readkey;
	  if (command='`') then
		ConsoleWindow(p);
	  if (command=chr(68)) then
		begin
		line1:='You cannot quit during a battle!';
		    updatedisplay(p);
	       end;
	  if (command='R') or (command='r') then
	       begin
			line1:='This is what you get for not registering!';
		    readkey;
		    monsterattack(p);
	       end;
	  if (command='c') or (command='C') then begin
		CastSpell(p); MonsterAttack(p); end;
	if (command='a') or (command='A') then begin
		Attack(p); MonsterAttack(p); end;
		until (p.HP<1) or (monsterHP<1);
	  if p.HP<1 then
		begin
		cleardisplay(p);
		    line1:='You died!';
		    updatedisplay(p);
		delay(1000);
		    textbackground(0);
				clrscr;
		    quit:=true;
 {
		    cmd:=chr(68);         }
	       end;
	  if monsterHP<1 then
		begin
			gotoxy(6,17);
		    writeln('You have defeated ',monster,'!');
		    gotoxy(6,18);
		    writeln('You gain ',gainedEXP,' experience, and ',gainedMONEY,' gold pieces');
		    p.EXP:=p.EXP+gainedEXP;
		    p.money:=p.money+gainedMONEY;
		    b:=random(99)+1;
		    if b<10 then GetSword;
				readkey;
		    delay(1500);
	       end;

	end;



Procedure Bootout;
	begin
	textcolor(black);
	  textbackground(black);
	  clrscr;
	  textcolor(grey);
	  writeln('Soo...you have been cheating have you?');
	  readln;
	  writeln('If your not, why is your hit points zero?');
	  readln;
	  writeln('Yeah right...that''s what they all say...');
	  delay(1000);
	  writeln('I guess I''m just going to have to kick your cheating ass out of the game...');
	  delay(500);
	  writeln('Later!');
	  delay(1000);
	  exit;
	  exit;
	  exit;
	  exit;
     end;

Procedure GetMonsterStats;
	begin
	if monster='Death' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='Scythe';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Centaur' then
		begin
		monsterdamage:=75;
		    monsterHP:=200;
		    monsterdefense:=25;
		    monsternumberattack:=1;
		    monstermagic:=0;
		    monsterMP:=0;
		    monsterToHit:=60;
		    monsterweapon:='Spear';
		    monsterweapondamage:=150;
		    monsterarmor:='Skin';
		    monsterarmordefense:=50;
		    gainedEXP:=random(300)+150;
		    gainedMONEY:=random(500)+500;
	       end;
	if monster='Centipede' then
		begin
		    monsterdamage:=25;
		    monsterHP:=20;
		    monsterdefense:=50;
		    monsternumberattack:=1;
		    monstermagic:=0;
		    monsterMP:=300;
		    monsterToHit:=30;
		    monsterweapon:='Bite';
		    monsterweapondamage:=400;
		    monsterarmor:='Skin';
		    monsterarmordefense:=25;
		    gainedEXP:=random(100)+100;
		    gainedMONEY:=random(200)+100;
	       end;
	if monster='Ghoul' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=0;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='Claws';
		    monsterweapondamage:=50;
		    monsterarmor:='Dirty Rags';
		    monsterarmordefense:=20;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Lich' then
		begin
		monsterdamage:=1000;
		    monsterHP:=2000;
		    monsterdefense:=0;
		    monsternumberattack:=1;
		    monstermagic:=0;
		    monsterMP:=4;
		    monsterToHit:=70;
		    monsterweapon:='fireball';
		    monsterweapondamage:=100;
		    monsterarmor:='Skin';
		    monsterarmordefense:=0;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Minotaur' then
		begin
		monsterdamage:=150;
		    monsterHP:=25;
		    monsterdefense:=200;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='Spear';
		    monsterweapondamage:=25;
		    monsterarmor:='Skin';
		    monsterarmordefense:=0;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Metal Slime' then
		begin
		    monsterdamage:=10;
		    monsterHP:=1;
		    monsterdefense:=200;
		    monsternumberattack:=1;
		    monstermagic:=1;
		    monsterMP:=1;
		    monsterToHit:=50;
		    monsterweapon:='tongue';
		    monsterweapondamage:=15;
		    monsterarmor:='Skin';
		    monsterarmordefense:=0;
		    gainedEXP:=random(50)+100;
		    gainedMONEY:=random(50)+100;
	       end;
	if monster='Vampire' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='claws';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Wyvern' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='wings';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Crimson Death' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='sword';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Spider King' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='spear';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Lord of the Pit' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='wing';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Wraith' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='claws';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Witch' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='broom';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Skeleton' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='bone club';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Will o'' the Wisps' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='mind twist';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Beholder' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='glare';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Colossus' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='fist';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Demon' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='red spear';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Sky Dragon' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='lightning';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Golem' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='fist';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Zolar' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='sword';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Imp' then
		begin
		monsterdamage:=20;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='sword';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Grunt' then
		begin
		monsterdamage:=10;
		    monsterHP:=50;
		    monsterdefense:=10;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='Axe';
		    monsterweapondamage:=5;
		    monsterarmor:='Skin';
		    monsterarmordefense:=10;
		    gainedEXP:=50;
		    gainedMONEY:=random(15)+15;
	       end;
	if monster='Whimpy Guard' then
		begin
		monsterdamage:=5;
		    monsterHP:=30;
		    monsterdefense:=0;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=40;
		    monsterweapon:='Sword';
		    monsterweapondamage:=5;
		    monsterarmor:='Rags';
		    monsterarmordefense:=5;
		    gainedEXP:=30;
		    gainedMONEY:=50;
	       end;
	if monster='Baby Dragon' then
		begin
		monsterdamage:=30;
		    monsterHP:=200;
		    monsterdefense:=0;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='tail';
		    monsterweapondamage:=10;
		    monsterarmor:='Skin';
		    monsterarmordefense:=0;
		    gainedEXP:=110;
		    gainedMONEY:=50;
	       end;
	if monster='Small Orc' then
		begin
		monsterdamage:=5;
		    monsterHP:=30;
		    monsterdefense:=5;
		    monsternumberattack:=1;
		    monstermagic:=2;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='punch';
		    monsterweapondamage:=55;
		    monsterarmor:='Skin';
		    monsterarmordefense:=0;
		    gainedEXP:=random(50)+1;
		    gainedMONEY:=random(50)+20;
	       end;
	if monster='Tiny Mage' then
		begin
		monsterdamage:=5;
		    monsterHP:=5;
		    monsterdefense:=10;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=50;
		    monsterweapon:='firebolt';
		    monsterweapondamage:=10;
		    monsterarmor:='Skin';
		    monsterarmordefense:=20;
		    gainedEXP:=random(0)+40;
		    gainedMONEY:=40;
	       end;
	if monster='Putty' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='sword';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Slime' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='sword';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Small Warrior' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='sword';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Giant Ant' then
		begin
		monsterdamage:=150;
		    monsterHP:=400;
		    monsterdefense:=100;
		    monsternumberattack:=1;
		    monstermagic:=300;
		    monsterMP:=300;
		    monsterToHit:=70;
		    monsterweapon:='sword';
		    monsterweapondamage:=200;
		    monsterarmor:='Skin';
		    monsterarmordefense:=100;
		    gainedEXP:=random(300)+300;
		    gainedMONEY:=random(500)+1000;
	       end;
	if monster='Fire Mage' then
		begin
		monsterdamage:=50;
		    monsterHP:=100;
		    monsterdefense:=10;
		    monsternumberattack:=1;
		    monstermagic:=255;
		    monsterMP:=255;
		    monsterToHit:=70;
		    monsterweapon:='firerod';
		    monsterweapondamage:=40;
		    monsterarmor:='Black Robes';
		    monsterarmordefense:=30;
		    gainedEXP:=random(50)+20;
		    gainedMONEY:=random(20)+10;
	       end;

     end;


Procedure GetLevel1Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel2Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Fiery Imp';
	       2..5: monster:='Ogre';
	       6..10: monster:='Asp';
	       11..15: monster:='Giant Snake';
	       16..20: monster:='Orc';
	       21..25: monster:='Sundevil';
	       26..30: monster:='Goo';
	       31..35: monster:='Red Slime';
	       36..40: monster:='Warrior';
	       41..45: monster:='Red Ant';
	       46..50: monster:='Fiery Imp';
	       51..55: monster:='Ogre';
	       56..60: monster:='Asp';
	       61..65: monster:='Giant Snake';
	       66..70: monster:='Orc';
	       71..75: monster:='Sundevil';
	       76..80: monster:='Goo';
	       81..85: monster:='Red Slime';
	       86..90: monster:='Warrior';
	       95..99: monster:='Red Ant';
	       100: monster:='Stalker';
	  end;
	end;


Procedure GetLevel3Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Mage';
	       2..5: monster:='Wizard';
	       6..10: monster:='Sorcerer';
	       11..15: monster:='Witch';
	       16..20: monster:='Warlock';
	       21..25: monster:='Conjurer';
	       26..30: monster:='Illusionist';
	       31..35: monster:='Druid';
	       36..40: monster:='Priest';
	       41..45: monster:='Cleric';
	       46..50: monster:='Mage';
	       51..55: monster:='Wizard';
	       56..60: monster:='Sorcerer';
	       61..65: monster:='Witch';
	       66..70: monster:='Warlock';
	       71..75: monster:='Conjurer';
	       76..80: monster:='Illusionist';
	       81..85: monster:='Druid';
	       86..90: monster:='Priest';
	       95..99: monster:='Cleric';
	       100: monster:='Merlin';
	  end;
	end;


Procedure GetLevel4Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Guard';
	       2..5: monster:='Warrior';
	       6..10: monster:='Barbarian';
	       11..15: monster:='Paladin';
	       16..20: monster:='Soldier';
	       21..25: monster:='Mercenary';
	       26..30: monster:='Escort';
	       31..35: monster:='Basher';
	       36..40: monster:='Footman';
	       41..45: monster:='Knight';
	       46..50: monster:='Guard';
	       51..55: monster:='Warrior';
	       56..60: monster:='Barbarian';
	       61..65: monster:='Paladin';
	       66..70: monster:='Soldier';
	       71..75: monster:='Mercenary';
	       76..80: monster:='Escort';
	       81..85: monster:='Basher';
	       86..90: monster:='Footman';
	       95..99: monster:='Knight';
	       100: monster:='Golden Axe';
	  end;
	end;


Procedure GetLevel5Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel6Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel7Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel8Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel9Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel10Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel11Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel12Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel13Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel14Monster;
	begin
	monsterchance:=random(99)+1;
	  case monsterchance of
	       1..1: monster:='Imp';
	       2..5: monster:='Grunt';
	       6..10: monster:='Whimpy Guard';
	       11..15: monster:='Baby Dragon';
	       16..20: monster:='Small Orc';
	       21..25: monster:='Tiny Mage';
	       26..30: monster:='Putty';
	       31..35: monster:='Slime';
	       36..40: monster:='Small Warrior';
	       41..45: monster:='Giant Ant';
	       46..50: monster:='Imp';
	       51..55: monster:='Grunt';
	       56..60: monster:='Whimpy Guard';
	       61..65: monster:='Baby Dragon';
	       66..70: monster:='Small Orc';
	       71..75: monster:='Tiny Mage';
	       76..80: monster:='Putty';
	       81..85: monster:='Slime';
	       86..90: monster:='Small Warrior';
	       95..99: monster:='Giant Ant';
	       100: monster:='Fire Mage';
	  end;
	end;


Procedure GetLevel15Monster;
	begin
		monsterchance:=random(99)+1;
	  case monsterchance of
		1..1: monster:='Death';
	       2..5: monster:='Centaur';
	       6..10: monster:='Centipede';
	       11..15: monster:='Ghoul';
	       16..20: monster:='Lich';
	       21..25: monster:='Minotaur';
	       26..30: monster:='Vampire';
	       31..35: monster:='Wyvern';
	       36..40: monster:='Crimson Death';
	       41..45: monster:='Spider King';
	       46..50: monster:='Lord of the Pit';
	       51..55: monster:='Wraith';
	       56..60: monster:='Witch';
	       61..65: monster:='Skeleton';
	       66..70: monster:='Will o'' the Wisps';
	       71..75: monster:='Beholder';
	       76..80: monster:='Colossus';
	       81..85: monster:='Demon';
	       86..90: monster:='Sky Dragon';
	       95..99: monster:='Golem';
	       100: monster:='Zolar';
	  end;
     end;


procedure GetMonster(var P:PlayerStats);
	begin
	case p.level of
		  1..1: GetLevel1Monster;
		 2..2: GetLevel2Monster;
		 3..3: GetLevel3Monster;
		 4..4: GetLevel4Monster;
		 5..5: GetLevel5Monster;
		 6..6: GetLevel6Monster;
		 7..7: GetLevel7Monster;
		 8..8: GetLevel8Monster;
		 9..9: GetLevel9Monster;
	       10..10: GetLevel10Monster;
	       11..11: GetLevel11Monster;
	       12..12: GetLevel12Monster;
	       13..13: GetLevel13Monster;
	       14..14: GetLevel14Monster;
	       15..15: GetLevel15Monster;
		end;
	end;

{-------=========   ALL OTHER PROCEDURES GO BELOW THIS LINE   ========-------}




procedure HelpMenu(var p:playerstats);
  var z:char;
	begin
	  repeat;
	clrscr;
	  textcolor(white);
	  writeln('This game was compiled in Borland C++ and parts in Turbo Pascal.');
	  writeln('This program is a copyright if Stupid Software 1997, All Rights Reserved.');
	  writeln;
	  textcolor(grey);
	  writeln('F1  - This menu');
	  writeln('F2  - Credits');
	  writeln('F5  - Save game');
	  writeln('F7  - Restore game');
	  writeln('F9  - View console commands');
	  writeln('F10 - Quit Game');
	  writeln('ESC - Return to game');
	  writeln('`   - Console Window');
	  textcolor(light_red);
	gotoxy(1,24);
	writeln('Command: ');
	  textcolor(dark_grey);
	  gotoxy(10,24);
	  z:=readkey;
	  if (z=chr(59)) then
		begin
				clrscr;
		textcolor(white);
		    writeln('You are already in this menu!');
		    readkey;
	       end;
	  if (z=chr(60)) then
		begin
		clrscr;
		    textcolor(grey);
		    writeln('No credits have been written yet');
		readkey;
	       end;
	  if (z=chr(63)) then
		begin
		clrscr;
		    textcolor(grey);
		    writeln('You cannot save your game yet!');
		    readkey;
	       end;
	  if (z=chr(65)) then
		begin
		clrscr;
		    textcolor(grey);
		    writeln('No save games were found!');
		    readkey;
	       end;
	  if (z=chr(67)) then
		begin
		clrscr;
		    textcolor(grey);
		    writeln('Console commands have not been written yet!');
		    readkey;
	       end;
	  if (z=chr(67)) then
		begin
		clrscr;
		    QuitPrompt(p);
		    cmd:=chr(68);
	       end;
	  if z='`' then ConsoleWindow(p);
	  until (ch=chr(27));
	end;



procedure Forest(var p:playerstats);
	begin
	  repeat
	  ClearDisplay(p);
	  town:=false;
	  line1:='Off in the distance lies the depth of the forest.  It smells of ';
	  line2:='sweet greens and wood.  You enjoy the smell of fresh air as you  ';
	  line3:='travel deeper into the forest.  Chirps of the birds, and the low ';
	  line4:='hum of the crickets fills your ears.';
		cmd1:=' L - Look for something to kill';
	  cmd2:=' H - Go to healer';
	  cmd3:=' G - Go to special places';
	  cmd4:=' X - Go back to town';
	  UpdateDisplay(p);
	  cmd:=readkey;
	if (cmd='l') or (cmd='L') then begin GetMonster(p); GetMonsterStats; FightMonster(p); end;
	  if (cmd='`') then ConsoleWindow(p);
	  if (cmd=chr(68)) then
		begin
			repeat;
			      QuitPrompt(p);
			       if (ch='y') or (ch='Y') then exit;
					until (ch='n') or (ch='N');
		    end;
	until (cmd='x') or (cmd='X');
     end;


procedure ArmorShop(var p:playerstats);
	begin
	repeat
		ClearDisplay(p);
	       line1:='The racks around you are filled with pieces of armory, jewelry and';
	       line2:='other mysterious items.  A young woman sits behind the counter, as';
	       line3:='you walk in, she says softly, "Good day, how may I serve you?"';
	       cmd1:=' S - Travel South';
	       cmd2:=' B - Purchase an item';
	       cmd3:=' F - Fence an item';
	       UpdateDisplay(p);
	       gotoxy(60,14);
	       cmd:=readkey;
	       if cmd='`' then ConsoleWindow(p);
	       if quit=true then begin exit; exit; end;
	       if cmd=F5 then SaveGame(p);
	       if cmd=F7 then LoadGame(p);
	       if (cmd=chr(68)) then
		    begin
			 repeat;
			      QuitPrompt(p);
			       if (ch='y') or (ch='Y') then exit;
				     until (ch='n') or (ch='N');
		    end;
	until (cmd='s') or (cmd='S');
	  cmd:='E';
     end;

procedure WeaponShop(var p:playerstats);
	begin
	repeat
		ClearDisplay(p);
		  line1:='Various swords and axes hang on the walls.  A strong middle aged man';
		  line2:='sits behind a dirty wooden counter.  He taps his foot up and down ';
		  line3:='at a steady pace.  It smells of hot oil.';
	       cmd1:=' N - Travel North';
	       cmd2:=' B - Purchase an item';
	       cmd3:=' F - Fence an item';
		  UpdateDisplay(p);
		  gotoxy(60,14);
	       cmd:=readkey;
	       if cmd='`' then ConsoleWindow(p);
	       if cmd=F5 then SaveGame(p);
	       if cmd=F7 then LoadGame(p);
	       if quit=true then begin exit; exit; end;
	       if (cmd=chr(68)) then
		    begin
			 repeat;
			      QuitPrompt(p);
			       if (ch='y') or (ch='Y') then exit;
				     until (ch='n') or (ch='N');
		    end;
	  until (cmd='n') or (cmd='N');
	  ClearDisplay(p);
	  textbackground(black);
	  clrscr;
	cmd:='E';
	end;

procedure ArmoryPlaza(var p:playerstats);
	begin
	repeat
	       ClearDisplay(p);
	       line1:='To the north you notice a small wooden door with a sign above it.';
	       line2:='The sign reads "Armory".  To the south, another door with a sign.';
	       line3:='above it which reads "Weapons Shop".  To the east is the tall';
	       line4:='walls of the town, and to the west is the town gates';
	       cmd1:=' N - Travel North';
	       cmd2:=' S - Travel South';
	       cmd3:=' W - Travel West';
	       UpdateDisplay(p);
	       gotoxy(60,14);
	       cmd:=readkey;
	     if cmd='`' then ConsoleWindow(p);
	       if quit=true then begin exit; exit; end;
	       if cmd=F5 then SaveGame(p);
	       if cmd=F7 then LoadGame(p);
	       if (cmd=chr(68)) then
		    begin
			 repeat;
			      QuitPrompt(p);
			       if (ch='y') or (ch='Y') then exit;
				     until (ch='n') or (ch='N');
		    end;
	  until (cmd='n') or (cmd='N') or (cmd='s') or (cmd='S') or (cmd='W') or (cmd='w');
		ClearDisplay(p);
	  textbackground(black);
	  clrscr;
	  if (cmd='w') or (cmd='W') then cmd:='+';
	  if (cmd='s') or (cmd='S') then WeaponShop(p);
	  if (cmd='n') or (cmd='N') then ArmorShop(p);
     end;



Procedure StartInTown(var p:playerstats);
	begin
	  repeat
	       ClearDisplay(p);
	       Town:=true;
			line1:='You look in both directions, off to the east, you notice an armory';
		  line2:='to the west, you see the plaza.  Behind you is the gates out of the';
		  line3:='city...';
		  cmd1:=' W - Travel West';
		  cmd2:=' E - Travel East';
		  cmd3:=' S - Travel South';
	       UpdateDisplay(p);
	       if p.HPmax<0 then
	    	  Bootout;
	       gotoxy(60,14);
		     cmd:=readkey;
	     if cmd='`' then ConsoleWindow(p);
	       if quit=true then begin Exit; Exit; end;
	       if cmd=F5 then SaveGame(p);
	       if cmd=F7 then LoadGame(p);
		if (cmd=chr(68)) then
		begin
			repeat;
			      QuitPrompt(p);
			       if (ch='y') or (ch='Y') then exit;
					until (ch='n') or (ch='N');
		    end;
	until (cmd='s') or (cmd='e') or (cmd='S') or (cmd='E') or (cmd='w') or (cmd='W');
	ClearDisplay(p);
	textbackground(black);
	textcolor(black);
	clrscr;
	if (cmd='s') or (cmd='S') then Forest(p);
     end;

procedure TitleScreen;
	begin
	  textcolor(black);
	  textbackground(black);
	  clrscr;
	  clrscr;
	  gotoxy(1,1);
	  textcolor(yellow);
	  textbackground(blue);
	  writeln('                             Legions of Chaos v1.3                             ');
	  textbackground(black);
	  textcolor(dark_grey);
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  writeln('±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±');
	  textcolor(yellow);
	  textbackground(blue);
	  writeln('                                  Ritual ''97                                   ');
	  gotoxy(18,7);
	  textbackground(red);
	  textcolor(white);
	  writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Main Menu ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
	  gotoxy(18,8);
	  writeln('³  1.  New Game                             ³');
	  gotoxy(18,9);
	  writeln('³  2.  Load Game                            ³');
	  gotoxy(18,10);
	  writeln('³  3.  Credits                              ³');
	  gotoxy(18,11);
	  writeln('³                                           ³');
	  gotoxy(18,12);
	  writeln('³  Q.  Quit Game                            ³');
	  gotoxy(18,13);
	  writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
     end;


procedure NewGame(var p:PlayerStats);
	begin
	     GetPlayerInformation(p);
	     InitalizePlayerStats(p);
	     DisplayPlayerStats(debug,p);
     end;


var p:PlayerStats; g:byte; LoadSuccess:boolean;
begin
	Randomize;
{     ScreenSave(debug);
     CopyPlead;}
     repeat
          LoadSuccess:=true;
          TitleScreen;
	     g:=0;
	     cmd:=readkey;
		case cmd of
		     '1': NewGame(p);
		     '2': Load(p,LoadSuccess);
               'Q': exit;
               'q': exit;
           chr(27): exit;
	        else g:=1;
		end;
		if LoadSuccess=false then g:=1
     until g=0;
     Writecmd8(p);
     MainScreen(p);
	UpdateStatsWindow(p);
     StartInTown(p);
     repeat
	  if (cmd='e') or (cmd='E') then ArmoryPlaza(p);
	  if (cmd='x') or (cmd='X') or (cmd='n') or (cmd='N') then StartInTown(p);
	  if (cmd='e') or (cmd='E') then ArmoryPlaza(p);
	  if (cmd=F5) then SaveGame(p);
	  if (cmd=F7) then LoadGame(p);
	  if cmd='+' then StartInTown(p);
     until (cmd=chr(68)) or (quit=true);
     textcolor(grey);
     textbackground(black);
     clrscr;
end.
