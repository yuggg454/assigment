-- Created a database named contact_management.
CREATE DATABASE contact_management;
USE contact_management;

-- Created a table named Company.
CREATE TABLE Company (
    CompanyID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Industry VARCHAR(45),
    Phone VARCHAR(12)
);

-- Created a table named Contact.
CREATE TABLE Contact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

-- Created a table named Employee.
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    HireDate DATE,
    Salary DECIMAL(10,2),
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

-- Created a table named ContactEmployee.
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,  
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Updated Lesley Bland’s phone number
UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

-- Updated Company name
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

-- Remove Dianne Connor’s contact event with Jack Lee
DELETE ce
FROM ContactEmployee ce
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Employee e ON ce.EmployeeID = e.EmployeeID
WHERE c.FirstName = 'Dianne' AND c.LastName = 'Connor'
  AND e.FirstName = 'Jack' AND e.LastName = 'Lee';

-- Select names who contacted “Toll Brothers”
SELECT DISTINCT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';

-- To show tables
SHOW TABLES;

/*
	8) What is the significance of “%” and “_” operators in the LIKE statement? 
    Answer:- 
    % → matches any number of characters
	Example: 'A%' → strings starting with A

	_ → matches exactly one character
	Example: 'A_' → strings with A + any 1 letter (like "Ab", "As")
    
    9) Explain normalization in the context of databases. 
	Answer:-
    Normalization is a database process that organizes data to reduce redundancy ,
    avoid update problems ,improve data integrity.
    
    10) What does a join in MySQL mean?
    Answer:-
    A join combines rows from two or more tables based on a foreign key.
	It allows retrieving connected data.
    
    11) What do you understand about DDL, DCL, and DML in MySQL?
    Answer:-
In SQL, DDL means Data Definition Language and it includes commands like CREATE, ALTER, DROP that are used to make or change tables. DML means Data Manipulation Language and includes SELECT, INSERT, UPDATE, DELETE which are used to work with the data inside the tables. DCL means Data Control Language and includes GRANT and REVOKE which control who can access or modify the database. So DDL defines the structure, DML works with the data, and DCL controls permissions.
    
    12) What is the role of the MySQL JOIN clause in a query, and what are some
	common types of joins? 
    Answer:-
    A join is used to combine data from two or more tables based on a matching column. The main types are INNER JOIN , LEFT JOIN, RIGHT JOIN , and FULL JOIN . Joins help us read connected data easily across tables.
*/