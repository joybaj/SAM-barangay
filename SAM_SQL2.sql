CREATE DATABASE SAMChatbot

USE SAMChatbot

CREATE TABLE [Role]
(
	RoleID INT NOT NULL
		CONSTRAINT RoleID PRIMARY KEY 
	,RoleName CHAR (15) NOT NULL
);

CREATE TABLE [Login] 
(
	Username CHAR (15) NOT NULL
		CONSTRAINT Username PRIMARY KEY
	,[Password] CHAR (15) NOT NULL
	,RoleID INT NOT NULL
		FOREIGN KEY (RoleID)
		REFERENCES [Role] (RoleID)
);

CREATE TABLE [User]
(
	UserID INT NOT NULL
		CONSTRAINT UserID PRIMARY KEY
	,[User_Name] CHAR (35) NOT NULL
	,User_Email CHAR (50) NOT NULL
	,Username CHAR (15) NOT NULL
		FOREIGN KEY (Username)
		REFERENCES [Login] (Username)
	,[Password] CHAR (15) NOT NULL
);

CREATE TABLE [Admin]
(
	AdminID INT NOT NULL
		CONSTRAINT AdminID PRIMARY KEY
	,Admin_Name CHAR (35) NOT NULL
	,Admin_Email CHAR (50) NOT NULL
	,Username CHAR (15) NOT NULL
		FOREIGN KEY (Username)
		REFERENCES [Login] (Username)
	,[Password] CHAR (15) NOT NULL
);

CREATE TABLE [Transaction]
(
	TransactionID INT NOT NULL
		CONSTRAINT TransactionID PRIMARY KEY
	,UserID INT NOT NULL
		CONSTRAINT UserID FOREIGN KEY
		REFERENCES [User] (UserID)
	,ServiceID INT NOT NULL
	--how to constraint? parent?
	,AdminID INT NOT NULL
		CONSTRAINT AdminID FOREIGN KEY
		REFERENCES [Admin] (AdminID)
	,Date_Requested DATETIME NOT NULL
	,Date_Completed DATETIME NOT NULL
	,[Status] VARCHAR (25) NOT NULL
);

CREATE TABLE [System_Details]
(
	SystemDetails_ID INT NOT NULL
		CONSTRAINT SystemDetails_ID PRIMARY KEY
	,Detail_Name CHAR (25) NOT NULL
	,Details VARCHAR (255) NOT NULL
);

CREATE TABLE [Document_Request]
(
	DocReqID INT NOT NULL
		CONSTRAINT DocReqID PRIMARY KEY
	,TransactionID INT NOT NULL
		FOREIGN KEY (TransactionID)
		REFERENCES [Transaction] (TransactionID)
	,DocumentType VARCHAR (25) NOT NULL
	,ValidID CHAR (25) NOT NULL
	,Purpose CHAR (255) NOT NULL
);

CREATE TABLE [User_Concern]
(
	ConcernID INT NOT NULL
		CONSTRAINT ConcernID PRIMARY KEY
	,TransactionID INT NOT NULL
		FOREIGN KEY (TransactionID)
		REFERENCES [Transaction] (TransactionID)
	,Concern VARCHAR (255) NOT NULL
	,ImgProof VARCHAR (255) NOT NULL
);