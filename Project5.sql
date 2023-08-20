//Group: Jared Christopher (jarchri@siue.edu) & Jayme Greer (jaymgre@siue.edu)

-- a list of quests that have been completed during or after 2020
SELECT people.name, quest.type, quest.name, complete.dateComplete
FROM complete, player, quest, people
WHERE complete.playerID = player.playerID
AND player.playerID = people.peopleID
AND complete.questID = quest.questID
AND complete.dateComplete > '2020-01-01'
ORDER BY complete.dateComplete DESC;


-- most common spell
SELECT spell, COUNT(*) AS count
FROM (
    SELECT spell FROM player
    UNION ALL
    SELECT spell FROM npc ) AS spells
GROUP BY spell
ORDER BY count DESC
LIMIT 1;    

-- which quests are least likely to be completed
SELECT quest.questID, quest.name, COUNT(complete.completionID) AS numCompletions
FROM quest, complete
WHERE quest.questID = complete.questID
GROUP BY quest.questID, quest.name
HAVING numCompletions <= 1
ORDER BY numCompletions ASC;


-- PART 2

-- update - leveling up level 2 players to level 3
UPDATE player
SET level = 3
WHERE level = 2;

-- inserting highest level player into the dungeon master table
INSERT INTO master (masterID, phone, address, experience)
SELECT playerID, phone, 'Unknown' AS address, 'Experienced' AS experience
FROM player
WHERE level = (SELECT MAX(level) FROM player);

-- delete old quests that were completed before 2010
DELETE FROM complete
WHERE YEAR(dateComplete) < 2010;


-- PART 3

CREATE VIEW quest_completed_view AS
SELECT quest.questID, quest.name, complete.dateComplete
FROM quest
JOIN complete ON quest.questID = complete.questID;

-- try to update
INSERT INTO quest_completed_view (questID, name, dateComplete)
VALUES (1, 'Sample Quest', '2023-06-30');

-- since this view has multiple tables joined together, to insert new tuples, we need directly manipulate the underlying tables (quest and complete). 
-- The changes made to the underlying tables will be shown in the view automatically.


-- PART 4

CREATE INDEX idx_complete_dateComplete ON complete (dateComplete);
