--Задание 2

select title, duration from song
where duration = (
select max(duration)
from song
)

select title from song
where duration >= '00:03:30'

select title from collection 
where '2018' < year_of_release  and year_of_release < 2020

select nickname from executor 
where nickname not like '% %'

select title from song
where title like '%my%'

--Задание 3

select g.title, COUNT(ex.nickname)
from genre as g 
left join genre_executor as ge on g.id = ge.genre_id
left join executor as ex on ge.executor_id = ex.id 
group by g.title 
order by count(ex.id) DESC 

select al.year_of_release, count(s.title) 
from album as al
left join song as s on al.id=s.id
where al.year_of_release < 2021 and al.year_of_release > 2018
group by al.year_of_release
order by count(s.id)

select al.title, AVG(s.duration)
from album as al
left join song as s on al.id=s.id
group by al.title 
order by AVG(s.duration)

select distinct ex.nickname
from executor as ex
where ex.nickname not in(
select distinct ex.nickname
from executor as ex
left join executor_album as ex_al on ex.id = ex_al.executor_id
left join album as al on al.id = ex_al.album_id
where al.year_of_release = 2020
)
order by ex.nickname

select cl.title 
from collection as cl
left join song_collection as s_cl on cl.id = s_cl.colletion_id 
left join song as s on s_cl.song_id = s.id 
left join album as al on s.id = al.id 
left join executor_album as ex_al on al.id = ex_al.album_id 
left join executor as ex on ex_al.executor_id = ex.id 
where nickname like '%Davis%'