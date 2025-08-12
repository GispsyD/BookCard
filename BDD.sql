DROP DATABASE IF EXISTS BookCard;
CREATE DATABASE BookCard;
USE BookCard;
CREATE TABLE gundam_cards (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name_Card VARCHAR(50) NOT NULL,
    Sous_Titre VARCHAR(20),
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
    Color TEXT CHECK (
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
    Link VARCHAR(20)
);

CREATE TABLE gundam_cards_img (
    ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Card_ID INT NOT NULL,
    Image_URL VARCHAR(255) NOT NULL,
    Image_Description VARCHAR(100),
    FOREIGN KEY (Card_ID) REFERENCES gundam_cards (ID) ON DELETE CASCADE
);