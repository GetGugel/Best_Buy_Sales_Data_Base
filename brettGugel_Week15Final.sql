/***************************************************
Brett Guge
BCS 360 
Week15 Final
Last Update: 5/7/2023
21038
***************************************************/

--Create and drop the database

DROP TABLE BITEMS;
DROP TABLE BSALES;
DROP TABLE BPRODUCTS; 
DROP TABLE BEMPLOYEES;
DROP TABLE BPRODUCT_CAT;
DROP TABLE BPAYMENT;
DROP TABLE BCUSTOMER;
DROP TABLE BESTREWARDS;

SELECT * FROM  BITEMS;
SELECT * FROM  BSALES;
SELECT * FROM  BPRODUCTS;
SELECT * FROM  BEMPLOYEES;
SELECT * FROM  BPRODUCT_CAT;
SELECT * FROM  BPAYMENT;
SELECT * FROM  BCUSTOMER;
SELECT * FROM  BESTREWARDS;

-----------------------CREATE Tables--------------------------------
CREATE TABLE BESTREWARDS(
RewardsID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
Points BIGINT NOT NULL DEFAULT(0),
JoinDate DATETIME DEFAULT GETDATE())--DROP TABLE BESTREWARDS

--BCUSTOMER
CREATE TABLE BCUSTOMER(
CustomerId INT NOT NULL PRIMARY KEY identity(1,1),
RewardsId INT NOT NULL FOREIGN KEY REFERENCES BESTREWARDS(RewardsID),
FirstName VARCHAR(60) NOT NULL,
LastName VARCHAR(60) NOT NULL,
Phone VARCHAR(25) NOT NULL,
Email VARCHAR(100) NOT NULL,
CreateDate DATETIME DEFAULT GETDATE()
)--DROP TABLE BCUSTOMER

--BPAYMENT
CREATE TABLE BPAYMENT(
PaymentID INT NOT NULL PRIMARY KEY identity(1,1),
CustomerId INT NOT NULL FOREIGN KEY REFERENCES BCUSTOMER(CustomerId),
PaymentType VARCHAR(10) NOT NULL,
CCnum BIGINT,
CCExpMonth INT,
CCExpYear INT,
CCSecNum INT,
[Status] CHAR(2) NOT NULL,
CreateDate DATETIME DEFAULT GETDATE()
)

--Best Buys Data tables

--BPRODUCT_SUB_CAT
CREATE TABLE BPRODUCT_CAT(
ProductCategoryID INT NOT NULL PRIMARY KEY identity(1,1),
CategoryName VARCHAR(60) NOT NULL
)

--BEMPLOYEES
CREATE TABLE BEMPLOYEES(
EmployeeID INT NOT NULL PRIMARY KEY identity(1,1),
EFirstName VARCHAR(60) NOT NULL,
ELastName VARCHAR(60) NOT NULL,
Position VARCHAR(60) NOT NULL,
JoinDate DATETIME DEFAULT GETDATE()
)

--BPRODUCTS
CREATE TABLE BPRODUCTS(
ProductID INT NOT NULL PRIMARY KEY identity(1,1),
ProductSubCategoryID INT NOT NULL FOREIGN KEY REFERENCES BPRODUCT_CAT(ProductCategoryID),
ProductName VARCHAR(60) NOT NULL,
Price MONEY NOT NULL,
Description VARCHAR(60) NOT NULL,
DiscountPercent INT NOT NULL,
DiscountFlat MONEY NOT NULL
)--DROP TABLE BProducts

--BSALES
CREATE TABLE BSALES(
SalesID INT NOT NULL PRIMARY KEY identity(1,1),
CustomerID INT NOT NULL FOREIGN KEY REFERENCES BCUSTOMER(CustomerId),
EmployeeID INT NOT NULL FOREIGN KEY REFERENCES BEMPLOYEES(EmployeeID),
SubTotal MONEY,
Taxes MONEY,
Total MONEY,
SalesDate DATETIME,
[Status] VARCHAR(1)
)

--BITEMS
CREATE TABLE BITEMS(
ItemsID INT NOT NULL PRIMARY KEY identity(1,1),
SalesID INT NOT NULL FOREIGN KEY REFERENCES BSALES(SalesID),
ProductID INT NOT NULL FOREIGN KEY REFERENCES BPRODUCTS(ProductID),
Quanity INT,
TotalPrice MONEY
)




------------------------------INSERT Statments And Stored Procedures-------------------------------------------
--I designed my database so that users could be given stored procedures
--to insert new data. A user cannot directly use an INSERT or UPDATE Statment

--INSERT BESTREWARDS 
--All Customers start with 0 points, they earn points by completing a sale
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
INSERT INTO BESTREWARDS VALUES (0,GETDATE())

--INSERT BCUSTOMER 
INSERT INTO BCUSTOMER VALUES( 1, 'James',	'Smith',	'(767) 546-4245',	'rowl@live.com',GETDATE())
INSERT INTO BCUSTOMER VALUES( 2,'Robert',	'Johnson',	'(922) 769-2703','wetter@verizon.net',GETDATE())
INSERT INTO BCUSTOMER VALUES( 3,'Mary',	'William',	'(916) 620-7171',	'helger@att.net',GETDATE())
INSERT INTO BCUSTOMER VALUES( 4,'Patricia',	'Brown',	'(389) 996-8885',	'jaesenj@comcast.net',GETDATE())
INSERT INTO BCUSTOMER VALUES( 5,'John',	'Jones',	'(443) 429-8706',	'avalon@me.com',GETDATE())
INSERT INTO BCUSTOMER VALUES( 6,'Jennifer',	'Gacia',	'(635) 944-3901',	'shaffei@hotmail.com',GETDATE())
INSERT INTO BCUSTOMER VALUES( 7,'Linda',	'Miller',	'(873) 347-4052',	'akoblin@icloud.com',GETDATE())
INSERT INTO BCUSTOMER VALUES( 8,'Elizabeth',	'Davis',	'(493) 783-2241',	'amichalo@sbcglobal.net',GETDATE())
INSERT INTO BCUSTOMER VALUES( 9,'Michael',	'Rodreguez',	'(388) 706-2688',	'henkp@verizon.net',GETDATE())
INSERT INTO BCUSTOMER VALUES( 10,'David',	'Martinez',	'(221) 858-8177',	'stellaau@optonline.net',GETDATE())

--BPAYMNENT INSERT
INSERT INTO BPAYMENT VALUES( 1 ,'Visa',	1921910212139810,	3,	25,	923,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 1,'MasterCard'	,7813211898711280,	5,	25,	120,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 2 ,'Visa',	7896910213981080,	2,	23,	1224,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 3, 'AmExpress',4200625829358760,	6,	25,	255,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 4,'AmExpress',	6300211898731260,	9,	23,	953,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 5,'Cash',	NULL,	NULL,	NULL,	NULL,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 6,'Discover'	,7812987656783420,	3,	27,	234,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 7,'Cash',	NULL,	NULL,	NULL,	NULL,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 8,'Cash',	NULL,	NULL,	NULL,	NULL,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 9,'Visa',	6300675478116530,	5,	22,	109,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 9,'Discover',	7891555238543070,	9,	29,	3104,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 10,'Discover',	7891237854309070,	9,	24,	3144,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 1,'Cash',	NULL,	NULL,	NULL	,NULL,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 2,'AmExpress',	7891237854309070,	9,	24,	3144,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 3,'Visa',	7891986543890920,	11,	23,	5423,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 4,'Cash',	NULL,	NULL,	NULL,	NULL,	'A',GETDATE())
INSERT INTO BPAYMENT VALUES( 10,'Discover',	7891237854309070,	9,	20,	3144,	'A',GETDATE())
--Employee INSERT, I inserted the values with the stored proc spBEmployee_INSERT
EXEC spBEmployee_INSERT 'Kevin',	'Hernandez',	'Cashier'
EXEC spBEmployee_INSERT 'Brian',	'Lopez',	'Cashier'
EXEC spBEmployee_INSERT 'Dorothy',	'Gonzalez',	'Cashier'
EXEC spBEmployee_INSERT 'Melissa',	'Wilson',	'Cashier'
EXEC spBEmployee_INSERT 'Timmothy',	'Anderson',	'Cashier'
EXEC spBEmployee_INSERT 'Ronald',	'Thomas',	'Cashier'
EXEC spBEmployee_INSERT 'Edward',	'Tayler',	'Manager'
EXEC spBEmployee_INSERT 'Rebecca',	'Moore',	'Manager'
EXEC spBEmployee_INSERT 'Sharon',	'Martin',	'TechSupport'
EXEC spBEmployee_INSERT 'Jason',	'Jackson',	'TechSupport'

--Product Category Insert, I inserted the values with the stored proc spBProdCat_INSERT
EXEC spBProdCat_INSERT  'TV & Home Theater'
EXEC spBProdCat_INSERT  'Computers'
EXEC spBProdCat_INSERT  'Video Games'
EXEC spBProdCat_INSERT  'Cell Phones'
EXEC spBProdCat_INSERT  'Wires'

--Product Insert
EXEC spBProduct_INSERT 1,	'Shark-Ion Robot Vacuum',	159.99,	'Wifi Connected Vacuum',	0,	0
EXEC spBProduct_INSERT 1,	'Dyson - Pure Cool Purifying Fan TP01',	239.99,	'Tower - Iron / Silver',	0,	0
EXEC spBProduct_INSERT 2,	'Samsung 65" CU7000',	499.99,'4k UHD',	10,	0
EXEC spBProduct_INSERT 2,	'Samsung 65" Q80B',	1299.99,	'QLED 4K Smart',	0,	300
EXEC spBProduct_INSERT 2,	'Hisense - 65 Class R6G', 	399.99,	 'LED 4K UHD Smart', 	0,	20
EXEC spBProduct_INSERT 3,	'Alienware Aurora R15',	3299.99,	'32GB-RTX 4080-1TB SSD',	0,	0
EXEC spBProduct_INSERT 3,	'Corsair Venfeance a7200',	1949.99,	'16GB-RTX3070-1TB SSD',	0,	0
EXEC spBProduct_INSERT 3,	'MacBook Air 13.6 Laptop', 	1049.99,	 '8GB  - 256GB SSD', 	0,	150
EXEC spBProduct_INSERT 3,	'ASUS - Vivobook 14 Laptop',	429.99,	'i3 8GB  - 128GB SSD ',	0,	0
EXEC spBProduct_INSERT 4,	'Microsoft - Xbox Series X ', 	559.99,	'1TB Console',	0,	0


--Insert Data into BSALES and BINSERT
--I used my stored proc's to enter data, since half of the fields are calculated

--Sale 1
EXEC spBSales_INSERT 1,1
	EXEC spBItems_INSERT 1,3,2
	EXEC spBItems_INSERT 1,6,1
	EXEC spBItems_INSERT 1,1,1
EXEC spBSale_Complete 1,1

--Sale 2
EXEC spBSales_INSERT 2,1
	EXEC spBItems_INSERT 2,3,2
	EXEC spBItems_INSERT 2,6,1
	EXEC spBItems_INSERT 2,1,1
EXEC spBSale_Complete 2,13


--Sale 3
EXEC spBSales_INSERT 3,2
	EXEC spBItems_INSERT 3,2,2
	EXEC spBItems_INSERT 3,6,1
	EXEC spBItems_INSERT 3,9,1
	EXEC spBItems_INSERT 3,10,1
EXEC spBSale_Complete 3,4
--Sale 4
EXEC spBSales_INSERT 5,1
	EXEC spBItems_INSERT 4,2,2
	EXEC spBItems_INSERT 4,6,1
	EXEC spBItems_INSERT 4,9,1
	EXEC spBItems_INSERT 4,10,1
EXEC spBSale_Complete 4,6

--Sale 5
EXEC spBSales_INSERT 2,1
	EXEC spBItems_INSERT 5,3,1
	EXEC spBItems_INSERT 5,10,1
EXEC spBSale_Complete 5,13

--Sale 6
EXEC spBSales_INSERT 6,6
	EXEC spBItems_INSERT 6,3,2
	EXEC spBItems_INSERT 6,6,1
EXEC spBSale_Complete 6,7

--Sale 6
EXEC spBSales_INSERT 6,6
	EXEC spBItems_INSERT 6,3,2
	EXEC spBItems_INSERT 6,6,1
EXEC spBSale_Complete 6,7
--7 was a test case


--Sale 8
EXEC spBSales_INSERT 9,4
	EXEC spBItems_INSERT 8,7,2
	EXEC spBItems_INSERT 8,3,9
EXEC spBSale_Complete 8,17

--Sale 9
EXEC spBSales_INSERT 4,2
	EXEC spBItems_INSERT 9,8,2
	EXEC spBItems_INSERT 9,3,1
	EXEC spBItems_INSERT 9,1,2
	EXEC spBItems_INSERT 9,3,1
EXEC spBSale_Complete 9,5

--Sale 10
EXEC spBSales_INSERT 6,5
	EXEC spBItems_INSERT 10,1,2
	EXEC spBItems_INSERT 10,6,1
	EXEC spBItems_INSERT 10,9,2
	EXEC spBItems_INSERT 10,10,6
EXEC spBSale_Complete 10,7



SELECT * FROM BSALES
SELECT * FROM BPAYMENT


----------------------------Test Cases-------------------------------------

---------------------Customer Tests----------------------------------------
PRINT '1'
--Run these too line together
INSERT INTO BESTREWARDS VALUES (0,GETDATE())
EXEC spBCUST_INSERT 11,'Test',	'existsingReward',	'(635) 949-3901',	'shaffei22@hotmail.com'
	--Create a new customer with an existing reward account

PRINT '2'
EXEC spBCUST_INSERT 12,'Test2',	'non-existsingReward',	'(635) 940-3901',	'shaffei220@hotmail.com'
	--Create a new customer with a new reward account

PRINT '3'
EXEC spBCUST_INSERT 1,'James',	'Smith',	'(767) 546-4245',	'rowl@live.com'
	--RewardsID is in use
PRINT '4'
EXEC spBCUST_INSERT 100,'Robert',	'Johnson',	'(922) 769-2703','wetter@verizon.net'
	--Customer Already Exists
PRINT '5'
EXEC spBCUST_INSERT 100,'Mary1',	'William',	'(916) 620-7171',	'helger@att.net'
	--Customer with this Phone Number exists
PRINT '6'
EXEC spBCUST_INSERT 100,'Mary1',	'William',	'(916) 620-7170',	'helger@att.net'
	--Customer Exists With this email


--------------------------BPAYMNENT test cases-------------------------------
PRINT ' 1'
EXEC spBPay_INSERT 2,'AmExpress',	789123784309070,	9,	24,	3144
	--card is valid
PRINT ' 2'
EXEC spBPay_INSERT 3,'Visa',	7891986543890920,	11,	13,	5423
	--card is expired
PRINT ' 3'
EXEC spBPay_INSERT 2,'Cash',	NULL,	NULL,	NULL,	NULL
	--Valid Cash
PRINT ' 4'
EXEC spBPay_INSERT 2,'Discover',	7891986543890920,	9,	24,	3144
	--Valid Discover card
PRINT ' 5'
EXEC spBPay_INSERT 0,'Discover',	7891986543890920,	9,	24,	3144
	--Customer Does not Exist

------------------------BEMPLOYEE Test Cases-----------------------------------
PRINT '1'
EXEC spBEmployee_INSERT 'Sharon',	'Martin',	'TechSupport'
	--Employee Exists
PRINT '2'
EXEC spBEmployee_INSERT 'Jason2',	'Jackson',	'TechSupport'
	--Unique Employee


------------------------BPRODUCT_CAT Cases-------------------------------------
PRINT '1'
EXEC spBProdCat_INSERT  'Cell Phones'
	--Product Category Exists
PRINT '2'
EXEC spBProdCat_INSERT 'Lighting'
	--Unique Product Category

------------------------BProduct Cases---------------------------------------------
PRINT '1'
EXEC spBProduct_INSERT 4,	'Microsoft - Xbox Series X ', 	559.99,	'1TB Console',	0,	0
	--Product already exists
PRINT '2'
EXEC spBProduct_INSERT 4,	'Microsoft - Xbox Series S ', 	0,	'1TB Console',	0,	0
	--Price is Too Low
PRINT '3'
EXEC spBProduct_INSERT 4,	'Microsoft - Xbox Series S ', 	1,	'1TB Console',	0,	2
	--Discount (flat) is greater than the sale price
PRINT '4'
EXEC spBProduct_INSERT 4,	'Microsoft - Xbox Series S ', 	100.99,	'1TB Console',	100,	0
	--Discount (percent) is greater than 99


------------------------BSALES Test Cases-----------------------------------
--Insert
EXEC spBSales_INSERT 100,1
	--Customer ID is unused 
EXEC spBSales_INSERT 1,100
	--Employee ID is unused 
EXEC spBSales_INSERT 11,1
	--Customer has no valid payment options
EXEC spBSales_INSERT 3,1
	--Customer already has an active sale

--Close/ A Sale
EXEC spBSale_Complete 4
	--Closes a sale
EXEC spBSale_Complete 1
	--The sale is already closed
EXEC spBSale_Complete 100
	--The sale does not exist

------------------------BItems Test Cases-----------------------------------
EXEC spBItems_INSERT 1,1,1
	--Sale has already been closed
EXEC spBItems_INSERT 6,88,1
	--Product does not exist
EXEC spBItems_INSERT 6,5,0
	--Quantity cannot be less than or equal to 0
EXEC spBItems_INSERT 5,6,1
EXEC spBItems_INSERT 5,2,1


------------------------BSALES Test Cases-----------------------------------
--Test Case: Card has expired
EXEC spBSales_INSERT 10,1
	EXEC spBItems_INSERT 7,1,6
	EXEC spBItems_INSERT 7,2,3
PRINT '1'
EXEC spBSale_Complete 7,16
	--card is set to E for expired
PRINT '2'
EXEC spBSales_INSERT 3,1
	--Customer already has an open sale
PRINT '3'
EXEC spBSales_INSERT 100,1
	--Customer does not exist
PRINT '4'
EXEC spBSales_INSERT 1,100
	--Employee does not exist
PRINT '5'
EXEC spBSales_INSERT 11,1
	--Customer has no valid payment options
PRINT '6'
EXEC spBSale_Complete 1,1
	--SalesID has already been closed (Status=C)
PRINT '7'
EXEC spBSale_Complete 6,333
	--SalesID does not belong to this customer

------------------------------UDF-------------------------------------------

CREATE FUNCTION udfGetCardStatus(@CCExpMonth INT,@CCExpYear INT)
RETURNS int
AS BEGIN
	DECLARE @CardStatus int;
	--Check the cards expiration Date
	IF(@CCExpYear>( YEAR( GETDATE() ) % 100 ))
	--Payment is valid
	BEGIN 
		SET @CardStatus=1;RETURN @CardStatus;
	END
	ELSE IF(@CCExpYear=( YEAR( GETDATE() ) % 100 ) AND @CCExpMonth>MONTH(GETDATE()))
	--Payment is valid
	BEGIN 
		SET @CardStatus=1;RETURN @CardStatus;
	END 
	ELSE
		SET @CardStatus=0;RETURN @CardStatus;
END;--DROP FUNCTION dbo.udfGetCardStatus

------------------------------Stored Procedures-------------------------------------------

--Used to Create a New BCUSTOMER, BESTREWARDS is Created with a customer 
--If a customer had an account, their old rewards account can be paired
CREATE PROC spBCust_INSERT(
@RewardsId INT,
@FirstName VARCHAR(60),  @LastName VARCHAR(60), 
@Phone VARCHAR(25),  @Email VARCHAR(100)
)
AS BEGIN TRY

	IF NOT EXISTS(SELECT 1 FROM BESTREWARDS WHERE RewardsID=@RewardsID)
	--case 0: RewardsId does not exist
	BEGIN
		PRINT 
			'RewardsID does not exist, attempting to create a new
			BESTREWARD and CUSTOMER'
			
		IF NOT EXISTS
		(SELECT 1 FROM BCUSTOMER WHERE 
		FirstName=@FirstName AND LastName=@LastName)
		--case 0.1: Customer Name is unique
		BEGIN
	
			IF NOT EXISTS
			(SELECT 1 FROM BCUSTOMER WHERE Phone=@Phone)
			--case 0.2: Customer Phone is unique
			BEGIN
			
				IF NOT EXISTS
				(SELECT 1 FROM BCUSTOMER WHERE email=@email )
				--case 0.3: Customer Eamil is unique
				BEGIN
					PRINT 'Creating Customer Account'
					INSERT INTO BESTREWARDS VALUES(0,GETDATE())
					SET @RewardsId = (SELECT MAX(RewardsID) FROM BESTREWARDS)
					INSERT INTO BCUSTOMER VALUES(@RewardsId,@FirstName,@LastName,@Phone,@Email,GETDATE())
				END
				ELSE BEGIN--Customer Eamil is NOT unique
					PRINT 'ERROR: Customer Already Exists with this email'
				END
			END
			ELSE BEGIN--Customer Phone is NOT unique
				PRINT 'ERROR: Customer Already Exists with this Phone'
			END
		END
		ELSE BEGIN--Customer Name is NOT unique
			PRINT 'ERROR: Customer Already Exists with this name'
		END
	END
	
	ELSE IF EXISTS(SELECT 1 FROM BCUSTOMER WHERE RewardsID=@RewardsID)
	--case 1:  RewardsId Is already in Use
	BEGIN
		PRINT 'RewardsID is being used by Someone else'
	END
	
	
	ELSE IF NOT EXISTS(SELECT 1 FROM BCUSTOMER WHERE RewardsID=@RewardsID)
	--case 2: RewardsId exists and is not in use
	BEGIN
		PRINT 'RewardsID exists, Attempting pairing to New BCUSTOMER Account'

		IF NOT EXISTS
		(SELECT 1 FROM BCUSTOMER WHERE 
		FirstName=@FirstName AND LastName=@LastName)
		--case 2.1: Customer Name is unique
		BEGIN
		
			IF NOT EXISTS
			(SELECT 1 FROM BCUSTOMER WHERE Phone=@Phone)
			--case 2.2: Customer Phone is unique
			BEGIN
			
				IF NOT EXISTS
				(SELECT 1 FROM BCUSTOMER WHERE email=@email )
				--case 2.3: Customer Eamil is unique
				BEGIN
					PRINT 'Creating Customer Account'
					INSERT INTO BCUSTOMER VALUES(@RewardsId,@FirstName,@LastName,@Phone,@Email,GETDATE())
				END
				ELSE BEGIN--Customer Eamil is NOT unique
					PRINT 'ERROR: Customer Already Exists with this email'
				END
			END
			ELSE BEGIN--Customer Phone is NOT unique
				PRINT 'ERROR: Customer Already Exists with this Phone'
			END
		END
		ELSE BEGIN--Customer Name is NOT unique
			PRINT 'ERROR: Customer Already Exists with this name'
		END
	END
END TRY

BEGIN CATCH
	THROW 51000, 'Error adding customer', 1;  
END CATCH--DROP PROCEDURE spBCUST_INSERT

--Used to Insert a New BPAYMENT 
CREATE PROC spBPay_INSERT(--Done
@CustomerID INT,
@PaymentType VARCHAR(10),
@CCnum BIGINT,
@CCExpMonth INT,
@CCExpYear INT,
@CCSecNum INT
)
AS BEGIN TRY
	
	IF EXISTS (SELECT 1 FROM BCUSTOMER WHERE CustomerId=@CustomerID)
	--Case 0: Customer Exists
	BEGIN
		IF(@PaymentType = 'Cash')
		--Case 1: Payment type is case
		BEGIN
			PRINT 'Creating Cash Payment'
			INSERT INTO BPAYMENT VALUES (@CustomerID,@PaymentType,NULL,NULL,NULL,NULL,'A',GETDATE())
		END

		ELSE IF (@PaymentType='Visa' OR @PaymentType='MasterCard' OR @PaymentType='Discover' 
			OR @PaymentType='AmExpress')
		--Case 2: Payment type is a valid card
		BEGIN
		
			IF(( dbo.udfGetCardStatus(@CCExpMonth,@CCExpYear))=1)
			--Case 2.1: Payment card is not expired
			BEGIN
				PRINT 'Payment is Valid'
				PRINT 'Creating a payment'
				INSERT INTO BPAYMENT VALUES (@CustomerID,@PaymentType,@CCnum,@CCExpMonth,@CCExpYear,@CCSecNum,'A',GETDATE())
				
			END
			ELSE
				PRINT 'ERROR: The card is already expired'
		END
		ELSE
			PRINT 'ERROR: Invalid Payment type, Vaild Types are: Visa, Discover, MasterCard, AmExpress, and Cash'

	END
	ELSE
		PRINT 'ERROR: CustomerID does not Exist in the Database'
END TRY 

BEGIN CATCH 
	THROW 51000, 'Error adding payment', 1;  
END CATCH--DROP PROCEDURE spBPay_INSERT 

--Create a new Employee
CREATE PROC spBEmployee_INSERT(
@EFirstName VARCHAR(60),
@ELastName VARCHAR(60),
@Position VARCHAR(60)
)
AS BEGIN TRY
	IF NOT EXISTS (SELECT 1 FROM BEMPLOYEES WHERE @EFirstName=EFirstName AND @ELastName=ELastName)
	BEGIN
		PRINT'Creating A New Employee'
		INSERT INTO BEMPLOYEES VALUES (@EFirstName,@ELastName,@Position,GETDATE())
	END
	ELSE
		PRINT 'ERROR: An Employee Exists With this Name'

END TRY
BEGIN CATCH
	THROW 51000, 'Error adding customer', 1;  
END CATCH--DROP PROC spBEmployee_INSERT

--Insert a new product category
CREATE PROC spBProdCat_INSERT(
@CategoryName VARCHAR(60)
)
AS BEGIN TRY
	IF NOT EXISTS (SELECT 1 FROM BPRODUCT_CAT WHERE @CategoryName=CategoryName)
	BEGIN
		PRINT'Creating A New Product Category'
		INSERT INTO BPRODUCT_CAT VALUES (@CategoryName)
	END
	ELSE
		PRINT 'ERROR: A Category with this name already exists'

END TRY
BEGIN CATCH
	THROW 51000, 'Error adding Product Category', 1;  
END CATCH--DROP PROC spBProdCat_INSERT

--Insert a New Product
CREATE PROC spBProduct_INSERT(
@ProductCategoryID INT,
@ProductName VARCHAR(60),
@Price MONEY,
@Description VARCHAR(60),

@DiscountPercent INT,
@DiscountFlat MONEY
)
AS BEGIN TRY

	IF (@Price<=0)
	BEGIN
		PRINT 'Error: Price cannot be below 0.01'
	END
	ELSE IF (@DiscountFlat>@Price)
	BEGIN
		PRINT 'Error: A Products Discount cannot be greater than its Price'
	END
	ELSE IF (@DiscountPercent>99 OR @DiscountPercent<0)
	BEGIN
		PRINT 'Error: A Products Discount Percent must be between 99 and 0'
	END
	ELSE IF NOT EXISTS(SELECT 1 FROM BPRODUCTS WHERE @ProductName=ProductName)
	BEGIN
		PRINT 'Creating New Product' 
		INSERT INTO BProducts VALUES 
		(@ProductCategoryID,@ProductName,@Price,@Description,@DiscountPercent,@DiscountFlat)
	END
	ELSE
		PRINT 'A Product With this name exists'
		
END TRY
BEGIN CATCH
	THROW 51000, 'Error adding Product', 1;  
END CATCH
--ensure DPrecent is not above 100 or below 0 and DFlat is not greater than the price
--product  must be unique in name.
--Product must have a Category that exsits

--Open a new sale
CREATE PROC spBSales_INSERT(
@CustomerID int,
@EmployeeID int
)
AS BEGIN TRY 
	DEClARE @newSale INT
	DEClARE @oldSale INT
	SET @newSale= (SELECT MAX(SalesID)+1 FROM BSALES)

	IF EXISTS (SELECT 1 FROM BCUSTOMER WHERE @CustomerID=CustomerID)
	BEGIN
		IF EXISTS (SELECT 1 FROM BPAYMENT WHERE @CustomerID=CustomerId AND [Status]='A')
		BEGIN
			IF EXISTS (SELECT 1 FROM BEMPLOYEES WHERE @EmployeeID=EmployeeID)
			BEGIN
				IF NOT EXISTS (SELECT 1 FROM BSALES WHERE @CustomerID=CustomerId AND [Status]='A')
				BEGIN
					PRINT 'Opening a New Sale at ID'+ CONVERT(VARCHAR,@newSale)
					INSERT INTO BSALES VALUES (@CustomerID,@EmployeeID,0,0,0,GETDATE(),'A')
				END
				ELSE
				BEGIN
					SET @oldSale= (SELECT SalesID FROM BSALES WHERE @CustomerID=CustomerId AND [Status]='A')
					PRINT 'Error this customer already has an Active sale at ID:'+ CONVERT(VARCHAR,@oldSale)
				END
			END
			ELSE
				PRINT 'This EmployeeID is unsued' 
		END
		ELSE 
			PRINT 'This Customer Has no Valid Payment Options'
	END
	ELSE
		PRINT 'This CustomerID is unused'
END TRY 

BEGIN CATCH
	THROW 51000, 'Error adding A new Sale', 1;  
END CATCH --DROP PROC spBSales_INSERT

CREATE PROC spBItems_INSERT(
@SalesID INT,
@ProductID INT,
@Quantity INT)
AS BEGIN TRY

DECLARE @TotalPrice MONEY

	 IF(@Quantity>0)
		BEGIN
		IF NOT EXISTS (SELECT 1 FROM BSales WHERE @SalesID=SalesID)
		BEGIN
			PRINT 'SalesID does not exist, open a new sale or try a diffrent number'
		END 
	
		ELSE IF ('C'=(SELECT [Status] FROM BSales WHERE @SalesID=SalesID))
		BEGIN
			PRINT 'This SalesID has already been closed'
		END 
		ELSE IF EXISTS (SELECT 1 FROM BPRODUCTS WHERE @ProductID=ProductID)
		BEGIN
			PRINT 'ProductID exists'
			PRINT 'Atttempting to Add Item to Sale'
			SET @TotalPrice=@Quantity*
			(((SELECT Price FROM BProducts WHERE @ProductID=ProductID)-(SELECT DiscountFlat FROM BProducts WHERE @ProductID=ProductID))
			-(SELECT (DiscountPercent/100)*Price FROM BProducts WHERE @ProductID=ProductID))
			INSERT INTO BITEMS VALUES (@SalesID,@ProductID,@Quantity,@TotalPrice)

			UPDATE BSALES 
			SET SubTotal=SubTotal+@TotalPrice WHERE @SalesID=SalesID
			UPDATE BSALES 
			SET Taxes=ROUND(SubTotal*0.08,2) WHERE @SalesID=SalesID
			UPDATE BSALES 
			SET Total=ROUND(SubTotal+Taxes,2) WHERE @SalesID=SalesID
		END
		ELSE
			PRINT 'Product Does not exist'
	END
	ELSE
		PRINT 'Quanity cannot be less than equal to 0'


END TRY

BEGIN CATCH

	THROW 51000, 'Error adding Product', 1;  

END CATCH--DROP PROC spBItems_INSERT



--This Procedure closes a sale, and assigns points to the customer
--If their payment method has an active status, but its expiration
--has past, the card will be updated and the sale will remain open
CREATE PROC spBSale_Complete(@SalesID INT,@PaymentId INT)
AS BEGIN TRY

	DECLARE @ccmonth INT
	DECLARE @ccYear INT

	
	IF NOT EXISTS (SELECT 1 FROM BSales WHERE @SalesID=SalesID)
	BEGIN
		PRINT 'SalesID does not exist, open a new sale or try a diffrent number'
	END 

	ELSE IF ('C'=(SELECT [Status] FROM BSales WHERE @SalesID=SalesID))
	BEGIN
		PRINT 'This SalesID has already been closed'
	END 

	ELSE IF  EXISTS (SELECT 1 FROM BPAYMENT BP 
		JOIN BSALES BS ON BS.CustomerID=BP.CustomerID
		WHERE @SalesID=SalesID AND @PaymentId=PaymentID AND
		BS.CustomerID=BP.CustomerId AND BP.[Status]='A')
	BEGIN

		IF ((SELECT PaymentType FROM BPAYMENT WHERE PaymentID=@PaymentId) = 'Cash')
		BEGIN
			PRINT 'Closing this Sale with a cash payment'
			UPDATE BSALES
			SET [Status]='C' WHERE @SalesID=SalesID

			UPDATE BESTREWARDS
			SET points=ROUND(BS.Total/100,0)+points 
			FROM BESTREWARDS BR JOIN BCUSTOMER BC ON  BR.RewardsID=BC.RewardsId
			JOIN BSALES BS ON BS.CustomerID=BC.CustomerID
			WHERE @SalesID=SalesID
		END
		
		ELSE IF(( dbo.udfGetCardStatus((SELECT CCExpMonth FROM BPAYMENT WHERE @PaymentId=PaymentID),
		(SELECT CCExpYear FROM BPAYMENT WHERE @PaymentId=PaymentID)))=1)
		BEGIN
			PRINT 'Closing this Sale with card'
				UPDATE BSALES
				SET [Status]='C' WHERE @SalesID=SalesID

				UPDATE BESTREWARDS
				SET points=ROUND(BS.Total/100,0)+points 
				FROM BESTREWARDS BR JOIN BCUSTOMER BC ON  BR.RewardsID=BC.RewardsId
				JOIN BSALES BS ON BS.CustomerID=BC.CustomerID
				WHERE @SalesID=SalesID
		END

		ELSE
		BEGIN
			PRINT 'Your Payment method has expired, try another payment or create a new one'
			UPDATE BPAYMENT
			SET [Status]= 'E'
			WHERE @PaymentID=PaymentID
		END	

	END
	ELSE
		PRINT 'This paymentID does not belong to this customer or it is expired'
END TRY

BEGIN CATCH
		THROW 51000, 'Error Completing sale', 1;  
END CATCH --DROP PROC spBSale_Complete














