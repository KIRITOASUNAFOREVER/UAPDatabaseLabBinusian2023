CREATE DATABASE [Cooking Simulator]
GO
USE [Cooking Simulator]

GO
CREATE TABLE [Chef] (
	[ChefId] CHAR(6) PRIMARY KEY CHECK ([ChefId] LIKE 'CHF[0-9][0-9][0-9]'),
	[ChefName] VARCHAR (20) NOT NULL,
	[ChefRating] INT NOT NULL
)

GO
CREATE TABLE [Food] (
	[FoodId] CHAR(6) PRIMARY KEY CHECK ([FoodId] LIKE 'FOD[0-9][0-9][0-9]'),
	[FoodName] VARCHAR (20) NOT NULL,
	[ChefId] CHAR(6) FOREIGN KEY REFERENCES [Chef] ([ChefId]),
	[FoodPrice] INT NOT NULL,
	[CookDuration] INT NOT NULL,
	[FoodType] VARCHAR(20) NOT NULL
)

GO
CREATE TABLE [Ingredient] (
	[IngredientsId] CHAR(6) PRIMARY KEY CHECK ([IngredientsId] LIKE 'IGD[0-9][0-9][0-9]'),
	[IngredientsName] VARCHAR(20) NOT NULL,
	[IngredientsPrice] INT NOT NULL
)

GO
CREATE TABLE [Tools] (
	[ToolsId] CHAR(6) PRIMARY KEY CHECK ([ToolsId] LIKE 'TLS[0-9][0-9][0-9]'),
	[ToolsName] VARCHAR (20) NOT NULL,
	[BrandName] VARCHAR (20) NOT NULL,
	[Material] VARCHAR(20) NOT NULL,
	[ToolsPrice] INT NOT NULL
)

GO
CREATE TABLE [FoodToolsDetail] (
	[FoodId] CHAR(6) FOREIGN KEY REFERENCES [Food] ([FoodId]) ON UPDATE CASCADE ON DELETE CASCADE,
	[ToolsId] CHAR(6) FOREIGN KEY REFERENCES [Tools] ([ToolsId]) ON UPDATE CASCADE ON DELETE CASCADE,
	[ToolsQuantity] INT NOT NULL
	PRIMARY KEY ([FoodId], [ToolsId])
)

GO
CREATE TABLE [FoodIngredientsDetail] (
	[FoodId] CHAR (6) FOREIGN KEY REFERENCES [Food] ([FoodId]) ON UPDATE CASCADE ON DELETE CASCADE,
	[IngredientsId] CHAR (6) FOREIGN KEY REFERENCES [Ingredient] ([IngredientsId]) ON UPDATE CASCADE ON DELETE CASCADE,
	[IngredientsQuantity] INT NOT NULL
	PRIMARY KEY ([FoodId], [IngredientsId])
)

GO
INSERT INTO [Chef] ([ChefId], [ChefName], [ChefRating]) VALUES 
('CHF001', 'Juma', 5),
('CHF002', 'Ben', 4),
('CHF003', 'Gordon Kamsay', 5),
('CHF004', 'Mlavin', 2),
('CHF005', 'Kimi', 3)

GO
INSERT INTO [Ingredient] ([IngredientsId], [IngredientsName], [IngredientsPrice]) VALUES
('IGD001', 'Garlic', 5000),
('IGD002', 'Cheese', 20000),
('IGD003', 'Noodle', 4000),
('IGD004', 'Ice Cream', 10000),
('IGD005', 'Chili', 25000),
('IGD006', 'Sugar', 8000),
('IGD007', 'Potato', 10000),
('IGD008', 'Rice', 12000),
('IGD009', 'Egg', 10000),
('IGD010', 'Salt', 6000)

GO
INSERT INTO [Tools] ([ToolsId], [ToolsName], [BrandName], [Material], [ToolsPrice]) VALUES
('TLS001', 'Bowl', 'Tiger Star', 'Aluminium', 20000),
('TLS002', 'Pan', 'Pyrex', 'Aluminium', 30000),
('TLS003', 'Mixer', 'Onix', 'Plastic', 50000),
('TLS004', 'Oven', 'Rinnai', 'Plastic', 150000),
('TLS005', 'Knife', 'Boker', 'Iron', 50000)

GO
INSERT INTO [Food] ([FoodId], [FoodName], [ChefId], [FoodPrice], [CookDuration], [FoodType]) VALUES
('FOD001', 'Lasagna', 'CHF003', 50000, 120, 'Main Dish'),
('FOD002', 'Indomie Laksa', 'CHF004', 70000, 35, 'Main Dish'),
('FOD003', 'Cheese Pudding', 'CHF005', 150000, 90, 'Dessert'),
('FOD004', 'Cinnamon Roll', 'CHF001', 45000, 100, 'Dessert'),
('FOD005', 'French Fries', 'CHF002', 50000, 10, 'Appetizer'),
('FOD006', 'Fried Calamari', 'CHF002', 60000, 50, 'Appetizer'),
('FOD007', 'Omurice', 'CHF005', 150000, 15, 'Main Dish'),
('FOD008', 'Ice Cream Volcano', 'CHF002', 30000, 10, 'Dessert'),
('FOD009', 'Seafood Fried Rice', 'CHF004', 50000, 10, 'Main Dish'),
('FOD010', 'Mixed Cocktail', 'CHF001', 20000, 10, 'Beverage')

GO
INSERT INTO [FoodIngredientsDetail] ([FoodId], [IngredientsId], [IngredientsQuantity]) VALUES
('FOD001', 'IGD002', 5),
('FOD001', 'IGD010', 10),
('FOD002', 'IGD003', 15),
('FOD002', 'IGD010', 10),
('FOD003', 'IGD002', 20),
('FOD004', 'IGD006', 20),
('FOD005', 'IGD007', 20),
('FOD005', 'IGD010', 25),
('FOD006', 'IGD010', 15),
('FOD007', 'IGD008', 2),
('FOD007', 'IGD009', 25),
('FOD008', 'IGD004', 50),
('FOD008', 'IGD005', 20),
('FOD009', 'IGD008', 50),
('FOD009', 'IGD009', 10),
('FOD009', 'IGD010', 5),
('FOD010', 'IGD006', 15),
('FOD010', 'IGD001', 5)

GO
INSERT INTO [FoodToolsDetail] ([FoodId], [ToolsId], [ToolsQuantity]) VALUES
('FOD001', 'TLS004', 1),
('FOD002', 'TLS001', 1),
('FOD003', 'TLS001', 2),
('FOD004', 'TLS003', 1),
('FOD005', 'TLS002', 1),
('FOD005', 'TLS005', 1),
('FOD006', 'TLS002', 1),
('FOD007', 'TLS002', 1),
('FOD008', 'TLS003', 1),
('FOD009', 'TLS002', 1),
('FOD010', 'TLS003', 1)

--1
SELECT UPPER(FoodName) AS [Food Name],('IDR '+CAST((FoodPrice) AS VARCHAR(max))) AS [Price] FROM Food
WHERE FoodName LIKE '%Fried%'

--2
SELECT ChefName AS [Chef],(CAST((ChefRating) AS VARCHAR(max)) + ' stars') AS [Chef Rating], FoodName FROM Chef
JOIN Food ON Chef.ChefId = Food.ChefId
WHERE ChefName LIKE '% %'

--3
SELECT FoodName, SUM(FoodIngredientsDetail.IngredientsQuantity * Ingredient.IngredientsPrice) AS [Spending] FROM Food
JOIN FoodIngredientsDetail ON Food.FoodId = FoodIngredientsDetail.FoodId
JOIN Ingredient ON FoodIngredientsDetail.IngredientsId = Ingredient.IngredientsId
WHERE (Food.FoodPrice < 100000) AND (CookDuration BETWEEN 30 AND 60)
GROUP BY FoodName
HAVING SUM(FoodIngredientsDetail.IngredientsQuantity * Ingredient.IngredientsPrice) BETWEEN 50000 AND 150000

--4
SELECT ('Rating '+CAST((ChefRating) AS VARCHAR(max))) AS [Chef Rating],COUNT(FoodId) AS [Total Food],SUM(FoodPrice) AS [Total Food Price] FROM Chef
JOIN Food ON Chef.ChefId = Food.ChefId
WHERE ChefRating = 5
GROUP BY ChefRating
UNION
SELECT ('Rating '+CAST((ChefRating) AS VARCHAR(max))) AS [Chef Rating],COUNT(FoodId) AS [Total Food],SUM(FoodPrice) AS [Total Food Price] FROM Chef
JOIN Food ON Chef.ChefId = Food.ChefId
WHERE ChefRating = 3
GROUP BY ChefRating

--5
SELECT DISTINCT IngredientsName AS [Ingredient Name] FROM Ingredient , FoodIngredientsDetail
WHERE Ingredient.IngredientsId = FoodIngredientsDetail.IngredientsId
AND FoodIngredientsDetail.FoodId IN ( SELECT FoodId FROM Food WHERE FoodPrice BETWEEN 50000 AND 100000 )


--6
SELECT SUBSTRING(FoodName, CHARINDEX(' ', FoodName) + 1, LEN(FoodName)) AS [Food Name], FoodPrice AS [Price] FROM Food
WHERE FoodName LIKE '% %'
AND FoodPrice >( SELECT AVG( FoodPrice) FROM Food WHERE FoodType Like 'Beverage')
GROUP BY FoodName,FoodPrice
ORDER BY FoodPrice ASC, [Food Name] ASC

--7
CREATE VIEW [Show Food] AS
SELECT LEFT(ChefName,CHARINDEX(' ',ChefName + ' ')-1) AS [Chef Name], ChefRating AS [Chef Rating], FoodName AS [Food],FoodType AS [Type], 
		CookDuration AS [Duration],('IDR '+CAST((FoodPrice) AS VARCHAR(max))) AS [Price] FROM Chef
JOIN Food ON Chef.ChefId = Food.ChefId

SELECT * FROM [Show Food]

--8
CREATE VIEW [Chef Food Price] AS
SELECT ChefName, ('Rp. '+CAST(SUM(FoodPrice) AS VARCHAR(max)) + ',00') AS [Total Food Price] FROM Chef
JOIN Food ON Chef.ChefId = Food.ChefId
GROUP BY ChefName
HAVING SUM(FoodPrice) > 100000

SELECT * FROm [Chef Food Price]

--9
SELECT * FROM Chef

ALTER TABLE Chef
ADD ChefGender CHAR(6) NOT NULL DEFAULT('N/A')
GO
ALTER TABLE Chef
ADD CONSTRAINT checkChefGender
CHECK (ChefGender LIKE 'Male' OR ChefGender LIKE 'FEMALE' OR ChefGender LIKE 'N/A')

SELECT * From Chef

--10
SELECT * FROM Chef

UPDATE Chef
SET ChefRating = a.ChefRating + 1
FROM Chef a
join food b on a.chefid=b.chefid
and b.foodprice>10000
join FoodIngredientsDetail c on c.FoodId=b.FoodId
join Ingredient d on d.IngredientsId = c.IngredientsId 
and d.IngredientsName in ('Garlic')

SELECT * FROM Chef