-- Create the Users table
CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    SignupDate DATE,
    ReferralSource VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    Gender VARCHAR(50)
);

-- Create the Transactions table
CREATE TABLE Transactions (
    TransactionID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID),
    Amount NUMERIC(10, 2),
    Date DATE,
    PaymentMethod VARCHAR(50),
    Category VARCHAR(50)
);

-- Create the Groups table
CREATE TABLE Groups (
    GroupID SERIAL PRIMARY KEY,
    GroupName VARCHAR(255),
    CreatedDate DATE,
    CreatedBy INT REFERENCES Users(UserID)
);

-- Create the GroupMemberships table
CREATE TABLE GroupMemberships (
    MembershipID SERIAL PRIMARY KEY,
    GroupID INT REFERENCES Groups(GroupID),
    UserID INT REFERENCES Users(UserID),
    DateJoined DATE
);

-- Create the Engagements table
CREATE TABLE Engagements (
    EngagementID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID),
    ActionType VARCHAR(100),
    ActionDate DATE,
    DeviceType VARCHAR(50),
    Duration INT
);

-- Create the Subscriptions table
CREATE TABLE Subscriptions (
    SubscriptionID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID),
    PlanType VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    RenewalStatus VARCHAR(50)
);

-- Create the RetentionMetrics table
CREATE TABLE RetentionMetrics (
    RetentionID SERIAL PRIMARY KEY,
    UserID INT REFERENCES Users(UserID),
    MonthlyActive CHAR(1),
    DaysSinceLastActivity INT,
    LifetimeValue NUMERIC(10, 2),
    ChurnRisk VARCHAR(50)
);

-- Create the Referrals table
CREATE TABLE Referrals (
    ReferralID SERIAL PRIMARY KEY,
    ReferrerID INT REFERENCES Users(UserID),
    ReferredUserID INT REFERENCES Users(UserID),
    ReferralDate DATE,
    IncentiveEarned NUMERIC(10, 2)
);

-- RDS blocks the COPY command I was going to use to upload the CSVs so I will do it manually through DBeaver
