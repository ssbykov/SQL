--количество исполнителей в каждом жанре
SELECT g.name, COUNT(*) FROM genre g
JOIN genre_artist ga ON g.id = ga.genre_id
JOIN artist a ON ga.artist_id = a.id 
GROUP BY g.name;
--количество треков, вошедших в альбомы 2019-2020 годов
SELECT count(*) FROM track t 
JOIN music_album ma ON t.album_id  = ma.id
WHERE ma.year BETWEEN 2019 AND 2020;
--средняя продолжительность треков по каждому альбом
SELECT ma.name, round(avg(t.time), 2)  FROM music_album ma  
JOIN track t ON ma.id = t.album_id 
GROUP BY ma.name;
--все исполнители, которые не выпустили альбомы в 2020 году
SELECT a.name FROM artist a 
WHERE a.name NOT IN (
SELECT a.name FROM artist a 
JOIN artist_album aa ON a.id = aa.artist_id 
JOIN music_album ma ON aa.album_id = ma.id 
WHERE ma.year = 2020
);
--названия сборников, в которых присутствует конкретный исполнитель (Pink Floyd)
SELECT mc.name  FROM music_collection mc 
JOIN track_collection tc ON mc.id = tc.collection_id 
JOIN track t ON tc.track_id = t.id 
JOIN music_album ma ON t.album_id = ma.id 
JOIN artist_album aa ON ma.id = aa.album_id 
JOIN artist a ON aa.artist_id = a.id 
WHERE a.name = 'Pink Floyd'
GROUP BY mc.name;
--название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT ma.name FROM music_album ma 
JOIN artist_album aa ON ma.id = aa.album_id 
JOIN artist a2 ON aa.artist_id = a2.id 
JOIN genre_artist ga2 ON a2.id = ga2.artist_id 
WHERE ga2.artist_id IN (
SELECT a.id FROM artist a
JOIN genre_artist ga ON a.id = ga.artist_id 
GROUP BY a.id
HAVING COUNT(*) > 1)
GROUP BY ma.name;
--наименование треков, которые не входят в сборники
SELECT t.name FROM track t 
WHERE t.id NOT IN (SELECT tc.track_id FROM track_collection tc);
--исполнителя(-ей), написавшего самый короткий по продолжительности трек
SELECT a.name FROM artist a 
JOIN artist_album aa ON a.id = aa.artist_id 
JOIN music_album ma ON aa.album_id = ma.id 
JOIN track t ON ma.id = t.album_id
WHERE t.time = (SELECT min(t2.time) FROM track t2);
--название альбомов, содержащих наименьшее количество треков
WITH ma_t AS (
SELECT ma.name,count(*) FROM music_album ma
JOIN track t ON ma.id = t.album_id
GROUP BY ma.name)
SELECT * FROM ma_t
WHERE count = (SELECT count FROM ma_t
ORDER BY count
LIMIT 1); 
