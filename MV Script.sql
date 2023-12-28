--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      NYC_Dimensional_Model-2.DM1
--
-- Date Created : Thursday, April 20, 2023 21:26:02
-- Target DBMS : MySQL 8.x
--

-- 
-- TABLE: Dim_Accident_Location 
--

CREATE TABLE Dim_Accident_Location(
    Accident_Location_SK    INT             NOT NULL,
    Borough                 VARCHAR(255),
    On_Street_Name          VARCHAR(255),
    Cross_Street_Name       VARCHAR(255),
    Off_Street_name         VARCHAR(255),
    ZipCode                 INT,
    Location                VARCHAR(255),
    Latitude                FLOAT(8, 0),
    Longitude               FLOAT(8, 0),
    Create_Date             DATE,
    Job_ID                  VARCHAR(255),
    PRIMARY KEY (Accident_Location_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Collision_Contributing_Factors 
--

CREATE TABLE Dim_Collision_Contributing_Factors(
    Person_Contributing_Factor_SK    INT             NOT NULL,
    Contributing_Factor_1            VARCHAR(255),
    Contributing_Factor_2            VARCHAR(255),
    Contributing_Factor_3            VARCHAR(255),
    Contributing_Factor_4            VARCHAR(255),
    Contributing_Factor_5            VARCHAR(255),
    Create_Date                      DATE,
    PID                              VARCHAR(10),
    PRIMARY KEY (Person_Contributing_Factor_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Collision_Vehicle_Types 
--

CREATE TABLE Dim_Collision_Vehicle_Types(
    Collision_Vehicle_Types_SK    INT             NOT NULL,
    Vehicle_Type_Code_1           VARCHAR(100),
    Vehicle_Type_Code_2           VARCHAR(100),
    Vehicle_Type_Code_3           VARCHAR(100),
    Vehicle_Type_Code_4           VARCHAR(100),
    Vehicle_Type_Code_5           VARCHAR(100),
    Create_Date                   DATETIME,
    Job_ID                        VARCHAR(10),
    PRIMARY KEY (Collision_Vehicle_Types_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    Date_SK             DATE    NOT NULL,
    dayofMonthNumber    INT,
    dayofWeekNumber     INT,
    dayofYearNumber     INT,
    MonthNumber         INT,
    QuarterNumber       INT,
    YearNumber          INT,
    PRIMARY KEY (Date_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Person_Contributing_Factor 
--

CREATE TABLE Dim_Person_Contributing_Factor(
    Person_Contributing_Factor_SK    INT             NOT NULL,
    Contributing_Factor_1            VARCHAR(255),
    Contributing_Factor_2            VARCHAR(255),
    Create_Date                      DATE,
    Job_ID                           VARCHAR(255),
    PRIMARY KEY (Person_Contributing_Factor_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Person_Type 
--

CREATE TABLE Dim_Person_Type(
    Person_Type_SK                   INT             NOT NULL,
    Person_ID                        INT,
    Person_Type                      VARCHAR(255),
    Person_Age                       INT,
    Person_Sex                       VARCHAR(40),
    Create_Date                      DATE,
    Job_ID                           VARCHAR(255),
    Person_Contributing_Factor_SK    INT,
    PRIMARY KEY (Person_Type_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Vehicle 
--

CREATE TABLE Dim_Vehicle(
    Vehicle_SK                       INT             NOT NULL,
    Vehicle_ID                       INT,
    Vehicle_Damage_SK                INT,
    State_Registration               VARCHAR(255),
    Vehicle_Type                     VARCHAR(255),
    Vehicle_Make                     VARCHAR(255),
    Vehicle_Model                    VARCHAR(255),
    Vehicle_Year                     INT,
    Create_Date                      DATE,
    Job_ID                           VARCHAR(255),
    Person_Contributing_Factor_SK    INT,
    PRIMARY KEY (Vehicle_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Vehicle_Collision_Damages 
--

CREATE TABLE Dim_Vehicle_Collision_Damages(
    Vehicle_Damage_SK              INT             NOT NULL,
    Vehicle_Damage                 VARCHAR(100),
    Vehicle_Damage_1               VARCHAR(100),
    Vehicle_Damage_2               VARCHAR(100),
    Vehicle_Damage_3               VARCHAR(100),
    Public_Property_Damage         VARCHAR(100),
    Public_Property_Damage_Type    VARCHAR(100),
    Create_Date                    DATETIME,
    Job_ID                         VARCHAR(10),
    PRIMARY KEY (Vehicle_Damage_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Vehicle_Contributing_Factor 
--

CREATE TABLE Dim_Vehicle_Contributing_Factor(
    Person_Contributing_Factor_SK    INT             NOT NULL,
    Contributing_Factor_1            VARCHAR(255),
    Contributing_Factor_2            VARCHAR(255),
    Create_Date                      DATE,
    Job_ID                           VARCHAR(10),
    PRIMARY KEY (Person_Contributing_Factor_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FCT_Collisions 
--

CREATE TABLE FCT_Collisions(
    Collision_SK                      INT             NOT NULL,
    Collision_ID                      INT             NOT NULL,
    Crash_Date                        DATE,
    Collision_Day                     INT,
    Crash_Time                        TIME,
    Crash_dayoftheweek                INT,
    Crash_Hour                        CHAR(10),
    Number_Of_Persons_Injured         INT,
    `Numbe_ Of_Persons_Killed`        INT,
    `Number_ Of_Pedestrians_Injured`  INT,
    `Numbe_ Of_Pedestrians_Killed`    INT,
    `Number_ Of_Cyclists_Injured`     INT,
    `Number_ Of_Cyclists_Killed`      INT,
    `Number_ Of_Motorist_Injured`     INT,
    `Number_ Of_Motorist_Killed`      INT,
    Accident_Location_SK              INT,
    Person_Contributing_Factor_SK     INT,
    Create_Date                       DATE,
    Job_ID                            VARCHAR(255),
    Collision_Vehicle_Types_SK        INT,
    PRIMARY KEY (Collision_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FCT_Person_Vehicle 
--

CREATE TABLE FCT_Person_Vehicle(
    Person_Sk              INT             NOT NULL,
    Person_Injury          VARCHAR(255),
    Ejection               VARCHAR(255),
    Emotional_Status       VARCHAR(255),
    Bodily_Injury          VARCHAR(255),
    Position_In_Vehicle    VARCHAR(255),
    Safety_Equipment       VARCHAR(255),
    Ped_Location           VARCHAR(255),
    Ped_Action             VARCHAR(255),
    Complaint              VARCHAR(255),
    Ped_Role               VARCHAR(255),
    Is_Driver              VARCHAR(20),
    Vehicle_Occupants      INT,
    Person_Type_SK         INT,
    Vehicle_SK             INT,
    Create_Date            DATE,
    Job_ID                 VARCHAR(255),
    Collision_SK           INT,
    PRIMARY KEY (Person_Sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_Person_Type 
--

ALTER TABLE Dim_Person_Type ADD CONSTRAINT RefDim_Person_Contributing_Factor24 
    FOREIGN KEY (Person_Contributing_Factor_SK)
    REFERENCES Dim_Person_Contributing_Factor(Person_Contributing_Factor_SK)
;


-- 
-- TABLE: Dim_Vehicle 
--

ALTER TABLE Dim_Vehicle ADD CONSTRAINT RefDim_Vehicle_Collision_Damages22 
    FOREIGN KEY (Vehicle_Damage_SK)
    REFERENCES Dim_Vehicle_Collision_Damages(Vehicle_Damage_SK)
;

ALTER TABLE Dim_Vehicle ADD CONSTRAINT RefDim_Vehicle_Contributing_Factor25 
    FOREIGN KEY (Person_Contributing_Factor_SK)
    REFERENCES Dim_Vehicle_Contributing_Factor(Person_Contributing_Factor_SK)
;


-- 
-- TABLE: FCT_Collisions 
--

ALTER TABLE FCT_Collisions ADD CONSTRAINT RefDim_Accident_Location1 
    FOREIGN KEY (Accident_Location_SK)
    REFERENCES Dim_Accident_Location(Accident_Location_SK)
;

ALTER TABLE FCT_Collisions ADD CONSTRAINT RefDim_Date7 
    FOREIGN KEY (Crash_Date)
    REFERENCES Dim_Date(Date_SK)
;

ALTER TABLE FCT_Collisions ADD CONSTRAINT RefDim_Collision_Contributing_Factors21 
    FOREIGN KEY (Person_Contributing_Factor_SK)
    REFERENCES Dim_Collision_Contributing_Factors(Person_Contributing_Factor_SK)
;

ALTER TABLE FCT_Collisions ADD CONSTRAINT RefDim_Collision_Vehicle_Types23 
    FOREIGN KEY (Collision_Vehicle_Types_SK)
    REFERENCES Dim_Collision_Vehicle_Types(Collision_Vehicle_Types_SK)
;


-- 
-- TABLE: FCT_Person_Vehicle 
--

ALTER TABLE FCT_Person_Vehicle ADD CONSTRAINT RefFCT_Collisions15 
    FOREIGN KEY (Collision_SK)
    REFERENCES FCT_Collisions(Collision_SK)
;

ALTER TABLE FCT_Person_Vehicle ADD CONSTRAINT RefDim_Person_Type16 
    FOREIGN KEY (Person_Type_SK)
    REFERENCES Dim_Person_Type(Person_Type_SK)
;

ALTER TABLE FCT_Person_Vehicle ADD CONSTRAINT RefDim_Vehicle17 
    FOREIGN KEY (Vehicle_SK)
    REFERENCES Dim_Vehicle(Vehicle_SK)
;


