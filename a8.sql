create table Student(
	rollno number(5),
	name varchar(7),
	dateOfAdmission date,
	branch varchar(7),
	percent number(3)
)

create table Alumni(
	name varchar(7),
	dateOfAdmission date,
	branch varchar(7),
	percent number(3)
)

insert into Student values (102, 'Akhil', '1991-01-02', 'Comp', 99)

create trigger t1  after update on Student  for each row 
begin 
	insert into Alumni values(:OLD.name,:OLD.dateOfAdmission,:OLD.branch,:OLD.percent);
end;
/
create trigger t2  after delete on Student  for each row 
begin 
	insert into Alumni values(:OLD.name,:OLD.dateOfAdmission,:OLD.branch,:OLD.percent);
end;
/

















create trigger t3 after update on Alumni for each row
begin 
	insert into Student(:OLD.name,:OLD.dateOfAdmission,:OLD.branch,:OLD.percent);
end;
/