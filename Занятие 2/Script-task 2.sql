create table if not exists genre (
	id serial primary key,
	name varchar(50) not null unique
);
create table if not exists artist (id serial primary key,
	name varchar(255) not null,
	nickname varchar(255),
	genre_id integer references genre(id)
);
create table if not exists music_album (id serial primary key,
	name varchar(255) not null,
	year integer,
	artist_id integer references artist(id)
);
create table if not exists track (id serial primary key,
	name varchar(255) not null,
	time time,
	album_id integer references music_album(id)
);
