-- ------------------------------------------------------
-- MIPT Databases course project 
-- (c) 2021 fckxorg
-- MIT LICENSE
-- ------------------------------------------------------


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- //////////////////////////////////////////////////////
--                     DDL SCRIPTS
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-- PROJECT SCHEMA
create schema if not exists project;

-- AVATAR TABLE
create table project.avatar 
(
	avatar_id  		serial 		primary key,
	avatar_url 		varchar(2048) 	not null 							-- 2048 is a maximum allowed size of http address
);

-- USER TABLE
create table project.user
(
	user_id 		serial 		primary key,
	handle_txt 		varchar(256) 	not null unique,						-- Each user MUST have unique handle
											 	 		-- Limit of 256 characters is a common limit for handles
	email_txt		varchar(320) 	unique,
	avatar_id		integer		references project.avatar(avatar_id),
	bio_txt			text,
	phone_no		varchar(20)	not null unique,						-- Each user must have phone number, 20 digits should be enough for everyone
	user_nm			varchar(256)	not null
);

-- STICKER TABLE
create table project.sticker
(
	sticker_id		serial		primary key,
	emotion_nm		varchar(256)	not null,
	picture_url		varchar(2048)	not null							-- 2048 is a maximum allowed size of http address
); 

-- CHAT TABLE
create table project.chat
(
	chat_id			serial		primary key,
	avatar_id		integer		references project.avatar(avatar_id),
	members_cnt		integer		not null,
	chat_nm			varchar(256)	not null
);


-- MESSAGE TABLE
create table project.message
(
	message_id		serial,
	version_no		integer,
	chat_id			integer		not null references project.chat(chat_id),
	sender_id		integer		not null references project.user(user_id),
	sticker_id		integer		references project.sticker(sticker_id),
	timestamp_dttm		timestamp	not null,
	payload_txt		text
);

alter table project.message 
add constraint PK_message primary key (message_id, version_no);

-- CALL TABLE
create table project.call
(
	call_id			serial		primary key,
	chat_id			integer		not null references project.chat(chat_id),
	duration_sec	interval		not null,
	video_flg		boolean,
	record_url		varchar(2048) 									-- 2048 is a maximum allowed size of http address
);

-- BOT TABLE
create table project.bot
(
	bot_id			serial		primary key,
	server_url		varchar(2048)	not null, 							-- 2048 is a maximum allowed size of http address
	bot_nm			varchar(256)	not null,
	avatar_id		integer		references project.avatar(avatar_id)
);

-- ATTACHMENT TABLE
create table project.attachment
(
	attachment_id	serial			primary key,
	message_id		integer,
	version_no		integer,
	type_txt		varchar(20)	not null,							-- file extension
	file_url		varchar(2048)	not null, 							-- 2048 is a maximum allowed size of http address
	size_amt		integer										-- file size in bytes
);

alter table project.attachment
add constraint FK_message
foreign key (message_id, version_no) references project.message(message_id, version_no);


-- USER_X_CHAT TABLE
create table project.user_x_chat
(
	user_id 		integer,
	chat_id			integer
);

alter table	project.user_x_chat
add constraint PK_user_x_chat 
primary key (user_id, chat_id);

alter table project.user_x_chat
add constraint FK_user
foreign key (user_id) references project.user(user_id);

alter table project.user_x_chat
add constraint FK_chat
foreign key (chat_id) references project.chat(chat_id);

-- USER_X_STICKER TABLE
create table project.user_x_sticker
(
	user_id 		integer,
	sticker_id		integer
);

alter table	project.user_x_sticker
add constraint PK_user_x_sticker 
primary key (user_id, sticker_id);

alter table project.user_x_sticker
add constraint FK_user
foreign key (user_id) references project.user(user_id);

alter table project.user_x_sticker
add constraint FK_sticker
foreign key (sticker_id) references project.sticker(sticker_id);

-- BOT_X_CHAT TABLE
create table project.bot_x_chat
(
	bot_id 			integer,
	chat_id			integer
);

alter table	project.bot_x_chat
add constraint PK_bot_x_chat 
primary key (bot_id, chat_id);

alter table project.bot_x_chat
add constraint FK_bot
foreign key (bot_id) references project.bot(bot_id);

alter table project.bot_x_chat
add constraint FK_chat
foreign key (chat_id) references project.chat(chat_id);


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- //////////////////////////////////////////////////////
--                      INSERTIONS
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- AVATAR INSERTIONS
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_1324.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_1576.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_1936.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_2078.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_6589.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_1203.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_1437.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_1247.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_9864.png');
insert into project.avatar (avatar_id, avatar_url)
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_3000.png');


-- STICKER INSERTIONS
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'anger', 'http://cdn.messenger.com/sticker/sticker_blob_1786.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'happiness', 'http://cdn.messenger.com/sticker/sticker_blob_3267.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'love', 'http://cdn.messenger.com/sticker/sticker_blob_7843.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'love', 'http://cdn.messenger.com/sticker/sticker_blob_8790.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'upset', 'http://cdn.messenger.com/sticker/sticker_blob_4583.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'facepalm', 'http://cdn.messenger.com/sticker/sticker_blob_2156.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'anger', 'http://cdn.messenger.com/sticker/sticker_blob_9075.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'facepalm', 'http://cdn.messenger.com/sticker/sticker_blob_3219.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'laugh', 'http://cdn.messenger.com/sticker/sticker_blob_4036.svg');
insert into project.sticker (sticker_id, emotion_nm, picture_url)
values (default, 'laugh', 'http://cdn.messenger.com/sticker/sticker_blob_1873.svg');


-- BOT INSERTIONS
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://fancybot.ru/', 'Timetable Bot', 1);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://flibusta.net/', 'Library Bot', 2);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, '237.98.114.3:5000', 'Kekifier', NULL);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://github.com', 'Deprecation Notifier', NULL);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://amazon.com/sale_bot', 'Amazon Sales', NULL);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://wikipedia.org/searcher', 'WikiBot', NULL);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://spotify.com/bot/genius', 'Genius Lyrics', NULL);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://spotify.com/bot/music', 'Music Downloader', NULL);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://2ka.mipt.ru', 'Бронирование стиралки', NULL);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://aviasales.ru/bot', 'Бронирование билетов', NULL);

-- CHAT INSERTIONS
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, 3, 120, 'concurrency-chat-support-2021');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, 4, 210, 'БД ФПМИ');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 20, 'Теорвер 932');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 8, 'Tarantool/perf.counters');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 230, 'concurrency-chat-mipt-2021');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 2, 'Changelog');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 5, 'xnoobs');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, 5, 330, 'Phystech.Genesis');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 197, 'Hackathon Winners');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 1, 'Saved Messages');


-- USER INSERTIONS
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@fckxorg', 'max.kokr@somemail.com', 6, 'Another un-innocent elegant fall into the un-magnificent life of adults', '+77895341231', 'Maxim Kokryashkin');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@AlgebraicWolf', 'test@test.com', 7, 'Life without cringe is worthless', '+74951201851', 'Alexei VoLkOv');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@BorisTab', null, null, null, '+79833211893', 'Boris Tabachnikov');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Alice', null, null, 'my face feels bigger than usual', '+79033811893', 'Alice');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@a.ershov', 'andrei.ershov@mipt.ru', null, 'А вы вводили понятие идеала?', '+78037651312', 'Andrei Ershov');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Bob', 'bob@protonmail.com', null, 'Nothing fancy here', '+79235311893', 'Bob');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Shisqa', 'shishatskiy.m@phystech.edu', 8, 'MIPT student', '+798322198993', 'Mikhail Shishatskiy');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@realDonaldTrump', 'mr.president@us.gov', 9, 'Make America great again', '+1345789312', 'Donald Trump');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Putin', 'vvp@kremlin.ru', 10, 'F*ck Navalny', '+79000000000', 'Vladimir Putin');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Xi', 'xi@prc.gov', null, 'Nice one! Plus 20 social points for you', '+4876132453', 'Xi Jinping');

-- MESSAGE INSERTIONS
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 1, 7, null, '2021-02-15 17:04:32', 'Здравствуйте! Пакетный менеджер не может найти docker-compose');
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 1, 2, null, '2021-02-15 17:07:33', 'Сделай sudo apt-get update && sudo apt-get upgrade');
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 1, 7, null, '2021-02-15 17:10:15', 'Спасибо, помогло!');
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 1, 2, 3, '2021-02-15 17:11:32', null);
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 6, 1, null, '2021-03-19 17:11:32', 'Перестаньте слать мне эти списки обновлений!');
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 9, 4, null, '2021-03-29 11:45:17', 'Hello, Bob!');
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 9, 6, null, '2021-03-29 11:47:13', 'Hello, Alice!');
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 3, 5, null, '2021-04-01 9:30:11', 'Может займемся сочной алгеброй вместо теорвера?');
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 3, 1, 6, '2021-03-29 11:45:17', null);
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 0, 2, 10, null, '2021-04-03 13:59:29', 'Кто не сдас проект, тот сдохнет, получается...');


-- ATTACHMENT INSERTIONS (only 3 entries here because it's kinda strange to create attachment for every message I have by now)
insert into project.attachment (attachment_id, message_id, version_no, type_txt, file_url, size_amt)
values (default, 1, 0, '.jpg', 'drive.google.com/shisqa/error.png', null);
insert into project.attachment (attachment_id, message_id, version_no, type_txt, file_url, size_amt)
values (default, 8, 0, '.pdf', 'mipt.ru/study/chair/math/algebra/cathegory_theory.pdf', '100500');
insert into project.attachment (attachment_id, message_id, version_no, type_txt, file_url, size_amt)
values (default, 3, 0, '.jpg', 'drive.google.com/shisqa/cute_cat.png', '45000');

-- USER_X_CHAT
insert into project.user_x_chat (user_id, chat_id)
values (7, 1);
insert into project.user_x_chat (user_id, chat_id)
values (2, 1);
insert into project.user_x_chat (user_id, chat_id)
values (1, 1);
insert into project.user_x_chat (user_id, chat_id)
values (4, 1);
insert into project.user_x_chat (user_id, chat_id)
values (6, 1);
insert into project.user_x_chat (user_id, chat_id)
values (4, 9);
insert into project.user_x_chat (user_id, chat_id)
values (6, 9);
insert into project.user_x_chat (user_id, chat_id)
values (1, 6);
insert into project.user_x_chat (user_id, chat_id)
values (5, 3);
insert into project.user_x_chat (user_id, chat_id)
values (1, 3);

-- USER_X_STICKER
insert into project.user_x_sticker (user_id, sticker_id)
values (2, 3);
insert into project.user_x_sticker (user_id, sticker_id)
values (1, 6);
insert into project.user_x_sticker (user_id, sticker_id)
values (4, 1);
insert into project.user_x_sticker (user_id, sticker_id)
values (4, 9);
insert into project.user_x_sticker (user_id, sticker_id)
values (4, 5);
insert into project.user_x_sticker (user_id, sticker_id)
values (4, 3);
insert into project.user_x_sticker (user_id, sticker_id)
values (7, 1);
insert into project.user_x_sticker (user_id, sticker_id)
values (7, 10);
insert into project.user_x_sticker (user_id, sticker_id)
values (7, 5);
insert into project.user_x_sticker (user_id, sticker_id)
values (3, 8);

-- BOT_X_CHAT
insert into project.bot_x_chat (bot_id, chat_id)
values (2, 1);
insert into project.bot_x_chat (bot_id, chat_id)
values (1, 7);
insert into project.bot_x_chat (bot_id, chat_id)
values (2, 7);
insert into project.bot_x_chat (bot_id, chat_id)
values (4, 3);


-- CALL INSERTS
insert into project.call (call_id, chat_id, duration_sec, video_flg, record_url)
values(default, 4, '01:00:00', true, 'mail.zoom.us/meetings/meeting-2031.mp4');
insert into project.call(call_id, chat_id, duration_sec, video_flg, record_url)
values(default, 1, '01:30:00', true, 'youtube.com/lectoriy_diht/tpcc/spring-2021-11.mp4');
insert into project.call(call_id, chat_id, duration_sec, video_flg, record_url)
values(default, 3, '00:10:00', false, null);


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- //////////////////////////////////////////////////////
--                   CHECKPOINT 5
--  at least 10 UPDATE, SELECT, INSERT, DELETE queries
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- [CRUD] = {Create, Read, Update, Delete}
-- Four basic operations of persistent storage
-- 
-- SQL equivalents:
-- [Create] : 	INSERT
-- [Read] 	: 	SELECT
-- [Update] : 	UPDATE
-- [Delete] : 	DELETE

-- Now let's do some real work (ﾉ◕ヮ◕)ﾉ*:・

-- ==================== Select =========================
-- View table with messenger users
select * from project.user;

-- List names and handles of users without bio
select user_nm, handle_txt
from project.user
where bio_txt is null;

-- Count chats with more than 100 members
select count(chat_id)
from project.chat
where members_cnt > 100;

-- List all message texts from all chats
select payload_txt
from project.message;

-- ==================== Update =========================
-- Poor Boris, let's give him a bio
update project.user
set bio_txt = 'A little bit of copy-paste is better than generic waste'
where handle_txt = '@BorisTab';

-- Maintainer of TimetableBot decided to change address
update project.bot
set server_url = 'http://notsofancybot.com'
where bot_id = 1;

-- ==================== Insert =========================
-- Whoops, there is a typo in message, it's better to fix it
insert into project.message (message_id, version_no, chat_id, sender_id, sticker_id, timestamp_dttm, payload_txt)
values (default, 1, 2, 10, null, '2021-04-03 13:59:29', 'Кто не сдаст проект, тот сдохнет, получается...');

--- Mmm, internship meeting
insert into project.call (call_id, chat_id, duration_sec, video_flg, record_url)
values(10, 4, '01:00:00', true, 'mail.zoom.us/meetings/meeting-2031.mp4');

-- ==================== Delete =========================
-- Overthrowing an authoritarian regime has never been so easy

delete from project.message 
where sender_id in (9, 10);

delete from project.user
where user_id in (9, 10);


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- //////////////////////////////////////////////////////
--                   CHECKPOINT 6
--  at least 5 sensible SELECT queries corresponding to
--  this checklist:
--	
--    a. GROUP BY + HAVING			    [V]
--    b. ORDER BY 				    [V]
--    c. func() OVER():			
--      i. PARTITION BY				    [V]
--     ii. ORDER BY				    [V]
--    iii. PARTITION BY + ORDER BY		    [V]
--     iv. func: all three kinds of functions:
--         * aggregate                              [V]
--         * range                                  [V]
--         * offset                                 [V]
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- [GROUP BY + HAVING] { Amount of peolple using each 'love' sticker }
select s.sticker_id, emotion_nm, count(user_id) as used_by 
from project.user_x_sticker uxs inner join project.sticker s 
on s.sticker_id = uxs.sticker_id 
group by s.sticker_id 
having emotion_nm = 'love';

-- [ORDER BY] { Top chats by members count }
select chat_id, chat_nm, members_cnt
from project.chat
order by members_cnt desc;

-- [PARTITION BY] { Amount of messages in each chat }
select distinct c.chat_id, chat_nm, count(message_id) over(partition by c.chat_id) as msg_amount
from project.message m inner join project.chat c
on m.chat_id = c.chat_id
group by c.chat_id, message_id;

-- [ORDER BY] { Overall most used stickers, their ancestor and predecessor }
select sticker_id, 
       user_cnt,  
       lag(user_cnt, 1, NULL) over (order by user_cnt desc) as prev_sticker_usage,
	   lead(user_cnt, 1, NULL) over (order by user_cnt desc) as next_sticker_usage
from 
(
	select s.sticker_id, count(user_id) as user_cnt from 
	project.sticker s left join project.user_x_sticker uxs
	on s.sticker_id = uxs.sticker_id
	group by s.sticker_id
) as usage_counted;

-- [PARTITION BY + ORDER BY] { Top 3 users by number of messages in each chat }
select user_id, user_nm, chat_nm, row_number() over(partition by chat_id order by message_cnt) as place
from 
(
	select distinct user_id, c.chat_id, c.chat_nm , user_nm, count(message_id) over(partition by c.chat_id) as message_cnt
	from project.user u left join project.message m 
	on m.sender_id = u.user_id left join project.chat c 
	on m.chat_id = c.chat_id
	group by user_id, c.chat_id, m.message_id
) as messages_counted;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- //////////////////////////////////////////////////////
--                   CHECKPOINT 8
--  at least 6 views:
--  * 2-3 should be made with dynamic masking
--  * 3-4 should be sensible summary tables
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- [DYNAMIC MASKING]
-- 1) Information about users, but phone numbers are hidden
create or replace view user_info as
select user_id, handle_txt, email_txt, avatar_id, bio_txt, user_nm, concat(left(phone_no, 2), '*********', right(phone_no, 2)) as phone_masked
from project.user;

-- 2) Bots, but server addresses are hidden to prevent leaks and DDoS attacks
create or replace view anonymized_servers as
select bot_id, bot_nm, avatar_id, concat(left(server_url, 5), '*******', right(server_url, 5)) as server_address -- Length just enough to get protocol and domain
from project.bot;
-- 3) 

-- [SUMMARY TABLES]
-- 3) Amount of messages in each chat
create or replace view msg_in_chat as
select distinct c.chat_id, chat_nm, count(message_id) over(partition by c.chat_id) as msg_amount
from project.message m inner join project.chat c
on m.chat_id = c.chat_id
group by c.chat_id, message_id;

-- 4) Usage statistics for stickers
create or replace view sticker_stats as
select sticker_id, 
       user_cnt,  
       lag(user_cnt, 1, NULL) over (order by user_cnt desc) as prev_sticker_usage,
	   lead(user_cnt, 1, NULL) over (order by user_cnt desc) as next_sticker_usage
from 
(
	select s.sticker_id, count(user_id) as user_cnt from 
	project.sticker s left join project.user_x_sticker uxs
	on s.sticker_id = uxs.sticker_id
	group by s.sticker_id
) as usage_counted;

-- 5) Top 3 most active users in each chat
-- Let's give them awards like in Yandex Music
create or replace view active_users as
select user_id, user_nm, chat_nm, row_number() over(partition by chat_id order by message_cnt) as place
from 
(
	select distinct user_id, c.chat_id, c.chat_nm , user_nm, count(message_id) over(partition by c.chat_id) as message_cnt
	from project.user u left join project.message m 
	on m.sender_id = u.user_id left join project.chat c 
	on m.chat_id = c.chat_id
	group by user_id, c.chat_id, m.message_id
) as messages_counted;

-- 6) Most popular bots
create view popular_bots as
select distinct b.bot_id, bot_nm, count(chat_id) over(partition by b.bot_id)
from project.bot b inner join project.bot_x_chat bxc on b.bot_id = bxc.bot_id
order by count(chat_id) over(partition by b.bot_id) desc;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- //////////////////////////////////////////////////////
--                   CHECKPOINT 9-10
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

create trigger create_avatar
after insert on project.user 
begin 
	update project.avatar set avatar_id = 1
		where project.user.user_id = new.user_id;
end;

create trigger call_people
after insert on project.call for each row 
begin 
	update project.message set payload_txt = 'Присоединиться к звонку'
	where 
	insert into project.message values (default, 0, default, now()::date, 1, 'Присоединиться к звонку');
end;

select * from project.avatar;

--drop procedure create_bot;

--
create or replace procedure create_bot(new_name varchar)
language plpgsql 
as $$
begin
	insert into project.bot values (default, 'http://www.bot_father', new_name, NULL);
end
$$;

call create_bot('the best name');

--
create or replace procedure update_url(id_bot integer, new_url varchar)
language plpgsql 
as $$
begin
	if new_url like 'http://www.%' then 
		update project.bot set server_url = new_url
		where bot_id = 1;
	end if;
end	
$$;

call update_url(1, 'http://www.NEW_url');