create table  Departments(
	dept_id int(4) NOT NULL primary key auto_increment key,
	dept_name varchar(7) 
)

create table Professors(
	prof_id int(4) primary key not null,
	prof_name varchar(7),
	dept_id int(4) not null  ,
	designation varchar(7),
	salary int(5),
	doj date,
	email varchar(7),
	phone int,
	city varchar(7),
	foreign key (dept_id) references Departments(dept_id) on delete cascade
)

create table works(
	prof_id int(4),
	dept_id int(4),
	duration int(4),
	foreign key (prof_id) references Professors(prof_id) on delete cascade,
	foreign key (dept_id) references Departments(dept_id) on delete cascade
) 

create table Shift(
	prof_id int(4),
	shift int(2),
	working_hours int(2),
	foreign key (prof_id) references Professors (prof_id) on delete cascade
)

 load data <local> infile 'dept.txt' into table Departments;  

 DELETE FROM table_name WHERE condition;

 ---Queries---
select * from Professors natural join Departments;

select Professors.prof_id, Professors.prof_name, Shift.shift
from Professors
inner join Shift
on Shift.prof_id = Professors.prof_id;

3rd - 
select Departments.dept_id, Departments.dept_name, Professors.prof_name  
from Departments
left join Professors
on Departments.dept_id=Professors.dept_id;

4th - 
select *
from Professors
right join Departments
on Departments.dept_id=Professors.dept_id;

5th - 
select Professors.prof_name, Departments.dept_name, Shift.shift, Professors.salary 
from Professors
left join Departments
on Professors.dept_id=Departments.dept_id
left join Shift
on Shift.prof_id=Professors.prof_id
where Professors.prof_id=101;

6th -
select Departments.dept_name, count(Professors.dept_id) as "No. of Profs"
from Professors
inner join Departments
on Professors.dept_id=Departments.dept_id
group by Professors.dept_id;

7th -
select Professors.prof_id ,Departments.dept_name
from Professors, Departments 
where Professors.dept_id in (
	select Departments.dept_id 
	from Departments
	where Departments.dept_name = 'comp'
)
and
Departments.dept_id in (
	select Departments.dept_id 
	from Departments 
	where Departments.dept_name = 'comp'
);

8th - 
select dept_name
from Departments 
where Departments.dept_id in (
	select Professors.dept_id
	from Professors
	where Professors.doj = '1991-01-01'
);

10th - pending

----Group by ----
select city, count(city) as "City Count" from Professors group by city;

