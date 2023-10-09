create table if not exists Genre (
id SERIAL primary key,
title varchar(100) not null
);

create table if not exists Executor ( 
id SERIAL primary key,
nickname varchar(100) not null
);

create table if not exists Genre_Executor (
genre_id INTEGER references Genre(id),
executor_id INTEGER references Executor(id),
constraint ge primary key (genre_id, executor_id)
);


create table if not exists Album (
id SERIAL primary key,
title varchar(100) not null,
year_of_release int
);

create table if not exists Executor_Album (
executor_id INTEGER references Executor(id),
album_id INTEGER references Album(id),
constraint exal primary key (executor_id, album_id)
);

create table if not exists Song (
id SERIAL primary key,
title varchar(100) not null,
duration time,
album_id INTEGER not null references Album(id)
);

create table if not exists Collection (
id SERIAL primary key,
title varchar(100) not null,
year_of_release int
);

create table if not exists Song_Collection (
song_id INTEGER references Song(id),
colletion_id INTEGER references Collection(id),
constraint sc primary key (song_id, colletion_id)
);