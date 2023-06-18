Use ResturantManagement
OPEN SYMMETRIC KEY PersonPass_SM --- Run this before inserting into Person Table
      DECRYPTION BY CERTIFICATE ResturantManagementPass;
Go
Use ResturantManagement  --- Enter data into Person Table
insert into dbo.person (FirstName, LastName, email, phoneno, username, [password], persontype, birthdate) values

('Urgot', 'Jackson', 'Urgot@gmail.com' , '2164782366', 'userUrgot',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'UrgotUrgot')), 'm', '08/06/1999'),

('Chandler', 'Irvine', 'Chandler@gmail.com' , '2389895605', 'userChandler',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'ChandlerChandler')), 'm', '01/11/1993'),

('Daniel', 'Pinto', 'Daniel@gmail.com' , '2478453258', 'userDaniel',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'DanielDaniel')), 'm', '03/07/1982'),

('Oliver', 'Gacia', 'Oliver@gmail.com' , '2348941435', 'userOliver',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'OliverOliver')), 'm', '02/07/1994'),

('Taylor', 'Swift', 'Taylor@gmail.com' , '2389486535', 'userTaylor',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'TaylorTaylor')), 'm', '11/07/1985'),

('Jayson', 'Stanson', 'Jayson@gmail.com' , '3248948654', 'userJayson',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'JaysonJayson')), 'm', '11/12/1972'),

('Pepper', 'Pots', 'Pepper@gmail.com' , '2348943521', 'userPepper',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'PepperPepper')), 'm', '12/05/1980'),

('Karl', 'Anderson', 'Karl@gmail.com' , '8789546311', 'userKarl',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'KarlKarl')), 'm', '03/05/1985'),

('Meena', 'Bugrarow', 'meena@gmail.com' , '8743555211', 'userMeena',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'meenaMeena')), 'm', '07/22/1994'),

('Monu', 'Bugdsw', 'monu@gmail.com' , '8743455211', 'userMonu',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'monuMonu')), 'm', '07/22/1994'),

('David', 'Peterson', 'davidp@gmail.com' , '8539542188', 'userDavid',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'davidDavid')), 'm', '07/01/1991'),

('Steve', 'Rogers', 'Steve@gmail.com' , '6898354630', 'userSteve',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'SteveSteve')), 'd', '02/01/1940'),

('Peng', 'Chen', 'Peng@gmail.com' , '2354986510', 'userPeng',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'PengPeng')), 'd', '02/28/1997'),

('Meghana', 'Sivakumar', 'Meghana@gmail.com' , '2535961510', 'userMeghana',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'MeghanaMeghana')), 'd', '05/28/1999'),

('Takumi', 'Song', 'Takumi@gmail.com' , '2358465325', 'userTakumi',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'TakumiTakumi')), 'd', '02/28/1997'),

('Shuaiqi', 'Wang', 'Shuaiqi@gmail.com' , '3534812365', 'userShuaiqi',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'ShuaiqiShuaiqi')), 'd', '05/26/1993'),

('Drabi', 'Kumar', 'drabi@gmail.com' , '3289684315', 'userDrabi',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'DrabiDrabi')), 'd', '01/11/1993'),

('Jameon', 'Johon', 'jameon@gmail.com' , '3324896565', 'userJameon',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'JameonJameon')), 'd', '02/28/1997'),

('Rabi', 'Kuma', 'Rabi@gmail.com' , '3289684315', 'userRabi',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'RabiRabi')), 'd', '01/11/1993'),

('Loni', 'Doni', 'loni@gmail.com' , '3122894315', 'userLoni',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'LoniLoni')), 'd', '02/24/1997'),

('Jackson', 'Johnson', 'Jackson@gmail.com' , '3324896565', 'userJackson',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'JacksonJackson')), 'd', '01/11/1993'),

('Xin', 'Zhao', 'Xin@gmail.com' , '3486786650', 'userXin',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'XinXin')), 'c', '05/01/1940'),

('Shibo', 'Lu', 'Shibo@gmail.com' , '8636564653', 'userShibo',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'ShiboShibo')), 'c', '06/08/1998'),

('Abhi', 'manu', 'Abhi@gmail.com' , '1897652568', 'userAbhi',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'AbhiAbhi')), 'c', '06/21/1997'),

('Jayesh', 'Khattar', 'Jayesh@gmail.com' , '1897652568', 'userJayesh',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'JayeshJayesh')), 'c', '08/01/1997'),

('Riddhi', 'Bhatti', 'Riddhi@gmail.com' , '1326436435', 'userRiddhi',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'RiddhiRiddhi')), 'c', '05/14/1999'),

('Fengyi', 'Zhang', 'Fengyi@gmail.com' , '1781331563', 'userFengyi',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'FengyiFengyi')), 'c', '06/1/1995'),

('Tonny', 'Sailor', 'tonny@gmail.com' , '1897652568', 'userTonny',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'TonnyTonny')), 'c', '01/04/1996'),

('Mandy', 'Tikala', 'mandy@gmail.com' , '1326436435', 'userMandy',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'MandyMandy')), 'c', '05/15/1998'),

('Joel', 'Frank', 'joel@gmail.com' , '9481331563', 'userJoel',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'JoelJoel')), 'c', '09/6/1994'),

('Dale', 'Some', 'dale@gmail.com' , '1781331563', 'userDale',EncryptByKey(Key_GUID('PersonPass_SM'),convert(varbinary, 'DaleDale')), 'c', '09/6/1995');
go
Use ResturantManagement -- Enter Data into Delivery Partner Table
insert into dbo.[Delivery Partner] (DeliveryPartnerID,SSN,VehicleLicenseNumber,InsuranceNo) values 
(11, '6417489635','2YHEN3', 'AEWW2385'),
(12, '3256483346','2YKK23', 'WQEW8961'),
(13, '2348568433','8EFS31', 'FGSD1234'),
(14, '8753624813','2WERW2', 'WERW2385'),
(15, '3264895963','8GA5AE', 'SSGR2815'),
(16, '8978117633','3EWWW2', 'WETW8423'),
(17, '2315456432','8WEF45', 'AEWH2346'),
(18, '2315422332','8WEF45', 'AEWH2346'),
(19, '1455456432','9BE5F45', 'INSF12346'),
(20, '2315451232','2H5R54', 'INS346');
go
Use ResturantManagement  -- To enter Payment Methods store Column with Data Encryption
OPEN SYMMETRIC KEY PaymentPass_SM
      DECRYPTION BY CERTIFICATE ResturantManagementPass;
	  go

Use ResturantManagement -- To enter Payment Methods
INSERT INTO [Payment Options] (CustomerID, CardType, CardHolderName, CardNumber, CVV, ExpiryDate) VALUES
('21', 'Credit','Xin Zhao', '2222233331125432',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '123')), '04-2024'),
('22', 'Debit','Shibo Lu', '4627333111324122',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '723')), '05-2024'),
('23', 'Credit','Abhi Abhi', '9254223333365218',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '823')), '06-2024'),
('24', 'Debit','Jayesh Khattar', '4289523567331122',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '923')), '07-2024'),
('25', 'Credit','Riddhi Bhatti', '5223331812319502',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '203')), '08-2024'),
('26', 'Debit','Fengyi Zhang', '6225644933311122',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '303')), '09-2024'),
('27', 'Credit','Rohan sharma', '2822283335134122',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '433')), '04-2024'),
('28', 'Credit','Ben Johnson', '3422233234319122',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '533')), '04-2024'),
('29', 'Credit','Bengy Bofy', '2822283235134122',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '323')), '01-2025'),
('30', 'Credit','Joel Frank', '3422693234319121',EncryptByKey(Key_GUID('PaymentPass_SM'),convert(varbinary, '243')), '12-2022');
go
Use ResturantManagement -- Entering Data for different Delivery Addresses
insert into dbo.[Delivery Address] (CustomerID, AddressType, StreetName1, StreetName2, City, [State], ZipCode)
values (21, 'Work', '360 Huntington Street', 'Richards Hall', 'Boston', 'Massachusetts','2115'),
(22, 'Home', '35 Lomasney Way', 'Apt601', 'Boston', 'Massachusetts','2114'),
(23, 'Work', '150 River Edge Dr', 'Lobby', 'Medford', 'Massachusetts','2155'),
(24, 'Work', '815 Boylston Street', 'Lobby', 'Boston', 'Massachusetts','2116'),
(25, 'Home', '327 Huntington Avenue', 'Apt526', 'Boston', 'Massachusetts','2115'),
(26, 'Work', '150 River Edge Dr', 'Lobby', 'Medford', 'Massachusetts','2155'),
(27, 'Home', '832 Boylston Street', 'Lobby', 'Boston', 'Massachusetts','2116'),
(28, 'Home', '327 Huntington Avenue', 'Apt526', 'Boston', 'Massachusetts','2115'),
(29, 'Work', '104 River Wart Dr','Lobby','Medford', 'Massachusetts','2155'),
(30, 'Work', '15 Parker Street', 'Lobby','Boston', 'Massachusetts','2116');
go
Use ResturantManagement -- Entering Data for different Restaurant
Insert into Restaurant(RestaurantName,StreetName,City,State,ZipCode,ManagerID,RestaurantType,CostForTwo,StoreOpenTime,StoreCloseTime,Rating)
Values('Olive Garden','212 Swing St','Austin','TX','02120','0','Italian','55','10 AM','11PM','3.5'),
('Bricco','241 Hanover St','Boston','MA','02113','1','Italian','30','10 AM','11PM','4.5'),
('Source Restaurant','27 Chruch St','Boston','MA','02138','2','Pizza Bar','40','10 AM','11PM','2.5'),
('Double Zero Boston','163 NewBury St','Boston','MA','02116','3','Vegan','43','10 AM','11PM','4.5'),
('Earls Kitchen','800 Boylston St','Boston','MA','02199','4','American','60','10 AM','11PM','3.5'),
('Ostra','1 Charles St','Boston','MA','02116','5','SeaFood','75','10 AM','11PM','4.5'),
('Beehive','541 Tremont St','Boston','MA','02116','6','American','50','10 AM','11PM','3.5'),
('Douzo Modern Japanese Restaurant','131 Darmouth St','Boston','MA','02116','7','Japanese','30','10 AM','11PM','5.5'),
('Godavri','374 Congress St','Boston','MA','02210','8','Indian','60','10 AM','11PM','4.5'),
('Bricco','241 Hanover St','Boston','MA','02113','9','Italian','30','10 AM','11PM','4.5'),
('Briccocheck','247 Hanover St','Boston','MA','02113','10','Italian','44','10 AM','11PM','4.5');

go
Use ResturantManagement -- Creating Menu for different Restuarants
INSERT INTO Menu (ItemName,Price,Category,RestaurantID)
VALUES ('Salad', '3', 'Starter','0'),
('Burrito', '15', 'Meal','0'),
('Cilantro Lime Rice', '8', 'Meal','0'),
('Nuggets', '14', 'Starter','0'),
('Panner Makhni', '12', 'Main Course','0'),
('Tacos', '10', 'Meal','1'),
('Ice Tea', '3', 'Drinks','2'),
('Tacos', '10', 'Main Course','2'),
('Subway Sandwich', '7', 'Meal','2'),
('Vegan Pizza', '15', 'Pizza','2'),
('Chicken Pizza', '18', 'PIzza','2'),
('Paneer Crispy', '13', 'Starter','3'),
('Lemonade', '5', 'Drinks','4'),
('Taco Salad', '4', 'Starter','4'),
('Masala Dosa', '11', 'Starter','4'),
('Chicken Masala', '12', 'Main Course','8'),
('Dal Makhni', '12', 'Main Course','8'),
('Paneer Masala', '12', 'Main Course','8'),
('Paneer Tikka', '12', 'Main Course','8'),
('Spinach Paneer', '12', 'Main Course','8'),
('Naan', '6', 'Starter','8'),
('Paratha', '6', 'Starter','8'),
('Garlic Naan', '6', 'Starter','8'),
('Tandoori Roti', '5', 'Starter','8');
go
Use ResturantManagement -- Creating Orders Data
INSERT INTO [ORDER] (CustomerID,RestaurantID,DeliveryAddressID,PaymentOptionID,DeliveryPartnerID,OrderStatus,DeliveryCharge)
VALUES ('21','0','0','0','11','Order Placed',2),
('22','4','1','1','12','Order Placed',2),
('23','0','2','2','13','Order Placed',0),
('24','2','3','3','14','Order Placed',2),
('25','3','4','4','15','Order Placed',2),
('26','4','5','5','16','Order Placed',2),
('27','8','6','6','17','Order Placed',2),
('22','1','7','7','18','Order Placed',2),
('21','8','0','0','19','Order Placed',0),
('21','8','0','0','20','Order Placed',2);
go

go
Use ResturantManagement -- Creating Data for various Order line items
INSERT INTO [Order Line](OrderID,MenuItem,Price,Quantity) values 
('0','2','8','1'),
('0','3','14','2'),
('1','12','5','2'),
('1','13','4','1'),
('2','0','3','3'),
('2','1','15','1'),
('2','4','14','2'),
('3','6','3','2'),
('3','7','10','1'),
('4','11','13','3'),
('5','12','5','4'),
('6','14','11','2'),
('6','15','12','2'),
('7','5','10','2'),
('8','19','12','1'),
('8','20','6','2'),
('9','17','12','1'),
('9','18','12','2'),
('9','22','6','3');
go

Use ResturantManagement -- Creating Data for various Order line items
Insert into Feedback(OrderID,Comments,Rating) Values
('1','fabulous','5'),
('0','Enjoyed a lot','4'),
('2','Good Food','4'),
('3','Average Quality','2'),
('4','Good Quantity','3'),
('5','Excellent Taste','5'),
('6','Excellent','5'),
('7','Average','3'),
('8','Must try','4'),
('9','Good','4');
go

Use ResturantManagement  --- Updating Order Amount based on the Order Line using Stored Procedures
Declare @total int
EXEC UpdateOrderAmount 0,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 1,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 2,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 3,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 4,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 5,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 6,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 7,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 8,@total output
print(@total)
go
Use ResturantManagement
Declare @total int
EXEC UpdateOrderAmount 9,@total output
print(@total)
go

go
Use ResturantManagement
Declare @message varchar(50)
EXEC UpdateOrderStatus 0,'Delivered',@message output
print(@message)
go








