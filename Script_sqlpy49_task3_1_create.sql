--[SQLPY-49] 3. ДЗ-1 Музыкальный сервис 
--Домашнее задание к лекции «Проектирование БД. Связи. 3НФ»

--СОЗДАДИМ ОТНОШЕНИЯ:

--3.1.1. создадим табл муз.жанров music_genres 
create table if not exists sqlpy49_task3_1.music_genres(
	genre_id serial primary key,
	genre_name text not null unique
);

--3.1.2 создадим табл певцов music_artists 
create table if not exists sqlpy49_task3_1.music_artists(
	artist_id serial primary key,
	artist_name text not null unique
);

--3.1.3. создадим табл вышедших муз.альбомов music_albums 
create table if not exists sqlpy49_task3_1.music_albums(
	album_id serial primary key,
	album_name text not null,
	album_release_year numeric(4)
);

--3.1.4. создадим табл муз.треков в альбоме music_tracks 
create table if not exists sqlpy49_task3_1.music_tracks(
	track_id serial primary key,
	track_name text not null,
	track_duration numeric(4)
);

--3.1.5. создадим табл вышедших муз.сборников music_collections 
create table if not exists sqlpy49_task3_1.music_collections(
	collection_id serial primary key,
	collection_name text not null,
	collection_release_year numeric(4)
);


-- ПОСТРОИМ СВЯЗИ:

--3.1.6. добавим в табл.треков огр-е внеш.ключа для столбца с альбомами
alter table sqlpy49_task3_1.music_tracks 
	add column album_id integer
	references sqlpy49_task3_1.music_albums;

--3.1.7. создадим табл-связей genre_into_artist для таблиц певцов и жанров 
create table if not exists sqlpy49_task3_1.genre_into_artist(
	genre_id integer references sqlpy49_task3_1.music_genres(genre_id) ,
	artist_id integer references sqlpy49_task3_1.music_artists(artist_id) ,
	constraint pk_artist_into_genre primary key (genre_id , artist_id)
);

--3.1.8. создадим табл-связей artist_into_album для таблиц альбомов и певцов 
create table if not exists sqlpy49_task3_1.artist_into_album(
	album_id integer references sqlpy49_task3_1.music_albums(album_id) ,
	artist_id integer references sqlpy49_task3_1.music_artists(artist_id) ,
	constraint pk_artist_into_album primary key (album_id , artist_id)
);

--3.1.9. создадим табл-связей track_into_collection для таблиц альбомов и певцов 
create table if not exists sqlpy49_task3_1.track_into_collection(
	collection_id integer references sqlpy49_task3_1.music_collections(collection_id) ,
	track_id integer references sqlpy49_task3_1.music_tracks (track_id) ,
	constraint pk_track_into_collection primary key (collection_id , track_id)
);



