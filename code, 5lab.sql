-- обнулення даних
UPDATE `myschemaa`.`invoise` SET `Client_ID` = NULL WHERE (`Invoise_ID` = '10');
UPDATE `myschemaa`.`invoise` SET `Client_ID` = NULL WHERE (`Invoise_ID` = '13');
UPDATE `myschemaa`.`invoise` SET `Client_ID` = NULL WHERE (`Invoise_ID` = '16');
UPDATE `myschemaa`.`invoise` SET `Client_ID` = NULL WHERE (`Invoise_ID` = '20');

-- Запит 1
SELECT Order_Details.OrderDetail_ID AS 'Orders ID', Product.Product_Name AS 'Product name',
Invoise.Invoise_ID AS 'Invoice ID', Invoise.Order_Date AS 'Transaction moment', Client.Last_Name AS 'Customer last name',
Client.First_Name AS 'Customer first name' FROM Order_Details
JOIN Product ON Order_Details.Product_ID = Product.Product_ID
RIGHT JOIN Invoise ON Order_Details.Invoise_ID = Invoise.Invoise_ID
LEFT JOIN Client ON Invoise.Client_ID = Client.Client_ID
ORDER BY Order_Details.OrderDetail_ID DESC;

-- Запит 2
SELECT DISTINCT Order_Details.OrderDetail_ID AS 'Orders ID', Product.Product_Name AS 'Product name',
Invoise.Invoise_ID AS 'Invoice ID', Invoise.Order_Date AS 'Transaction moment', Client.Last_Name AS 'Customer last name', Client.First_Name AS 'Customer first name'
FROM Order_Details
JOIN Product ON Order_Details.Product_ID = Product.Product_ID
JOIN Invoise ON Order_Details.Invoise_ID = Invoise.Invoise_ID
JOIN Client ON Invoise.Client_ID = Client.Client_ID
JOIN Seller ON Invoise.Invoise_ID = Seller.Invoise_ID
JOIN Store ON Seller.Seller_ID = Store.Seller_ID
WHERE Store.Store_Equipment LIKE '%система%'
AND Invoise.Order_Date BETWEEN '2023-10-01' AND '2023-11-01'
ORDER BY Order_Details.OrderDetail_ID;

-- Запит 3
SELECT DISTINCT Order_Details.OrderDetail_ID AS 'Orders ID', Product.Product_Name AS 'Product name',
Invoise.Invoise_ID AS 'Invoice ID', Invoise.Order_Date AS 'Transaction moment', Client.Last_Name AS 'Customer last name', Client.First_Name AS 'Customer first name'
FROM Order_Details
JOIN Product ON Order_Details.Product_ID = Product.Product_ID
JOIN Invoise ON Order_Details.Invoise_ID = Invoise.Invoise_ID
JOIN Client ON Invoise.Client_ID = Client.Client_ID
JOIN Seller ON Invoise.Invoise_ID = Seller.Invoise_ID
JOIN Store ON Seller.Seller_ID = Store.Seller_ID
WHERE Store.Store_Equipment LIKE '%система%'
AND Invoise.Order_Date BETWEEN '2023-10-01' AND '2023-11-01'
ORDER BY Order_Details.OrderDetail_ID;
