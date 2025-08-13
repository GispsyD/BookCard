DROP DATABASE IF EXISTS BookCard;
CREATE DATABASE BookCard;
USE BookCard;

--Table Game

CREATE TABLE Game (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name_Game VARCHAR(50) NOT NULL,
    Img_Game VARCHAR(255) NOT NULL
    --Look for description ??
);


--Table Extension

CREATE TABLE Extension_Card (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Game_ID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Date_Release DATE,
    FOREIGN KEY (Game_ID) REFERENCES Game(ID) ON DELETE CASCADE

);

--Table Extension_Img

CREATE TABLE Extension_Img (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Extension_ID INT NOT NULL,
    Image_URL VARCHAR(255) NOT NULL,
    Image_Description VARCHAR(100),
    FOREIGN KEY (Extension_ID) REFERENCES Extension_Card(ID) ON DELETE CASCADE

);

--Table Card Gundam

CREATE TABLE Gundam_Cards (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Extension_ID INT NOT NULL,
    Name_Card VARCHAR(50) NOT NULL,
    Sous_Title VARCHAR(20),
    Rarete CHAR(4) CHECK (
        Rarete IN (
            'LR++',
            'LR+',
            'LR',
            'R+',
            'R',
            'U+',
            'U',
            'C+',
            'C',
            'T'
        )
    ),
    Type CHAR(10) CHECK (
        Type IN (
            'Unit',
            'Pilot',
            'Command',
            'Base',
            'Resource',
            'UnitToken',
            'ExResource',
            'ExBase'
        )
    ),
    Color VARCHAR(10) CHECK (
        Color IN (
            'Red',
            'Bleu',
            'Green',
            'White'
        )
    ),
    LVL TINYINT CHECK (LVL BETWEEN 1 AND 10),
    Cost TINYINT CHECK (Cost BETWEEN 0 AND 10),
    Effect VARCHAR(100),
    Effect_Type VARCHAR(15) CHECK (
        Effect_Type IN (
            'Blocker',
            'Support',
            'Attack',
            'Destroyed',
            'Deploy',
            'Breach',
            'High-Maneuver',
            'Repair'
        )
    ),
    Attack INT,
    Def INT,
    Archetype VARCHAR(50) NOT NULL,
    Archetype_02 VARCHAR(50),
    Space BOOLEAN NOT NULL,
    Earth BOOLEAN NOT NULL,
    Link VARCHAR(20),
    Author VARCHAR(20),
    FOREIGN KEY (Extension_ID) REFERENCES Extension_Card(ID) ON DELETE CASCADE
);

--Table Picture Gundam

CREATE TABLE Gundam_Cards_Img (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Card_ID INT NOT NULL,
    Image_URL VARCHAR(255) NOT NULL,
    Image_Description VARCHAR(100),
    FOREIGN KEY (Card_ID) REFERENCES Gundam_Cards(ID) ON DELETE CASCADE
);