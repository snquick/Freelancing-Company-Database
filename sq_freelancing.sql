# Author: Stephanie Quick
# Class: Database Systems
# Project: Final Project; Freelancing Company
# File: sq_freelancing.sql

DROP DATABASE IF EXISTS freelancingFinal;
CREATE DATABASE IF NOT EXISTS freelancingFinal;
USE freelancingFinal;

# creating table userAccount
create table userAccount (
	accountID int not null auto_increment,
    username varchar(30) not null,
    pass varchar(30) not null,
    email varchar(40) not null,
    customerName varchar(30) not null, 
    primary key (accountID)
);

# creating table jobProposal
create table jobProposal (
	proposalID int not null auto_increment,
    accountID int not null,
    jobType varchar(30) not null,
    customerName varchar(30),
    clientComments varchar(100),
    primary key (proposalID),
    foreign key (accountID) references userAccount (accountID) on update cascade
);

# creating table jobProposalStatus
create table jobProposalStatus (
	proposalStatusID int not null auto_increment,
    proposalID int not null,
    jobStatus varchar(15) not null,
    primary key (proposalStatusID),
    foreign key (proposalID) references jobProposal (proposalID)
);

# creating table contractDetails
create table contractDetails (
	contractID int not null auto_increment,
    proposalID int not null,
    jobType varchar(30) not null,
    customerName varchar(30) not null, 
    startDate varchar(35) not null,
    dueDate varchar(35) not null,
    primary key (contractID),
    foreign key (proposalID) references jobProposal (proposalID)
);

# creating table payments
create table payments (
	paymentID int not null auto_increment,
    contractID int not null,
    paymentType varchar(15) not null,
    paymentTotal decimal(15,2) not null default '0.00',
    bankAccount varchar(15) not null,
    primary key (paymentID),
    foreign key (contractID) references contractDetails (contractID)
);

# inserting into userAccount table
INSERT INTO userAccount (username, pass, email, customerName) VALUES ('mpolaski', 'b5z0sfa#99', 'mpolaski@gmail.com', 'Michelle Polaski');
INSERT INTO userAccount (username, pass, email, customerName) VALUES ('cruskowsky', 'adp356sfa!9', 'cruskowsky@hotmail.com', 'Cameron Ruskowsky');
INSERT INTO userAccount (username, pass, email, customerName) VALUES ('emusk', 'ghra30pav1', 'musk@gmail.com', 'Elon Musk');
INSERT INTO userAccount (username, pass, email, customerName) VALUES ('jerichards', 'p1lajc40@', 'jerichards@gmail.com', 'Jessica Richards');
INSERT INTO userAccount (username, pass, email, customerName) VALUES ('johndoe', 'p#9vhgslm$2d', 'johndoe19@gmail.com', 'John Doe');

#inserting into jobProposal table
INSERT INTO jobProposal (accountID, jobType, customerName, clientComments) VALUES ('1', 'Wordpress 2+ Pages', 'Michelle Polaski', 'Please look at my contract proposal for details');
INSERT INTO jobProposal (accountID, jobType, customerName, clientComments) VALUES ('2', 'HTML webpage', 'Cameron Ruskowsky', 'Make the style of the home page modern, with a blue color palette');
INSERT INTO jobProposal (accountID, jobType, customerName, clientComments) VALUES ('3', 'Wordpress Bug Fixes', 'Elon Musk', 'Minor bugs');
INSERT INTO jobProposal (accountID, jobType, customerName, clientComments) VALUES ('4', 'Wordpress Plugin', 'Jessica Richards', 'Please make sure the plugin works along with my selected theme');
INSERT INTO jobProposal (accountID, jobType, customerName, clientComments) VALUES ('5', 'Wordpress 1 Page', 'John Doe', 'No comment.');

# inserting into jobProposalStatus table
INSERT INTO jobProposalStatus (proposalID, jobStatus) VALUES ('1', 'IN PROGRESS'); 
INSERT INTO jobProposalStatus (proposalID, jobStatus) VALUES ('2', 'COMPLETED'); 
INSERT INTO jobProposalStatus (proposalID, jobStatus) VALUES ('3', 'COMPLETED'); 
INSERT INTO jobProposalStatus (proposalID, jobStatus) VALUES ('4', 'IN PROGRESS'); 
INSERT INTO jobProposalStatus (proposalID, jobStatus) VALUES ('5', 'NOT STARTED');

# inserting into contractDetails
INSERT INTO contractDetails (proposalID, jobType, customerName, startDate, dueDate) VALUES ('1', 'Wordpress 2+ Pages', 'Michelle Polaski', 'Nov 1 2020', 'January 1 2021');
INSERT INTO contractDetails (proposalID, jobType, customerName, startDate, dueDate) VALUES ('2', 'HTML webpage', 'Cameron Ruskowsky', 'November 12 2020', 'November 24 2020');
INSERT INTO contractDetails (proposalID, jobType, customerName, startDate, dueDate) VALUES ('3', 'Wordpress Bug Fixes', 'Elon Musk', 'December 1 2020', 'December 3 2020');
INSERT INTO contractDetails (proposalID, jobType, customerName, startDate, dueDate) VALUES ('4', 'Wordpress Plugin', 'Jessica Richards', 'Dec 13 2020', 'December 20 2020');
INSERT INTO contractDetails (proposalID, jobType, customerName, startDate, dueDate) VALUES ('5', 'Wordpress 1 Page', 'John Doe', 'Dec 10 2020', 'January 10 2021');

# inserting in payments table
INSERT INTO payments (contractID, paymentType, paymentTotal, bankAccount) VALUES ('1', 'Credit', '500.00', 'Chase'); 
INSERT INTO payments (contractID, paymentType, paymentTotal, bankAccount) VALUES ('2', 'Debit', '300.00', 'First Midwest'); 
INSERT INTO payments (contractID, paymentType, paymentTotal, bankAccount) VALUES ('3', 'Cash', '150.00', 'N/A'); 
INSERT INTO payments (contractID, paymentType, paymentTotal, bankAccount) VALUES ('4', 'Direct Deposit', '300.00', 'Bank of America'); 
INSERT INTO payments (contractID, paymentType, paymentTotal, bankAccount) VALUES ('5', 'Debit', '250.00', 'Chase');

# queries to view each table
select * from userAccount;
select * from jobProposal;
select * from jobProposalStatus;
select * from contractDetails;
select * from payments;