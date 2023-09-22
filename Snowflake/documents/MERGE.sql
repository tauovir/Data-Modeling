
CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
);
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100);
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80);
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50);
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300);

CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
);
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100);
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180);
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50);
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300);

SELECT * FROM SourceProducts;
SELECT * FROM TargetProducts


MERGE into TargetProducts AS Target
USING SourceProducts AS Source
ON Source.ProductID = Target.ProductID
WHEN NOT MATCHED THEN
    INSERT(ProductID,ProductName, Price) 
    VALUES (Source.ProductID, Source.ProductName, Source.Price)
WHEN MATCHED THEN UPDATE  SET
    Target.ProductName = Source.ProductName,
    Target.Price = Source.Price;
