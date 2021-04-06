-- ------------------------------------------------------
-- MIPT Databases course project 
-- (c) 2021 fckxorg
-- MIT LICENSE
-- ------------------------------------------------------


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- //////////////////////////////////////////////////////
--         			DDL SCRIPTS
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- PROJECT SCHEMA
create schema if not exists project;

-- AVATAR TABLE
create table project.avatar 
(
	avatar_id  		serial 			primary key,
	avatar_url 		varchar(2048) 	not null 			-- 2048 is a maximum allowed size of http address
);

-- USER TABLE
create table project.user
(
	user_id 		serial 			primary key,
	handle_txt 		varchar(256) 	not null unique,	-- Each user MUST have unique handle
											 	 		-- Limit of 256 characters is a common limit for handles
	email_txt		varchar(320) 	unique,
	avatar_id		integer			references project.avatar(avatar_id),
	bio_txt			text,
	phone_no		varchar(20)		not null unique,	-- Each user must have phone number, 20 digits should be enough for everyone
	user_nm			varchar(256)	not null
);

-- STICKER TABLE
create table project.sticker
(
	sticker_id		serial			primary key,
	emotion_nm		varchar(256)	not null,
	picture_url		varchar(2048)	not null			-- 2048 is a maximum allowed size of http address
); 

-- CHAT TABLE
create table project.chat
(
	chat_id			serial			primary key,
	avatar_id		integer			references project.avatar(avatar_id),
	members_cnt		integer			not null
);

-- MESSAGE TABLE
create table project.message
(
	message_id		serial,
	version_no		integer,
	chat_id			integer			not null references project.chat(chat_id),
	sender_id		integer			not null references project.user(user_id),
	sticker_id		integer			references project.sticker(sticker_id),
	timestamp_dttm	timestamp		not null,
	payload_txt		text
);

alter table project.message 
add constraint PK_message primary key (message_id, version_no);

-- CALL TABLE
create table project.call
(
	call_id			serial			primary key,
	chat_id			integer			not null references project.chat(chat_id),
	duration_sec	interval		not null,
	video_flg		boolean,
	record_url		varchar(2048) 						-- 2048 is a maximum allowed size of http address
);

-- BOT TABLE
create table project.bot
(
	bot_id			serial			primary key,
	server_url		varchar(2048)	not null, 			-- 2048 is a maximum allowed size of http address
	bot_nm			varchar(256)	not null,
	avatar_id		integer			references project.avatar(avatar_id)
);

-- ATTACHMENT TABLE
create table project.attachment
(
	attachment_id	serial			primary key,
	message_id		integer,
	version_no		integer,
	type_txt		varchar(20)		not null,			-- file extension
	file_url		varchar(2048)	not null, 			-- 2048 is a maximum allowed size of http address
	size_amt		integer								-- file size in bytes
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