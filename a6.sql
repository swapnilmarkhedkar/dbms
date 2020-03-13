
CREATE TABLE O_EmpId(
	id int NOT NULL,
	name varchar2(10) NOT NULL,
	city varchar2(10)
);

CREATE TABLE N_EmpId(
	id int NOT NULL,
	name varchar2(10) NOT NULL,
	city varchar2(10)
);

INSERT INTO O_EmpId values(1, 'Sohail', 'Mumbai');
INSERT INTO O_EmpId values(3, 'Shruti', 'Pune');
INSERT INTO O_EmpId values(5, 'Swapnil', 'Thane');

INSERT INTO N_EmpId values(2, 'Soham', 'PCMC');
INSERT INTO N_EmpId values(3, 'Shruti', 'Pune');
INSERT INTO N_EmpId values(4, 'Prashant', 'Malad');

declare
	oldr int;
	oldn varchar2(10);
    oldl varchar2(10);

	newr int;
	newn varchar2(10);
    newl varchar2(10);
    
	cursor oldcur is select * from O_EmpId;
	cursor newcur(n int) is select * from N_EmpId where id=n;
    
begin
	open oldcur;
	loop
		fetch oldcur into newr,newn,newl;
		exit when oldcur%notfound;

		open newcur(newr);
		fetch newcur into oldr,oldn,oldl;

		if(newcur%notfound) then
			insert into N_EmpId values(newr,newn,oldl);
		end if;

		close newcur;
	end loop;
	close oldcur;
end;
/
