-- CREATE
-- CREATE PROCEDURE CreateDiningTable(
--     @TableCode NVARCHAR(255),
--     @AvailabilityStatus BIT,
--     @PersonCount BIGINT
-- )
-- AS
-- BEGIN
--     INSERT INTO DiningTable (TableCode, AvailabilityStatus, PersonCount)
--     VALUES (@TableCode, @AvailabilityStatus, @PersonCount);
-- END;

-- -- READ
-- CREATE PROCEDURE GetDiningTables
-- AS
-- BEGIN
--     SELECT * FROM DiningTable;
-- END;

-- exec GetDiningTables

-- -- READ BY ID
-- CREATE PROCEDURE GetDiningTableById(@TableID BIGINT)
-- AS
-- BEGIN
--     SELECT * FROM DiningTable WHERE TableID = @TableID;
-- END;

-- UPDATE
-- CREATE PROCEDURE UpdateDiningTable(
--     @TableID BIGINT,
--     @TableCode NVARCHAR(255),
--     @AvailabilityStatus BIT,
--     @PersonCount BIGINT
-- )
-- AS
-- BEGIN
--     UPDATE DiningTable
--     SET TableCode = @TableCode,
--         AvailabilityStatus = @AvailabilityStatus,
--         PersonCount = @PersonCount
--     WHERE TableID = @TableID;
-- END;

-- -- DELETE
-- CREATE PROCEDURE DeleteDiningTable(@TableID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM DiningTable WHERE TableID = @TableID;
-- END;
