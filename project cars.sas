/*Find the make and mode of the most expensive European car that has a price tag of greater than $150,000*/

data carsasia; 
length make $10 model $ 50;
infile "C:\Users\sachi\Downloads\carsasiapipedelimited.txt" delimiter="|";
input make $ model $ type $ origin $ msrp;
format msrp dollar8.;
run;

proc import datafile="C:\Users\sachi\Downloads\carseu.xlsx" out =carseu replace dbms=xlsx;
format msrp dollar8.;
run;

data expcar;
set carseu;
where msrp > 150000;
run;

proc print data=expcar;
run;
