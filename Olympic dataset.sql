 --Number Olympics games have been held?
select count(distinct games) as GameCount
from OlympicGames;

--List down all Olympic games held sofar
select distinct games as games
from OlympicGames;

-- the total number of Nations who participated in each Olympics game
with t1 as
(select distinct games,noc
	from OlympicGames
	where Season = 'summer'),
t2 as
(select region,NOC
	from regions)
select games,count(*)as region
from t1
join t2 ON t2.NOC = t1.NOC
group by Games
order by Games;

-- Fetch details of the oldest athletes to win a gold medal
SELECT distinct(name),sex,age,team,sport
from OlympicGames
where Age =(select max(age) from OlympicGames where medal = 'gold');

-- Fetch details of the youngest athletes to win a gold medal
select distinct(name),sex,age,team,sport
from olympicgames
where age = (select min(age) from Olympicgames where medal = 'gold');

