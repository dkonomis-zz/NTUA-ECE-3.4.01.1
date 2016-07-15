program Hello9(input, output);
   var i, n : integer;

   procedure hello;
   begin
      writeln('Hello, world')
   end;

begin
   writeln('Give number of greetings',
	   ' then press <enter>:');
   readln(n);
   for i := 1 to n do hello
end.
