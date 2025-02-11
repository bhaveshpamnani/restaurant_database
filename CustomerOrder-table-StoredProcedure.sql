-- -- Create CustomerOrder
-- CREATE PROCEDURE CreateCustomerOrder
--     @UserID BIGINT,
--     @TableID BIGINT,
--     @TotalAmount DECIMAL(8, 2),
--     @PaymentStatus NVARCHAR(255),
--     @MenuID BIGINT,
--     @Quantity BIGINT,
--     @OrderStatus NVARCHAR(255)
-- AS
-- BEGIN
--     INSERT INTO CustomerOrder (UserID, TableID, TotalAmount, PaymentStatus, CreatedAt, MenuID, Quantity, OrderStatus)
--     VALUES (@UserID, @TableID, @TotalAmount, @PaymentStatus, GETDATE(), @MenuID, @Quantity, @OrderStatus);

--     SELECT SCOPE_IDENTITY() AS NewOrderID; -- Return the new OrderID
-- END;


-- -- GetALL CustomerOrders
-- CREATE PROCEDURE sp_GetCustomerOrders
-- AS
-- BEGIN
--     SELECT 
--         co.OrderID,
--         co.UserID,
--         u.UserName,
--         co.TableID,
--         dt.TableCode,
--         co.TotalAmount,
--         co.PaymentStatus,
--         co.CreatedAt,
--         co.MenuID,
--         m.DishName,
--         co.Quantity,
--         co.OrderStatus
--     FROM 
--         CustomerOrder co
--     INNER JOIN [User] u ON co.UserID = u.UserID
--     INNER JOIN DiningTable dt ON co.TableID = dt.TableID
--     INNER JOIN Menu m ON co.MenuID = m.MenuID;
-- END;


-- --GetByID CustomerOrders
-- CREATE PROCEDURE GetCustomerOrderById
--     @OrderID BIGINT
-- AS
-- BEGIN
--     SELECT 
--         co.OrderID,
--         co.UserID,
--         u.UserName,
--         co.TableID,
--         dt.TableCode,
--         co.TotalAmount,
--         co.PaymentStatus,
--         co.CreatedAt,
--         co.MenuID,
--         m.DishName,
--         co.Quantity,
--         co.OrderStatus
--     FROM 
--         CustomerOrder co
--     INNER JOIN [User] u ON co.UserID = u.UserID
--     INNER JOIN DiningTable dt ON co.TableID = dt.TableID
--     INNER JOIN Menu m ON co.MenuID = m.MenuID
--     WHERE 
--         co.OrderID = @OrderID;
-- END;



-- --Update CustomerOrder
-- CREATE PROCEDURE UpdateCustomerOrder
--     @OrderID BIGINT,
--     @UserID BIGINT,
--     @TableID BIGINT,
--     @TotalAmount DECIMAL(8, 2),
--     @PaymentStatus NVARCHAR(255),
--     @MenuID BIGINT,
--     @Quantity BIGINT,
--     @OrderStatus NVARCHAR(255)
-- AS
-- BEGIN
--     UPDATE CustomerOrder
--     SET 
--         UserID = @UserID,
--         TableID = @TableID,
--         TotalAmount = @TotalAmount,
--         PaymentStatus = @PaymentStatus,
--         MenuID = @MenuID,
--         Quantity = @Quantity,
--         OrderStatus = @OrderStatus
--     WHERE 
--         OrderID = @OrderID;

--     SELECT * FROM CustomerOrder WHERE OrderID = @OrderID; -- Return the updated record
-- END;


-- --Delete CustomerOrder
-- CREATE PROCEDURE sp_DeleteCustomerOrder
--     @OrderID BIGINT
-- AS
-- BEGIN
--     DELETE FROM CustomerOrder WHERE OrderID = @OrderID;
--     SELECT @OrderID AS DeletedOrderID; -- Confirm the deletion
-- END;
