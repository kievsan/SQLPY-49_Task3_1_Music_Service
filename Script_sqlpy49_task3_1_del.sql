--[SQLPY-49] 3. ДЗ-1 Музыкальный сервис 
--Домашнее задание к лекции «Проектирование БД. Связи. 3НФ»

set schema 'sqlpy49_task3_1';

--УДАЛИМ ОТНОШЕНИЯ:

drop table genre_into_artist;
drop table artist_into_album;
drop table track_into_collection;

drop table music_genres;
drop table music_tracks;
drop table music_collections;
drop table music_artists;
drop table music_albums;
