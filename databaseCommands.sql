Group: Jared Christopher (jarchri@siue.edu) & Jayme Greer (jaymgre@siue.edu)

CREATE DATABASE CS434Project;

USE CS434Project;

---- create tables ----

CREATE TABLE campaign (
    campaignID int unsigned unique AUTO_INCREMENT NOT NULL,
    name varchar(30)  NOT NULL,
    dateStarted DATE NOT NULL,
    PRIMARY KEY(campaignID)
);


CREATE TABLE storyline (
    title varchar(30) NOT NULL,
    cID int unsigned NOT NULL,
    description text NOT NULL,
    length int unsigned NOT NULL,
    difficulty int unsigned NOT NULL,
    PRIMARY KEY(title),
    FOREIGN KEY(cID) REFERENCES campaign(campaignID)
);


CREATE TABLE people (
    peopleID int unsigned unique AUTO_INCREMENT NOT NULL,
    name varchar(30) NOT NULL,
    description text NOT NULL,
    PRIMARY KEY(peopleID)
);


CREATE TABLE master (
    masterID int unsigned NOT NULL,
    phone varchar(30) NOT NULL,
    address text NOT NULL,
    experience varchar(30) NOT NULL,
    FOREIGN KEY(masterID) REFERENCES people(peopleID)
);


CREATE TABLE npc (
    npcID int unsigned NOT NULL,
    level int NOT NULL,
    class varchar(30) NOT NULL,
    spell varchar(30) NOT NULL,
    FOREIGN KEY(npcID) REFERENCES people(peopleID)
);


CREATE TABLE player (
    playerID int unsigned AUTO_INCREMENT NOT NULL,
    phone varchar(30) NOT NULL,
    level int NOT NULL,
    class varchar(30) NOT NULL,
    spell varchar(30) NOT NULL,
    FOREIGN KEY(playerID) REFERENCES people(peopleID)
);


CREATE TABLE quest (
    questID int unsigned unique AUTO_INCREMENT NOT NULL,
    type ENUM('side', 'main'),
    name varchar(30) NOT NULL,
    difficulty int NOT NULL,
    description text NOT NULL,
    PRIMARY KEY(questID)
);

CREATE TABLE complete (
    completionID int unsigned AUTO_INCREMENT NOT NULL,
    playerID int unsigned,
    questID int unsigned,
    dateComplete date NOT NULL,
    PRIMARY KEY(completionID),
    FOREIGN KEY(playerID) REFERENCES player(playerID),
    FOREIGN KEY(questID) REFERENCES quest(questID)
);

---- insert data ----

INSERT INTO campaign
    (name, dateStarted)
VALUES
    ('campaign1', '2023-06-19'),
    ('campaign2', '2023-06-18'),
    ('campaign3', '2023-06-17'),
    ('campaign4', '2023-06-16'),
    ('campaign5', '2023-06-15');


INSERT INTO storyline
    (cID, title, description, length, difficulty)
VALUES
    (1, 'story1', 'campaign about story1', 72, 1),
    (2, 'story2', 'campaign about story2', 76, 2),
    (3, 'story3', 'campaign about story3', 80, 3),
    (4, 'story4', 'campaign about story4', 84, 4),
    (5, 'story5', 'campaign about story5', 88, 5);  



INSERT INTO people
    (name, description)
VALUES
    ('person1', 'description about person1'),
    ('person2', 'description about person2'),
    ('person3', 'description about person3'),
    ('person4', 'description about person4'),
    ('person5', 'description about person5'),
    ('person6', 'description about person6'),
    ('person7', 'description about person7'),
    ('person8', 'description about person8'),
    ('person9', 'description about person9'),
    ('person10', 'description about person10'),
    ('person11', 'description about person11'),
    ('person12', 'description about person12'),
    ('person13', 'description about person13'),
    ('person14', 'description about person14'),
    ('person15', 'description about person15');


INSERT INTO master
    (masterID, phone, address, experience)
VALUES
    (1, '6181111111', '123 Address Dr', 'beginner'),
    (2, '6182222222', '234 Address Dr', 'intermediate'),
    (3, '6183333333', '345 Address Dr', 'advanced'),
    (4, '6184444444', '456 Address Dr', 'expert'),
    (5, '6185555555', '567 Address Dr', 'intermediate');


INSERT INTO npc
    (npcID, level, class, spell)
VALUES
    (6, 2, 'druid', 'spell1'),
    (7, 1, 'warlock', 'spell2'),
    (8, 18, 'rogue', 'spell3'),
    (9, 6, 'bard', 'spell1'),
    (10, 8, 'bard', 'spell4');


INSERT INTO player
    (playerID, phone, level, class, spell)
VALUES
    (11, '6181234567', 6, 'druid', 'spell2'),
    (12, '6187654321', 4, 'wizard', 'spell6'),
    (13, '6186666666', 9, 'rogue', 'spell3'),
    (14, '6187777777', 2, 'cleric', 'spell5'),
    (15, '6189999999', 4, 'paladin', 'spell4');


INSERT INTO quest
    (type, name, difficulty, description)
VALUES
    ('side', 'quest1', 1, 'description about quest1'),
    ('main', 'mainquest', 4, 'description about mainquest'),
    ('side', 'quest2', 2, 'description about quest2'),
    ('side', 'quest3', 3, 'description about quest3'),
    ('side', 'quest4', 2, 'description about quest4');


INSERT INTO complete 
    (playerID, questID, dateComplete)
VALUES 
    (11, 1, '2023-06-19'),
    (12, 2, '2023-06-20'),
    (13, 3, '2023-06-21'),
    (14, 4, '2023-06-22'),
    (14, 5, '2023-06-23');

