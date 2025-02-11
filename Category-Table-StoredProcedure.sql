Select * from Category
ALTER TABLE Category ADD ImagePath NVARCHAR(MAX);

-- CREATE
-- Create PROCEDURE CreateCategory(
--     @CategoryName NVARCHAR(255),
--     @Description NVARCHAR(255),
--     @ImagePath NVARCHAR(MAX)
-- )
-- AS
-- BEGIN
--     INSERT INTO Category (CategoryName, Description,ImagePath)
--     VALUES (@CategoryName, @Description,@ImagePath);
-- END;

-- READ
-- CREATE PROCEDURE GetCategories
-- AS
-- BEGIN
--     SELECT * FROM Category;
-- END;
-- EXEC GetCategories

DBCC CHECKIDENT ('Category', NORESEED);
DBCC CHECKIDENT ('Category', RESEED, 3);

-- READ BY ID
-- CREATE PROCEDURE GetCategoryById(@CategoryID BIGINT)
-- AS
-- BEGIN
--     SELECT * FROM Category WHERE CategoryID = @CategoryID;
-- END;

-- -- UPDATE
-- Create PROCEDURE UpdateCategory(
--     @CategoryID BIGINT,
--     @CategoryName NVARCHAR(255),
--     @Description NVARCHAR(255),
--     @ImagePath NVARCHAR(MAX)
-- )
-- AS
-- BEGIN
--     UPDATE Category
--     SET CategoryName = @CategoryName,
--         Description = @Description,
--         ImagePath = @ImagePath
--     WHERE CategoryID = @CategoryID;
-- END;

-- -- DELETE
-- CREATE PROCEDURE DeleteCategory(@CategoryID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM Category WHERE CategoryID = @CategoryID;
-- END;
