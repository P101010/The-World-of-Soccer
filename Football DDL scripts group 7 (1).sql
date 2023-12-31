CREATE SCHEMA football;
USE football;

-- Create tables
CREATE TABLE League (
    LID INT PRIMARY KEY,
    Name VARCHAR(100),
    President VARCHAR(100)
);

CREATE TABLE Men (
    LID INT,
    Name VARCHAR(100),
    FOREIGN KEY (LID) REFERENCES League(LID)
);

CREATE TABLE Women (
    LID INT,
    Name VARCHAR(100),
    FOREIGN KEY (LID) REFERENCES League(LID)
);

CREATE TABLE Seasons (
    SID INT PRIMARY KEY,
    LID INT,
    Year INT,
    FOREIGN KEY (LID) REFERENCES League(LID)
);

CREATE TABLE Team (
    TID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Player (
    PID INT PRIMARY KEY,
    TID INT,
    Name VARCHAR(100),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (TID) REFERENCES Team(TID)
);

CREATE TABLE Stadium (
    StID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100)
);

CREATE TABLE Matches (
    MID INT PRIMARY KEY,
    TeamID_Home INT,
    TeamID_Away INT,
    SID INT,
    StID INT,
    FOREIGN KEY (TeamID_Home) REFERENCES Team(TID),
    FOREIGN KEY (TeamID_Away) REFERENCES Team(TID),
    FOREIGN KEY (SID) REFERENCES Seasons(SID),
    FOREIGN KEY (StID) REFERENCES Stadium(StID)
);

CREATE TABLE Plays (
    PID INT,
    TID INT,
    MID INT,
    FOREIGN KEY (PID) REFERENCES Player(PID),
    FOREIGN KEY (TID) REFERENCES Team(TID),
    FOREIGN KEY (MID) REFERENCES Matches(MID)
);

CREATE TABLE Manager (
    MID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Manager_Manages (
    MID INT,
    TID INT,
    Year INT,
    FOREIGN KEY (MID) REFERENCES Manager(MID),
    FOREIGN KEY (TID) REFERENCES Team(TID)
);

CREATE TABLE Transfers (
    TeamID_To INT,
    TeamID_From INT,
    Type VARCHAR(20),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (TeamID_To) REFERENCES Team(TID),
    FOREIGN KEY (TeamID_From) REFERENCES Team(TID)
);





CREATE TABLE Referee (
    RID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Referee_Overseas (
    MID INT,
    RID INT,
    FOREIGN KEY (MID) REFERENCES Matches(MID),
    FOREIGN KEY (RID) REFERENCES Referee(RID)
);

CREATE TABLE Goals (
    MID INT,
    PID INT,
    Type VARCHAR(20),
    Time INT,
    FOREIGN KEY (MID) REFERENCES Matches(MID),
    FOREIGN KEY (PID) REFERENCES Player(PID)
);

CREATE TABLE Assists (
    MID INT,
    PID INT,
    Time INT,
    FOREIGN KEY (MID) REFERENCES Matches(MID),
    FOREIGN KEY (PID) REFERENCES Player(PID)
);

CREATE TABLE Cards (
    MID INT,
    PID INT,
    Type VARCHAR(20),
    Time INT,
    FOREIGN KEY (MID) REFERENCES Matches(MID),
    FOREIGN KEY (PID) REFERENCES Player(PID)
);

CREATE TABLE Revenue (
    MID INT,
    Type VARCHAR(20),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (MID) REFERENCES Matches(MID)
);

CREATE TABLE Results (
    MID INT,
    TeamID_Home INT,
    TeamID_Away INT,
    HomeTeam_Points INT,
    AwayTeam_Points INT,
    HomeTeam_Goals INT,
    AwayTeam_Goals INT,
FOREIGN KEY (MID) REFERENCES Matches(MID),
FOREIGN KEY (TeamID_Home) REFERENCES Team(TID),
FOREIGN KEY (TeamID_Away) REFERENCES Team(TID)
);

CREATE TABLE Standings (
SID INT,
Position INT,
TID INT,
Points INT,
FOREIGN KEY (SID) REFERENCES Seasons(SID),
FOREIGN KEY (TID) REFERENCES Team(TID)
);



