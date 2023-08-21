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

