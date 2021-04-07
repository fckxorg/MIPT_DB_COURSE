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
values (default, 'http://cdn.messenger.com/avatar/avatar_blob_2387.png');


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
values (default, 'http://fancybot.ru/', 'Timetable Bot', 13);
insert into project.bot (bot_id, server_url, bot_nm, avatar_id)
values (default, 'http://flibusta.net/', 'Library Bot', 14);
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
values (default, 15, 120, 'concurrency-chat-support-2021');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, 16, 210, 'БД ФПМИ');
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
values (default, 17, 330, 'Phystech.Genesis');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 197, 'Hackathon Winners');
insert into project.chat (chat_id, avatar_id, members_cnt, chat_nm)
values (default, NULL, 1, 'Saved Messages');

select * from project.chat;
select * from project.user;

-- USER INSERTIONS
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@fckxorg', 'max.kokr@somemail.com', 18, 'Another un-innocent elegant fall into the un-magnificent life of adults', '+77895341231', 'Maxim Kokryashkin');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@AlgebraicWolf', 'test@test.com', 19, 'Life without cringe is worthless', '+74951201851', 'Alexei VoLkOv');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@BorisTab', null, null, null, '+79833211893', 'Boris Tabachnikov');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Alice', null, null, 'my face feels bigger than usual', '+79033811893', 'Alice');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@a.ershov', 'andrei.ershov@mipt.ru', null, 'А вы вводили понятие идеала?', '+78037651312', 'Andrei Ershov');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Bob', 'bob@protonmail.com', null, 'Nothing fancy here', '+79235311893', 'Bob');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Shisqa', 'shishatskiy.m@phystech.edu', 20, 'MIPT student', '+798322198993', 'Mikhail Shishatskiy');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@realDonaldTrump', 'mr.president@us.gov', 21, 'Make America great again', '+1345789312', 'Donald Trump');
insert into project.user (user_id, handle_txt, email_txt, avatar_id, bio_txt, phone_no, user_nm)
values (default, '@Putin', 'vvp@kremlin.ru', 22, 'F*ck Navalny', '+79000000000', 'Vladimir Putin');
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
values (default, 0, 2, 11, null, '2021-04-03 13:59:29', 'Кто не сдас проект, тот сдохнет, получается...');


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
values (14, 1);
insert into project.bot_x_chat (bot_id, chat_id)
values (13, 7);
insert into project.bot_x_chat (bot_id, chat_id)
values (14, 7);
insert into project.bot_x_chat (bot_id, chat_id)
values (16, 3);


-- CALL INSERTS
insert into project.call (call_id, chat_id, duration_sec, video_flg, record_url)
values(default, 4, '01:00:00', true, 'mail.zoom.us/meetings/meeting-2031.mp4');
insert into project.call(call_id, chat_id, duration_sec, video_flg, record_url)
values(default, 1, '01:30:00', true, 'youtube.com/lectoriy_diht/tpcc/spring-2021-11.mp4');
insert into project.call(call_id, chat_id, duration_sec, video_flg, record_url)
values(default, 3, '00:10:00', false, null);