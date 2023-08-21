# DND-Database

Group: Jared Christopher (jarchri@siue.edu) & Jayme Greer (jmcgree@siue.edu)

Goal: The goal of this project is to create a relational database and populate it with hundreds of thousands of records in multiple different entites.
This project was done using Visual Studio Code and MySQL in the Terminal.

File explainations:
  1.  randomDataGenerator.cpp: This file includes functions for generating random strings, dates, and integers, using the rand() function. The generated random data was assigned to variables like player names or campaign completion dates. To insert the data, we created SQL statements written to output files specific to each data type. For instance, player data was written to 'player_inserts.sql'. These files were executed in the Terminal using the 'source' command. For example, to insert data from 'player_inserts.sql' into the 'player' table, we used the command 'source player_inserts.sql'.
  2. Project5.sql: This file provieds the list of complex queries we used to test the integrity of our relational database.
