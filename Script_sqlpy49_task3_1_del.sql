--[SQLPY-49] 3. ДЗ-1 Музыкальный сервис 
--Домашнее задание к лекции «Проектирование БД. Связи. 3НФ»

set schema 'sqlpy49_task3_1';

--УДАЛИМ ОТНОШЕНИЯ:

drop table if exists genre_into_artist;
drop table if exists artist_into_album;
drop table if exists track_into_collection;

drop table if exists music_genres;
drop table if exists music_tracks;
drop table if exists music_collections;
drop table if exists music_artists;
drop table if exists music_albums;
