-- CREATE
-- CREATE PROCEDURE CreateChief(
--     @UserID BIGINT,
--     @OrderID BIGINT
-- )
-- AS
-- BEGIN
--     INSERT INTO Chief (UserID, OrderID)
--     VALUES (@UserID, @OrderID);
-- END;

-- -- READ ALL
-- CREATE PROCEDURE GetChiefs
-- AS
-- BEGIN
--     SELECT * FROM Chief;
-- END;

-- -- READ BY ID
-- CREATE PROCEDURE GetChiefById(@ChiefID BIGINT)
-- AS
-- BEGIN
--     SELECT * FROM Chief WHERE ChiefID = @ChiefID;
-- END;

-- UPDATE
-- CREATE PROCEDURE UpdateChief(
--     @ChiefID BIGINT,
--     @UserID BIGINT,
--     @OrderID BIGINT
-- )
-- AS
-- BEGIN
--     UPDATE Chief
--     SET UserID = @UserID,
--         OrderID = @OrderID
--     WHERE ChiefID = @ChiefID;
-- END;

-- DELETE
-- CREATE PROCEDURE DeleteChief(@ChiefID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM Chief WHERE ChiefID = @ChiefID;
-- END;
