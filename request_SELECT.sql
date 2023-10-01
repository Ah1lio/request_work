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
