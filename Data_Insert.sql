--=== UserRole Insert ===---
INSERT INTO UserRole (RoleName)
VALUES 
('Customer'),
('Staff');
select * from UserRole

--=== User Insert ===---
INSERT INTO [User] (UserName, UserEmail, Password, Phone, RoleID)
VALUES 
('John Doe', 'john.doe@example.com', 'password123', '1234567890', 1),
('Jane Smith', 'jane.smith@example.com', 'password456', '0987654321', 2);


--=== Category Insert ===---
INSERT INTO Category (CategoryName, Description)
VALUES 
('Appetizers', 'Starters before the main meal'),
('Main Course', 'Hearty and filling dishes');


--=== Menu Insert ===---
INSERT INTO Menu (CategoryID, DishName, Description, Price, ImgURL, AvailabilityStatus)
VALUES 
(1, 'Spring Rolls', 'Crispy rolls stuffed with vegetables', 5.99, 'spring_rolls.jpg', 1),
(2, 'Grilled Chicken', 'Juicy chicken breast with herbs', 15.99, 'grilled_chicken.jpg', 1);


--=== DiningTable Insert ===---
INSERT INTO DiningTable (TableCode, AvailabilityStatus, PersonCount)
VALUES 
('T1', 1, 4),
('T2', 0, 2);


--=== Reservation Insert ===---
INSERT INTO Reservation (UserID, TableID, BookDate, BookTime, PersonCount, ReservationStatus)
VALUES 
(1, 1, '2024-12-25', '18:30:00', 4, 'Confirmed'),
(2, 2, '2024-12-26', '19:00:00', 2, 'Pending');


--=== CustomerOrder Insert ===---
INSERT INTO CustomerOrder (UserID, TableID, TotalAmount, PaymentStatus, CreatedAt, OrderStatus, MenuID, Quantity)
VALUES 
(2, 2, 250.00, 'Paid', '2024-12-29 12:30:00', 'Completed', 2, 2),
(2, 2, 150.00, 'Unpaid', '2024-12-29 13:00:00', 'Pending', 2, 1),
(2, 2, 400.00, 'Paid', '2024-12-28 19:45:00', 'Completed', 2, 4),
(2, 2, 75.00, 'Paid', '2024-12-28 14:20:00', 'Canceled', 2, 1),
(2, 2, 300.00, 'Pending', '2024-12-29 14:10:00', 'In Progress', 2, 3);


SELECT * from CustomerOrder
DELETE from CustomerOrder 
WHERE OrderID = 10006

--=== Inventory Insert ===---
INSERT INTO Inventory (ItemName, QuantityAvailable, QuantityWanted)
VALUES 
('Chicken Breast', 10.00, 5.00),
('Spring Roll Wrappers', 20.00, 10.00);


--=== Staff Insert ===---
INSERT INTO Staff (UserID, Available)
VALUES 
(1, 1),
(2, 0);


--=== Chief Insert ===---
INSERT INTO Chief (UserID, OrderID)
VALUES 
(1, 1),
(2, 2);


--=== FeedbackCategory Insert ===---
INSERT INTO FeedbackCategory (CategoryName)
VALUES 
('Service'),
('Ambiance');


--=== Feedback Insert ===---
INSERT INTO Feedback (Description, UserID, FeedbackCategoryID)
VALUES 
('Great food and service!', 1, 1),
('Could improve the ambiance.', 2, 2);
