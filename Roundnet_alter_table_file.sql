--first taking the ranking_player table, creating a copy ('player') and deleting the columns we don't need in the new table

CREATE TABLE IF NOT EXISTS player AS 
SELECT *
FROM ranking_player; 

SELECT * 
FROM player;

ALTER TABLE player
DROP COLUMN IF EXISTS display_name,
DROP COLUMN IF EXISTS nick_name,
DROP COLUMN IF EXISTS slug,
DROP COLUMN IF EXISTS rg_id, 
DROP COLUMN IF EXISTS bio,
DROP COLUMN IF EXISTS sm_fb,
DROP COLUMN IF EXISTS sm_twitter,
DROP COLUMN IF EXISTS last_name_public,
DROP COLUMN IF EXISTS pro_qualified;

-- rename the id to player_id, so we don't get any merging problems later

ALTER TABLE player
RENAME COLUMN id TO player_id;

ALTER TABLE player
RENAME COLUMN eusra_id TO player_eusra_id;

ALTER TABLE player
RENAME COLUMN sm_insta TO player_insta;

ALTER TABLE player
RENAME COLUMN rg_elo TO player_rg_elo;

ALTER TABLE player
RENAME COLUMN elo_games TO player_elo_games_total;

ALTER TABLE player
RENAME COLUMN country_id TO player_country_id;

ALTER TABLE player
RENAME COLUMN city TO player_city;

ALTER TABLE player
RENAME COLUMN player_country_id TO country_id;



--next step is to do the same with the ranking_team table and name it ('clubs')


CREATE TABLE IF NOT EXISTS club AS 
SELECT *
FROM ranking_club;

ALTER TABLE club
DROP COLUMN IF EXISTS short_name,
DROP COLUMN IF EXISTS slug,
DROP COLUMN IF EXISTS intials,
DROP COLUMN IF EXISTS text,
DROP COLUMN IF EXISTS shirt_color,
DROP COLUMN IF EXISTS sm_email,
DROP COLUMN IF EXISTS sm_fb,
DROP COLUMN IF EXISTS address,
DROP COLUMN IF EXISTS sm_twitter,
DROP COLUMN IF EXISTS contact_email,
DROP COLUMN IF EXISTS contact_person,
DROP COLUMN IF EXISTS secret,
DROP COLUMN IF EXISTS group_img,
DROP COLUMN IF EXISTS logo,
DROP COLUMN IF EXISTS sm_youtube,
DROP COLUMN IF EXISTS video_link,
DROP COLUMN IF EXISTS group_img_small,
DROP COLUMN IF EXISTS logo_small,
DROP COLUMN IF EXISTS region_id,
DROP COLUMN IF EXISTS logo_winner,
DROP COLUMN IF EXISTS sm_homepage,
DROP COLUMN IF EXISTS initials;


ALTER TABLE club
RENAME COLUMN id TO club_id;

SELECT *
FROM club;

ALTER TABLE club 
RENAME COLUMN name TO club_name;

ALTER TABLE club 
RENAME COLUMN sm_insta TO club_insta;

--- and the same form the ranking_team as ('teams')


CREATE TABLE IF NOT EXISTS team AS 
SELECT *
FROM ranking_team
WHERE (gender='mm' OR gender='ff' OR gender='mf' OR gender='fm') ; 

SELECT *
FROM team;

ALTER TABLE team
DROP COLUMN IF EXISTS short_name,
DROP COLUMN IF EXISTS slug,
DROP COLUMN IF EXISTS funfact,
DROP COLUMN IF EXISTS text,
DROP COLUMN IF EXISTS together_since,
DROP COLUMN IF EXISTS profile_img,
DROP COLUMN IF EXISTS is_liga_team,
DROP COLUMN IF EXISTS captain_id,
DROP COLUMN IF EXISTS eusra_id,
DROP COLUMN IF EXISTS sm_insta;


ALTER TABLE team
RENAME COLUMN id TO team_id;

ALTER TABLE team
RENAME COLUMN name TO team_name;


--- TABLE on table, this time the "tournament" table




CREATE TABLE IF NOT EXISTS tournament AS 
SELECT *
FROM ranking_tournamentevent
WHERE non_roundnet=0;

SELECT *
FROM tournament


ALTER TABLE tournament
DROP COLUMN IF EXISTS short_name,
DROP COLUMN IF EXISTS description,
DROP COLUMN IF EXISTS slug,
DROP COLUMN IF EXISTS host_id, 
DROP COLUMN IF EXISTS address,
DROP COLUMN IF EXISTS teaser,
DROP COLUMN IF EXISTS group_img,
DROP COLUMN IF EXISTS logo,
DROP COLUMN IF EXISTS payment_details,
DROP COLUMN IF EXISTS registration_confirmation_msg,
DROP COLUMN IF EXISTS registration_info,
DROP COLUMN IF EXISTS contact_email,
DROP COLUMN IF EXISTS registration_external,
DROP COLUMN IF EXISTS registration_link,
DROP COLUMN IF EXISTS host_string,
DROP COLUMN IF EXISTS date_unknown,
DROP COLUMN IF EXISTS video_link,
DROP COLUMN IF EXISTS hidden,
DROP COLUMN IF EXISTS registration_over,
DROP COLUMN IF EXISTS is_liga,
DROP COLUMN IF EXISTS max_players,
DROP COLUMN IF EXISTS min_f_players,
DROP COLUMN IF EXISTS min_m_players,
DROP COLUMN IF EXISTS region_id,
DROP COLUMN IF EXISTS show_index,
DROP COLUMN IF EXISTS is_single_signup,
DROP COLUMN IF EXISTS non_roundnet,
DROP COLUMN IF EXISTS reduced_member_count,
DROP COLUMN IF EXISTS community_date,
DROP COLUMN IF EXISTS community_html_de,
DROP COLUMN IF EXISTS community_html_en,
DROP COLUMN IF EXISTS countries_date,
DROP COLUMN IF EXISTS countries_html,
DROP COLUMN IF EXISTS overall_spots,
DROP COLUMN IF EXISTS use_payment_token,
DROP COLUMN IF EXISTS tournament_category_id,
DROP COLUMN IF EXISTS billing_address,
DROP COLUMN IF EXISTS short_slug;

--- delete id 124 (name = Spielplan Templates) from the table Tournament as we don't need it.

DELETE FROM tournament
WHERE id = 124;

DELETE FROM tournament
WHERE id IN (36, 38, 39, 40, 41, 44, 59, 63, 84, 92, 107, 108, 156, 165, 138);

ALTER TABLE tournament
RENAME COLUMN id TO event_id;

ALTER TABLE tournament
RENAME COLUMN name TO event_name;


--- now with the devision table


CREATE TABLE IF NOT EXISTS division AS 
SELECT *
FROM ranking_tournamentdivision;

SELECT *
FROM division;

ALTER TABLE division
DROP COLUMN IF EXISTS podium_img,
DROP COLUMN IF EXISTS registration_open,
DROP COLUMN IF EXISTS registration_start,
DROP COLUMN IF EXISTS date,
DROP COLUMN IF EXISTS end_date,
DROP COLUMN IF EXISTS title,
DROP COLUMN IF EXISTS teams_date,
DROP COLUMN IF EXISTS teams_html, 
DROP COLUMN IF EXISTS waiting_list_date,
DROP COLUMN IF EXISTS waiting_list_html,
DROP COLUMN IF EXISTS registration_end,
DROP COLUMN IF EXISTS lottery_date,
DROP COLUMN IF EXISTS lottery_html,
DROP COLUMN IF EXISTS min_teams,
DROP COLUMN IF EXISTS division_category_id,
DROP COLUMN IF EXISTS exclude_rating,
DROP COLUMN IF EXISTS members_only,
DROP COLUMN IF EXISTS quali_ranking_id,
DROP COLUMN IF EXISTS prediction_game,
DROP COLUMN IF EXISTS prediction_team_number,
DROP COLUMN IF EXISTS prediction_until;


--- delete the rows from the virtual tournaments and the liga 

DELETE FROM division
WHERE event_id IN (36, 38, 39, 40, 41, 44, 59, 63, 84, 92, 107, 108, 124, 156, 165, 138);

ALTER TABLE division
RENAME COLUMN id TO tournament_id;



--- same steps for the tournamentteam

CREATE TABLE IF NOT EXISTS tteam AS 
SELECT *
FROM ranking_tournamentteam;

SELECT *
FROM tteam;

ALTER TABLE tteam
DROP COLUMN IF EXISTS alt_short_name, 
DROP COLUMN IF EXISTS tied_position,
DROP COLUMN IF EXISTS profile_img,
DROP COLUMN IF EXISTS paid,
DROP COLUMN IF EXISTS sign_up_date,
DROP COLUMN IF EXISTS profile_img_small,
DROP COLUMN IF EXISTS check_in_code,
DROP COLUMN IF EXISTS check_in_date, 
DROP COLUMN IF EXISTS checked_in;

ALTER TABLE tteam
RENAME COLUMN rg_elo TO team_rg_id;

ALTER TABLE tteam
RENAME COLUMN skill TO team_skill;

ALTER TABLE tteam
RENAME COLUMN alt_name TO team_name;

ALTER TABLE tteam
RENAME COLUMN id TO tournament_team_id;


--- and last for tournamentplayers

CREATE TABLE IF NOT EXISTS tplayer AS 
SELECT *
FROM ranking_tournamentplayer;

SELECT *
FROM tplayer;


ALTER TABLE tplayer
DROP COLUMN IF EXISTS date, 
DROP COLUMN IF EXISTS comment,
DROP COLUMN IF EXISTS points_date;

ALTER TABLE tplayer
RENAME COLUMN rg_elo TO player_rg_elo;

ALTER TABLE tplayer
RENAME COLUMN country_id TO id;


--- now we take the help-tables and prepare them for merging

CREATE TABLE IF NOT EXISTS country AS 
SELECT *
FROM ranking_country;


SELECT * 
FROM country;

ALTER TABLE country
DROP COLUMN IF EXISTS short_name;

ALTER TABLE country
RENAME COLUMN id TO country_id;


CREATE TABLE IF NOT EXISTS surface AS 
SELECT *
FROM ranking_surface;

SELECT * 
FROM surface;


ALTER TABLE surface
RENAME COLUMN id TO surface_id;

CREATE TABLE IF NOT EXISTS division_kat AS 
SELECT *
FROM ranking_division;

SELECT *
FROM division_kat


ALTER TABLE division_kat
DROP COLUMN IF EXISTS short_name, 
DROP COLUMN IF EXISTS allowed_gender,
DROP COLUMN IF EXISTS gender_restricted,
DROP COLUMN IF EXISTS slug;

ALTER TABLE division_kat
RENAME COLUMN id TO division_id;

--- create new table for all tournaments 

CREATE TABLE IF NOT EXISTS tournament_roundnet AS 
SELECT * 
FROM tournament_roundnet_pre trp 
WHERE event_id NOT IN (84, 85, 126, 132, 133, 134, 135, 142, 143, 144, 145, 159, 165, 166, 174, 230, 231, 232, 233, 239, 266, 307, 321, 322, 323, 324, 345, 347);

-- Drop columns we don't need 

ALTER TABLE tournament_roundnet 
DROP COLUMN IF EXISTS tournament_id, 
DROP COLUMN IF EXISTS team_rg_id,
DROP COLUMN IF EXISTS elo_diff, 
DROP COLUMN IF EXISTS team_gender_y, 
DROP COLUMN IF EXISTS id, 
DROP COLUMN IF EXISTS player_rg_elo, 
DROP COLUMN IF EXISTS player_elo_games_total, 
DROP COLUMN IF EXISTS elo_division,
DROP COLUMN IF EXISTS player_id,
DROP COLUMN IF EXISTS event_id;

ALTER TABLE tournament_roundnet
RENAME COLUMN team_gender_x TO team_gender;

--- ADD Column estimated_player city to get an estimation, there the players might came from

SELECT COUNT (*)
FROM tournament_roundnet ;

ALTER TABLE tournament_roundnet
ADD player_city_estimated varchar;

UPDATE tournament_roundnet 
SET player_city_estimated = (CASE WHEN player_city IS NULL THEN city 
WHEN player_city = '' THEN city ELSE player_city END) ;


--- Create the final roundnet_tournament table by choosing only the rows which have an event_id

CREATE TABLE IF NOT EXISTS roundnet_tournament AS 
SELECT *
FROM tournament_roundnet
WHERE event_name IS NOT NULL ;


--- Do the same to the tournament_roundnet_pre table

ALTER TABLE tournament_roundnet_pre
ADD player_city_estimated varchar;

UPDATE tournament_roundnet_pre
SET player_city_estimated = (CASE WHEN player_city IS NULL THEN city 
WHEN player_city = '' THEN city ELSE player_city END) ;





