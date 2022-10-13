create table if not exists GENRE(
ID SERIAL primary key,
TITLE VARCHAR(60) UNIQUE not null  
);

create table if not exists EXECUTOR(
ID SERIAL primary key,
NAME VARCHAR(60) not NULL
);

create table if not exists COMPILATION(
ID SERIAL primary key,
TITLE VARCHAR(60) not null,
YEAR_OF_ISSUE INTEGER check (year_of_issue>1600 and year_of_issue<5000)
);

create table if not exists ALBUM(
ID SERIAL primary key,
TITLE VARCHAR(60) not null,
year_of_issue INTEGER check (year_of_issue>1600 and year_of_issue<5000)
);

create table if not exists TRACK(
ID SERIAL primary key,
TITLE VARCHAR(60) not null,
DURATION integer check (duration<300 and duration>90),
ALBUM_ID INTEGER not null references ALBUM(ID)
);

create table if not exists GENREEXECUTOR(
GENRE_ID INTEGER references GENRE(ID),
EXECUTOR_ID INTEGER references EXECUTOR(ID),
constraint PK primary key (GENRE_ID, EXECUTOR_ID)
);

create table if not exists ALBUMEXECUTOR(
ALBUM_ID INTEGER references ALBUM(ID),
EXECUTOR_ID INTEGER references EXECUTOR(ID),
constraint PK1 primary key (ALBUM_ID, EXECUTOR_ID)
);

create table if not exists TRACKCOMPILATION(
TRACK_ID INTEGER references TRACK(ID),
COMPILATION_ID INTEGER references COMPILATION(ID),
constraint PK2 primary key (TRACK_ID, COMPILATION_ID)
);
