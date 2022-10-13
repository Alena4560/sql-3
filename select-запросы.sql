select GENRE.TITLE, COUNT(EXECUTOR.NAME) from GENRE 
join GENREEXECUTOR on GENRE.ID=GENRE_ID 
join EXECUTOR on EXECUTOR_ID=EXECUTOR.ID
group by GENRE.TITLE;

select COUNT(TRACK.TITLE) from TRACK 
join ALBUM on ALBUM_ID = ALBUM.ID 
where ALBUM.YEAR_OF_ISSUE BETWEEN 2019 and 2020;

select AVG(DURATION), ALBUM.TITLE from TRACK 
join ALBUM on ALBUM_ID = ALBUM.ID 
GROUP BY ALBUM.TITLE;

select NAME from EXECUTOR where NAME not in
(select name from executor 
JOIN albumexecutor on EXECUTOR.id = EXECUTOR_ID 
JOIN album on album_ID = ALBUM.ID 
WHERE ALBUM.year_of_issue = 2020);

select C.title from COMPILATION as C
join TRACKCOMPILATION as TC on c.ID = TC.COMPILATION_ID
join TRACK as T on TRACK_ID=T.ID
join ALBUMEXECUTOR as AE on T.ALBUM_ID=AE.ALBUM_ID
join EXECUTOR as E on AE.EXECUTOR_ID=E.ID
where NAME = 'Modern Talking';

select TITLE from ALBUM 
join ALBUMEXECUTOR on ALBUM.ID = ALBUM_ID 
join EXECUTOR on EXECUTOR_ID=EXECUTOR.ID
join GENREEXECUTOR on EXECUTOR.ID=GENRE_ID
group by ALBUM.TITLE
having (COUNT(GENREEXECUTOR.GENRE_ID) > 1);

select T.title from TRACK T 
left join COMPILATION C on T.ID = C.ID 
where C.ID is null;

select name from executor 
JOIN ALBUMEXECUTOR on EXECUTOR.ID=EXECUTOR_ID  
join ALBUM on ALBUM_ID=ALBUM.ID
join TRACK on ALBUM.ID=TRACK.ALBUM_ID
where DURATION =
(select MIN(DURATION) from TRACK);

select ALBUM.TITLE from ALBUM 
join TRACK on ALBUM.ID=TRACK.album_id 
group by ALBUM.TITLE
having count(track.id) = 
(select count(TRACK) from ALBUM 
join TRACK on ALBUM.ID=TRACK.album_id 
group by ALBUM.TITLE
order BY count(TRACK)
limit 1);