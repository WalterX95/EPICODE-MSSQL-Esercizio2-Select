USE Giorno2DB;

--1) Numero totale degli ordini

--SELECT COUNT(*) FROM Orders;

--2) Numero Totale di clienti

--SELECT COUNT(*) FROM Customers;

-- 3) Numero totale di clienti che abitano a londra

--SELECT * FROM Customers WHERE City LIKE '%London%'

--4)  La media aritmetica del costo del trasporto di tutti gli ordini effettuati

-- SELECT AVG([Freight]) AS EXP1 FROM Orders;

--5)  La media aritmetica del costo del trasporto dei soli ordini effettuati dal cliente "BOTTM"

--SELECT AVG([Freight]) AS EXP2 FROM Orders WHERE CustomerID LIKE '%BOTTM'

--6) Totale delle spese di trasporto effettuate raggruppate per id cliente

--SELECT CustomerID, SUM(Freight) AS totaleSpese FROM Orders
--GROUP BY CustomerID;

--7) Numero totale di clienti raggruppati per città di appartenenza

--SELECT CustomerID FROM Orders
--Group By CustomerID, ShipCountry;

--8) Totale di UnitPrice * Quantity raggruppato per ogni ordine

SELECT OrderID, SUM(UnitPrice * Quantity) AS TotalPrice
FROM [Order Details]
GROUP BY OrderID;

--9) Totale di UnitPrice * Quantity solo dell'ordine con id=10248

SELECT SUM(UnitPrice * Quantity) AS TotalPrice
FROM [Order Details]
WHERE OrderID = 10248;