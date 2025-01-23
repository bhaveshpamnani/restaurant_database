-- -- CREATE
-- CREATE PROCEDURE CreateUser(
--     @UserName NVARCHAR(255),
--     @UserEmail NVARCHAR(255),
--     @Password NVARCHAR(255),
--     @Phone NVARCHAR(255),
--     @RoleID BIGINT
-- )
-- AS
-- BEGIN
--     INSERT INTO [User]
--         (UserName, UserEmail, Password, Phone, RoleID)
--     VALUES
--         (@UserName, @UserEmail, @Password, @Phone, @RoleID);
-- END;

SELECT * from [UserRole]
EXEC CreateUser "bhavesh","bhavsh@gmail.com","234567890","1234567890",1

-- DBCC CHECKIDENT ('User', NORESEED);
-- DBCC CHECKIDENT ('User', RESEED, 3);


-- READ
Create PROCEDURE GetUsers
AS
BEGIN
    SELECT [dbo].[User].[UserID],
    [dbo].[User].[UserEmail],
    [dbo].[User].[UserName],
    [dbo].[User].[Password],
    [dbo].[User].[Phone],
[dbo].[User].[RoleId],
    [dbo].[UserRole].[RoleName]
    FROM [User] 
    Left Outer Join 
    [dbo].[UserRole] on [dbo].[User].[RoleID] = [dbo].[UserRole].[RoleID] ;
END;

-- Exec GetUsers

-- -- READ BY ID
-- Create PROCEDURE GetUserById(@UserID BIGINT)
-- AS
-- BEGIN
--     SELECT [dbo].[User].[UserID],
--     [dbo].[User].[UserEmail],
--     [dbo].[User].[UserName],
--     [dbo].[User].[Password],
--     [dbo].[User].[Phone],
--     [dbo].[User].[RoleId],
--     [dbo].[UserRole].[RoleName]
--     FROM [User] 
--     Left Outer Join 
--     [dbo].[UserRole] on [dbo].[User].[RoleID] = [dbo].[UserRole].[RoleID]
--     WHERE [dbo].[User].[UserID] = @UserID ;
-- END;

-- Exec GetUserById 1

-- -- UPDATE
-- CREATE PROCEDURE UpdateUser(
--     @UserID BIGINT,
--     @UserName NVARCHAR(255),
--     @UserEmail NVARCHAR(255),
--     @Password NVARCHAR(255),
--     @Phone NVARCHAR(255),
--     @RoleID BIGINT
-- )
-- AS
-- BEGIN
--     UPDATE [User]
--     SET UserName = @UserName,
--         UserEmail = @UserEmail,
--         Password = @Password,
--         Phone = @Phone,
--         RoleID = @RoleID
--     WHERE UserID = @UserID;
-- END;

-- -- DELETE
-- CREATE PROCEDURE DeleteUser(@UserID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM [User] WHERE UserID = @UserID;
-- END;


---===Login 
-- Alter PROCEDURE ValidateUser
--     @UserEmail NVARCHAR(255)
-- AS
-- BEGIN
--     SELECT UserID, RoleID,UserName ,Password
--     FROM [User] 
--     WHERE UserEmail = @UserEmail;
-- END;
SELECT * from Reservation
SELECT * from DiningTable
SELECT * from [User]

