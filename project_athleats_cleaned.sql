
show variables like 'secure_file_priv';
create database sessn8;

use sessn8;

create table olympics1
(
ID	int, 
Name varchar(400),
Sex	char(2),
Age int,
Height int,
Weight int,
Team varchar(400),
NOC	varchar(400),
Games varchar(400),
Year int,
Season varchar(400),
City varchar(400),
Sport varchar(400),
Event varchar(400),
Medal varchar(200)
);

select * from olympics1;




load data infile "C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/Athletes_Cleaned.csv"
into table olympics1
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics1
limit 5;


select count(*) from olympics1;


-- display countries who secured gold

select medal,count(medal) as medalcount
from olympics1
group by medal;


select * from olympics1
where medal="Gold";
-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select count(medal) as medalcount,medal
from olympics1
where medal<>'nomedal'
group by medal;
select count(medal) as Medal_Count,Medal 
from olympics1
group by medal;
-- 2. Show count of unique sports present in Olympics
select count(distinct(sport)) as countsport
from olympics1;

-- 3. Show how many different medals won by team India
select medal,count(medal) as medalcount
from olympics1
where team='india' and medal<>'nonmedal'
group by medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select team, count(medal) as countmedal,event
from olympics1
where team='india' and medal<>'nonmedal'
group by event
order by countmedal desc;

-- 5. Show event wise medals won by India in order of year
select team,count(medal) as countmedal,event,year
from olympics1
where (team='india' and medal<>'nomedal')
group by event,year
order by year asc;

-- 6. show country who won maximum medals.
select team,count(medal) as countmedal
from olympics1
where medal<>'nomedal'
group by team
order by countmedal desc
limit 1;


-- 7.show top 10 countries who won gold
select count(medal) as countmedal,team
from olympics1
where medal ='gold'
group by team
order by countmedal desc
limit 10;



--  8. show in which year did United states won most gold medal



-- 9. In which sports United States has most medals.
select count(medal) as countmedal,sport,team
from olympics1
where team='united states' and medal<>'nomedal'
group by sport
order by countmedal desc
limit 1;

-- 10. Find top three players who won most medals along with their sports and country
select count(medal) as countmedal,name,sport,team
from olympics1
group by name,sport,team
order by countmedal desc
limit 3;

-- 11. Find player with most gold medals in cycling along with his country.
select count(medal) as countmedal,name,team , sport
from olympics1
where medal='gold' and sport='cycling'
group by name,team
order by countmedal desc
limit 1;

-- Q12. Find out the count of different medals of the top basketball player Teresa Edwards with his country
select count(medal) as countmedal,team,medal
from olympics1
where medal<>'nomedal' and name='teresa edwards'
group by team,medal
order by countmedal desc;


-- 13.Find Top 7 players with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select count(medal) as countmedal,name,team,medal
from olympics1
where medal<>'nomedal' and sport='basketball'
group by name,team,medal
order by countmedal desc
limit 7;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select count(medal) as medalcount,sex,year
from olympics1
where medal<>'nomedal'
group by sex,year
order by year desc;


show variables like 'secure_file_priv';