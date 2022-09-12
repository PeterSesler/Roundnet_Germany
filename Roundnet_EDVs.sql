
--- Clubs in Total
SELECT COUNT(*)
FROM club;

--- Player in total
SELECT COUNT (*)
FROM player_club;


WHERE club_name IS NOT NULL;

--- Player with a club
SELECT COUNT (*)
FROM player_club
WHERE club_name IS NOT NULL;

--- Player with a RG membership is a bit complicated and will be done, if the need it: its complicated as they are automaticly member if their club is a member


---biggest clubs: 
SELECT club_name,
COUNT (*)
FROM player_club
WHERE club_name IS NOT NULL
GROUP BY club_name
ORDER BY COUNT (*)DESC;

---How many clubs have Insta: 
SELECT COUNT (*)
FROM club 
WHERE club_insta IS NOT NULL;

---gender of the player 

SELECT COUNT (*)
FROM player_club
WHERE player_gender ='m' ;

SELECT COUNT (*)
FROM player_club
WHERE player_gender ='f' ;

--- active since auf jahren gesplittet

SELECT COUNT (*)
FROM player_club
WHERE active_since = 2015;

SELECT COUNT (*)
FROM player_club
WHERE active_since = 2016;

SELECT COUNT (*)
FROM player_club
WHERE active_since = 2017;

SELECT COUNT (*)
FROM player_club
WHERE active_since = 2018;

SELECT COUNT (*)
FROM player_club
WHERE active_since = 2019;

SELECT COUNT (*)
FROM player_club
WHERE active_since = 2020;

SELECT COUNT (*)
FROM player_club
WHERE active_since = 2021;

SELECT COUNT (*)
FROM player_club
WHERE active_since = 2022;

--- MAX and MIN Age

SELECT MAX (birth_date),
first_name,
last_name
FROM player_club
WHERE birth_date IS NOT NULL
GROUP BY first_name, last_name;

---Average Age

SELECT AVG(2022 -(EXTRACT(YEAR FROM birth_date)))
FROM player_club;

--- der typische roundnet player is 26 Jahre alt

--- Insta von spielern angegeben

SELECT COUNT (*)
FROM player_club
WHERE player_insta IS NOT NULL;

---  how many players played a turnament where to get rg-elo-points

SELECT COUNT (*)
FROM player_club
WHERE player_rg_elo IS NOT NULL;

--- how many players have highest and lowest rg_elo separated by gender

SELECT first_name,
last_name,
player_rg_elo,
player_elo_games_total
FROM player_club
WHERE player_rg_elo IS NOT NULL AND player_gender ='f'
ORDER BY player_rg_elo DESC;


SELECT first_name,
last_name,
player_rg_elo,
player_elo_games_total
FROM player_club
WHERE player_rg_elo IS NOT NULL AND player_gender ='m'
ORDER BY player_rg_elo DESC;

--- player with most elo games

SELECT first_name,
last_name,
player_rg_elo,
player_elo_games_total
FROM player_club
WHERE player_rg_elo IS NOT NULL AND player_gender ='m'
ORDER BY player_elo_games_total DESC;


SELECT first_name,
last_name,
player_rg_elo,
player_elo_games_total
FROM player_club
WHERE player_rg_elo IS NOT NULL AND player_gender ='f'
ORDER BY player_elo_games_total DESC;

--- how many players we have in the seperate elo division: as reminder: 1= Beginner, 2= Intermediate, 3= Advanced, 4= Pro

SELECT COUNT (*)
FROM player_club 
WHERE elo_division = 1;

SELECT COUNT (*)
FROM player_club 
WHERE elo_division = 2
;


SELECT COUNT (*)
FROM player_club 
WHERE elo_division = 3;


SELECT COUNT (*)
FROM player_club 
WHERE elo_division = 4;


--- How many teams who participate in tournaments in total do we have? 

SELECT COUNT (*)/2
FROM roundnet_tournament;

--- we have 3.952 teams 

--- how many different teams do exist?

SELECT COUNT (DISTINCT team_name)
FROM roundnet_tournament;

--- we have 3.266 unique team combinations playing in the tournament

--- which are the most doues playing together ?

---MEN

SELECT team_name,
COUNT(team_name)*2 AS tournaments_played,
first_name,
last_name,
player_city_estimated
FROM roundnet_tournament 
WHERE division ='Men' AND (team_name IS NOT NULL OR team_name !=' ')
GROUP BY team_name, first_name, last_name, player_city_estimated 
ORDER BY COUNT(team_name) DESC;


--- keep in mind on this table that only team_names who appear twice make sence to think about. it can be that one player uses the same team_name for different partners 

---WOMEN

SELECT team_name,
COUNT(team_name)*2 AS tournaments_played,
first_name,
last_name, 
player_city_estimated 
FROM roundnet_tournament 
WHERE (division ='Women' OR division ='Mixed & Women') AND (team_name IS NOT NULL OR team_name !=' ')
GROUP BY team_name, first_name, last_name, player_city_estimated 
ORDER BY COUNT(team_name) DESC;

--- MIXED

SELECT team_name,
COUNT(team_name) AS tournaments_played,
first_name,
last_name, 
player_city_estimated 
FROM roundnet_tournament 
WHERE (division ='Mixed' OR division ='Mixed & Women') AND (team_name IS NOT NULL OR team_name !=' ')
GROUP BY team_name, first_name, last_name, player_city_estimated 
ORDER BY COUNT(team_name) DESC;

-- in addition we can add a where clause for only tournaments with rankings or choosing the roundnet_ranking table 


--- How Many tournaments do we have? 

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament;

--- We habe 74 tournaments in our List 

-- now we wanna devide this number into the number of divisions

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE division = 'Men';

--- we have 34 tournaments with a male devision

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE division = 'Women';

--- we have 20 tournaments with a Women division

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE division = 'Mixed';

--- We have 40 tournaments with a Mixed division

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE division = 'Open';

---we havew 23 tournaments with an Open division

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE division = 'Mixed & Women';

--- and last but not least 5 


--- now we wanna now the years the tournament take place in / will do it the next days

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE EXTRACT(YEAR FROM date) = 2016;

--- we have one tournament in 2016

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE EXTRACT(YEAR FROM date) = 2017;

--- we have 0 tournaments in 2017

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE EXTRACT(YEAR FROM date) = 2018;

--- we have 3 tournaments in 2018

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE EXTRACT(YEAR FROM date) = 2019;

--- we have 14 tournaments in 2019

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE EXTRACT(YEAR FROM date) = 2020;

--- we have 9 tournaments in 2020 (care about Corona)

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE EXTRACT(YEAR FROM date) = 2021;

--- we have 16 tournaments in 2021

SELECT COUNT (DISTINCT event_name)
FROM roundnet_tournament
WHERE EXTRACT(YEAR FROM date) = 2022;

--- we already hat 32 tournaments in 2022 (date 16.08.2022)


---- there are the most tournaments are played? 

SELECT COUNT (DISTINCT event_name),
rt.location
FROM roundnet_tournament rt
GROUP BY rt.location;

--- its a quiet fair community as everyone seems to arange some tournaments


--- how many tournaments with a ranking are there? 

SELECT COUNT (DISTINCT event_name)
FROM roundnet_ranking;

--- we have 35 tournaments with a ranking
