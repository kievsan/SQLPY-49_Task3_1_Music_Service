--[SQLPY-49] 3. ��-1 ����������� ������ 
--�������� ������� � ������ ��������������� ��. �����. 3�Ի

--�������� ���������:

--3.1.1. �������� ���� ���.������ music_genres 
create table if not exists sqlpy49_task3_1.music_genres(
	genre_id serial primary key,
	genre_name text not null unique
);

--3.1.2 �������� ���� ������ music_artists 
create table if not exists sqlpy49_task3_1.music_artists(
	artist_id serial primary key,
	artist_name text not null unique
);

--3.1.3. �������� ���� �������� ���.�������� music_albums 
create table if not exists sqlpy49_task3_1.music_albums(
	album_id serial primary key,
	album_name text not null unique,
	album_release_year numeric(4)
);

--3.1.4. �������� ���� ���.������ � ������� music_tracks 
create table if not exists sqlpy49_task3_1.music_tracks(
	track_id serial primary key,
	track_name text not null unique,
	track_duration numeric(4)
);

--3.1.5. �������� ���� �������� ���.��������� music_collections 
create table if not exists sqlpy49_task3_1.music_collections(
	collection_id serial primary key,
	collection_name text not null unique,
	collection_release_year numeric(4)
);


-- �������� �����:

--3.1.6. ������� � ����.������ ���-� ����.����� ��� ������� � ���������
alter table sqlpy49_task3_1.music_tracks 
	add column album_id integer
	references sqlpy49_task3_1.music_albums;

--3.1.7. �������� ����-������ genre_into_artist ��� ������ ������ � ������ 
create table if not exists sqlpy49_task3_1.genre_into_artist(
	genre_id integer references sqlpy49_task3_1.music_genres(genre_id) ,
	artist_id integer references sqlpy49_task3_1.music_artists(artist_id) ,
	constraint pk_artist_into_genre primary key (genre_id , artist_id)
);

--3.1.8. �������� ����-������ artist_into_album ��� ������ �������� � ������ 
create table if not exists sqlpy49_task3_1.artist_into_album(
	album_id integer references sqlpy49_task3_1.music_albums(album_id) ,
	artist_id integer references sqlpy49_task3_1.music_artists(artist_id) ,
	constraint pk_artist_into_album primary key (album_id , artist_id)
);

--3.1.9. �������� ����-������ track_into_collection ��� ������ �������� � ������ 
create table if not exists sqlpy49_task3_1.track_into_collection(
	collection_id integer references sqlpy49_task3_1.music_collections(collection_id) ,
	track_id integer references sqlpy49_task3_1.music_tracks (track_id) ,
	constraint pk_track_into_collection primary key (collection_id , track_id)
);



