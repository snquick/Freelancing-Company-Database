# Freelancing-Company-Database

**Introduction - Background of the organization (30 points)**
○ Provide a brief introduction of the sub-system and the organization in one 

For this course project, I decided to make a sub-system of my freelancing business to help me 
become more organized with freelancing, along with broadening my skills with SQL. For 
freelancing, I’m a wordpress consultant and I develop websites by programming. I eventually want
to begin making personalized themes and plugins for wordpress, but since I have not begun that 
yet I do not believe this will be included in the sub-system. Instead, I’ll be focusing on keeping a 
database of clients requests and contracts, payments, user accounts (this goes along with 
contracts), and most likely a table dedicated to the job details/description. In total, there should be 
4-5 tables


**Part II - ER/Class Diagram--Draw the class diagram for your proposed database**
https://lucid.app/lucidchart/6d686b85-4375-4339-b48d-349f33f1aa5e/edit?shared=true&page=0_0&invitationId=inv_7c5dd6c3-d1ee-4848-844a-8d3eb97f04ea#


**Part III - Description of tables (10 points)**

○ In a couple of sentences, provide a brief description of each table in your 
database. Also include a short description of the columns/attributes from 
each table.
In my sub-system, I decided to focus on the contract and job proposal portion of my freelancing 
business. With this, I made five tables: JobProposal, ContractDetails, UserAccount, 
JobProposalStatus, and Payments. 

ContractDetails: The user makes the contract when submitting a job request on the freelancing 
website, such as Upwork. They select which package they want (standard 1 web page, multiple 
pages, etc) and that will be saved as the jobType column. They will also input the rest of this 
table’s information when they are submitting their contract request. These values include: 
customerName, startDate, dueDate, contactInformation, paymentType, and paymentTotal. The 
only field in this table that is not inputted by the user is the jobID which will be generated in the 
table. 

JobProposal: This is the table that I would mainly be using after the contract is accepted. The first 
time I view a job, I would see it in the contract details and accept it. After that, I would mainly use 
the jobProposal table to just view the requirements relating to this job. The columns in this table 
include: [PK] proposalID, [FK]JobID, jobType, customerName, dueDate, clientComments. I made 
this because I normally do not review the payment information every time I want to quickly check 
on the job information. This is the table I would use after taking a break from the job and coming 
back to it. Hence, this is mainly used for my productivity and view only.

UserAccount: This table is only used if the customer wants a wordpress website made. For 
wordpress, you need an account created for the user to access whenever they need. I would 
either gather an account from them to make the website, or create a new one for them. The 
columns in this table include: [PK] AccountID, username, password, email, firstName, lastName. 

jobProposalStatus: This table’s purpose is to view all previously completed projects, current 
projects, and upcoming projects. It’s a great way to keep all the projects I have done organized 
and to stay on track on what needs to be done. The columns in here include: [FK] JobID, 
customerName, and jobStatus.

Payments: If I need to review payments, this is what this table is for. The columns include: [PK] 
paymentID, [FK]paymentType, [FK]paymentTotal, and bankAccountID.


**Part IV - Description of keys - Primary, foreign, composite (20 points)**

In a couple of sentences, provide a brief description of the primary, foreign 
and composite keys for each table.

A majority of the tables I will be using for this project do have primary keys and foreign keys. For 
the contractDetails, JobProposal, Payments, and UserAccount, these all have primary keys. For 
example, contractDetails has a jobID that will keep each of the contracts organized and unique. 
This key cannot be null or repeated. I’ll most likely make it a one-by-one ratio. Similarly, the other 
tables mentioned also have ID primary keys to keep each of the logs unique. In regards to the 
foreign keys, the JobID from contractDetails has to be called into 3 other tables. I do this because 
the jobID is important, especially if some people have duplicate last names, and it’s typically easy 
to remember. I also call the value paymentType and paymentTotal to the payments table in case I
just want to make sure a payment went through and I don’t want to view all the details of the 
contract. 


● Data types for each attribute (20 points)

○ In a couple of sentences, provide reasoning for selecting data types for each
attribute/column.

The data types that I will be using for this project are varchar(n), datetime, smallmoney, and int. 
For columns that involve names, descriptions, and explained the jobType along with usernames 
and emails, I will be using the varchar(n) data type. I decided against using the nvarchar data type
since it includes unicode strings which I will not be using and using nvarchar(max) is considered a
large value type that requires additional processing. For the due dates and start dates, I will be 
using datetime. I haven’t used any other date data type and since we used this in previous labs, I 
feel more comfortable using this one. With int, that will contribute to the ID numbers and these 
don’t need to be special notation. Lastly, smallmoney will be involved with the payment table to 
keep it organized. 



● Description of relationships (20 points)

○ In a couple of sentences provide a brief description of the relationships 
between the tables of your database.

The only two types of relationships between my tables for this sub-system is one-to-one and 
many-to-one relationships. For contract details to payments, this is a many-to-one relationship. 
Since I am able to have many contracts at the same time, but each contract can only have one 
payment, that is how I formed the relationship. Similarly with contractDetails and JobProposals. 
Each jobProposal can only have one contract but I can have many contracts. This goes for the 
same with JobProposal status that has the many to one relationship with jobProposals. Lastly, I 
made a one-to-one relationship with userAccounts and JobProposal. Each jobProposal can only 
have one userAccount and vice versa
