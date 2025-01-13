CREATE DATABASE Restaurant
USE Restaurant

CREATE TABLE [User] (
    UserID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(255) NOT NULL,
    UserEmail NVARCHAR(255) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(255) NOT NULL,
    RoleID BIGINT NOT NULL
);

CREATE TABLE Category (
    CategoryID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(255) NOT NULL,
    Description NVARCHAR(255) NOT NULL
);

CREATE TABLE Menu (
    MenuID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CategoryID BIGINT NOT NULL,
    DishName NVARCHAR(255) NOT NULL,
    Description NVARCHAR(255) NOT NULL,
    Price DECIMAL(8, 2),
    ImgURL NVARCHAR(255) NOT NULL,
    AvailablityStatus BIT NOT NULL
);

CREATE TABLE DiningTable (
    TableID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TableCode NVARCHAR(255) NOT NULL,
    AvailabilityStatus BIT NOT NULL,
    PersonCount BIGINT NOT NULL
);

CREATE TABLE Reservation (
    ReservationID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    UserID BIGINT NOT NULL,
    TableID BIGINT NOT NULL,
    BookDate DATE NOT NULL,
    BookTime TIME NOT NULL,
    PersonCount BIGINT NOT NULL,
    ReservationStatus NVARCHAR(255) NOT NULL
);

Create TABLE CustomerOrder (
    OrderID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    UserID BIGINT NOT NULL,
    TableID BIGINT NOT NULL,
    TotalAmount DECIMAL(8, 2) NOT NULL,
    PaymentStatus NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME NOT NULL,
    MenuID BIGINT NOT NULL,
    Quantity BIGINT NOT NULL,
    OrderStatus NVARCHAR(255) NOT NULL
);

CREATE TABLE Inventory (
    InventoryID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ItemName NVARCHAR(255) NOT NULL,
    QuantityAvailable DECIMAL(8, 2) NOT NULL,
    QuantityWanted DECIMAL(8, 2) NOT NULL
);

CREATE TABLE Staff (
    StaffID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    UserID BIGINT NOT NULL,
    Available BIT NOT NULL
);

CREATE TABLE Chief (
    ChiefID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    UserID BIGINT NOT NULL,
    OrderID BIGINT NOT NULL
);

CREATE TABLE Feedback (
    FeedbackID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Description NVARCHAR(255) NOT NULL,
    UserID BIGINT NOT NULL,
    FeedbackCategoryID BIGINT NOT NULL
);

CREATE TABLE FeedbackCategory (
    FeedbackCategoryID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(255) NOT NULL
);

CREATE TABLE UserRole (
    RoleID BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(255) NOT NULL
);

-- ALTER TABLE Chief ADD CONSTRAINT chief_orderID_fk FOREIGN KEY (OrderID) REFERENCES CustomerOrder (OrderID);
-- ALTER TABLE Menu ADD CONSTRAINT menu_categoryID_fk FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID);
-- ALTER TABLE Reservation ADD CONSTRAINT reservation_tableID_fk FOREIGN KEY (TableID) REFERENCES DiningTable (TableID);
-- ALTER TABLE Reservation ADD CONSTRAINT reservation_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
-- ALTER TABLE Chief ADD CONSTRAINT chief_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
-- ALTER TABLE CustomerOrder ADD CONSTRAINT order_tableID_fk FOREIGN KEY (TableID) REFERENCES DiningTable (TableID);
-- ALTER TABLE CustomerOrder ADD CONSTRAINT menu_tableID_fk FOREIGN KEY (MenuID) REFERENCES Menu (MenuID);
-- ALTER TABLE Feedback ADD CONSTRAINT feedback_categoryID_fk FOREIGN KEY (FeedbackCategoryID) REFERENCES FeedbackCategory (FeedbackCategoryID);
-- ALTER TABLE Staff ADD CONSTRAINT staff_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
-- ALTER TABLE Feedback ADD CONSTRAINT feedback_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
-- ALTER TABLE CustomerOrder ADD CONSTRAINT order_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
-- ALTER TABLE [User] ADD CONSTRAINT user_roleID_fk FOREIGN KEY (RoleID) REFERENCES UserRole (RoleID);



-- Chief Table Constraints
IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'chief_orderID_fk'
)
BEGIN
    ALTER TABLE Chief ADD CONSTRAINT chief_orderID_fk FOREIGN KEY (OrderID) REFERENCES CustomerOrder (OrderID);
END;

IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'chief_userID_fk'
)
BEGIN
    ALTER TABLE Chief ADD CONSTRAINT chief_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
END;

-- Menu Table Constraints
IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'menu_categoryID_fk'
)
BEGIN
    ALTER TABLE Menu ADD CONSTRAINT menu_categoryID_fk FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID);
END;

-- Reservation Table Constraints
IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'reservation_tableID_fk'
)
BEGIN
    ALTER TABLE Reservation ADD CONSTRAINT reservation_tableID_fk FOREIGN KEY (TableID) REFERENCES DiningTable (TableID);
END;

IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'reservation_userID_fk'
)
BEGIN
    ALTER TABLE Reservation ADD CONSTRAINT reservation_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
END;

-- CustomerOrder Table Constraints
IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'order_tableID_fk'
)
BEGIN
    ALTER TABLE CustomerOrder ADD CONSTRAINT order_tableID_fk FOREIGN KEY (TableID) REFERENCES DiningTable (TableID);
END;

IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'menu_tableID_fk'
)
BEGIN
    ALTER TABLE CustomerOrder ADD CONSTRAINT menu_tableID_fk FOREIGN KEY (MenuID) REFERENCES Menu (MenuID);
END;

IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'order_userID_fk'
)
BEGIN
    ALTER TABLE CustomerOrder ADD CONSTRAINT order_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
END;

-- Feedback Table Constraints
IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'feedback_categoryID_fk'
)
BEGIN
    ALTER TABLE Feedback ADD CONSTRAINT feedback_categoryID_fk FOREIGN KEY (FeedbackCategoryID) REFERENCES FeedbackCategory (FeedbackCategoryID);
END;

IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'feedback_userID_fk'
)
BEGIN
    ALTER TABLE Feedback ADD CONSTRAINT feedback_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
END;

-- Staff Table Constraints
IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'staff_userID_fk'
)
BEGIN
    ALTER TABLE Staff ADD CONSTRAINT staff_userID_fk FOREIGN KEY (UserID) REFERENCES [User] (UserID);
END;

-- User Table Constraints
IF NOT EXISTS (
    SELECT 1 
    FROM sys.foreign_keys 
    WHERE name = 'user_roleID_fk'
)
BEGIN
    ALTER TABLE [User] ADD CONSTRAINT user_roleID_fk FOREIGN KEY (RoleID) REFERENCES UserRole (RoleID);
END;
