--Drop Database [ResturantManagement]
--iF DATABASE EXISTS, DROP
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'ResturantManagement')
    DROP DATABASE [ResturantManagement]
GO

CREATE DATABASE [ResturantManagement];  --- Why is the name this way? Lets stick to ResturantManagement
go

Use ResturantManagement
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Damg6210-ResturantManagement-password';
Go
CREATE certificate ResturantManagementPass
      WITH SUBJECT = 'ResturantManagement  Password';
   Go

CREATE SYMMETRIC KEY PersonPass_SM
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE ResturantManagementPass;
Go
CREATE SYMMETRIC KEY PaymentPass_SM
     WITH ALGORITHM = AES_256
     ENCRYPTION BY CERTIFICATE ResturantManagementPass;
Go

-- Create Person table --
USE ResturantManagement --- Specifiy Use Statement for all table creation statements
CREATE TABLE Person (
    PersonID INT IDENTITY(0000,1) PRIMARY KEY, 
    FirstName [VARCHAR](40) NOT NULL,
    LastName [VARCHAR](40) NOT NULL,
    Email [VARCHAR](30) NOT NULL,
    PhoneNo [VARCHAR](10) NOT NULL,
    Username [VARCHAR](15) NOT NULL,
    [Password] [varbinary](200) NOT NULL,
    PersonType [VARCHAR](1) NOT NULL,
    BirthDate DATE NOT NULL,
    CreatedDate DATETIME DEFAULT SYSDATETIME(),
    LastModifiedDate DATETIME,
    CONSTRAINT chk_PersonType CHECK (PersonType IN ('M', 'C', 'D')),
    CONSTRAINT chk_Phone CHECK (PhoneNo not like '%[^0-9]%' AND len(PhoneNo) = 10),
    CONSTRAINT chk_Email CHECK (Email like '%_@__%.__%')
)
go
-- Create Customer table --
Use ResturantManagement 
CREATE TABLE Customer(CustomerID INT NOT NULL,
CONSTRAINT [f_CustomerPerson] FOREIGN KEY(CustomerID) REFERENCES Person(PersonID),
CONSTRAINT pk_Customer PRIMARY KEY (CustomerID)
)
Go

-- Create Delivery Partner table --
Use ResturantManagement
CREATE TABLE [Delivery Partner] (
    DeliveryPartnerID INT PRIMARY KEY,
    SSN VARCHAR (10) NOT NULL,
    VehicleLicenseNumber [VARCHAR](19) NOT NULL,
    InsuranceNo [VARCHAR](10) NOT NULL,
    CreatedDate DATETIME DEFAULT SYSDATETIME(),
    LastModifiedDate DATETIME,
    CONSTRAINT f_DeliveryPerson FOREIGN KEY(DeliveryPartnerID) REFERENCES Person(PersonID),
    CONSTRAINT chk_Ssn CHECK (SSN not like '%[^0-9]%' AND len(SSN) = 10),
    CONSTRAINT ck_VehicleLicenseSpecialChar CHECK (VehicleLicenseNumber NOT LIKE '%[^A-Z0-9]%'),
    CONSTRAINT ck_InsuranceSpecialChar CHECK (InsuranceNo NOT LIKE '%[^A-Z0-9]%')
)
Go

-- Create Restaurant Manager table --
Use ResturantManagement
CREATE TABLE [Restaurant Manager] (
    ManagerID INT NOT NULL,
    CONSTRAINT [f_ManagerPerson] FOREIGN KEY(ManagerID) REFERENCES Person(PersonID),
    CONSTRAINT pk_Manager PRIMARY KEY (ManagerID)
)
Go

-- Create Restaurant table --
Use ResturantManagement
CREATE TABLE Restaurant(
    RestaurantID INT IDENTITY(0000,1) PRIMARY KEY, 
    RestaurantName [VARCHAR](40) NOT NULL,
    RestaurantType [VARCHAR](30) NOT NULL,
    Rating FLOAT,
    ManagerID INT NOT NULL,
    CostForTwo [VARCHAR](2),
    CreatedDate DATETIME DEFAULT SYSDATETIME(),
    LastModifiedDate DATETIME,
    StreetName VARCHAR(50),
    City VARCHAR(20),
    State VARCHAR(2),
    ZipCode VARCHAR(5),
    StoreOpenTime [VARCHAR](5) NULL,
    StoreCloseTime [VARCHAR](5) NULL
    CONSTRAINT chk_Manager FOREIGN KEY(ManagerID) REFERENCES [dbo].[Restaurant Manager] (ManagerID)
)
Go

-- Create Payment Options table --
Use ResturantManagement
CREATE TABLE [Payment Options](
    PaymentOptionID INT IDENTITY(0000,1) PRIMARY KEY, 
    CustomerID [VARCHAR](40) NOT NULL,
    CardType [VARCHAR](40) NOT NULL,
    CardHolderName [VARCHAR](30) NOT NULL,
    CardNumber [VARCHAR](16) NOT NULL,
    CVV [varbinary](200) NOT NULL,
    ExpiryDate[VARCHAR](20) NOT NULL,
    CreatedDate DATETIME DEFAULT SYSDATETIME(),
    LastModifiedDate DATETIME,
    CONSTRAINT chk_CardNumber CHECK((CardNumber not like '%[^0-9]%' AND len(CardNumber) = 16))
)
Go

-- Create Delivery Address table --
Use ResturantManagement
Create table [Delivery Address] 
(
    DeliveryAddressID INT IDENTITY(0000,1) PRIMARY KEY,
    CustomerID INT,
    AddressType VARCHAR (10) NOT NULL,
    StreetName1 VARCHAR(50) NOT NULL,
    StreetName2 VARCHAR(50),
    City VARCHAR(20) NOT NULL,
    [State] VARCHAR(20) NOT NULL,
    ZipCode VARCHAR(5) NOT NULL,
    CreatedDate DATETIME DEFAULT SYSDATETIME(),
    LastModifiedDate DATETIME
    CONSTRAINT [f_CustomerPersonKey] FOREIGN KEY(CustomerID) REFERENCES Person(PersonID),
    CONSTRAINT chk_ZipCode CHECK (ZipCode not like '%[^0-9]%' AND len(ZipCode) = 4),
    CONSTRAINT chk_AddressType CHECK (AddressType IN ('Home','Work','Other')),
    CONSTRAINT chk_State CHECK (State not like '%[^A-Z]%')
)
Go

-- Create Menu Item --
Use ResturantManagement
Create table [Menu]
(
    MenuID INT IDENTITY(0000,1) PRIMARY KEY,
    ItemName VARCHAR(60) NOT NULL,
    Price int NOT NULL,
    Category VARCHAR(60) NOT NULL,
    RestaurantID int NOT NULL,
    CreatedDate DATETIME DEFAULT SYSDATETIME(),
    lastModifiedDate DATETIME,
    Constraint chk_ResturantID FOREIGN Key(RestaurantID) REFERENCES [Restaurant] (RestaurantID)
)
Go

-- Create Order table --
Use ResturantManagement
Create table [Order]
(
    OrderID INT IDENTITY(0000,1) PRIMARY KEY,
    CustomerID int NOT NULL,
    RestaurantID int NOT NULL,
    DeliveryAddressID int NOT NULL,
    PaymentOptionID int NOT NULL,
    DeliveryPartnerID INT, 
    OrderStatus VARCHAR(20) NOT NULL,
    CreatedDate DATETIME DEFAULT SYSDATETIME(),
    OrderAmount INT,
    Tax AS ([OrderAmount]*(0.1)),
    DeliveryCharge FLOAT NOT NULL,
    [Total Amount] AS (([OrderAmount]+[DeliveryCharge])+[OrderAmount]*(0.1)),
    LastModifiedDate DATETIME,
    OrderDeliveryDate DATE,
    CONSTRAINT [f_CustomerKey] FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT chk_Resturant FOREIGN KEY(RestaurantID)REFERENCES Restaurant(RestaurantID),
    CONSTRAINT chk_DeliveryAddress FOREIGN KEY(DeliveryAddressID)REFERENCES [Delivery Address](DeliveryAddressID),
    CONSTRAINT chk_PaymentOptionID FOREIGN KEY(PaymentOptionID)REFERENCES [Payment Options](PaymentOptionID),
    CONSTRAINT chk_DeliveryPartnerID FOREIGN KEY(DeliveryPartnerID)REFERENCES [Delivery Partner](DeliveryPartnerID),
    CONSTRAINT chk_OrderStatus CHECK (OrderStatus IN ('Order Placed','In Progress','Delivered')),
)
Go

-- Create Order Line item --
Use ResturantManagement
Create table [Order Line] 
(
  OrderLineID int IDENTITY(0000,1) PRIMARY KEY,
  OrderID int NOT NULL,
  MenuItem int NOT NULL,
  Price int NOT NULL,
  Quantity int NOT NULL,
  CreatedDate DATETIME DEFAULT SYSDATETIME()
  Constraint Fk_OrderID FOREIGN Key(OrderID) REFERENCES [Order] (OrderID),
  Constraint Fk_MenuID FOREIGN Key(MenuItem) REFERENCES [Menu] (MenuID)
)
go
-- Create Feedback Table --
Use ResturantManagement
Create table [Feedback]
(
    FeedbackID INT IDENTITY(0000,1) PRIMARY KEY,
    CreatedDate DATETIME DEFAULT SYSDATETIME(),
    Rating INT NOT NULL,
    Comments VARCHAR(180),
    OrderId int NOT NULL
    CONSTRAINT chk_OrderID FOREIGN KEY(OrderID) REFERENCES[Order](OrderID)  
)
Go

 ---Indexes------
--For finding person with person's name instead of person id
Use ResturantManagement
create NONCLUSTERED index Person_Name
on Person (FirstName ASC, LastName ASC)
Go
Use ResturantManagement
--For finding the most recent order
create NONCLUSTERED index Order_Date
on [Order] (CreatedDate DESC)
Go
Use ResturantManagement
--For finding the best rating orders
create NONCLUSTERED index Feedback_Rating
on [Feedback] (Rating DESC)
Go
Use ResturantManagement
--For finding the closet expired cards
Go
Use ResturantManagement
create NONCLUSTERED index Payment_Expire
on [Payment Options] (ExpiryDate ASC)
Go
--Views------
CREATE or ALTER VIEW Order_placed 
AS 
SELECT TOP 1 (DeliveryPartnerID), count(orderStatus) CountOfOrderPlaced from [dbo].[order] group by DeliveryPartnerID, orderStatus
having orderStatus = 'Order Placed';
go


CREATE or ALTER VIEW [dbo].[OrderFeedback] AS
SELECT   CONCAT(p.FirstName,' ',p.LastName) AS [Customer], o.OrderID, r.RestaurantName AS [Restaurant], f.Rating, f.Comments, 
FORMAT(f.CreatedDate,'MM-DD-YY') as [Feedback Date] FROM [Feedback] f
Inner Join [Order] o on o.OrderID =   f.OrderId
Inner Join Customer c on c.CustomerID = o.CustomerID 
Inner Join Person p on p.PersonID = c.CustomerID 
Inner Join Restaurant r on r.RestaurantID = o.RestaurantID  --- o.ResturantID is wrong

GO

CREATE VIEW [dbo].[GetRestaurantProfit] AS
    SELECT RestaurantID, Sum([Total Amount]) AS [Profit] FROM [Order] GROUP BY RestaurantID;
GO


--Functions--
CREATE FUNCTION [dbo].[GetOrderAmount](@OrderID INT)
  RETURNS INT
  AS
    BEGIN 
       RETURN (SELECT Sum([Price] * [Quantity]) FROM [Order Line] ol WHERE ol.OrderID = @OrderID GROUP BY ol.OrderID)
    END
GO

-------PROCEDURES----------

Create or ALTER PROCEDURE dbo.GetCustomerAddress @CustomerID INT
AS
    select Customer.CustomerID,Person.FirstName,Person.lastName,Person.Email,Person.PhoneNo,Person.BirthDate,[Delivery Address].AddressType,[Delivery Address].StreetName1 from [Delivery Address] 
    inner join Customer on Customer.CustomerID = [Delivery Address].CustomerID 
    inner join Person on Person.PersonID = Customer.CustomerID where [Delivery Address].CustomerID= @CustomerID
GO

--EXEC dbo.GetCustomerDetails @CustomerID=10


Create or ALTER PROCEDURE dbo.GetRestaurant @columnname NVARCHAR(4000),@columnnvalue NVARCHAR(4000)
AS
    DECLARE @SQL NVARCHAR(4000)
    SELECT @SQL = 'SELECT Restaurant.RestaurantID,Restaurant.RestaurantName,Restaurant.RestaurantType,Restaurant.Rating,Restaurant.StoreOpenTime,Restaurant.StoreCloseTime,Restaurant.CostForTwo,Restaurant.StreetName,Restaurant.City,Restaurant.[State],Restaurant.ZipCode,Restaurant.StoreOpenTime,Restaurant.StoreCloseTime from Restaurant  
 inner join [Order] on [Order].RestaurantID =Restaurant.RestaurantID where '+@columnname+' = '+@columnnvalue;  
 print @sql
EXEC(@sql)
go

 --EXEC dbo.GetRestaurant @columnname='RestaurantType',@columnnvalue="'Indian'"
 go
 --EXEC GetRestaurant @columnname='City',@columnnvalue="'Boston'"
Go

--Procedure to get order History--
Create or ALTER PROCEDURE [dbo].[GetOrderHistory] @CustomerID INT
AS
BEGIN
    Select CONCAT(p.FirstName,' ',p.lastName) as [Customer],r.RestaurantName as [Restaurant],da.AddressType as [Address Type]
      ,RIGHT(po.CardNumber,4) as [Last 4 Card Digits], CONCAT(dpp.FirstName,' ',dpp.lastName) as [Delivery Partner],
      o.OrderStatus as [Status],FORMAT(o.OrderDeliveryDate, 'MM-dd-yy hh:mm:ss') as [Delivery Date],o.DeliveryCharge,o.Tax,
      o.[Total Amount] as [Amount] from [dbo].[Order] o 
      join Restaurant r on r.RestaurantID = o.RestaurantID 
      join [Delivery Address] da on da.DeliveryAddressID = o.DeliveryAddressID 
      join [Payment Options] po on po.PaymentOptionID = o.PaymentOptionID 
      join [Delivery Partner] dp on dp.DeliveryPartnerID = o.DeliveryPartnerID 
      inner join Person dpp on dpp.PersonID = dp.DeliveryPartnerID
      join Customer c on c.CustomerID = o.CustomerID 
      inner join Person p on p.PersonID = c.CustomerID where o.CustomerID= @CustomerID
END

--EXEC GetOrderHistory 0
GO

Create PROCEDURE [dbo].[GetPaymentOptions] @CustomerID INT
AS
BEGIN
    select c.CustomerID,p.FirstName,p.lastName,po.[CardType],po.[CardHolderName],po.[CardNumber],po.[CVV],po.[ExpiryDate]
    from [Payment Options] po inner join Customer c on c.CustomerID = po.CustomerID 
    inner join Person p on p.PersonID = c.CustomerID where po.CustomerID= @CustomerID
END
Go

Create or alter PROCEDURE [dbo].[UpdateOrderAmount]
(@OrdID INT,@OrderTotal int output)
 AS
 BEGIN
        DECLARE @total INT
        SELECT @total = dbo.GetOrderAmount(@OrdID)
        UPDATE [Order]
        SET  [Order].OrderAmount = @total
        WHERE [Order].OrderID = @OrdID
		SET @OrderTotal = @total
 END;
GO

Create or alter PROCEDURE [dbo].[UpdateOrderStatus]
(@OrderID INT, @OrderStatus VARCHAR(20),@message varchar(50) output)
 AS
 BEGIN
        UPDATE [Order]
        SET  [Order].OrderStatus = @OrderStatus
        WHERE [Order].OrderID = @OrderID
		SET @message = 'Order Status updated successfully'
 END;
GO

---TRIGGERS---

CREATE OR ALTER TRIGGER [dbo].[ManagePerson]
ON [dbo].[Person]
FOR INSERT
AS
BEGIN
        INSERT INTO Customer Select PersonID from Inserted where PersonType = 'C';
        INSERT INTO [Restaurant Manager] Select PersonID from Inserted where PersonType = 'M';
END;
Go

create TRIGGER Restaurant_lmd
ON dbo.Restaurant
for update
AS
BEGIN
    SET NOCOUNT ON;
UPDATE Restaurant SET Restaurant.LastModifiedDate=getdate()
FROM Restaurant Inner join Inserted ON Restaurant.RestaurantID= Inserted.RestaurantID
END;
Go

create TRIGGER Order_lmd
ON dbo.[Order]
for update
AS
BEGIN
    SET NOCOUNT ON;
UPDATE [Order] SET [Order].LastModifiedDate=getdate()
FROM [Order] Inner join Inserted ON [Order].OrderID= Inserted.OrderID
END;
Go

create TRIGGER Person_lmd
ON dbo.[Person]
for update
AS
BEGIN
    SET NOCOUNT ON;
UPDATE [Person] SET [Person].LastModifiedDate=getdate()
FROM [Person] Inner join Inserted ON [Person].PersonID= Inserted.PersonID
END;
Go

CREATE or ALTER TRIGGER [dbo].[Order_Delivery]
ON [dbo].[Order]
FOR UPDATE
AS
BEGIN
       SET NOCOUNT ON;
	   DECLARE @OrderStatus VARCHAR(20)
       DECLARE @OrderID INT
       DECLARE @OrderDeliveryDate DATETIME
       SELECT @OrderID = INSERTED.OrderID,@OrderStatus = INSERTED.OrderStatus,@OrderDeliveryDate=INSERTED.OrderDeliveryDate FROM INSERTED
      if @OrderStatus ='Delivered' and @OrderDeliveryDate != null
	  begin
      UPDATE [Order] SET [Order].OrderDeliveryDate=getdate()
      FROM [Order] Inner join Inserted ON [Order].OrderID= Inserted.OrderID
	  end
	  
END

Go



