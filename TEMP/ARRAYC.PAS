program StuffArray(input, output);

uses crt, app;

const MAX=20;
      ESC=chr(27);
      grey=7;
      ENTER=chr(13);
      TAB=chr(009);
      BACK=chr(8);
type
     TTutorApp=object(TApplication)
     end;
     Tperson=record
       First,Last:string;
       Age:integer;
     end;
     Tlist=Array[1..MAX] of Tperson;
     person=File of Tperson;

function AveAge(var list:tlist; var last:integer):integer;
	var x,y:integer;
        begin
          y:=0;
         for x:=1 to last do
          y:=y + list[x].age;
          writeln('The Average age is ',round(y/last));
         AveAge:=y;
        end;

function PerFull(var list:tlist; var last:integer):integer;
	var x:integer;
       begin
       x:=last;
       writeln('The list is ',round(x/max*100),'% full');
       PerFull:=x;
       end;

function Upstring(s:string):string;
 var c:integer;
   begin
        for c:=1 to length(s) do
             s[c]:=Upcase(s[c]);
        Upstring:=s;
   end;

function DoSearch(list:tlist; last:integer; target:string):integer;
  var row:integer;
	begin
		row:=1;
		while Upstring(list[row].last)<>Upstring(target) do
		row:=row+1;
          Dosearch:=row;
	end;

function Oldest(var list:Tlist;last:integer):integer;
	var old,p:integer;
	  begin
	   old:=list[1].age;
        for p:=2 to last do
        if list[p].age > old then
        old:=list[p].age;
        Oldest:=old;
       end;

function Youngest(var list:Tlist; last:integer):integer;
	var young,p:integer;
       begin
        young:=List[1].age;
        for p:=2 to last do
        if list[p].age < young then
        young:=list[p].age;
        Youngest:=young;
       end;

procedure MyReadlnName(var a:string; w:integer);
	var x,y,c:integer;
         ch:string;
       begin
         x:=wherex;
         y:=wherey;
         c:=1;
         ch:='';
         a:='';
         repeat
            gotoxy(x,y);
            write(' ':w);
            gotoxy(x,y);
            write(a);
            gotoxy(x+c-1,y);
            ch:=readkey;
            if (ch=BACK) and (c>1) then
              begin
                c:=c-1;
                a:=copy(a,1,length(a)-1);
              end
            else if (ch=BACK) and (c=1) then
              begin
               c:=c;
               end
            else if ch<>ENTER then
		    begin
                a:=a+ch;
                c:=c+1;
              end;
         until (c>w) or (ch=chr(13));
       end;

procedure MyReadln(var a:string; w:integer);
	var x,y,c:integer;
         ch:string;
       begin
         x:=wherex;
         y:=wherey;
         c:=1;
         ch:='';
         a:='';
         repeat
            gotoxy(x,y);
            write(' ':w);
            gotoxy(x,y);
            write(a);
            gotoxy(x+c-1,y);
            ch:=readkey;
            if (ch=BACK) and (c>1) then
              begin
                c:=c-1;
                a:=copy(a,1,length(a)-1);
              end
            else if (ch=BACK) and (c=1) then
              begin
               c:=c;
               end
            else if ch<>ENTER then
		    begin
                a:=a+ch;
                c:=c+1;
              end;
            if ch='.' then
            	begin
                c:=22;
                a:=copy(a,1,length(a)-1);
               end;
         until (c>w) or (ch=chr(13));
       end;

procedure RanOp(d:string);
	var z,l:integer;
     begin
          for l:=1 to length(d) do
              begin
                   repeat
           		    z:=random(14)+1;
           		    textcolor(z);
                   until z<>4;
                   write(d[l]);
              end;
     end;

procedure DrawBox;
	var x:integer;
         y:string;
     begin
           textbackground(red);
           x:=8;
           y:='                                             ';
           repeat
           	gotoxy(18,x);
               writeln(y);
               x:=x+1;
           until x=16;
	      textcolor(white);
           gotoxy(35,8);
           writeln('User Menu!');
           gotoxy(22,9);
           writeln('(A) Add names to the name list');
           gotoxy(22,10);
           writeln('(V) List Menu');
           gotoxy(22,11);
           writeln('(N) Enter in your name (Do First!)');
           gotoxy(22,12);
           writeln('(S) Save your name list');
           gotoxy(22,13);
           writeln('(L) Load up a name list');
		 gotoxy(22,14);
           writeln('(C) Clear out the list');
           gotoxy(22,15);
           writeln('(Q) Quit');
           gotoxy(18,16);
           write(' Pick an option (E,A,V,N,S,L,C,Q):           ');
           textcolor(white);
           gotoxy(53,16);
     end;

procedure DrawMenu;
   var l,x,z:integer;
       d,y,a:string;
  	begin
           textbackground(black);
           textcolor(black);
           for x:=1 to 2 do
            begin
              writeln(x);
	 	    clrscr;
            end;
           textbackground(red);
           writeln('                                                                               ');
	      gotoxy(22,1);
           RanOp(' Options Menu for Nick''s Menu ');
           textcolor(8);
           textbackground(0);
	      a:='±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±';
           x:=2;
           gotoxy(1,2);
           repeat
             writeln(a);
             delay(20);
             x:=x+1;
           until (x=25);
	      gotoxy(1,24);
	      textcolor(white);
	      textbackground(red);
	      writeln('                                 Arrays Program                                ');	      textcolor(white);
            begin
              textcolor(black);
              textbackground(black);
              a:='  ';
              x:=9;
              repeat
                gotoxy(63,x);
                writeln(a);
                x:=x+1;
              until (x=18);
              a:=' ';
              x:=20;
              repeat
                gotoxy(x,17);
                writeln(a);
                x:=x+1;
              until (x=63);
            end;
           DrawBox;
     end;

procedure AnyKey(name:string);
  var x,y,c:integer;
  	 s:string;
    begin
      repeat
          textcolor(random (14)+1);
          textbackground(black);
          s:='Press ANY KEY to Continue ' + name;
          for x:=1 to length(s) do
           begin
              y:=23;
              gotoxy(y+x,22);
              write(s[x]);
              delay(50);
              c:=y+x;
           end;
		for x:=length(s) downto 1 do
           begin
            gotoxy(23+x,22);
            write(' ');
            delay(50);
           end;
	 until keypressed;
      readkey;
    end;

procedure AnyKeyMenu(name:string);
  var x,y,c:integer;
  	 s:string;
    begin
      repeat
          textcolor(random (14)+1);
          textbackground(black);
          s:='Press ANY KEY to Continue ' + name;
          for x:=1 to length(s) do
           begin
              y:=23;
              gotoxy(y+x,22);
              write(s[x]);
              delay(50);
              c:=y+x;
           end;
		for x:=length(s) downto 1 do
           begin
            textcolor(8);
            textbackground(0);
            gotoxy(23+x,22);
            write('±');
            delay(50);
           end;
	 until keypressed;
      readkey;
    end;

procedure NameOfUser(var name:string);
  var x:integer;
     begin
       for x := 18 to 62 do
        begin
         gotoxy(x,8);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
         textcolor(white);
         gotoxy(38,8);
         writeln('Name');
       for x := 62 downto 18 do
        begin
         gotoxy(x,9);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
       for x := 18 to 62 do
        begin
         gotoxy(x,10);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
       for x := 62 downto 18 do
        begin
         gotoxy(x,11);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
       for x := 18 to 62 do
        begin
         gotoxy(x,12);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
       for x := 62 downto 18 do
        begin
         gotoxy(x,13);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
       for x := 18 to 62 do
        begin
         gotoxy(x,14);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
         gotoxy(20,12);
         writeln('What is your name?');
         gotoxy(40,12);
         textbackground(black);
         writeln('                      ');
         gotoxy(40,12);
       for x := 62 downto 18 do
        begin
         gotoxy(x,15);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
       for x := 18 to 62 do
        begin
         gotoxy(x,16);
         textbackground(blue);
         textcolor(white);
         writeln(' ');
         delay(10);
        end;
         textcolor(white);
         textbackground(black);
         gotoxy(40,12);
         MyReadlnName(name,22);
     end;

procedure WritePerson(var p:tperson; x:integer; name:string);
	begin
          gotoxy(1,x);
          writeln(p.last);
          gotoxy(34,x);
          writeln(p.first);
          gotoxy(69,x);
          writeln(p.age);
     end;

procedure DisplayList(var List:Tlist; var last:integer; name:string);
    var x:integer;
    	 begin
       textbackground(black);
       textcolor(white);
       clrscr;
       textbackground(red);
       textcolor(white);
       writeln('Last Name                        First Name                         Age         ');
       textcolor(white);
       textbackground(black);
       if (last=0) then
       begin
        gotoxy(30,15);
        textcolor(white+blink);
        textbackground(black);
        writeln('The list is EMPTY!!!');
       end;
       for x:=1 to last do
       	begin
           Writeperson(List[x],x+1,name);
          end;
       AnyKey(name);
       DrawMenu;
      end;

procedure DisplayLists(var List:Tlist; var last:integer; name:string);
    var x:integer;
    	 begin
       textbackground(black);
       textcolor(white);
       clrscr;
       textbackground(red);
       textcolor(white);
       writeln('Last Name                        First Name                         Age         ');
       textcolor(white);
       textbackground(black);
       if (last=0) then
       begin
        gotoxy(30,15);
        textcolor(white+blink);
        textbackground(black);
        writeln('The list is EMPTY!!!');
       end;
       for x:=1 to last do
       	begin
           Writeperson(List[x],x+1,name);
          end;
      end;


procedure ReadPerson(var p:Tperson);
  	begin
      textbackground(black);
      textcolor(random (14)+1);
      clrscr;
      writeln('Enter Your First Name Please:');
      readln(p.First);
      writeln('Enter Your Last Name:');
      readln(p.Last);
      writeln('Enter Your Age:');
      {$I-}
      readln(p.age);
      {$I+}
     end;

procedure DoAdd(var List:Tlist; var last:integer; name:string);
  var x:integer;
      y:string;
     begin
       textbackground(black);
       if last>=max then
       begin
        clrscr;
        textbackground(black);
        gotoxy(22,13);
        writeln('There are too many people on the list!');
        AnyKey(name);
       end
	  else
          begin
	  	  last:=last + 1;
       	  ReadPerson(List[last]);
          end;
     end;

procedure Load(var list:tList; var last:integer; name:string);
var
  f:person;
  v,y,x,p:integer;
  a,clear:string;
begin
     textcolor(white);
     textbackground(blue);
     clear:='         ';
     y:=17;
     for x:=length(clear) downto 1 do
     	begin
     		gotoxy(18,y-x);
	          writeln(' ');
	          delay(30);
	     end;
	y:=18;
     clear:='                 Load File                  ';
     for x:=1 to length(clear) do
     	begin
	  	     gotoxy(x+y,8);
               write(clear[x]);
               delay(30);
      	end;
     clear:='        ';
     y:=8;
     for x:=1 to length(clear) do
          begin
               gotoxy(62,x+y);
               writeln(clear[x]);
               delay(30);
          end;
     clear:='                                            ';
     y:=62;
     for x:=length(clear) downto 1 do
     	begin
               gotoxy(y-x,16);
               writeln(' ');
               delay(30);
          end;
	textbackground(red);
     gotoxy(19,9);
     writeln('                                           ');
     delay(50);
     gotoxy(19,10);
     writeln('      Load File:                           ');
     delay(50);
     gotoxy(19,11);
     writeln('        Default Load is A:\PEOPLE.LST      ');
     gotoxy(19,12);
     writeln('                Status Bar                ');
     gotoxy(19,13);
     writeln('                                          ');
     gotoxy(19,14);
     writeln('                                          ');
     gotoxy(19,15);
     writeln('                                          ');
     gotoxy(20,13);
     textcolor(0);
     writeln('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
     gotoxy(36,10);
     textbackground(black);
     textcolor(white);
     writeln('                 ');
     gotoxy(36,10);
     MyReadln(a,18);
     if a='' then
     	a:='A:\PEOPLE';
     assign(f, a+'.LST');
    	textbackground(15);
    	textcolor(15);
     {$I-}
	reset(f);
     {$I+}
	if IOresult=0 then
     	begin
               for x:=20 to 30 do
		          begin
     		          textbackground(random (14)+1);
     		          gotoxy(x,13);
			          writeln(' ');
     		          delay(50);
       	          end;
               textbackground(red);
               p:=0;
               textbackground(white);
               for x:=30 to 40 do
      	          begin
                         textbackground(random (14)+1);
          	          gotoxy(x,13);
                         writeln(' ');
                         delay(50);
                    end;
               while not EOF(F) do
 	               begin
	         	          p:=p+1;
		    	          read(F, list[p]);
	               end;
               last:=p;
               close(F);
               for x:=40 to 50 do
                    begin
                         textbackground(random (14)+1);
                         gotoxy(x,13);
          	          textcolor(white);
                         writeln(' ');
                         delay(50);
                    end;
               for x:=50 to 60 do
     	          begin
                         textbackground(random (14)+1);
                         gotoxy(x,13);
          	          textcolor(white);
                         writeln(' ');
                         delay(50);
                    end;
               gotoxy(34,14);
               textcolor(15+blink);
               for x:=10000 to 10010 do
     	          begin
      		          sound(x);
      		          delay(30);
      		          nosound;
     	          end;
               textbackground(red);
               writeln('File Loaded');
	          AnyKeyMenu(name);
		end
     else
     	begin
               x:=9;
               textbackground(red);
               repeat
                    clear:='                                           ';
               	gotoxy(19,x);
               	writeln(clear);
               	x:=x+1;
               until x=16;
               gotoxy(30,12);
               writeln('Error ',IOresult,': File not found');
          	readkey;
          end;
end;

procedure Save(list:tList; last:integer; name:string);
    var
       f: person;
       x,p,y:integer;
       a,v,clear:string;
       key:char;
             begin
                  textcolor(white);
                  textbackground(red);
                  clear:='         ';
                  y:=17;
                for x:=length(clear) downto 1 do
                   begin
     	             gotoxy(18,y-x);
                       writeln(' ');
                       delay(30);
                   end;
                  y:=18;
                  clear:='                 Save File                  ';
                  for x:=1 to length(clear) do
                   begin
                    gotoxy(x+y,8);
                    write(clear[x]);
                    delay(30);
                   end;
                  clear:='        ';
                  y:=8;
                  for x:=1 to length(clear) do
                   begin
                    gotoxy(62,x+y);
                    writeln(clear[x]);
                    delay(30);
                   end;
                   clear:='                                            ';
                   y:=62;
                   for x:=length(clear) downto 1 do
                    begin
                     gotoxy(y-x,16);
                     writeln(' ');
                     delay(30);
                    end;
                    x:=9;
                    repeat
                      textbackground(blue);
	                 v:='                                           ';
                      gotoxy(19,x);
                      x:=x+1;
                      writeln(v);
                    until x=16;
                    gotoxy(19,10);
                    writeln('      Save File:                           ');
                    gotoxy(19,11);
                    writeln('        Default Save is A:\PEOPLE.LST      ');
                    gotoxy(20,13);
                    textcolor(0);
                    writeln('ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ');
                    textbackground(0);
                    textcolor(15);
                    gotoxy(36,10);
                    writeln('                 ');
                    gotoxy(36,10);
                    MyReadln(a,18);
                    if a='' then
                    	a:='A:\PEOPLE';
                    Assign(f, a+'.LST');
	               rewrite(F);
	               for x:=20 to 30 do
                      begin
                       textbackground(random (14)+1);
                       gotoxy(x,13);
                       writeln(' ');
                       delay(50);
                      end;
                    for x:=30 to 40 do
                      begin
			         textbackground(random (14)+1);
          	         gotoxy(x,13);
                        writeln(' ');
                        delay(50);
                      end;
                    for p:=1 to last do
	                 write(F, list[p]);
                    close(F);
                    for x:=40 to 50 do
                      begin
			         textbackground(random (14)+1);
          	         gotoxy(x,13);
                        writeln(' ');
                        delay(50);
                      end;
                   for x:=50 to 60 do
                      begin
			         textbackground(random (14)+1);
          	         gotoxy(x,13);
                        writeln(' ');
                        delay(50);
                      end;
                   gotoxy(36,14);
                   textcolor(15+blink);
                   for x:=10000 to 10010 do
     	              begin
      		              sound(x);
      		              delay(30);
      		              nosound;
     	              end;
                   textbackground(blue);
                   writeln('File Saved');
                   AnyKeyMenu(name);
             end;

procedure ClearOut(var List:Tlist; var last:integer);
  var x,y:integer;
     xv,xr:string;
     key:char;
     begin
      DrawBox;
      textbackground(red);
      textcolor(white);
      xr:='                                           ';
      for x:=1 to length(xr) do
       begin
        gotoxy(18+x,8);
        writeln(xr[x]);
        delay(10);
        gotoxy(18+x,10);
        writeln(xr[x]);
        delay(10);
        gotoxy(18+x,12);
        writeln(xr[x]);
        delay(10);
	   gotoxy(18+x,14);
        writeln(xr[x]);
        delay(10);
        gotoxy(18+x,15);
        writeln(xr[x]);
        delay(10);
       end;
      for x:=1 to length(xr) do
       begin
         gotoxy(18+x,9);
         writeln(xr[x]);
         delay(10);
         gotoxy(18+x,13);
         writeln(xr[x]);
         delay(10);
         gotoxy(18+x,11);
         writeln(xr[x]);
         delay(10);
	    gotoxy(18+x,16);
         writeln(xr[x]);
         delay(10);
       end;
        xv:='(y/N)';
        xr:='Are you sure you want to clear your list?';
       for x:=1 to length(xr) do
       for y:=1 to length(xv) do
        begin
         gotoxy(18+x,10);
         writeln(xr[x]);
         gotoxy(18+y,12);
         writeln(xv[y]);
         delay(5);
        end;
        gotoxy(24,12);
        write(' ');
        key:=readkey;
    	 if (key='Y') or (key='Yes') or (key='YES') or (key='yes') or (key='y') then
        begin
	    last:=0;
         sound(3000);
         delay(25);
         nosound;
        end;
      if (key='N') or (key='n') or (key='no') or (key='NO') or (key=ENTER) then
        begin
         sound(3000);
         delay(25);
         nosound;
        end;
     end;

procedure Deleteperson(var List:tList; var Last:integer; todelete:integer);
var p:integer;
begin
	Last:=last-1;
     for p:=todelete to last do
         list[p]:=list[p+1];
end;

procedure NoStuff2;
   var x:integer;
       v:string;
	begin
      x:=9;
	 sound(3000);
      delay(25);
      nosound;
      textbackground(red);
      v:='                  Search!                  ';
      gotoxy(19,8);
      writeln(v);
      repeat
        textbackground(blue);
	   v:='                                           ';
        gotoxy(19,x);
        x:=x+1;
        writeln(v);
      until x=16;
      textcolor(white+blink);
      gotoxy(30,12);
      writeln('The List is EMPTY!!!');
      readkey;
      textcolor(white);
     end;

procedure NoStuff1;
   var x:integer;
       v:string;
	begin
      x:=9;
	 sound(3000);
      delay(25);
      nosound;
      textbackground(red);
      v:='                 Delete!                   ';
      gotoxy(19,8);
      writeln(v);
      repeat
        textbackground(blue);
	   v:='                                           ';
        gotoxy(19,x);
        x:=x+1;
        writeln(v);
      until x=16;
      textcolor(white+blink);
      gotoxy(30,12);
      writeln('The List is EMPTY!!!');
      readkey;
      textcolor(white);
     end;

procedure NoStuff;
   var x:integer;
       v:string;
	begin
      x:=9;
	 sound(3000);
      delay(25);
      nosound;
      textbackground(red);
      v:='                  Stats!                   ';
      gotoxy(19,8);
      writeln(v);
      repeat
        textbackground(blue);
	   v:='                                           ';
        gotoxy(19,x);
        x:=x+1;
        writeln(v);
      until x=16;
      textcolor(white+blink);
      gotoxy(30,12);
      writeln('The List is EMPTY!!!');
      readkey;
      textcolor(white);
     end;

procedure SearchPerson(var list:tList;var last:integer; var d:boolean; name:string);
var
    target,ans,answer:string;
    p:integer;
    found:boolean;
    aperson:person;
    x:integer;
begin
     if last=0 then
          begin
               Nostuff2;
          end
     else
	repeat
           textbackground(0);
   	      clrscr;
           d:=false;
		 found:=false;
  		 writeln('Type the name of the person you want to find');
  		 readln(target);
           for p:= 1 to last do
           begin
             if (Upstring(target)=Upstring(list[p].First)) or
		      (Upstring(target)=Upstring(list[p].Last)) then
              begin
                 clrscr;
                 found:=true;
                 DisplayLists(list,last,name);
                 textbackground(green);
			  writeperson(list[p],p+1,name);
                 gotoxy(1,23);
                 textbackground(black);
               end;
           end;
         if found=false then
           writeln ('Sorry, ' , target , ' was not found');
           writeln('Do you want to search again?');
           writeln;
           ans:=readkey;
      until (ans='N') or (ans='n');
      if (ans='N') or (ans='n') then Drawmenu;
      d:=true;
end;

procedure Search(var list:tList;var last:integer; var d:boolean; name:string);
var
    target,ans,answer:string;
    p:integer;
    found:boolean;
    aperson:person;
    x:integer;

begin
     if last=0 then
          begin
               Nostuff1;
          end
     else
	repeat
           textbackground(0);
   	      clrscr;
           d:=false;
		 found:=false;
  		 writeln('Type the name of the person you want to delete');
  		 readln(target);
           for p:= 1 to last do
           begin
             if (Upstring(target)=Upstring(list[p].First)) or
		      (Upstring(target)=Upstring(list[p].Last)) then
               begin
                 clrscr;
                 found:=true;
                 DisplayLists(list,last,name);
                 textbackground(green);
			  writeperson(list[p],p+1,name);
                 gotoxy(1,24);
                 textbackground(black);
                 write('Do you want to delete this person (Y/N)?');
                 answer:=readkey;
                 if (answer='y') or (answer='Y') then
                   Deleteperson(list,last,p)
                 else
                    textbackground(black);
                 	clrscr;
                 clrscr;
               end;
           end;
         if found=false then
           writeln ('Sorry, ' , target , ' was not found');
           writeln('Do you want to delete another user?');
           writeln;
           ans:=readkey;
      until (ans='N') or (ans='n');
      if (ans='N') or (ans='n') then Drawmenu;
      d:=true;
end;

procedure Stats(var last:integer; list:Tlist);
	var v:string;
         x:integer;
	  begin
        if last > 0 then
	   begin
           x:=9;
           sound(3000);
           delay(25);
           nosound;
           textbackground(red);
           v:='                  Stats!                   ';
           gotoxy(19,8);
           writeln(v);
           repeat
             textbackground(blue);
	        v:='                                           ';
             gotoxy(19,x);
             x:=x+1;
             writeln(v);
           until x=16;
           gotoxy(20,9);
           writeln('There are ',last,' people on the list');
           gotoxy(20,10);
           PerFull(list,last);
           gotoxy(20,11);
           writeln('* * * * *');
           gotoxy(20,12);
           writeln('The oldest age is ',Oldest(list,last));
           gotoxy(20,13);
           writeln('The youngest age is ',Youngest(list,last));
           gotoxy(20,14);
           AveAge(list,last);
           readkey;
        end
        else
         NoStuff;
       end;

procedure ListMenu(list:tlist; last:integer; name:string; d:boolean);
	var x:integer;
         a,b,c,v,z:string;
         ch:char;
       begin
        textcolor(white);
        repeat
           x:=9;
           sound(3000);
           delay(25);
           nosound;
           v:='                List Menu!                 ';
           textbackground(red);
           gotoxy(19,8);
	      writeln(v);
           gotoxy(18,16);
           v:='                                             ';
           writeln(v);
           repeat
             v:='                                           ';
             textbackground(blue);
	        gotoxy(19,x);
             x:=x+1;
             writeln(v);
           until x=16;
           gotoxy(20,10);
           v:='(V) View the list';
           a:='(S) Statistics';
           b:='(Q) Quit back to Main';
           c:='(D) Delete a name';
           z:='(L) Search for a name';
           writeln(v);
           gotoxy(20,12);
           writeln(a);
           gotoxy(20,14);
           writeln(c);
           gotoxy(40,10);
           writeln(z);
           gotoxy(40,12);
           writeln(b);
           ch:=readkey;
           case ch of
            'V','v': DisplayList(list,last,name);
            'S','s': Stats(last,list);
            'D','d': Search(list,last,d,name);
            'L','l': SearchPerson(list,last,d,name);
           end;
        until (ch='Q') or (ch='q');
       end;

procedure MainMenuKey(var field:byte; var ch:char);
	begin
     	if field=1 then ch:='A';
          if field=2 then ch:='V';
		if field=3 then ch:='N';
		if field=4 then ch:='S';
		if field=5 then ch:='L';
		if field=6 then ch:='C';
		if field=7 then ch:='Q';
     end;

procedure CheckField(var field:byte);
	begin
          textcolor(black);
          textbackground(grey);
     	if field>7 then field:=1;
          if field<1 then field:=7;
          if field=1 then
			begin
               	gotoxy(22,9);
                    writeln('(A) Add names to the name list');
               end;
          if field=2 then
			begin
               	gotoxy(22,10);
                    writeln('(V) List Menu');
               end;
		if field=3 then
			begin
               	gotoxy(22,11);
                    writeln('(N) Enter in your name (Do First!)');
               end;
		if field=4 then
			begin
               	gotoxy(22,12);
                    writeln('(S) Save your name list');
               end;
		if field=5 then
			begin
               	gotoxy(22,13);
                    writeln('(L) Load up a name list');
               end;
		if field=6 then
			begin
               	gotoxy(22,14);
                    writeln('(C) Clear out the list');
               end;
		if field=7 then
			begin
               	gotoxy(22,15);
                    writeln('(Q) Quit');
               end;
     end;

var List: Tlist;
    last: integer;
    ch: char;
    p,p1,p2: Tperson;
    d,QUIT:boolean;
    name:string;
    TutorApp: TTutorApp;
    field:byte;

begin
 TutorApp.init;
 clrscr;
 Randomize;
 last:=0;
 QUIT:=false;
 DrawMenu;
 field:=1;
 repeat
    DrawBox;
    CheckField(field);
    ch:=readkey;
    ch:=Upcase(ch);
    case ch of
     chr(80): field:=field+1;
     chr(72): field:=field-1;
     chr(13): MainMenuKey(field,ch);
    end;
    case ch of
     'E': ReadPerson(p1);
     'A': DoAdd(list,last,name);
     'V': ListMenu(List,last,name,d);
     'N': NameOfUser(name);
     'S': Save(list,last,name);
     'L': Load(list,last,name);
     'C': ClearOut(list,last);
    end;
   case ch of
    'E': DrawMenu;
    'A': DrawMenu;
    'V': DrawMenu;
    'N': DrawMenu;
    'S': DrawMenu;
    'L': DrawMenu;
    'C': DrawMenu;
   end;
   if (ch='Q') or (ch='q') then QUIT:=true;
 until QUIT;
end.




