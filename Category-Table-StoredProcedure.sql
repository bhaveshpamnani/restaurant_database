-- CREATE
-- CREATE PROCEDURE CreateCategory(
--     @CategoryName NVARCHAR(255),
--     @Description NVARCHAR(255)
-- )
-- AS
-- BEGIN
--     INSERT INTO Category (CategoryName, Description)
--     VALUES (@CategoryName, @Description);
-- END;

-- READ
-- CREATE PROCEDURE GetCategories
-- AS
-- BEGIN
--     SELECT * FROM Category;
-- END;
-- EXEC GetCategories

-- DBCC CHECKIDENT ('Category', NORESEED);
-- DBCC CHECKIDENT ('Category', RESEED, 3);

-- READ BY ID
-- CREATE PROCEDURE GetCategoryById(@CategoryID BIGINT)
-- AS
-- BEGIN
--     SELECT * FROM Category WHERE CategoryID = @CategoryID;
-- END;

-- -- UPDATE
-- CREATE PROCEDURE UpdateCategory(
--     @CategoryID BIGINT,
--     @CategoryName NVARCHAR(255),
--     @Description NVARCHAR(255)
-- )
-- AS
-- BEGIN
--     UPDATE Category
--     SET CategoryName = @CategoryName,
--         Description = @Description
--     WHERE CategoryID = @CategoryID;
-- END;

-- -- DELETE
-- CREATE PROCEDURE DeleteCategory(@CategoryID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM Category WHERE CategoryID = @CategoryID;
-- END;
