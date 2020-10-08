create table USER_HAVE_VIDEOS
(
	USER_ID NUMBER not null
		constraint USER_HAVE_VIDEOS_USERS_USER_ID_FK
			references USERS
				on delete cascade,
	VIDEO_ID NUMBER not null
		constraint USER_HAVE_VIDEOS_VIDEOS_VIDEO_ID_FK
			references VIDEOS
)
/

