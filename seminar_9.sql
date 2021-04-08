-- SEMINAR 9

-- 1
create function hello()
returns varchar(100) as $$
	select 'Hello. world!'
$$ language sql;

select hello();

-- 2
create function rev_str(input_str varchar(200))
returns varchar(200) as $$
	select reverse(input_str);
$$ language sql;

select rev_str('Hello');

-- 3
create function fact(n integer)
returns integer as $$
begin
	if n > 0 then return n * fact(n - 1);
	else return 1;
	end if;
end;
$$ language plpgsql;

-- 4

create function inc_date(input_date date, n_days integer)
returns date as 
$$
declare 
	time_interval interval;
begin
	time_interval := make_interval(0, 0, 0, n_days, 0, 0, 0);
	return input_date + time_interval;
end;
$$ language plpgsql;

select inc_date('2020-12-29', 10);

-- 5
create function backup()
returns integer as $$
begin
	
end
$$

select *
from information_schema.tables 
where table_schema = 'public'
order by table_name;
