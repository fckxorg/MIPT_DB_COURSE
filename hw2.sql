set search_path = 'seminar_3'; -- comment
/*
 * Long comment
 */
select * from information_schema.tables where table_schema = 'seminar_3'

insert into salary values
('Трамп', 'США', 20000000000000);


select * from seminar_3.salary

alter table salary add column comment text;

update salary 
	set comment = 'Комментарий для ' || employee_nm;
select * from salary

delete
	from salary
where employee_nm  = 'Трамп';

select * from salary

truncate table salary;

INSERT INTO seminar_3.salary VALUES('Ken Sánchez', 'HR', 78);
INSERT INTO seminar_3.salary VALUES('TerriLee Duffy', 'HR', 95);
INSERT INTO seminar_3.salary VALUES('Roberto Tamburello', 'HR', 382);
INSERT INTO seminar_3.salary VALUES('Rob Walters', 'HR', 16);
INSERT INTO seminar_3.salary VALUES('Gail Erickson', 'HR', 1079);
INSERT INTO seminar_3.salary VALUES('Jossef Gibson', 'HR', 102);
INSERT INTO seminar_3.salary VALUES('Dylan Miller', 'HR', 486);
INSERT INTO seminar_3.salary VALUES('Diane Margheim', 'HR', 1953);
INSERT INTO seminar_3.salary VALUES('Gigi Matthew', 'SALE', 49);
INSERT INTO seminar_3.salary VALUES('Michael Raheem', 'SALE', 71);
INSERT INTO seminar_3.salary VALUES('Ovidiu Cracium', 'SALE', 94);
INSERT INTO seminar_3.salary VALUES('Thierry Hers', 'SALE', 61);
INSERT INTO seminar_3.salary VALUES('Janice Galvin', 'SALE', 972);
INSERT INTO seminar_3.salary VALUES('Michael Sullivan', 'SALE', 849);
INSERT INTO seminar_3.salary VALUES('Sharon Salavaria', 'SALE', 715);
INSERT INTO seminar_3.salary VALUES('David Michael', 'SALE', 94);
INSERT INTO seminar_3.salary VALUES('Kevin Brown', 'R&D', 891);
INSERT INTO seminar_3.salary VALUES('John Wood', 'R&D', 1486);
INSERT INTO seminar_3.salary VALUES('Mary Dempsey', 'R&D', 176);
INSERT INTO seminar_3.salary VALUES('Wanida Benshoof', 'R&D', 49);
INSERT INTO seminar_3.salary VALUES('Terry Eminhizer', 'R&D', 381);
INSERT INTO seminar_3.salary VALUES('Sariya Harnpadoungsataya', 'R&D', 946);
INSERT INTO seminar_3.salary VALUES('Mary Gibson', 'R&D', 486);
INSERT INTO seminar_3.salary VALUES('Jill Williams', 'R&D', 19);
INSERT INTO seminar_3.salary VALUES('James Hamilton', 'R&D', 46);
INSERT INTO seminar_3.salary VALUES('Peter Krebs', 'R&D', 445);
INSERT INTO seminar_3.salary VALUES('Jo Brown', 'R&D', 666) ;
INSERT INTO seminar_3.salary VALUES('Guy Gilbert', 'MANAGEMENT', 482);
INSERT INTO seminar_3.salary VALUES('Mark McArthur', 'MANAGEMENT', 12);
INSERT INTO seminar_3.salary VALUES('Britta Simon', 'MANAGEMENT', 194);
INSERT INTO seminar_3.salary VALUES('Margie Shoop', 'MANAGEMENT', 481);
INSERT INTO seminar_3.salary VALUES('Rebecca Laszlo', 'MANAGEMENT', 16);
INSERT INTO seminar_3.salary VALUES('Annik Stahl', 'MANAGEMENT', 134);
INSERT INTO seminar_3.salary VALUES('Suchitra Mohan', 'R&D', 87);
INSERT INTO seminar_3.salary VALUES('Brandon Heidepriem', 'R&D', 111) ;
INSERT INTO seminar_3.salary VALUES('Jose Lugo', 'R&D', 185);
INSERT INTO seminar_3.salary VALUES('Chris Okelberry', 'R&D', 94);
INSERT INTO seminar_3.salary VALUES('Kim Abercrombie', 'R&D', 348);
INSERT INTO seminar_3.salary VALUES('Ed Dudenhoefer', 'R&D', 68);
INSERT INTO seminar_3.salary VALUES('JoLynn Dobney', 'R&D', 346);
INSERT INTO seminar_3.salary VALUES('Bryan Baker', 'R&D', 185);
INSERT INTO seminar_3.salary VALUES('James Kramer', 'SUPPORT', 965);
INSERT INTO seminar_3.salary VALUES('Nancy Anderson', 'SUPPORT', 444);
INSERT INTO seminar_3.salary VALUES('Simon Rapier', 'SUPPORT', 133);
INSERT INTO seminar_3.salary VALUES('Thomas Michaels', 'SUPPORT', 200);
INSERT INTO seminar_3.salary VALUES('Eugene Kogan', 'SUPPORT', 144);
INSERT INTO seminar_3.salary VALUES('Andrew Hill', 'SUPPORT', 186);
INSERT INTO seminar_3.salary VALUES('Ruth Ellerbrock', 'SUPPORT', 179);
INSERT INTO seminar_3.salary VALUES('Barry Johnson', 'HEAD', 10000);
INSERT INTO seminar_3.salary VALUES('Sidney Higa', 'HEAD', 1);
INSERT INTO seminar_3.salary VALUES('Max Lanson', 'PR', 150);

select employee_nm 
	from seminar_3.salary 
where salary_amt > 500; -- 12

select employee_nm 
	from seminar_3.salary 
where salary_amt < 400 and department_nm = 'HR'; -- 13

select employee_nm 
	from seminar_3.salary 
where salary_amt between 300 and 500; -- 14

select employee_nm 
	from seminar_3.salary 
where salary_amt > 100 and employee_nm like '%a% %' -- 15

select employee_nm
	from seminar_3.salary
where department_nm in ('HR', 'PR') -- 16

select distinct department_nm
	from seminar_3.salary
where department_nm like '__' -- 17

select department_nm
	from seminar_3.salary
where department_nm like 'S%' -- 18

select employee_nm
	from seminar_3.salary
where department_nm not in ('R&D', 'SUPPORT') -- 19

select department_nm
	from seminar_3.salary
where department_nm like '%A%' 
and department_nm like '%E%' -- 20

select count(*)
	from seminar_3.salary -- 21
	
select max(salary_amt)
	from seminar_3.salary -- 22
	
select count(*)
	from seminar_3.salary
where salary_amt > 500 -- 23

select department_nm, avg(salary_amt)
	from seminar_3.salary
group by department_nm -- 24

select department_nm, avg(salary_amt)
	from seminar_3.salary
group by department_nm
having avg(salary_amt) > 500 -- 25

select department_nm, min(salary_amt)
	from seminar_3.salary
group by department_nm
having min(salary_amt) > 500 -- 26

select count(employee_nm), department_nm
	from seminar_3.salary
group by department_nm -- 27
having count(employee_nm) > 9

select employee_nm, salary_amt 
	from seminar_3.salary
order by salary_amt desc -- 28

select department_nm, avg(salary_amt), min(salary_amt), max(salary_amt), count(employee_nm)
	from seminar_3.salary
group by department_nm 
order by avg(salary_amt) desc -- 29

select department_nm, max(salary_amt ) - avg(salary_amt) as avg_deviation, 
max(salary_amt) - min(salary_amt) as min_deviation
	from seminar_3.salary
group by department_nm -- 30

select department_nm, max(salary_amt ) - avg(salary_amt) as avg_deviation, 
max(salary_amt) - min(salary_amt) as min_deviation,
avg(salary_amt) - min(salary_amt) as avgmin_deviation
	from seminar_3.salary
group by department_nm -- 31

select department_nm, sum(salary_amt)
	from seminar_3.salary
group by department_nm 
order by sum(salary_amt) asc --32







