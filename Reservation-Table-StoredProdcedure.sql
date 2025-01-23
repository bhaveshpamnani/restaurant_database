-- -- CREATE
Alter PROCEDURE CreateReservation(
    @UserID BIGINT,
    @BookDate DATE,
    @BookTime TIME,
    @PersonCount BIGINT,
    @ReservationStatus NVARCHAR(255)
)
AS
BEGIN
    INSERT INTO Reservation (UserID, BookDate, BookTime, PersonCount, ReservationStatus)
    VALUES (@UserID, @BookDate, @BookTime, @PersonCount, @ReservationStatus);
END;
-- DBCC CHECKIDENT ('FeedBack', NORESEED);
-- DBCC CHECKIDENT ('FeedBack', RESEED, 3);
-- -- READ
-- create PROCEDURE GetReservations
-- AS
-- BEGIN
--     SELECT
--     [dbo].[Reservation].ReservationID,
--     [dbo].[Reservation].ReservationStatus,
--     [dbo].[Reservation].PersonCount,
--     [dbo].[Reservation].BookDate,
--     [dbo].[Reservation].BookTime,
--     [dbo].[DiningTable].TableID,
--     [dbo].[User].UserID,
--     [dbo].[User].UserName,
--     [dbo].[User].UserEmail,
--     [dbo].[DiningTable].TableCode,
--     [dbo].[DiningTable].AvailabilityStatus
--      FROM Reservation
--      LEFT OUTER JOIN
--      [dbo].[DiningTable] ON [dbo].[Reservation].TableID = [dbo].[DiningTable].TableID
--      LEFT OUTER JOIN
--      [dbo].[User] ON [dbo].[Reservation].UserID = [dbo].[User].UserID;
-- END;

-- -- READ BY ID
-- create PROCEDURE GetReservationById(@ReservationID BIGINT)
-- AS
-- BEGIN
--     SELECT
--     [dbo].[Reservation].ReservationID,
--     [dbo].[Reservation].ReservationStatus,
--     [dbo].[Reservation].PersonCount,
--     [dbo].[Reservation].BookDate,
--     [dbo].[Reservation].BookTime,
--     [dbo].[DiningTable].TableID,
--     [dbo].[User].UserID,
--     [dbo].[User].UserName,
--     [dbo].[User].UserEmail,
--     [dbo].[DiningTable].TableCode,
--     [dbo].[DiningTable].AvailabilityStatus
--      FROM Reservation
--      LEFT OUTER JOIN
--      [dbo].[DiningTable] ON [dbo].[Reservation].TableID = [dbo].[DiningTable].TableID
--      LEFT OUTER JOIN
--      [dbo].[User] ON [dbo].[Reservation].UserID = [dbo].[User].UserID
--      WHERE ReservationID = @ReservationID;
-- END;

-- -- -- UPDATE
-- create PROCEDURE UpdateReservation(
--     @ReservationID BIGINT,
--     @UserID BIGINT,
--     @TableID BIGINT,
--     @BookDate DATE,
--     @BookTime TIME,
--     @PersonCount BIGINT,
--     @ReservationStatus NVARCHAR(255)
-- )
-- AS
-- BEGIN
--     UPDATE Reservation
--     SET UserID = @UserID,
--         TableID = @TableID,
--         BookDate = @BookDate,
--         BookTime = @BookTime,
--         PersonCount = @PersonCount,
--         ReservationStatus = @ReservationStatus
--     WHERE ReservationID = @ReservationID;
-- END;

-- -- -- DELETE
-- CREATE PROCEDURE DeleteReservation(@ReservationID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM Reservation WHERE ReservationID = @ReservationID;
-- END;


Alter PROCEDURE GetReservationsByUserId
    @UserId INT
AS
BEGIN
    SELECT [dbo].[DiningTable].TableCode,
    [dbo].[Reservation].BookDate,
    [dbo].[Reservation].ReservationID,
    [dbo].[Reservation].UserID,
    [dbo].[Reservation].ReservationID,
    [dbo].[Reservation].ReservationStatus,
    [dbo].[Reservation].BookDate,
    [dbo].[Reservation].BookTime,
    [dbo].[Reservation].PersonCount
    FROM Reservation
    LEFT OUTER JOIN DiningTable
    ON [dbo].[DiningTable].TableID = [dbo].[Reservation].TableID
    WHERE UserID = @UserId;
END;
GO
EXEC GetReservationsByUserId 4

ALTER PROCEDURE PostReservationRequest
    @UserId INT,
    @BookDate DATE,
    @BookTime TIME,
    @PersonCount INT,
    @ReservationID INT OUTPUT,
    @ReservationStatus NVARCHAR(50) OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @AvailableTableId INT;
        DECLARE @AvailableTableCode NVARCHAR(10);

        -- Check for available table
        SELECT TOP 1 @AvailableTableId = TableID, @AvailableTableCode = TableCode
        FROM DiningTable
        WHERE AvailabilityStatus = 1 AND PersonCount >= @PersonCount
        ORDER BY PersonCount;

        -- If a table is available, insert the reservation
        IF @AvailableTableId IS NOT NULL
        BEGIN
            INSERT INTO Reservation (UserID, TableID, BookDate, BookTime, PersonCount, ReservationStatus)
            VALUES (@UserId, @AvailableTableId, @BookDate, @BookTime, @PersonCount, 'Confirmed');

            -- Get the newly generated ReservationID
            SET @ReservationID = SCOPE_IDENTITY();

            -- Update table availability
            UPDATE DiningTable
            SET AvailabilityStatus = 0
            WHERE TableID = @AvailableTableId;

            SET @ReservationStatus = CONCAT('Confirmed - Table: ', @AvailableTableCode);
        END
        ELSE
        BEGIN
            SET @ReservationID = NULL;
            SET @ReservationStatus = 'Pending - No table available';
        END;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        -- Return error information
        SET @ReservationID = NULL;
        SET @ReservationStatus = ERROR_MESSAGE();
    END CATCH;
END;
GO

