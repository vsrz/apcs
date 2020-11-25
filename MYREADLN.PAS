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



