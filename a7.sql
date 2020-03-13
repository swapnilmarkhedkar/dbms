
create or replace procedure greetings
as
begin
	dbms_output.put_line('HEllo');
end;
/

declare
	custid number;
	scheme varchar(5);
	
begin
	custid:=101;
	scheme:='abc';
	dbms_output.put_line('Cust ID : '||custid);
	
	
end;
/

create or replace procedure proc_grade(purchase IN number) is
begin
	if (purchase>=10000 and purchase<20000) then
		dbms_output.put_line('You belong to Platinum Category');
	elsif (purchase>=5000 and purchase<10000) then
		dbms_output.put_line('You belong to Gold Category');
	elsif (purchase>=2000 and purchase<5000) then
		dbms_output.put_line('You belong to Silver Category');
	end if;
end;
/

declare
	purchase number;
procedure proc_grade(purchase IN number) is
begin
	if purchase>=10000 and purchase<20000 then
		dbms_output.put_line('You belong to Platinum Category');
	elsif purchase>=5000 and purchase<10000 then
		dbms_output.put_line('You belong to Gold Category');
	elsif purchase>=2000 and purchase<5000 then
		dbms_output.put_line('You belong to Silver Category');
	end if;
end;


----Start------

create table Customer (
	custid number(3) primary key,
	name varchar(7),
	purchase number(6)
);
create table Category(
	custid number(3) not null,
	class varchar(7),
	foreign key(custid) references Customer(custid)
);

insert into Customer values (101, 'Pritam', 15000);
insert into Customer values (102, 'Akhil', 14000);
insert into Category values (101, 'None');

create or replace procedure proc_grade(purchase IN number, myClass OUT varchar) is
begin
	if (purchase>=10000 and purchase<20000) then
		myClass := 'Plati';
	elsif (purchase>=5000 and purchase<10000) then
		myClass := 'Gold';
	elsif (purchase>=2000 and purchase<5000) then
		myClass := 'Silver';
	end if;
end;
/


declare
	i number(2);
	myClass varchar(7);
	currCustId number(3);
	currPurchase number(5);
begin
    currPurchase:=0;
	for i in 101 .. 103 loop
        begin
            select purchase into currPurchase from Customer where custid=i;
            proc_grade(currPurchase,myClass);
		    dbms_output.put_line('Category : '|| myClass);
            insert into Category values(i, myClass);
            
        exception when no_data_found then
            dbms_output.put_line('No Data');
        end;
        dbms_output.put_line('ID : '||i);
    end loop;
    
    
end;
/