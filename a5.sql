create table Customer2(
	custid number(7) primary key,
	name varchar(7),
	dop date,
	scheme varchar(7),
	status varchar(7)
)

create table Fine(
	custid number(7),
	ldate date,
	amt number(7)
)

insert into Customer2(101, 'Chad', '11-01-2019', 'abc', 'not')

declare 
	cust number(7);
	schemeName varchar(7);
	myDop date;
	days number(4);
	fine number(4);
begin
	-- take input
	dbms_output.put_line('Enter Customer ID');
	cust:=101;
	dbms_output.put_line('Enter Scheme Name');
	schemeName:='abc';

	--select dop into myDop from Customer2 where custid=cust and scheme=schemeName;
    myDop:='11-01-2019';
	days:= SYSDATE - myDop;

	fine:=0;

	if (days<30 and days>=15) then 
		fine:=days*5;
	elsif (days>30) then
		fine:=days*50;	
	end if;

	dbms_output.put_line('Fine is' || fine);
	insert into Fine values(cust, SYSDATE, fine);

end;
/


declare 
	cust number(7);
	schemeName varchar(7);
	myDop date;
	days number(4);
	fine number(4);
    scheme varchar(7);
    custid number(7);
    dop date;
begin
	-- take input
	dbms_output.put_line('Enter Customer ID');
	cust:=101;
	dbms_output.put_line('Enter Scheme Name');
	schemeName:='abc';

    begin
	    select dop into myDop from Customer2 where custid=cust;
    exception when no_data_found then 
        dbms_output.put_line('No Data');
    end;
    --SELECT dop INTO myDop from Customer2 where custid=custid AND NameOfScheme=nameScheme;
    --myDop:='11-01-2019';
	days:= SYSDATE - myDop;

	fine:=0;

	if (days<30 and days>=15) then 
		fine:=days*5;
	elsif (days>30) then
		fine:=days*50;	
	end if;

	dbms_output.put_line('Fine is ' || fine);
	insert into Fine values(cust, SYSDATE, fine);

end;
/