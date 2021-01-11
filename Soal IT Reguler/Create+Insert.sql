CREATE DATABASE MelodyStore
USE MelodyStore

CREATE TABLE Customer(
	CustomerID		CHAR(5)			PRIMARY KEY
	CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName	VARCHAR(50)		NOT NULL,		
	CustomerGender	VARCHAR(10)		
	CHECK(CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female') NOT NULL,
	CustomerAddress	VARCHAR(50)		NOT NULL,
	CustomerPhone	VARCHAR(20)		CHECK (CustomerPhone LIKE '+62%') NOT NULL,
	CustomerEmail	VARCHAR(50)		CHECK (CustomerEmail LIKE '%@%.%') NOT NULL
)

CREATE TABLE Employee(
	EmployeeID		CHAR(5)		PRIMARY KEY
	CHECK (EmployeeID LIKE 'EM[0-9][0-9][0-9]'),
	EmployeeName	VARCHAR(50)		NOT NULL,		
	EmployeeGender	VARCHAR(10)		
	CHECK(EmployeeGender LIKE 'Male' OR EmployeeGender LIKE 'Female') NOT NULL,
	EmployeePhone	VARCHAR(20)		CHECK (EmployeePhone LIKE '+62%') NOT NULL,
	EmployeeEmail	VARCHAR(50)		CHECK (EmployeeEmail LIKE '%@%.%') NOT NULL
)

CREATE TABLE AlbumGenre(
	AlbumGenreID	CHAR(5)		PRIMARY KEY
	CHECK (AlbumGenreID LIKE 'AG[0-9][0-9][0-9]'),
	AlbumGenreName	VARCHAR(20)	NOT NULL
)

CREATE TABLE Album(
	AlbumID			CHAR(5)		PRIMARY KEY
	CHECK (AlbumID LIKE 'AL[0-9][0-9][0-9]'),
	AlbumGenreID	CHAR(5)		FOREIGN KEY REFERENCES AlbumGenre(AlbumGenreID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	AlbumName		VARCHAR(50)	NOT NULL,
	AlbumPrice		DECIMAL(10,2)	NOT NULL
)

CREATE TABLE HeaderSalesTransaction(
	HeaderSalesTransactionID	CHAR(5)		PRIMARY KEY
	CHECK (HeaderSalesTransactionID LIKE 'HS[0-9][0-9][0-9]'),
	CustomerID	CHAR(5)	FOREIGN KEY REFERENCES Customer(CustomerID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	EmployeeID	CHAR(5)	FOREIGN KEY REFERENCES Employee(EmployeeID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	HeaderSalesTransactionDate	DATE		NOT NULL
)

CREATE TABLE DetailSalesTransaction(
	HeaderSalesTransactionID	CHAR(5)	FOREIGN KEY REFERENCES HeaderSalesTransaction(HeaderSalesTransactionID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	AlbumID	CHAR(5)	FOREIGN KEY REFERENCES Album(AlbumID)
	ON UPDATE CASCADE ON DELETE CASCADE,
	Quantity		INT		NOT NULL,
	PRIMARY KEY (HeaderSalesTransactionID, AlbumID)
)


INSERT INTO Customer VALUES
('CU001','Veronica Zhang','Female','Anggrek VII Street, West Jakarta', '+6285619356118', 'veronica@gmail.com'),
('CU002','Alvin Darian','Male','Genta Raya Street, Depok','+6281526719448','alvin@yahoo.co.id'),
('CU003','Farrel Putra Novarian','Male','Pinus 67, Bekasi','+6278261938182','farrel@gmail.com'),
('CU004','Ferdinand Dermawan','Male','U Raya Street, West Jakarta','+6281311332255','ferdinand@yahoo.com'),
('CU005','Mikhaya Puteri','Female','Tanjung Duren Street, West Jakarta','+6285716355511','mikhaya@gmail.com'),
('CU006','Denia Nisrina','Female','Kemang Raya Street, West Jakarta','+6281645617281','denia@yahoo.co.id'),
('CU007','Dimas Pratama Gunawan','Male','Kebon Kacang Street, Central Jakarta','+6287834527161','dimas@gmail.com'),
('CU008','Imas Kamilah','Female','Tegar Beriman Street, Bogor','+62851918345115','imas@gmail.com'),
('CU009','Ronaldo','Male','Kebon Jeruk Street, West Jakarta','+6285617351635','ronaldo@gmail.com'),
('CU010','Michael Saverio Nathanael','Male','Sudirman Street, South Jakarta','+628156371889','michael@yahoo.com')

INSERT INTO Employee VALUES
('EM001','Calum','Male','+6281528176226','calum@melodystore.com'),
('EM002','Steven Clifford','Male','+6281573450687','steven@melodystore.com'),
('EM003','Ari Irwin','Male','+62852817645663','ari@melodystore.com'),
('EM004','Angelina Hemmings','Female','+6281527879009','angelina@melodystore.com'),
('EM005','Naira Angelica','Female','+6287872564567','naira@melodystore.com'),
('EM006','Felix Van Bosch','Male','+628558165345','felix@melodystore.com'),
('EM007','Naila','Female','+628989172567','naira@melodystore.com'),
('EM008','Reuben Jonathan','Male','+6285714623415','reuben@melodystore.com'),
('EM009','Mada Theodorus Jonathan','Male','+6281673526124','mada@melodystore.com'),
('EM010','Teddy','Male','+6281726351094','teddy@melodystore.com')

INSERT INTO AlbumGenre VALUES
('AG001','Pop'),
('AG002','Jazz'),
('AG003','R&B'),
('AG004','Rock'),
('AG005','Classic'),
('AG006','Dance'),
('AG007','Country'),
('AG008','Electonic Dance'),
('AG009','Indie'),
('AG010','K-Pop')

INSERT INTO Album VALUES
('AL001','AG001','CALM',250000),
('AL002','AG008','Listen Again',220000),
('AL003','AG001','Heartbreak Weather',200000),
('AL004','AG009','Notes on a Conditional Form', 300000),
('AL005','AG010','Love Yourself:Answer',250000),
('AL006','AG010','Summer Nights',400000),
('AL007','AG007','Fearless',320000),
('AL008','AG003','24K Magic',200000),
('AL009','AG004','One More Night',300000),
('AL010','AG001','Up All Night',250000)


INSERT INTO HeaderSalesTransaction VALUES
('HS001','CU002','EM003','2020-03-01'),
('HS002','CU004','EM002','2020-03-01'),
('HS003','CU006','EM001','2020-03-02'),
('HS004','CU008','EM005','2020-03-03'),
('HS005','CU001','EM003','2020-03-03'),
('HS006','CU003','EM003','2020-03-04'),
('HS007','CU005','EM007','2020-03-05'),
('HS008','CU007','EM008','2020-03-06'),
('HS009','CU009','EM001','2020-03-07'),
('HS010','CU002','EM003','2020-03-07')

INSERT INTO DetailSalesTransaction VALUES
('HS001','AL009',1),
('HS001','AL008',2),
('HS002','AL007',1),
('HS003','AL007',5),
('HS003','AL008',1),
('HS003','AL006',7),
('HS004','AL005',1),
('HS005','AL004',2),
('HS006','AL003',3),
('HS006','AL002',4),
('HS006','AL001',2),
('HS006','AL010',1),
('HS007','AL001',1),
('HS007','AL010',1),
('HS008','AL009',2),
('HS008','AL001',1),
('HS009','AL002',3),
('HS010','AL003',8),
('HS010','AL002',10),
('HS010','AL008',1)

--1
SELECT CustomerName,CustomerPhone,CustomerEmail 
FROM Customer
WHERE CustomerName not like '% %'

--2
SELECT a.CustomerName,c.EmployeeName,b.HeaderSalesTransactionDate
FROM Customer a
JOIN HeaderSalesTransaction b 
ON a.CustomerID=b.CustomerID
JOIN Employee c
ON b.EmployeeID=c.EmployeeID
WHERE DATENAME(DAY,b.HeaderSalesTransactionDate)=3

--3
SELECT a.AlbumName,('Rp'+CAST((a.AlbumPrice) AS VARCHAR(max))) AS AlbumPrice ,SUM(b.Quantity)as TotalAlbumPurchased
FROM Album a
JOIN DetailSalesTransaction b 
ON a.AlbumID=b.AlbumID
WHERE LEN(a.AlbumName)>5
GROUP BY a.AlbumName,a.AlbumPrice

--4
SELECT ('Mr.'+a.CustomerName) AS CustomerName,COUNT(DISTINCT c.AlbumID) AS [Total of Album Type],
SUM(c.Quantity) AS [Total of Quantity],b.HeaderSalesTransactionDate
FROM Customer a
JOIN HeaderSalesTransaction b ON b.CustomerID=a.CustomerID
JOIN DetailSalesTransaction c ON b.HeaderSalesTransactionID=c.HeaderSalesTransactionID
WHERE a.CustomerGender='Male'
GROUP BY CustomerName,b.HeaderSalesTransactionDate
UNION
SELECT ('Mrs.'+a.CustomerName) AS CustomerName,COUNT(DISTINCT c.AlbumID) AS [Total of Album Type],
SUM(c.Quantity) AS [Total of Quantity],b.HeaderSalesTransactionDate
FROM Customer a
JOIN HeaderSalesTransaction b ON b.CustomerID=a.CustomerID
JOIN DetailSalesTransaction c ON b.HeaderSalesTransactionID=c.HeaderSalesTransactionID
WHERE a.CustomerGender='Female'
GROUP BY CustomerName,b.HeaderSalesTransactionDate
ORDER BY [Total of Quantity]

--5
SELECT a.*
FROM Customer a 
JOIN HeaderSalesTransaction b on a.CustomerID=b.CustomerID
JOIN DetailSalesTransaction c on c.HeaderSalesTransactionID=b.HeaderSalesTransactionID
JOIN Album d on d.AlbumID=c.AlbumID
and d.AlbumName like 'CALM'
WHERE b.HeaderSalesTransactionDate in 
(
 SELECT b.HeaderSalesTransactionDate
 WHERE DAY(b.HeaderSalesTransactionDate)%2=0
)

--6
SELECT c.CustomerID, SUBSTRING(c.CustomerName,1,(CHARINDEX(' ',c.CustomerName + ' ')-1)) AS CustomerName,c.CustomerPhone,c.CustomerEmail
FROM
(
SELECT b.CustomerID,COUNT(d.AlbumID) AS AlbumCount,c.HeaderSalesTransactionID
FROM HeaderSalesTransaction b 
JOIN DetailSalesTransaction c ON c.HeaderSalesTransactionID=b.HeaderSalesTransactionID
JOIN Album d ON d.AlbumID=c.AlbumID
GROUP BY b.CustomerID,c.HeaderSalesTransactionID
HAVING COUNT(d.AlbumID)>1
) AS x
JOIN Customer c on x.CustomerID=c.CustomerID

--7
CREATE VIEW UpdatedCustomerData AS 
SELECT CustomerName,CustomerGender,CustomerPhone,REPLACE(CustomerEmail, '.co.id', '.com') AS CustomerEmail
FROM Customer 
WHERE CustomerEmail Like '%yahoo%'

SELECT * FROM UpdatedCustomerData

--8
CREATE VIEW TransactionDataOfPopAlbum AS 
SELECT 
a.HeaderSalesTransactionID,DATENAME(WEEKDAY,a.HeaderSalesTransactionDate) AS [Day Of Transaction],
a.HeaderSalesTransactionDate,SUM(b.Quantity) AS [Total Of Quantity]
FROM HeaderSalesTransaction a
JOIN DetailSalesTransaction b
ON b.HeaderSalesTransactionID=a.HeaderSalesTransactionID
JOIN Album c 
ON c.AlbumID=b.AlbumID
JOIN  AlbumGenre d
ON d.AlbumGenreID=c.AlbumGenreID
AND d.AlbumGenreName='Pop'
GROUP BY a.HeaderSalesTransactionID,a.HeaderSalesTransactionDate

SELECT * FROM TransactionDataOfPopAlbum

--9
ALTER TABLE Customer 
ADD CustomerInstagram varchar(20)

ALTER TABLE Customer
ADD CONSTRAINT CheckInstagram
CHECK (CustomerInstagram Like '@%')

SELECT * FROM Customer

--10
SELECT * FROM Album
DELETE
FROM Album
WHERE AlbumPrice<350000
AND AlbumName LIKE '% % %'
SELECT * FROM Album