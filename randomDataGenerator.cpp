//Group: Jared Christopher (jarchri@siue.edu) & Jayme Greer (jaymgre@siue.edu)

#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

// generate a random string
string generateRandomString(int length) {
    const string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    const int charsetLength = charset.length();
    string result;
    for (int i = 0; i < length; ++i) {
        result += charset[rand() % charsetLength];
    }
    return result;
}

// generate a random date
string generateRandomDate() {
    int year = 2000 + rand() % 24;
    int month = 1 + rand() % 12;
    int day = 1 + rand() % 28;
    return to_string(year) + "-" + to_string(month) + "-" + to_string(day);
}

int main() {
    srand(time(0));

    // insert statements for campaign
    ofstream campaignFile("campaign_inserts.sql");
    for (int i = 1; i <= 100000; ++i) {
        string name = generateRandomString(10);
        string dateStarted = generateRandomDate();
        campaignFile << "INSERT INTO campaign (name, dateStarted) VALUES ('" << name << "', '" << dateStarted << "');" << endl;
    }
    campaignFile.close();

    // insert statements for storyline
    ofstream storylineFile("storyline_inserts.sql");
    for (int i = 1; i <= 100000; ++i) {
        string title = generateRandomString(10);
        int cID = rand() % 100000 + 1;
        string description = generateRandomString(20);
        int length = rand() % 100 + 1; 
        int difficulty = rand() % 5 + 1; 
        storylineFile << "INSERT INTO storyline (title, cID, description, length, difficulty) VALUES ('" << title << "', " << cID << ", '" << description << "', " << length << ", " << difficulty << ");" << endl;
    }
    storylineFile.close();

    // insert statement for people
    ofstream peopleFile("people_inserts.sql");
    for (int i = 1; i <= 10000; ++i) {
        string name = generateRandomString(10);
        string description = generateRandomString(20);
        peopleFile << "INSERT INTO people (name, description) VALUES ('" << name << "', '" << description << "');" << endl;
    }
    peopleFile.close();

    // insert statements for master
    ofstream masterFile("master_inserts.sql");
    for (int i = 1; i <= 1000; ++i) {
        int masterID = rand() % 10000 + 1;
        string phone = generateRandomString(10);
        string address = generateRandomString(20);
        string experience = generateRandomString(10);
        masterFile << "INSERT INTO master (masterID, phone, address, experience) VALUES (" << masterID << ", '" << phone << "', '" << address << "', '" << experience << "');" << endl;
    }
    masterFile.close();

    // insert statements for npc
    ofstream npcFile("npc_inserts.sql");
    for (int i = 1; i <= 1000; ++i) {
        int npcID = rand() % 10000 + 1; 
        int level = rand() % 100 + 1; 
        string classType = generateRandomString(10);
        string spell = generateRandomString(10);
        npcFile << "INSERT INTO npc (npcID, level, class, spell) VALUES (" << npcID << ", " << level << ", '" << classType << "', '" << spell << "');" << endl;
    }
    npcFile.close();

    // insertstatements for player
    ofstream playerFile("player_inserts.sql");
    for (int i = 1; i <= 1000; ++i) {
        string phone = generateRandomString(10);
        int level = rand() % 100 + 1;
        string classType = generateRandomString(10);
        string spell = generateRandomString(10);
        playerFile << "INSERT INTO player (phone, level, class, spell) VALUES ('" << phone << "', " << level << ", '" << classType << "', '" << spell << "');" << endl;
    }
    playerFile.close();

    // insert statements for quest
    ofstream questFile("quest_inserts.sql");
    for (int i = 1; i <= 1000; ++i) {
        string type = (rand() % 2 == 0) ? "side" : "main"; 
        string name = generateRandomString(10);
        int difficulty = rand() % 5 + 1; 
        string description = generateRandomString(20);
        questFile << "INSERT INTO quest (type, name, difficulty, description) VALUES ('" << type << "', '" << name << "', " << difficulty << ", '" << description << "');" << endl;
    }
    questFile.close();

    // insert statements for complete
    ofstream completeFile("complete_inserts.sql");
    for (int i = 1; i <= 1000; ++i) {
        int playerID = rand() % 1000 + 1;
        int questID = rand() % 1000 + 1;
        string dateComplete = generateRandomDate();
        completeFile << "INSERT INTO complete (playerID, questID, dateComplete) VALUES (" << playerID << ", " << questID << ", '" << dateComplete << "');" << endl;
    }
    completeFile.close();

    cout << "INSERT statements generated successfully." << endl;

    return 0;
}