create table COMMENTS
(
	COMMENT_ID NUMBER generated as identity,
	COMMENT_CONTENT CLOB not null,
	VIDEO_ID NUMBER not null
		constraint COMMENTS_VIDEOS_VIDEO_ID_FK
			references VIDEOS,
	USER_ID NUMBER not null
		constraint COMMENTS_USERS_USER_ID_FK
			references USERS
)
/

create unique index COMMENTS_COMMENT_ID_UINDEX
	on COMMENTS (COMMENT_ID)
/

alter table COMMENTS
	add constraint COMMENTS_PK
		primary key (COMMENT_ID)
/

