-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--////////////////////////////////////////////////////////////////
--                FIRST BLOCK OF TASKS
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create table public.organization as
select 1 as id_org, 'АО Тинькофф Банк' as name_org
union
select 2, 'X5 Retail Group'
union
select 3, 'АО Ромашка';

create table public.teacher (id_teach, last_name, first_name, birth_date, salary_amt, id_org) as
select 1, 'Роздухова', 'Нина', '1992-04-15', 15000.00, 1
 union
select 2, 'Меркурьева', 'Надежда', '1995-03-12', 25000.00, 1
 union
select 3, 'Халяпов', 'Александр', '1994-09-30', 17000.00, 2
 union
select 4, 'Иванов', 'Иван', NULL, 100000.00, 3
 union
select 5, 'Петров', 'Петр', NULL, 3000.00, 3;

-- 1
create view full_teacher_view as
select * from public.teacher;

-- 2
create view organization_teacher as
select * from public.teacher
where id_org is not NULL;

-- 3
create view full_list_teacher_org as
select id_teach, last_name, first_name birth_date, name_org
from public.teacher t left join public.organization o on o.id_org = t.id_org;

-- 4
create view teacher_org_names as
select id_teach, concat(last_name, ' ', first_name) as "Фамилия Имя", birth_date as "Дата рождения", name_org
from public.teacher t left join public.organization o on o.id_org = t.id_org;

-- 5
insert into full_teacher_view(id_teach, last_name, first_name, birth_date, salary_amt, id_org)
values (6, 'Дашков', 'Евгений', '1987-07-12', 20000.00, 1);

-- 6
delete from full_teacher_view 
where last_name = 'Дашков';

-- 7
update full_teacher_view
set birth_date='2020-03-03'
where id_teach=4;

-- 8
update organization_teacher 
set id_org=NULL
where id_teach=4;

-- 9
create view organization_teacher_local as
select * from public.teacher
where id_org is not null 
with local check option;

update organization_teacher_local
set id_org=NULL
where id_teach=5;

select * from organization_teacher_local

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--////////////////////////////////////////////////////////////////
--                SECOND BLOCK OF TASKS
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 1
with recursive
t(n) as (
select 0
	union all
select n + 1
	from t
	where n < 100
)
select sum(n) from t;

-- 2
with recursive
t(n) as (
select 3
	union all
select n + 5
	from t
	where n < 48
)
select sum(n) from t;

-- 3
select sum(n) from (
with recursive
t(n) as (
select 1
	union all
select n * 3
	from t
)
select * from t limit 10 ) as generated;

-- 4
with recursive
t(n) as (
select to_timestamp('2021-02-03', 'yyyy-mm-dd')
	union all
select n + interval '7' day 
	from t
	where n < current_date
)
select * from t;

-- 5
with recursive
t(n) as (
select to_timestamp('2019-02-04', 'yyyy-mm-dd')
	union all
select n + interval '7' day 
	from t
	where n + interval '7' day < to_timestamp('2019-06-01', 'yyyy-mm-dd') 
)
select * from t;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--////////////////////////////////////////////////////////////////
--                THIRD BLOCK OF TASKS
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create table public.department (dep_id, par_dep_id, dep_name) as select 1, NULL, 'АО Тинкофф Банк' union
select 2, 1, 'Управление анализа кредитных рисков' union
select 3, 2, 'Отдел риск-менеджмента малого и среднего бизнеса' union select 4, 2, 'Отдел риск-менеджмента розничного бизнеса' union select 5, 1, 'Департамент ИТ' union
select 6, 5, 'Управление хранилищ данных и отчетности' union select 7, 6, 'Отдел очистки и контроля качества данных' union select 8, 7, 'Группа администрирования хранилищ данных' union select 9, 7, 'Группа контроля качества данных' union
select 10, 5, 'Отдел отчетности и витрин данных' union select 11, 5, 'Отдел трансформации и загрузки данных' union select 12, 11, 'Группа системного анализа' union
select 13, 11, 'Группа разработки';

