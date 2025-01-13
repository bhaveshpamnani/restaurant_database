-- CREATE
-- CREATE PROCEDURE CreateInventory(
--     @ItemName NVARCHAR(255),
--     @QuantityAvailable DECIMAL(8, 2),
--     @QuantityWanted DECIMAL(8, 2)
-- )
-- AS
-- BEGIN
--     INSERT INTO Inventory (ItemName, QuantityAvailable, QuantityWanted)
--     VALUES (@ItemName, @QuantityAvailable, @QuantityWanted);
-- END;
DBCC CHECKIDENT ('Inventory', NORESEED);
DBCC CHECKIDENT ('Inventory', RESEED, 3);
-- READ ALL
-- CREATE PROCEDURE GetInventories
-- AS
-- BEGIN
--     SELECT * FROM Inventory;
-- END;

-- -- READ BY ID
-- CREATE PROCEDURE GetInventoryById(@InventoryID BIGINT)
-- AS
-- BEGIN
--     SELECT * FROM Inventory WHERE InventoryID = @InventoryID;
-- END;

-- -- UPDATE
-- CREATE PROCEDURE UpdateInventory(
--     @InventoryID BIGINT,
--     @ItemName NVARCHAR(255),
--     @QuantityAvailable DECIMAL(8, 2),
--     @QuantityWanted DECIMAL(8, 2)
-- )
-- AS
-- BEGIN
--     UPDATE Inventory
--     SET ItemName = @ItemName,
--         QuantityAvailable = @QuantityAvailable,
--         QuantityWanted = @QuantityWanted
--     WHERE InventoryID = @InventoryID;
-- END;

-- DELETE
-- CREATE PROCEDURE DeleteInventory(@InventoryID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM Inventory WHERE InventoryID = @InventoryID;
-- END;
