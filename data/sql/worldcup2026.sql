CREATE DATABASE worldcup2026;
USE worldcup2026;
SELECT COUNT(*) FROM games_live;
SELECT COUNT(*) FROM teams_live;
SELECT COUNT(*) FROM groups_live;
SELECT COUNT(*) FROM stadiums_live;
ALTER TABLE teams_live ADD PRIMARY KEY (id);
ALTER TABLE stadiums_live ADD PRIMARY KEY (id);

SELECT id, COUNT(*) FROM teams_live GROUP BY id HAVING COUNT(*) > 1;

SELECT DISTINCT home_team_id, away_team_id, type
FROM games_live
WHERE home_team_id NOT IN (SELECT id FROM teams_live)
   OR away_team_id NOT IN (SELECT id FROM teams_live);

UPDATE games_live SET home_team_id = NULL WHERE home_team_id = 0;
UPDATE games_live SET away_team_id = NULL WHERE away_team_id = 0;

ALTER TABLE games_live ADD FOREIGN KEY (home_team_id) REFERENCES teams_live(id);
ALTER TABLE games_live ADD FOREIGN KEY (away_team_id) REFERENCES teams_live(id);
ALTER TABLE games_live ADD FOREIGN KEY (stadium_id) REFERENCES stadiums_live(id);

ALTER TABLE games_live MODIFY stadium_id INT;
ALTER TABLE games_live ADD FOREIGN KEY (stadium_id) REFERENCES stadiums_live(id);

SELECT
  t.name_en AS team,
  g.group,
  SUM(CASE WHEN g.home_team_id = t.id THEN g.home_score ELSE g.away_score END) AS goals_for,
  SUM(CASE WHEN g.home_team_id = t.id THEN g.away_score ELSE g.home_score END) AS goals_against
FROM teams_live t
JOIN games_live g ON t.id IN (g.home_team_id, g.away_team_id)
WHERE g.type = 'group' AND g.finished = 'TRUE'
GROUP BY t.name_en, g.group
ORDER BY g.group, goals_for DESC;

SELECT type, home_team_name_en, away_team_name_en, home_score, away_score
FROM games_live
WHERE type IN ('r32','r16','qf','sf','third','final')
ORDER BY FIELD(type,'r32','r16','qf','sf','third','final');

SELECT home_team_name_en, away_team_name_en, home_score, away_score,
  ABS(home_score - away_score) AS margin
FROM games_live
WHERE finished = 'TRUE'
ORDER BY margin DESC
LIMIT 10;

SELECT
  s.name_en AS stadium,
  s.city_en,
  COUNT(g.id) AS matches_played,
  SUM(g.home_score + g.away_score) AS total_goals
FROM stadiums_live s
JOIN games_live g ON s.id = g.stadium_id
WHERE g.finished = 'TRUE'
GROUP BY s.name_en, s.city_en
ORDER BY total_goals DESC;

SELECT
  t.name_en AS team,
  COUNT(*) AS draw_count
FROM teams_live t
JOIN games_live g ON t.id IN (g.home_team_id, g.away_team_id)
WHERE g.finished = 'TRUE' AND g.home_score = g.away_score
GROUP BY t.name_en
ORDER BY draw_count DESC
LIMIT 10;

SELECT CURRENT_USER();
USE worldcup2026;
DELETE FROM worldcup2026.games_live;
SELECT * FROM games_live LIMIT 50;