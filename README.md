# DND-Database

Group: Jared Christopher (jarchri@siue.edu) & Jayme Greer (jaymgre@siue.edu)

Goal: The goal of this project is to create a functional database management system and populate it with hundreds of thousands of records in multiple different entites.
This project was done using Visual Studio Code and MySQL in the Terminal.

File explainations:
  1. randomDataGenerator.cpp: This file includes functions for generating random strings, dates, and integers, using the rand() function. The generated random data was assigned to variables like player names or campaign completion dates. To insert the data, we created SQL statements written to output files specific to each data type. For instance, player data was written to 'player_inserts.sql'. These files were executed in the Terminal using the 'source' command. For example, to insert data from 'player_inserts.sql' into the 'player' table, we used the command 'source player_inserts.sql'.
  2. databaseCommands.sql: This file contains every command used to create each table in our database schema. These commands are what our insert statements are based off of in our randomDataGenerator.cpp file.
  3. Project5.sql: This file provieds the list of complex queries we used to test the integrity of our relational database.
