-- -- CREATE
-- CREATE PROCEDURE CreateFeedback(
--     @Description NVARCHAR(255),
--     @UserID BIGINT,
--     @FeedBackCategoryID BIGINT
-- )
-- AS
-- BEGIN
--     INSERT INTO FeedBack (Description, UserID, FeedBackCategoryID)
--     VALUES (@Description, @UserID, @FeedBackCategoryID);
-- END;

DBCC CHECKIDENT ('CustomerOrder', NORESEED);
DBCC CHECKIDENT ('CustomerOrder', RESEED, 3);

-- -- READ ALL
-- CREATE PROCEDURE GetFeedbacks
-- AS
-- BEGIN
--     SELECT [dbo].[Feedback].[FeedbackID],    
--      [dbo].[FeedbackCategory].[FeedbackCategoryID],    
--      [dbo].[FeedbackCategory].[CategoryName],    
--      [dbo].[Feedback].[Description],    
--      [dbo].[Feedback].[UserID]   
--     FROM [dbo].[FeedBack]
--     LEFT OUTER JOIN 
--     [dbo].[FeedbackCategory] ON [dbo].[Feedback].[FeedbackCategoryID] = [dbo].[FeedbackCategory].[FeedbackCategoryID];
-- END;

-- exec GetFeedbacks

-- READ BY ID
-- CREATE PROCEDURE GetFeedbackById(@FeedBackID BIGINT)
-- AS
-- BEGIN
--     SELECT 
--     [dbo].[Feedback].[FeedbackID],    
--      [dbo].[FeedbackCategory].[FeedbackCategoryID],    
--      [dbo].[FeedbackCategory].[CategoryName],    
--      [dbo].[Feedback].[Description],    
--      [dbo].[Feedback].[UserID]
--      FROM [dbo].[FeedBack]
--      LEFT OUTER JOIN 
--     [dbo].[FeedbackCategory] ON [dbo].[Feedback].[FeedbackCategoryID] = [dbo].[FeedbackCategory].[FeedbackCategoryID]
--      WHERE FeedBackID = @FeedBackID;
-- END;
-- EXEC GetFeedbackById 2

-- UPDATE
-- CREATE PROCEDURE UpdateFeedback(
--     @FeedBackID BIGINT,
--     @Description NVARCHAR(255),
--     @UserID BIGINT,
--     @FeedBackCategoryID BIGINT
-- )
-- AS
-- BEGIN
--     UPDATE FeedBack
--     SET Description = @Description,
--         UserID = @UserID,
--         FeedBackCategoryID = @FeedBackCategoryID
--     WHERE FeedBackID = @FeedBackID;
-- END;

-- -- DELETE
-- CREATE PROCEDURE DeleteFeedback(@FeedBackID BIGINT)
-- AS
-- BEGIN
--     DELETE FROM FeedBack WHERE FeedBackID = @FeedBackID;
-- END;
