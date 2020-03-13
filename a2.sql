2nd - 
select * 
from Professors
where prof_name like 'a%' 
or prof_name like'd%';

3rd-
select count(distinct city) as "City Count"
from Professors;

4th - 
update Professors
set salary=salary*1.05
where doj='2001-02-02';

5th 
delete from Professors where city='Nagpur';

6th 
select prof_name,city from Professors where city='Pune'
union
select prof_name,city from Professors where city='Mumbai' ;

7th
select prof_name,city,designation from Professors where city in ('Pune', 'Mumbai');
select prof_name,city,designation from Professors where designation='staff' ;
not done

8th 
select prof_name, salary
from Professors
where salary = (select max(salary) from Professors);

select prof_name, salary
from Professors
where salary between 12500 and 13500;

9th
select prof_name, salary, doj
from Professors
order by salary desc;
