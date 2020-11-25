{By Jeremy Villegas}

{Advanced Placement ( AP ) Computer Science, Period 5}



program aljksdfashdf(input,output);

uses crt;

{$M 40000,6400,8000}

const
  enter=chr(13);
  back=chr(8);
  max=22;
  ESC=27;
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

type
{     TTutorApp=object(TApplication)
     end;                           }
     Tperson=record
     	First,lastname:string;
          age:integer;
     end;
	TList=Array[1..max] of Tperson;
     person=file of tperson;


function Oldest(var list:tlist; var last:integer): string;
 var old,p:integer; x:string;
begin
	old:=list[1].age;
     for p:=2 to last do
     	if list [p].age>old then
               begin
	          	old:=list[p].age;
                    x:=list[p].first;
               end;
     oldest:=x;
end;

function AverageAge(var list:tlist; last:integer): integer;
 var z,y,x:integer;
 	begin
          z:=0;
		for y:=1 to last do
          	z:=z+list[y].age;
          writeln('The average age of the people is ',round(z/last),'...');
     end;

function Youngest(var list:tlist; last:integer): string;
 var z,x:integer; y:string;
 	begin
     	x:=list[1].age;
     	for z:=2 to last do
               if list [z].age<x then
				begin
                    	x:=list[z].age;
                         y:=list[z].first;
                    end;
          Youngest:=y;
     end;

function ListFull(var list:tlist; last:integer): integer;
 var z,y,x:integer;
 	begin
		writeln('The list is ',round(last/max*100),'% full');
     end;


function UpString(s:string):string;
 var c:longint;
	begin
     	for c:=1 to length(s) do
          	s[c]:=Upcase(s[c]);
          Upstring:=s;
     end;


function DoSearch(list:tlist; last:integer; target:string): integer;
	var row:integer; crap:boolean; x:integer;
     begin
     	row:=0;
          for x:=1 to last do
			begin
	   			if (Upstring(list[x].lastname)=Upstring(target)) or (Upstring(list[x].first)=Upstring(target)) then
					row:=x;
          	end;
     	dosearch:=row;
	end;



procedure TheReadln(var a:string; w:integer);
	var x,y,c:integer;
     	ch:string;

     begin
          x:=wherex;
          y:=wherey;
          c:=1;
          ch:='';
          a:='';
          repeat
               ch:=readkey;
          until ch=chr(13);
     end;

procedure MyReadln(var a:string; w:integer);
	var x,y,c:integer;
         ch:string;
         z:boolean;
       begin
         z:=false;
         w:=w+1;
         x:=wherex;
         y:=wherey;
         c:=1;
         ch:='';
         a:='';
         repeat
            z:=false;
            gotoxy(x,y);
            write(' ':w);
            gotoxy(x,y);
            write(a);
            gotoxy(x+c-1,y);
            ch:=readkey;
            if (ch=BACK) and (c>1) then
              begin
                z:=true;
                c:=c-1;
                a:=copy(a,1,length(a)-1);
              end
            else
		  if (ch=BACK) and (c=1) then
              begin
               c:=c;
               end
            else if ch<>ENTER then
		    begin
                a:=a+ch;
                c:=c+1;
              end;
            if (C>W) and (Z=false) then a:=copy(a,1,length(a)-1);
            if ch='.' then
             	begin
                 c:=22;
                 a:=copy(a,1,length(a)-1);
               end;
         until (ch=chr(13));
       end;



procedure OkClick;
  var x:byte; ch:char;
  	begin
          x:=37;
		textbackground(grey);
          textcolor(grey);
          gotoxy(39,18);
          writeln('฿฿฿฿฿฿฿฿');
          gotoxy(46,17);
          writeln('Ü');
          gotoxy(x+4,17);
          textbackground(grey);
          writeln('         ');
          x:=40;
          gotoxy(x-1,17);
          textbackground(green);
          textcolor(light_blue);
          writeln('   O    ');
          textbackground(grey);
          gotoxy(38,17);
          writeln(' ');
          textbackground(green);
		textcolor(yellow);
          gotoxy(x+3,17);
          writeln('k');
          delay(200);
          gotoxy(40,17);
          textbackground(grey);
          writeln('             ');
          x:=38;
          gotoxy(x,17);
          textbackground(green);
          textcolor(light_blue);
          writeln('   O    ');
		textcolor(yellow);
          gotoxy(x+4,17);
          writeln('k');
          textcolor(0);
          textbackground(grey);
          gotoxy(39,18);
          writeln('฿฿฿฿฿฿฿฿');
          gotoxy(46,17);
          writeln('Ü');
          delay(200);
     end;

procedure OkBox;
  var x:byte; ch:char;
	begin
          x:=38;
          gotoxy(x,17);
          textbackground(green);
          textcolor(light_blue);
          writeln('   O    ');
		textcolor(yellow);
          gotoxy(x+4,17);
          writeln('k');
          textcolor(0);
          textbackground(grey);
          gotoxy(39,18);
          writeln('฿฿฿฿฿฿฿฿');
          gotoxy(46,17);
          writeln('Ü');
     end;



procedure WritePerson(var p:tperson; x:integer);
var z,y:integer;
	begin
     	gotoxy(3,x);
          writeln(p.lastname);
          gotoxy(36,x);
          writeln(p.first);
          gotoxy(70,x);
          writeln(p.age);
     end;


procedure NotAvailable;
	var x:integer;
     begin
     	gotoxy(28,22);
          textbackground(blue);
          textcolor(white);
          writeln('That option is not available');
     	readkey;
          gotoxy(28,22);
          textcolor(dark_grey);
          textbackground(black);
          writeln('ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ');
     end;


procedure CloseBox(x:byte; y:byte);
	begin
          textcolor(light_green);
          gotoxy(x,y);
          writeln('þ');
     	textcolor(white);
	end;

procedure BoxBkgrnd;
  var x:integer;
      begin
          textbackground(red);
          textcolor(white);
          for x:=9 to 17 do
               begin
                    gotoxy(20,x);
			 	writeln('บ                                        บ');
               end;
          gotoxy(20,8);
	 	writeln('ษอ[ ]ออออออออออออออออออออออออออออออออออออป');
          gotoxy(20,18);
          writeln('ศออออออออออออออออออออออออออออออออออออออออผ');
          textcolor(white);
      end;

procedure DrawBox;
  var x:integer;
  	begin
          BoxBkgrnd;
          gotoxy(22,9);
          writeln('1: Display the list');
          gotoxy(22,10);
          writeln('2: Add a person to the list');
          gotoxy(22,11);
          writeln('3: Save this list');
          gotoxy(22,12);
          writeln('4: Load a list');
          gotoxy(22,13);
	  writeln('5: Delete Menu');
          gotoxy(22,14);
          writeln('6: Lookup a person on the list');
          gotoxy(22,15);
          writeln('7: See the stats on the current list');
          gotoxy(22,16);
          writeln('8: Alphabetize menu');
          gotoxy(22,17);
          writeln('Q: Quit this program');
     	CloseBox(23,8);
     end;



procedure DrawMenu;
     var x:integer;
	begin
	  textcolor(black);
          textbackground(black);
          clrscr;
          clrscr;
          gotoxy(1,1);
          textcolor(yellow);
          textbackground(blue);
          writeln('                               Weird Funky Stuff                               ');
          textbackground(black);
	     textcolor(dark_grey);
          for x:=1 to 23 do
			writeln('ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ');
          textbackground(red);
          textcolor(white);
          DrawBox;
     end;


procedure DisplayList(var list:tlist; var last:integer);
var L,x:integer; p:tperson;
	begin
          textbackground(black);
          textcolor(grey);
          clrscr;
          textbackground(blue);
          textcolor(yellow);
          gotoxy(1,1);
          writeln('  Last Name                        First Name                        Age       ');
          textbackground(black);
          textcolor(grey);
          for x:=1 to last do
               begin
			   	writeperson(list[x],x+1);
               end;
          if last=0 then writeln('There is no one on the list!');
     end;


procedure ReadPerson(var P:tperson);
var x:integer;
	begin
          drawbox;
          textbackground(grey);
          textcolor(white);
          gotoxy(22,9);
	 	writeln('ษอ[ ]ออออออออออออออออออออออออออออออออออออป');
          gotoxy(22,19);
          writeln('ศออออออออออออออออออออออออออออออออออออออออผ');
          textcolor(light_green);
          gotoxy(25,9);
          writeln('þ');
          textcolor(white);
		for x:=10 to 18 do
          	begin
               	gotoxy(22,x);
			 	writeln('บ                                        บ');
               end;
          textbackground(grey);
          textcolor(black);
          gotoxy(23,10);
          writeln('First name:');
          gotoxy(23,13);
          writeln('Last name:');
          gotoxy(23,16);
          writeln('Age:');
		gotoxy(24,11);
          textbackground(blue);
          textcolor(white);
          writeln('                                      ');
          gotoxy(24,14);
          writeln('                                      ');
          gotoxy(24,17);
          writeln('                                      ');
          repeat
               gotoxy(23,10);
               textcolor(white);
               textbackground(grey);
               writeln('First name:');
	          gotoxy(24,11);
               textbackground(Blue);
	          readln(p.first);
               textcolor(black);
               textbackground(grey);
               gotoxy(23,10);
               writeln('First name:');
          until p.first<>'';
          repeat
               gotoxy(23,13);
               textbackground(grey);
     		textcolor(white);
               writeln('Last name:');
     	     gotoxy(24,14);
               textbackground(blue);
	          readln(p.lastname);
               textcolor(black);
               textbackground(grey);
               gotoxy(23,13);
               writeln('Last name:');
          until p.lastname<>'';
          textcolor(white);
          textbackground(grey);
          gotoxy(23,16);
          writeln('Age:');
          textbackground(blue);
          textcolor(15);
	    	gotoxy(24,17);
	     readln(p.age);
	end;

procedure Add(var list:tlist; var last:integer);
var L:integer;
	begin
     	if last>=max then
               begin
                    textbackground(black);
                    textcolor(white);
                    gotoxy(1,24);
	          	writeln('There are already too many people on the list!');
               	readkey;
               end
          else
          	begin
               	last:=last+1;
                    ReadPerson(List[last]);
			end;
     end;

procedure Save(list:tList; last:integer);
var
   f: person;
   p:integer;
   y:string;
   x:string;
   key:char;
   a:integer;
begin
          begin
               textbackground(blue);
               textcolor(white);
               gotoxy(3,22);
               writeln('ษออน Saving... ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
               gotoxy(3,23);
               writeln('บ                                                                        บ');
               gotoxy(3,24);
               writeln('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฝ');
               textbackground(black);
			textcolor(grey);
               gotoxy(1,3);
               writeln('Enter path:  (default a:\people.rit)');
			Myreadln(x,8);
               if x='' then
               	x:='a:\people';
               textcolor(dark_grey);
               gotoxy(5,23);
               assign(F, x+'.rit');
               gotoxy(5,23);
               delay(50);
               writeln('ฑ');
               gotoxy(6,23);
               delay(50);
               writeln('ฑ');
               gotoxy(7,23);
               delay(50);
               writeln('ฑ');
               gotoxy(8,23);
               delay(50);
               writeln('ฑ');
               assign(F, x);
               gotoxy(9,23);
               delay(50);
               writeln('ฑ');
               gotoxy(10,23);
               delay(50);
               writeln('ฑ');
               gotoxy(11,23);
               delay(50);
               writeln('ฑ');
               gotoxy(12,23);
               delay(50);
               writeln('ฑ');
               gotoxy(13,23);
               delay(50);
               writeln('ฑ');
               gotoxy(14,23);
               delay(50);
               writeln('ฑ');
               rewrite(F);
               gotoxy(15,23);
               delay(50);
               writeln('ฑ');
               gotoxy(16,23);
               delay(50);
               writeln('ฑ');
               gotoxy(17,23);
               delay(50);
               writeln('ฑ');
               gotoxy(18,23);
               delay(50);
               writeln('ฑ');
               gotoxy(19,23);
               delay(50);
               writeln('ฑ');
               gotoxy(20,23);
               a:=20;
	          for p:=1 to last do
               	begin
		               write(F, list[p]);
                         gotoxy(a,23);
                         delay(50);
                         writeln('ฑ');
                         a:=a+1;
                    	gotoxy(a,23);
				end;
               for a:= a to 74 do
               	begin
		               gotoxy(a,23);
		               delay(25);
		               writeln('ฑ');
                         gotoxy(a,23);
                    end;
          end;
end;

procedure Save1(list:tlist; last:integer);
var key:string;
begin
     textbackground(black);
	clrscr;
     writeln('Would you like to save the current list (Y/N)?');
     readln(key);
     if (key='y') or (key='Y') then
     	save(list,last);
end;



procedure DisplayErrorCode(a:integer);
  var x:integer;
  	begin
     	textcolor(0);
          textbackground(grey);
          gotoxy(23,15);
          if a=2 then writeln('File not found');
          if a=3 then writeln('Path not found');
          if a=5 then writeln('Access denied');
          if a=6 then writeln('Invalid handle');
          if a=8 then writeln('Not enough memory');
          if a=10 then writeln('Invalid enviorment');
          if a=11 then writeln('Invalid format');
          if a=18 then writeln('No more files');
     end;

procedure Load(var list:tList; var last:integer);
var
  f:person;
  p:integer;
  x:string;
  z:string;
  a:integer;
  d:integer;
  ch:char;
begin
     textbackground(black);
	z:='.rit';
     clrscr;
     textbackground(blue);
     textcolor(white);
     gotoxy(3,22);
     writeln('ษออน Loading... ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
     gotoxy(3,23);
     writeln('บ                                                                        บ');
     gotoxy(3,24);
     writeln('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออฝ');
     textbackground(black);
     textcolor(grey);
     gotoxy(1,3);
     writeln('Name of file:  (default a:\people.rit)');
     readln(x);
     if x='' then
     	x:='a:\people';
     textcolor(dark_grey);
     Assign(F, x+'.rit');
     {$I-}
     reset(f);
     {$I+}
     a:=IOresult;
     if a=0 then
		begin
               for d:=5 to 25 do
                    begin
		               gotoxy(d,23);
		               delay(50);
		               writeln('ฑ');
                    end;
               p:=0;
{               for d:=20 to 25 do
     	          begin
		               gotoxy(20,23);
		               delay(50);
		               writeln('ฑ');
                    end;}
               a:=26;
               while not EOF(F) do
 	              begin
	                   p:=p+1;
         	              read(F, list[p]);
                        gotoxy(a,23);
                        delay(50);
                        writeln('ฑ');
                        a:=a+1;

	              end;
               last:=p;
               for a:= a to 74 do
     	          begin
		               gotoxy(a,23);
		               delay(25);
		               writeln('ฑ');
                    end;
	          close(f);
          end
     else
     	begin
               textbackground(grey);
               textcolor(white);
               for p:=10 to 18 do
                   begin
                        gotoxy(21,p);
                        writeln('บ                                        บ');
                   end;
               gotoxy(21,9);
               writeln('ษอ[ ]ออออออออออออออออออออออออออออออออออออป');
               gotoxy(21,19);
               writeln('ศออออออออออออออออออออออออออออออออออออออออผ');
               gotoxy(24,09);
               textcolor(light_green);
               writeln('þ');
               textcolor(black);
               gotoxy(23,10);
		     writeln('ERROR: ',a);
               gotoxy(23,12);
               writeln('An error occured while trying to read');
               gotoxy(23,13);
			writeln('the file ',x+'.rit');
          	Displayerrorcode(a);
               repeat
	               OkBox;
                    ch:=readkey;
			until (ch='o') or (ch='O') or (ch=chr(13));
               OkClick;
          end;
end;

procedure Deleteperson(var List:tList; var Last:integer; var todelete:integer);
var p:integer;
begin
	Last:=last-1;
     for p:=todelete to last do
         list[p]:=list[p+1];
     dec(todelete);
end;



procedure Search (var list:tList; var last:integer; var d:boolean);
var
    target,ans,answer:string;
    p:integer;
    found:boolean;
    aperson:person;
    x:integer;

begin
	repeat
           textbackground(0);
   	      clrscr;
           d:=false;
		 found:=false;
  		 writeln('Type the name of the person you want to delete');
  		 readln(target);
		 p:=1;
           while p<=last do
           begin
             if (Upstring(target)=Upstring(list[p].First)) or (Upstring(target)=Upstring(list[p].LastName)) then
               begin
                 clrscr;
                 found:=true;
                 DisplayList(list,last);
                 textcolor(white);
			  writeperson(list[p],p+1);
                 gotoxy(1,24);
                 write('Do you want to delete this person (Y/N)?');
                 answer:=readkey;
                 if (answer='y') or (answer='Y') then
                   Deleteperson(list,last,p)
                 else
                    begin
	                 	clrscr;
                         found:=false;
                    end;
               end;
             inc(p);
           end;
         clrscr;
         if found=false then

           writeln ('Sorry, your target, ' , target , ' was not found');
           writeln('Do you want to try again?');
           writeln;
           ans:=readkey;
      until (ans='N') or (ans='n');
      d:=true;

end;


procedure Delete(var list:tlist; var last:integer);
var x:char;
	begin
          textbackground(0);
          clrscr;
		textcolor(7);
          writeln('Are you absolutely sure you want to delete everyone on the list?');
          x:=readkey;
          if (x='y') or (x='Y') then
			begin
                    last:=0;
		          writeln('Everyone on the list has been cleared!');
                    readkey;
               end;
     end;

procedure LoadList(var list:tlist; var last:integer);
var z:char;
	begin
          textcolor(grey);
          textbackground(black);
          clrscr;
          writeln('Load list?');
          z:=readkey;
          if (z='y') or (z='Y') then Load(list,last);
     end;



procedure GetStats(list:tlist; last:integer);
	begin
          gotoxy(23,15);
          textcolor(0);
          AverageAge(list,last);
          gotoxy(23,11);
          textcolor(black);
          writeln('The list has ',last,' people in it.');
          gotoxy(23,10);
          textcolor(black);
          ListFull(list,last);
          textcolor(0);
          gotoxy(23,13);
       	writeln('The oldest person is ',Oldest(list,last));
          textcolor(0);
          gotoxy(23,14);
          writeln('The youngest person is ',Youngest(list,last));
     end;

procedure SeeStats(list:tlist; last:integer);
 var x:integer; ch:char;
	begin
          DrawBox;
          if last>1 then
	     begin
                  textbackground(grey);
                  textcolor(white);
                  for x:=10 to 18 do
                      begin
                           gotoxy(21,x);
                           writeln('บ                                        บ');
                      end;
                  gotoxy(21,9);
                  writeln('ษอ[ ]ออออออออออออออออออออออออออออออออออออป');
                  gotoxy(21,19);
                  writeln('ศออออออออออออออออออออออออออออออออออออออออผ');
                  gotoxy(24,09);
                  textcolor(light_green);
                  writeln('þ');
                  GetStats(list,last);
                  repeat
                       OkBox;
                       ch:=readkey;
                  until (ch='O') or (ch='o') or (ch=chr(13));
          	   OkClick;
	     end
	  else
     	      begin
                   textbackground(0);
                   writeln('There is nobody on the list!');
                   readkey;
              end;
			textcolor(white);

	end;

procedure S(var list:tlist; var last:integer);
	var target:string; row:integer;
     begin
          row:=0;
          textbackground(black);
          clrscr;
          writeln('Who do you want to look for?');
          readln(target);
     	row:=dosearch(list,last,target);
          DisplayList(list,last);
          textcolor(white);
          if row<>0 then
			writeperson(list[row],row+1)
          else
          	begin
                    gotoxy(1,23);
                    Textcolor(white);
		          writeln('Sorry, that person was not found.');
               end;
     	readkey;
     end;

procedure EnterDelete(var field:byte; var ch:char);
	begin
     	if field=1 then ch:='1';
          if field=2 then ch:='2';
          if field=3 then ch:='3';
          if field=4 then ch:='Q';
     end;

procedure DrawDeleteMenu;
  var x:integer;
	begin
          textbackground(blue);
          textcolor(white);
          gotoxy(22,09);
          writeln('ษอ[ ]ออออออออออออออออออออออออออออออออออออป');
          for x:=10 to 18 do
          	begin
	          	gotoxy(22,x);
          	     writeln('บ                                        บ');
               end;
          gotoxy(22,19);
          writeln('ศออออออออออออออออออออออออออออออออออออออออผ');
          gotoxy(25,09);
          textcolor(light_green);
          writeln('þ');
     	textcolor(yellow);
		for x:=14 to 15 do
	     	begin
		          gotoxy(23,x);
				writeln('                                        ');
	          end;
          gotoxy(23,10);
          writeln('              Delete Menu               ');
          gotoxy(23,11);
          writeln('  1: Delete everyone on the list        ');
          gotoxy(23,12);
          writeln('  2: Delete a single person on the list ');
          gotoxy(23,13);
          writeln('  3: Search for a person on the list    ');
          gotoxy(23,18);
          writeln('  Q: Quit to main menu                  ');
     end;


procedure CheckDeleteField(var field:byte);
	begin
          DrawDeleteMenu;
     	if field>4 then field:=1;
          if field<1 then field:=4;
          textcolor(black);
          textbackground(grey);
          if field=1 then
          	begin
               	gotoxy(23,11);
		          writeln('  1: Delete everyone on the list        ');
               end;
          if field=2 then
          	begin
               	gotoxy(23,12);
                    writeln('  2: Delete a single person on the list ');
               end;
          if field=3 then
          	begin
               	gotoxy(23,13);
                    writeln('  3: Search for a person on the list    ');
               end;
          if field=4 then
               begin
               	gotoxy(23,18);
                    writeln('  Q: Quit to main menu                  ');
               end;
          textcolor(grey);
          textbackground(black);
     end;

procedure DeleteMenu(var list:tlist; var last:integer);
     var ch:char; d:boolean; x:integer; field:byte;
	begin
          DrawBox;
          textcolor(black);
          textbackground(black);
          gotoxy(1,1);
          textcolor(yellow);
          textbackground(blue);
          writeln('                               Weird Funky Stuff                               ');
          textbackground(black);
	     textcolor(dark_grey);
          drawdeletemenu;
          textcolor(white);
          field:=1;
     	repeat
               CheckDeleteField(field);
               gotoxy(1,24);
			ch:=readkey;
	          case ch of
                    chr(80): field:=field+1;
	               chr(72): field:=field-1;
                    chr(13): EnterDelete(field,ch);
               end;
               if ch='1' then Delete(list,last);
               if ch='2' then Search(list,last,d);
               if ch='3' then S(list,last);
			if (ch='1') or (ch='2') or (ch='3') then
				begin
					DrawMenu;
		               DrawBox;
                    end;
               CheckDeleteField(field);
          until (ch='q') or (ch='Q');


     end;


procedure EnterAlpha(var field:byte; var ch:char);
	begin
     	if field=1 then ch:='1';
          if field=2 then ch:='2';
          if field=3 then ch:='3';
          if field=4 then ch:='4';
          if field=5 then ch:='Q';
     end;

procedure CheckAlphaField(var field:byte);
  var x:integer;
	begin
          textcolor(white);
          textbackground(blue);
          for x:=10 to 18 do
          	begin
		          gotoxy(22,x);
		          writeln('บ                                        บ');
               end;
          gotoxy(23,10);
          textcolor(yellow);
          writeln('         Alphabetize Menu');
          gotoxy(23,11);
          writeln(' 1: Alphabetize by first name');
          gotoxy(23,12);
          writeln(' 2: Alphabetize by last name');
          gotoxy(23,13);
          writeln(' 3: Alphabetize by age');
          gotoxy(23,14);
          writeln(' 4: Choose where to place the names');
          gotoxy(23,18);
          writeln(' Q: Quit to main menu');
     	if field>5 then field:=1;
          if field<1 then field:=5;
          textcolor(black);
          textbackground(grey);
          if field=1 then
          	begin
               	gotoxy(23,11);
                    writeln(' 1: Alphabetize by first name           ');
               end;
          if field=2 then
          	begin
               	gotoxy(23,12);
                    writeln(' 2: Alphabetize by last name            ');
               end;
          if field=3 then
          	begin
               	gotoxy(23,13);
                    writeln(' 3: Alphabetize by age                 ');
               end;
          if field=4 then
          	begin
               	gotoxy(23,14);
                    writeln(' 4: Choose where to place the names     ');
               end;
          if field=5 then
          	begin
               	gotoxy(23,18);
                    writeln(' Q: Quit to main menu                   ');
               end;
     end;




procedure AlphabetizeMenu(var list:tlist; var last:integer);
	var x:integer; ch:char; field:byte;
     begin
          textcolor(white);
          textbackground(blue);
          gotoxy(22,09);
          writeln('ษอ[ ]ออออออออออออออออออออออออออออออออออออป');
          gotoxy(22,19);
          writeln('ศออออออออออออออออออออออออออออออออออออออออผ');
          for x:=10 to 18 do
          	begin
		          gotoxy(22,x);
		          writeln('บ                                        บ');
               end;
     	gotoxy(25,09);
          textcolor(light_green);
          writeln('þ');
          gotoxy(23,10);
          textcolor(yellow);
          writeln('         Alphabetize Menu');
          gotoxy(23,11);
          writeln(' 1: Alphabetize by first name');
          gotoxy(23,12);
          writeln(' 2: Alphabetize by last name');
          gotoxy(23,13);
          writeln(' 3: Alphabetize by age');
          gotoxy(23,14);
          writeln(' 4: Choose where to place the names');
          gotoxy(23,18);
          writeln(' Q: Quit to main menu');
          gotoxy(1,24);
          textcolor(white);
          field:=1;
          repeat
               CheckAlphaField(field);
			ch:=readkey;
	          ch:=upcase(ch);
	          	case ch of
	                    chr(80): field:=field+1;
	                    chr(72): field:=field-1;
                         chr(13): EnterAlpha(field,ch);
	     		end;
               if ch='1' then NotAvailable;
               if ch='2' then NotAvailable;
               if ch='3' then NotAvailable;
               if ch='4' then NotAvailable;
          until (ch='Q') or (ch=chr(27));
     end;

procedure EnterMainMenu(var field:byte; var ch:char);
	begin
     	if field=1 then ch:='1';
          if field=2 then ch:='2';
          if field=3 then ch:='3';
          if field=4 then ch:='4';
          if field=5 then ch:='5';
          if field=6 then ch:='6';
          if field=7 then ch:='7';
          if field=8 then ch:='8';
          if field=9 then ch:='Q';
     end;

procedure fieldcheck(var field:byte);
  var x:byte;
	begin
          DrawBox;
          x:=21;
          textcolor(black);
          textbackground(grey);
          if field>9 then field:=1;
          if field<1 then field:=9;
          if field=1 then
          	begin
               	gotoxy(x,9);
                    writeln(' 1: Display the list                    ');
               end;
          if field=2 then
          	begin
               	gotoxy(x,10);
                    writeln(' 2: Add a person to the list            ');
               end;
          if field=3 then
          	begin
               	gotoxy(x,11);
                    writeln(' 3: Save this list                      ');
               end;
          if field=4 then
          	begin
               	gotoxy(x,12);
                    writeln(' 4: Load a list                         ');
               end;
          if field=5 then
          	begin
               	gotoxy(x,13);
                    writeln(' 5: Delete Menu                         ');
               end;
          if field=6 then
          	begin
               	gotoxy(21,14);
                    writeln(' 6: Lookup a person on the list         ');
               end;
          if field=7 then
          	begin
               	gotoxy(21,15);
                    writeln(' 7: See the stats on the current list   ');
     		end;
          if field=8 then
          	begin
               	gotoxy(21,16);
                    writeln(' 8: Alphabetize menu                    ');
               end;
          if field=9 then
          	begin
               	gotoxy(21,17);
                    writeln(' Q: Quit this program                   ');
               end;

     end;


var
{  TutorApp: TTutorApp;}
  Last:integer;
  List:tlist;
  ch:char;
  x:integer;
  d:boolean;
  field:byte;
{72=up,75=right,77=left,80=down}
begin
     {TutorApp.init;   }
     clrscr;
     field:=1;
     last:=0;
     LoadList(list,last);
	d:=false;
     clrscr;
     gotoxy(1,1);
     textbackground(blue);
     writeln(' ');
     drawmenu;
     repeat
	    drawbox;
         FieldCheck(field);
         gotoxy(1,24);
	    ch:=readkey;
               case ch of
                   chr(72): field:=field-1;
                   chr(80): field:=field+1;
                   chr(13): EnterMainMenu(field,ch);
               end;
               textcolor(grey);
	          case ch of
		         '1': DisplayList(list,last);
	              '2': Add(list,last);
                   '3': Save1(list,last);
                   '4': Load(list,last);
                   '5': DeleteMenu(list,last);
                   '6': S(list,last);
			    '7': SeeStats(list,last);
                   '8': AlphabetizeMenu(list,last);
	              'Q': ch:=chr(esc);
	              'q': ch:=chr(esc);
		     end;
	          if (d=true) or (ch='1') then readkey;
	          case ch of
		         '1': drawmenu;
	              '2': drawmenu;
                   '3': drawmenu;
                   '4': drawmenu;
                   '5': drawmenu;
                   '6': drawmenu;
			    '7': drawmenu;
                   '8': drawmenu;
		     end;
         textcolor(white);
	until ch=chr(ESC);
     DrawBox;
     textbackground(blue);
     textcolor(white);
     gotoxy(9,10);
     writeln('ษอ[ ]อออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
     gotoxy(9,14);
     writeln('ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
	for x:=11 to 13 do
     	begin
          	gotoxy(9,x);
     		writeln('บ                                                             บ');
          end;
     gotoxy(12,10);
     textcolor(light_green);
     writeln('þ');
     textbackground(blue);
     textcolor(yellow);
	gotoxy(10,11);
     writeln('                  You''re about to quit!');
	gotoxy(10,12);
	writeln('           Would you like to save your list (Y/N)?');
     gotoxy(39,13);
     textbackground(black);
     writeln('   ');
     gotoXy(40,13);
     readln(ch);
     if (ch='Y') or (ch='y') then begin clrscr; save(list,last); end;
     clrscr;
end.