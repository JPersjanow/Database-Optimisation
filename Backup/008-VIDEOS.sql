create table VIDEOS
(
	VIDEO_ID NUMBER generated as identity,
	VIDEO_NAME VARCHAR2(50 char) not null,
	VIDEO_DESCRIPTION CLOB not null,
	VIDEO_TAGS BLOB,
	NUM_LIKES NUMBER,
	NUM_COMMENTS NUMBER,
	VIDEOSCOL VARCHAR2(45 char)
)
/

create unique index VIDEOS_VIDEO_ID_UINDEX
	on VIDEOS (VIDEO_ID)
/

alter table VIDEOS
	add constraint VIDEOS_PK
		primary key (VIDEO_ID)
/

