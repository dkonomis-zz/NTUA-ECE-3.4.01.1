program addfracs (input, output);

   var n0, d0, n1, d1, n2, d2 : integer;

begin
   writeln('Fractions add');
   writeln('-------------');
   write('Enter the nominator of the first fraction : ');
   read(n0);
   readln;
   repeat
      write('Enter the denominator of the first fraction : ');
      read(d0);
      readln;
      if d0 = 0 then
	 writeln('Denominator cannot be zero, please try again!');
   until (d0 <> 0);
   write('Enter the nominator of the second fraction : ');
   read(n1);
   readln;
   repeat
      write('Enter the denominator of the second fraction : ');
      read(d1);
      readln;
      if d1 = 0 then
	 writeln('Denominator cannot be zero, please try again!');
   until (d1 <> 0);

   n2 := n0 * d1 + n1 * d0;
   d2 := d0 * d1;
   writeln('Sum : ', n2, '/', d2);
end.
