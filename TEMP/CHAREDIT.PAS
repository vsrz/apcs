program Legions_Of_Chaos_v10_Character_Editor(input,output);

uses crt, editgrap, copyrite;

const
   mem=35;
   mem2=80;



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

var LoadSuccess:byte;

procedure LoadCharacter(var p:PlayerStats);
	var x:integer; f:file of PlayerStats; z:string[8];
     	begin
               textbackground(black);
               clrscr;
     		textcolor(white);
               textbackground(blue);
               gotoxy(3,22);
               writeln('ษออน Loading... ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
               gotoxy(3,23);
               writeln('บ                                                                        บ');
               gotoxy(3,24);
               writeln('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฝ');
               textcolor(grey);
               textbackground(black);
               gotoxy(1,1);
               writeln('Enter your character name');
               gotoxy(1,2);
               readln(z);
               textcolor(dark_grey);
               textbackground(black);
          	assign(F, z+'.dat');
               reset(f);
		     for x:=5 to 25 do
		     	begin
		               gotoxy(x,23);
		               write('ฑ');
		               delay(50);
                    end;
               for x:=26 to 45 do
               	begin
                    	gotoxy(x,23);
                         write('ฑ');
                         delay(50);
                    end;
               read(f, p);
          	for x:=46 to 60 do
               	begin
                    	gotoxy(x,23);
					write('ฑ');
                         delay(50);
                    end;
               close(f);
               for x:=61 to 72 do
               	begin
                    	gotoxy(x,23);
                         write('ฑ');
                         delay(25);
                    end;
               LoadSuccess:=1;
          
     	textcolor(grey);
	     gotoxy(1,8);
	     writeln('Press any key to continue');
	     readkey;

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
  var key:char; cheat:string;
	begin
     	repeat
               debug:=true;
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
               writeln('(1) Name    : ',p.name);
               writeln('(2) Class   : ',p.class);
               writeln('(3) Damage  : ',p.damage);
               writeln('(4) Defense : ',p.defense);
               writeln('(5) Magic   : ',p.magic);
               writeln;
               gotoxy(39,3);
               writeln('          (6) Your name: ',p.realname);
               gotoxy(39,4);
               writeln('          (7) HP: ',p.HP,'/',p.HPmax);
               gotoxy(39,5);
               writeln('          (8) MP: ',p.MP,'/',p.MPmax);
               gotoxy(38,6);
               writeln('           (9) EXP: ',p.exp);
               gotoxy(36,7);
               writeln('             (0) ToHit: ',100-p.tohit,'%');
               writeln;
               writeln('(A) Attack Damage    : ',p.modifieddamage,'-',p.dammax);
               writeln('(B) Armor Defense    : ',p.modifieddefense);
               writeln('(C) Attacks per round: ',p.numberattack);
               writeln;
               writeln('(D) Weapon          : ',p.weaponname);
               writeln('(E) Damage          : ',p.weapondamage);
               writeln('(F) Modified Damage : ',p.modifieddamage);
               writeln;
               writeln('(G) Armor            : ',p.armorname);
               writeln('(I) Defense          : ',p.armordefense);
               writeln('(I) Modified Defense : ',p.modifieddefense);
               gotoxy(39,9);
               textcolor(grey);
               writeln('          Gold: ');
               gotoxy(55,9);
               writeln(p.money);
               gotoxy(49,11);
               textcolor(white);
               writeln('(J) Spells');
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
               if (cheat='suck blue frog') or (cheat='Suck blue frog') or (debug=true) then
          	     begin
                         debug:=true;
                    	gotoxy(1,21);
                         textcolor(blue);
                    	writeln('EDITING CHARACTER, PRESS ''?'' FOR HELP');
                         gotoxy(1,23);
                         textcolor(black);
                         writeln('                                                       ');
                         gotoxy(1,23);
                         textcolor(white);
                         writeln('Command: ');
					gotoxy(11,23);
                         textcolor(dark_grey);
                         key:=readkey;
                         {$I-}
                    	if (key='q') or (key='Q') then debug:=false;
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
                         {$I+}
                    end;
          until debug=false;

     end;


procedure SaveCharacter(var P:PlayerStats);
	var x:byte; f: file of PlayerStats; z:string[8];
     	begin
               textbackground(black);
               clrscr;
               textbackground(blue);
               textcolor(white);
               gotoxy(3,22);
               writeln('ษออน Saving... ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
               gotoxy(3,23);
               writeln('บ                                                                        บ');
               gotoxy(3,24);
               writeln('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฝ');
               z:=p.name;
          	Assign(F, z+'.dat');
               textbackground(black);
               textcolor(dark_grey);
               for x:=5 to 25 do
               	begin
                    	gotoxy(x,23);
                         write('ฑ');
                         delay(50);
                    end;
               rewrite(F);
               for x:=26 to 45 do
               	begin
                    	gotoxy(x,23);
                         write('ฑ');
                         delay(50);
                    end;
               write(F, p);
          	for x:=46 to 60 do
               	begin
                    	gotoxy(x,23);
                         write('ฑ');
                         delay(50);
                    end;
               close(f);
               for x:=61 to 72 do
               	begin
                    	gotoxy(x,23);
                         write('ฑ');
                         delay(25);
                    end;
          end;



var debug:boolean; p:playerstats;

begin
	Screensave(debug);
     CopyPlead;
     clrscr;
     LoadCharacter(p);
	if LoadSuccess=1 then
          begin
			DisplayPlayerStats(debug,p);
		     SaveCharacter(p);
          	clrscr;
          end
     else
     	begin
          	textbackground(0);
               clrscr;
               writeln('File not found');
          end;
end.