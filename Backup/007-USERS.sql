create table USERS
(
	USER_ID NUMBER generated as identity,
	USER_NAME VARCHAR2(50 char) not null,
	USER_PASSWORD VARCHAR2(100 char) not null,
	USER_EMAIL VARCHAR2(60 char) not null,
	USER_YT_ID VARCHAR2(50 char) not null
)
/

create unique index USERS_USER_YT_ID_UINDEX
	on USERS (USER_YT_ID)
/

create unique index USERS_USER_ID_UINDEX
	on USERS (USER_ID)
/

create unique index USERS_USER_NAME_UINDEX
	on USERS (USER_NAME)
/

alter table USERS
	add constraint USERS_PK
		primary key (USER_ID)
/

