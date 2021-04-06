create schema seminar_4;
create table seminar_4.department (department_nm text, location_txt text);
select * from department;

INSERT INTO seminar_4.department VALUES('HR', 'Murom');
INSERT INTO seminar_4.department VALUES('SUPPORT', 'Saratov');
INSERT INTO seminar_4.department VALUES('MANAGEMENT', 'Samara');
INSERT INTO seminar_4.department VALUES('HEAD', 'Moscow');
INSERT INTO seminar_4.department VALUES('SALE', 'Moscow');
INSERT INTO seminar_4.department VALUES('R&D', 'Novosibirsk');

select * from seminar_4.department

create schema seminar_3;
create table seminar_3.salary (nm text, department_nm text, salary_amt integer)

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

select s.nm from seminar_3.salary s -- 5
inner join seminar_4.department d
on d.department_nm = s.department_nm
where d.location_txt = 'Moscow';

select s.nm from seminar_3.salary s -- 6
left join seminar_4.department d
on d.department_nm = s.department_nm
where d.location_txt is null;

select d.location_txt, max(s.salary_amt) as max_salary_amt -- 7
from seminar_4.department d
full join seminar_3.salary s
on s.department_nm = d.department_nm
group by d.location_txt;

select d.location_txt, count(s.nm) as max_salary_amt -- 8
from seminar_4.department d
left join seminar_3.salary s
on s.department_nm = d.department_nm
group by d.location_txt;

select d.location_txt -- 9
from seminar_4.department d
left join seminar_3.salary s
on s.department_nm = d.department_nm
group by d.location_txt
having min(s.salary_amt) > 500;

select s.nm, s.salary_amt, d.location_txt 
from seminar_3.salary s left join seminar_4.department d on 
d.department_nm = s.department_nm
order by location_txt, s.salary_amt asc; -- 10

select d.location_txt, avg(s.salary_amt)
from seminar_4.department d left join seminar_3.salary s
on d.department_nm = s.department_nm
group by d.location_txt
order by avg(s.salary_amt) desc; -- 11

select d.location_txt, avg(s.salary_amt), min(s.salary_amt), max(s.salary_amt), count(s.nm)
from seminar_4.department d left join seminar_3.salary s
on d.department_nm = s.department_nm
group by d.location_txt; -- 12

select d.location_txt, avg(s.salary_amt), count(s.nm)
from seminar_4.department d left join seminar_3.salary s
on d.department_nm = s.department_nm
group by d.location_txt
having avg(s.salary_amt) > 100;-- 13


insert into seminar_4.department values('932', 'Долгопрудный');

select d.department_nm, max(s.salary_amt), min(s.salary_amt), sum(s.salary_amt), count(s.salary_amt), avg(s.salary_amt)
from seminar_4.department d left join seminar_3.salary s
	on s.department_nm = d.department_nm
where d.department_nm = '932'
group by d.department_nm; -- 14

select s.nm, d.department_nm, s.salary_amt
from seminar_3.salary s full join seminar_4.department d
on s.department_nm = d.department_nm -- 15
 
---------------- SEMINAR 5-----------------------
create schema seminar_5;
create table seminar_5.test_table (
	my_id serial,
	my_text_field text
);

begin transaction;
	insert into seminar_5.test_table (my_text_field) values('test_field');
	select * from seminar_5.test_table;
commit;

begin transaction isolation level repeatable read;
	update seminar_5.test_table
	set my_text_field = 'other value';
	select * from seminar_5.test_table
commit;