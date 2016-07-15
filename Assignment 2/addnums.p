program addnums (input, output);
   var m,n,sum : integer;

begin
   writeln('I will add two integers');
   write('Enter the first number, then press <return> :');
   read(m);
   readln;
   write('Now the second, <return> : ');
   read(n);
   readln;
   sum := m + n;
   writeln(m, ' + ', n, ' = ', sum)
end.
