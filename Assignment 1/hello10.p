program Hello10(input, output);
   var i, n : integer;

   procedure hello;
   begin
      writeln('Hello, world')
   end;

begin
   writeln('Give number of greetings',
	   ' then press <enter>:');
   readln(n);
   if n < 0 then writeln('# is negative')
   else for i := 1 to n do hello;
end.
