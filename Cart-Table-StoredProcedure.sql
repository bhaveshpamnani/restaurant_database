SELECT * from Cart

-- CREATE PROCEDURE GetCartItemsByUserID
--     @UserID INT
-- AS
-- BEGIN
--     SELECT * FROM Cart WHERE UserID = @UserID;
-- END;

-- CREATE PROCEDURE UpdateCartQuantity
--     @CartID INT,
--     @Quantity INT
-- AS
-- BEGIN
--     UPDATE Cart 
--     SET Quantity = @Quantity 
--     WHERE CartID = @CartID;
-- END;


-- CREATE PROCEDURE AddMenuItemToCart
--     @MenuID INT,
--     @TableID INT,
--     @UserID INT,
--     @Quantity INT
-- AS
-- BEGIN
--     INSERT INTO Cart (MenuID, TableID, UserID, Quantity)
--     VALUES (@MenuID, @TableID, @UserID, @Quantity);
-- END;
