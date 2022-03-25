create table if not exists genre (
	id serial primary key,
	name varchar(50) not null unique
);
create table if not exists artist (
	id serial primary key,
	name varchar(255) not null,
	nickname varchar(255)
);
create table if not exists music_album (
	id serial primary key,
	name varchar(255) not null,
	year integer
);
create table if not exists music_collection (
	id serial primary key,
	name varchar(255) not null,
	year integer
);
create table if not exists track (
	id serial primary key,
	name varchar(255) not null,
	time integer,
	album_id integer references music_album(id)
);
create table if not exists genre_artist (
	genre_id integer references genre(id),
	artist_id integer references artist(id),
	constraint genre_artist_pk primary key (genre_id, artist_id)
);
create table if not exists artist_album (
	artist_id integer references artist(id),
	album_id integer references music_album(id),
	constraint artist_album_pk primary key (artist_id, album_id)
);
create table if not exists track_collection (
	id serial primary key,
	track_id integer references track(id),
	collection_id integer references music_collection(id)
);
	

