program fracs (input, output);
   var n0, d0, n1, d1 : integer;
   var op, f : char;

   function digit() : integer;
      var x :  integer;
   begin
      repeat
	 readln(x);
	 if (x < 0) or (x >= 10) then
	    write('Invalid input. Number should be a single digit [0-9], ',
		    'without a sign, please try again: ');
      until (x >= 0) and (x < 10);
      digit := x
   end;

   function symbol() : char;
      var c : char;
   begin
      repeat
	 readln(c);
	 if (c <> '+') and (c <> '-') and (c <> '*') and (c <> '/') then
	    write('Invalid input. Symbol should be [+|-|*|/], ',
		  'please try again: ');
      until (c = '+') or (c = '-') or (c = '*') or (c = '/');
      symbol := c
   end;

   function gcd(a, b : integer) : integer;
   begin
      while (a > 0) and (b > 0) do
	 if (a > b) then a := a mod b
	 else b := b mod a;
      gcd := a + b;
   end;

   procedure add(x0, y0, x1, y1 : integer);
      var x2, y2, d : integer;
   begin
      x2 := x0 * y1 + x1 * y0;
      y2 := y0 * y1;
      d := gcd(x2, y2);
      x2 := x2 div d;
      y2 := y2 div d;
      writeln(x0:2, '   ', x1:2,  '   ', x2:2, '     ', (x2 mod y2):2);
      writeln('--',' + ', '--', ' = ', '--', ' = ',  x2 div y2, ' ', '--');
      writeln(y0:2, '   ', y1:2,  '   ', y2:2, '     ', y2:2);
   end;

   procedure subtract(x0, y0, x1, y1:  integer);
      var x2, y2, d : integer;
      var neg : boolean;
   begin
      x2 := x0 * y1 - x1 * y0;
      y2 := y0 * y1;
      if (x2 < 0) then
	 begin
	    x2 := -x2;
	    neg := true
	 end;
      d := gcd(x2, y2);
      x2 := x2 div d;
      y2 := y2 div d;

      if (not neg) then
         begin
	    writeln(x0:2, '   ', x1:2, '   ', x2:2, '     ', (x2 mod y2):2);
            writeln('--', ' - ', '--', ' = ', '--', ' = ', x2 div y2, ' ', '--');
	    writeln(y0:2, '   ', y1:2, '   ', y2:2, '     ', y2:2);
	  end
      else
	 begin
	    writeln(x0:2, '   ', x1:2,  '    ', x2:2, '      ', (x2 mod y2):2);
	    writeln('--',' - ', '--', ' = ', '-', '--', ' = ',  '-', x2 div y2, ' ', '--');
	    writeln(y0:2, '   ', y1:2,  '    ', y2:2, '      ', y2:2);
	 end;
   end;

   procedure multiply(x0, y0, x1, y1 : integer);
      var x2, y2, d : integer;
   begin
      x2 := x0 * x1;
      y2 := y0 * y1;
      d := gcd(x2, y2);
      x2 := x2 div d;
      y2 := y2 div d;
      writeln(x0:2, '   ', x1:2,  '   ', x2:2, '     ', (x2 mod y2):2);
      writeln('--',' * ', '--', ' = ', '--', ' = ',  x2 div y2, ' ', '--');
      writeln(y0:2, '   ', y1:2,  '   ', y2:2, '     ', y2:2);

   end;

   procedure divide(x0, y0, x1, y1 : integer);
      var x2, y2, d : integer;
   begin
      if (x1 = 0) then
	 writeln('Division by zero (0) is not allowed.')
      else
	 begin
            x2 := x0 * y1;
	    y2 := x1 * y0;
	    d := gcd(x2, y2);
	    x2 := x2 div d;
	    y2 := y2 div d;
	    writeln(x0:2, '   ', x1:2,  '   ', x2:2, '     ', (x2 mod y2):2);
	    writeln('--',' / ', '--', ' = ', '--', ' = ',  x2 div y2, ' ', '--');
	    writeln(y0:2, '   ', y1:2,  '   ', y2:2, '     ', y2:2);
	 end
   end;

begin
   writeln('Welcome to fractions program!');
   writeln('-----------------------------');
   repeat
      write('Enter the nominator of the first fraction: ');
      n0 := digit();
      write('Enter the denominator of the first fraction: ');
      repeat
        d0 := digit();
        if (d0 = 0) then
	   write('Invalid input. Denominator cannot be zero (0), ',
		 'please try again: ');
      until (d0 <> 0);
      write('Enter the nominator of the second fraction: ');
      n1 := digit();
      write('Enter the denominator of the second fraction: ');
      repeat
         d1 := digit();
         if (d1 = 0) then
	    write('Invalid input. Denominator cannot be zero (0), ',
		  'please try again: ');
      until (d1 <> 0);
      write('Enter the symbol of the arithmetic operation: ');
      op := symbol();
      case op of
	'+' : add(n0, d0, n1, d1);
	'-' : subtract(n0, d0, n1, d1);
	'*' : multiply(n0, d0, n1, d1);
	'/' : divide(n0, d0, n1, d1);
      end;
      write('Do you wish to continue? [y/n]: ');
      readln(f);
   until (f = 'n');   
end.
