-- -- CREATE
-- Alter PROCEDURE CreateMenu(
--     @CategoryID BIGINT,
--     @DishName NVARCHAR(255),
--     @Description NVARCHAR(255),
--     @Price DECIMAL(8, 2),
--     @ImgURL NVARCHAR(255),
--     @AvailabilityStatus BIT,
--     @Rating INT
-- )
-- AS
-- BEGIN
--     INSERT INTO Menu (CategoryID, DishName, Description, Price, ImgURL, AvailabilityStatus,Rating)
--     VALUES (@CategoryID, @DishName, @Description, @Price, @ImgURL, @AvailabilityStatus,@Rating);
-- END;

-- DBCC CHECKIDENT ('FeedBack', NORESEED);
-- DBCC CHECKIDENT ('FeedBack', RESEED, 3);
-- -- READ
-- Alter PROCEDURE GetMenus
-- AS
-- BEGIN
--     SELECT 
--     [dbo].[Menu].MenuID,
--     [dbo].[Menu].DishName,
--     [dbo].[Category].CategoryName,
--     [dbo].[Menu].CategoryID,
--     [dbo].[Menu].[Description],
--     [dbo].[Menu].AvailabilityStatus,
--     [dbo].[Menu].ImgURL,
--     [dbo].[Menu].Price,
--     [dbo].[Menu].Rating
--      FROM Menu
--      LEFT OUTER JOIN
--      [dbo].Category ON [dbo].[Menu].CategoryID = [dbo].[Category].CategoryID;
-- END;
-- Exec GetMenus

-- -- READ BY ID
-- Alter PROCEDURE GetMenuById(@MenuID BIGINT)
-- AS
-- BEGIN
--     SELECT 
--     [dbo].[Menu].MenuID,
--     [dbo].[Menu].DishName,
--     [dbo].[Category].CategoryName,
-- [dbo].[Menu].CategoryID,
--     [dbo].[Menu].[Description],
--     [dbo].[Menu].AvailabilityStatus,
--     [dbo].[Menu].ImgURL,
--     [dbo].[Menu].Price,
--     [dbo].[Menu].Rating
--      FROM Menu
--      LEFT OUTER JOIN
--      [dbo].Category ON [dbo].[Menu].CategoryID = [dbo].[Category].CategoryID
--     WHERE MenuID = @MenuID;
-- END;
-- Exec GetMenuById 1

-- -- UPDATE
-- Alter PROCEDURE UpdateMenu(
--     @MenuID BIGINT,
--     @CategoryID BIGINT,
--     @DishName NVARCHAR(255),
--     @Description NVARCHAR(255),
--     @Price DECIMAL(8, 2),
--     @ImgURL NVARCHAR(255),
--     @AvailabilityStatus BIT,
--     @Rating INT
-- )
-- AS
-- BEGIN
--     UPDATE Menu
--     SET CategoryID = @CategoryID,
--         DishName = @DishName,
--         Description = @Description,
--         Price = @Price,
--         ImgURL = @ImgURL,
--         AvailabilityStatus = @AvailabilityStatus,
--         Rating = @Rating
--     WHERE MenuID = @MenuID;
-- END;

-- -- DELETE
-- CREATE PROCEDURE DeleteMenu(@MenuID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM Menu WHERE MenuID = @MenuID;
-- END;


-- Alter PROCEDURE GetMenuByCategoryID
--     @CategoryID INT
-- AS
-- BEGIN
--     -- Select the menu items that belong to the specified category
--     Select
--     [dbo].[Menu].MenuID,
--     [dbo].[Menu].DishName,
--     [dbo].[Category].CategoryName,
--     [dbo].[Menu].CategoryID,
--     [dbo].[Menu].[Description],
--     [dbo].[Menu].AvailabilityStatus,
--     [dbo].[Menu].ImgURL,
--     [dbo].[Menu].Price,
--     [dbo].[Menu].Rating
--      FROM Menu
--      LEFT OUTER JOIN
--      [dbo].Category ON [dbo].[Menu].CategoryID = [dbo].[Category].CategoryID
--     WHERE 
--         [dbo].[Menu].CategoryID = @CategoryID;
-- END

Exec GetMenuByCategoryID 6
use Restaurant

SELECT * from CustomerOrder
SELECT * from Menu
SELECT * from DiningTable
Use Restaurant

