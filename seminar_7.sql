create schema seminar_7;
DROP SCHEMA IF EXISTS seminar_7 CASCADE;
CREATE SCHEMA seminar_7;

DROP TABLE IF EXISTS seminar_7.participant;
CREATE TABLE seminar_7.participant (
 participant_id        INT PRIMARY KEY,
 participant_nm        VARCHAR(200),
 participant_birth_dt  DATE,
 participant_country_nm   VARCHAR(200)
);

DROP TABLE IF EXISTS seminar_7.competition;
CREATE TABLE seminar_7.competition (
 competition_id      INT PRIMARY KEY,
 competition_nm      VARCHAR(200),
 held_dt             DATE,
 competition_country_nm VARCHAR(100),
 result_sorting_type_code VARCHAR(10) CHECK(result_sorting_type_code IN ('ASC', 'DESC'))
);

DROP TABLE IF EXISTS seminar_7.competition_result;
CREATE TABLE seminar_7.competition_result (
 competition_id      INT REFERENCES seminar_7.competition(competition_id),
 participant_id      INT REFERENCES seminar_7.participant(participant_id),
 participant_result_amt  NUMERIC(20,2)
);

INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (1, 'Иванов И.И.', '1970-01-17', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (2, 'Петров А.С.', '1989-02-03', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (3, 'Яковлев П.П.', '1990-04-28', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (4, 'Николаев Д.С.', '1988-09-24', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (5, 'Николаев С.С.', '1987-06-20', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (6, 'Попова А.А.', '1989-12-30', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (7, 'Максимова Ю.П.', '1988-05-23', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (8, 'Смирнов И.И.', '1985-04-27', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (9, 'Попова Р.А.', '1991-04-22', 'Украина');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (10, 'Степанов П.И.', '1987-10-23', 'Украина');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (11, 'Михайлов В.Д.', '1989-04-23', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (12, 'Веселов Н.Д.', '1987-11-25', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (13, 'Киреева З.Д.', '1988-04-05', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (14, 'Дмитриева О.Ж.', '1988-04-05', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (15, 'Федорова М.Л.', '1988-04-05', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (16, 'Лаптева И.Д.', '1988-04-05', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (17, 'Григорьев Л.З.', '1987-05-28', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (18, 'Черепаха П.Г.', '1990-04-01', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (19, 'Цекало М.З.', '1987-06-17', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (20, 'Чапаев К.Л.', '1988-09-30', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (21, 'Чистов К.П.', '1989-06-22', 'Россия');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (22, 'Мамаева В.Р.', '1987-10-27', 'Украина');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (23, 'Михайлов К.Д.', '1988-08-10', 'Украина');
INSERT INTO seminar_7.participant (participant_id, participant_nm, participant_birth_dt, participant_country_nm) VALUES (24, 'Попов А.Д.', '1987-04-18', 'Украина');

INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm, result_sorting_type_code) VALUES (1, 'Веселые старты', '2019-04-09', 'Россия', 'DESC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm, result_sorting_type_code) VALUES (2, 'Забег на 10 км', '2017-06-15', 'США', 'DESC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm, result_sorting_type_code) VALUES (3, 'Прыжки в длину', '2016-04-23', 'Болгария', 'ASC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm, result_sorting_type_code) VALUES (4, 'Прыжки в высоту', '2019-08-14', 'Россия', 'ASC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm, result_sorting_type_code) VALUES (5, 'Метание ядра', '2018-05-25', 'США', 'ASC');
INSERT INTO seminar_7.competition (competition_id, competition_nm, held_dt, competition_country_nm, result_sorting_type_code) VALUES (6, 'Триатлон', '2014-11-18', 'Россия', 'DESC');

INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (1, 13, 100.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (1, 15, 113.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (1, 10, 50.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (1, 1, 88.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (1, 3, 19.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (1, 4, 56.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (1, 7, 73.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (1, 19, 23.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (2, 11, 92.77);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (2, 2, 104.10);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (2, 9, 115.09);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (2, 4, 105.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (2, 3, 100.10);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (2, 15, 100.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (2, 17, 99.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 5, 343.70);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 6, 645.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 10, 113.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 14, 115.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 15, 119.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 16, 333.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 20, 249.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 21, 149.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 22, 84.20);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 23, 90.07);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 24, 114.88);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (3, 1, 176.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (4, 19, 123.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (4, 18, 234.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (4, 17, 112.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (4, 16, 187.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (4, 15, 109.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (4, 14, 156.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (4, 13, 178.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 1, 116.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 3, 118.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 5, 125.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 7, 129.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 9, 127.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 11, 106.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 13, 105.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 15, 104.50);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 17, 106.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 19, 107.50);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 21, 108.99);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (5, 23, 105.45);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 2, 105.90);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 4, 100.67);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 6, 147.99);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 8, 185.70);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 10, 136.50);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 12, 114.80);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 14, 149.43);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 16, 115.80);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 18, 100.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 20, 99.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 22, 104.00);
INSERT INTO seminar_7.competition_result (competition_id, participant_id, participant_result_amt) VALUES (6, 24, 106.00);

-- 4
select participant_result_amt, competition_nm from (
SELECT result_sorting_type_code, participant_result_amt,
row_number()
over (
	partition by result_sorting_type_code, competition_nm 
	order by 
	case when result_sorting_type_code='ASC' then participant_result_amt end desc, 
	case when result_sorting_type_code='DESC' then participant_result_amt end asc) as place, 
competition_nm
FROM seminar_7.competition_result res inner join seminar_7.competition comp
ON res.competition_id = comp.competition_id) as sorted
where sorted.place=1;

-- 5
select participant_result_amt, competition_nm from (
SELECT result_sorting_type_code, participant_result_amt,
row_number()
over (
	partition by result_sorting_type_code, competition_nm 
	order by 
	case when result_sorting_type_code='ASC' then participant_result_amt end desc, 
	case when result_sorting_type_code='DESC' then participant_result_amt end asc) as place, 
competition_nm
FROM seminar_7.competition_result res inner join seminar_7.competition comp
ON res.competition_id = comp.competition_id) as sorted
where sorted.place <= 3;

-- 6
select competition_nm, place, abs(participant_result_amt - best) 
from (
	select 
	participant_result_amt, 
	competition_nm, 
	place, 
	first_value(participant_result_amt) over (partition by competition_nm) as best
	from 
	(
		SELECT result_sorting_type_code, participant_result_amt,
		row_number()
		over (
			partition by result_sorting_type_code, competition_nm 
			order by 
			case when result_sorting_type_code='ASC' then participant_result_amt end desc, 
			case when result_sorting_type_code='DESC' then participant_result_amt end asc) as place, 
		competition_nm
		FROM seminar_7.competition_result res inner join seminar_7.competition comp
		ON res.competition_id = comp.competition_id
	) as sorted
	where sorted.place > 3 or sorted.place = 1
) as dev_ready
where dev_ready.place > 3;

-- 7
select 
participant_nm,
competition_nm
from 
(
	select 
	participant_nm, 
	participant_birth_dt,
	competition_nm, 
	first_value(participant_birth_dt) over (partition by competition_nm) as best_birth_dt
	from 
	(
		SELECT participant_result_amt, participant_nm, participant_birth_dt,
		row_number()
		over (
			partition by result_sorting_type_code, competition_nm 
			order by 
			case when result_sorting_type_code='ASC' then participant_result_amt end desc, 
			case when result_sorting_type_code='DESC' then participant_result_amt end asc) as place, 
		competition_nm
		FROM seminar_7.competition_result res inner join seminar_7.competition comp
		ON res.competition_id = comp.competition_id inner join seminar_7.participant part on part.participant_id = res.participant_id
	) as age_ready
) as ready_best_birth_dt
where participant_birth_dt < best_birth_dt;

-- 8
select 
participant_nm,
competition_nm,
participant_result_amt,
prev_participant_result_amt,
next_participant_result_amt,
participant_result_amt - prev_participant_result_amt as prev_diff,
participant_result_amt - next_participant_result_amt as next_diff 
from 
(
	select participant_nm, 
	competition_nm, 
	participant_result_amt,
	lag(participant_result_amt, 1, NULL) over (partition by competition_nm order by place) as prev_participant_result_amt,
	lead(participant_result_amt, 1, NULL) over (partition by competition_nm order by place) as next_participant_result_amt
	from 
	(
	SELECT participant_result_amt, participant_nm,
	row_number()
	over (
		partition by result_sorting_type_code, competition_nm 
		order by 
		case when result_sorting_type_code='ASC' then participant_result_amt end desc, 
		case when result_sorting_type_code='DESC' then participant_result_amt end asc) as place, 
			competition_nm
	FROM seminar_7.competition_result res inner join seminar_7.competition comp
	ON res.competition_id = comp.competition_id inner join seminar_7.participant part on part.participant_id = res.participant_id
	) as offsets
	order by competition_nm, place
) as diffs;

-- 9
select
	competition_nm,
	count(is_unique) over(partition by competition_nm) as unique_participants
from 
(
	select 
	competition_nm, 
	case when row_number() over (partition by competition_nm, participant_id) = 1 then 1 else 0 end as is_unique
	from seminar_7.competition_result res inner join seminar_7.competition comp on res.competition_id = comp.competition_id
) as prep_unique;

-- 10
select 
competition_nm,
participant_nm,
case when place >3 then 'Не занял призового места' else concat('Занял место', ' ', cast(place as varchar(1))) end as state 
from
(
select place, participant_nm, competition_nm from (
SELECT result_sorting_type_code, participant_result_amt, participant_nm,
row_number()
over (
	partition by result_sorting_type_code, competition_nm 
	order by 
	case when result_sorting_type_code='ASC' then participant_result_amt end desc, 
	case when result_sorting_type_code='DESC' then participant_result_amt end asc) as place, 
competition_nm
FROM seminar_7.competition_result res inner join seminar_7.competition comp
ON res.competition_id = comp.competition_id inner join seminar_7.participant p on p.participant_id = res.participant_id) as sorted
) as place_table;