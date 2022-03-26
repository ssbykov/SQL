-- название и год выхода альбомов, вышедших в 2018 году
SELECT name  FROM music_album WHERE year = 2018;
-- название и продолжительность самого длительного трека (2 способа)
SELECT name, time FROM track WHERE time = (SELECT MAX(time) FROM track);
SELECT name, time FROM track ORDER BY time DESC LIMIT 1;
-- название треков, продолжительность которых не менее 3,5 минуты (210 секунд)
SELECT name, time FROM track WHERE time >= 210;
-- названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name FROM music_collection WHERE year BETWEEN 2018 AND 2020;
--исполнители, чье имя состоит из 1 слова
SELECT name FROM artist WHERE name NOT LIKE '% %';
--название треков, которые содержат слово "мой"/"my"
SELECT name FROM track WHERE name LIKE '%мой%' OR name LIKE '%my%';