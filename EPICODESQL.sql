USE Giorno2DB;
/*1) SELEZIONE DI TUTTI I PRODOTTI (TUTTI I CAMPI) */

SELECT * FROM Products;

--2) Selezione di tutti i prodotti con uno quantità disponibile (UnitsInStock) di almeno 40 pezzi

SELECT * FROM Products WHERE UnitsInStock > 40;

--3) Selezione di tutti i clienti (Employees) che abitano a Londra

SELECT * FROM Customers WHERE City = 'London';

--4) Selezione di tutti gli ordini, ordinati in ordine decrescente per spese di trasporto (Freight),

SELECT * FROM Orders ORDER BY Freight DESC;

--5) Selezione degli ordini il cui importo del trasporto è superiore a 90 e inferiore i 200

 SELECT * FROM Orders WHERE Freight BETWEEN 20 AND 90 ORDER BY Freight

--6)  Selezione di tutti i prodotti la cui categoria è "1",

SELECT * FROM Products WHERE CategoryID = 1;

--7) Selezione di tutte le righe dei dettagli degli ordini che hanno applicato uno sconto

SELECT * FROM [Order Details] WHERE Discount <> 0;

--8) Selezione di tutti gli ordini del cliente con ID "BOTTM" le cui spese di trasporto superano l'importo di 50.

SELECT * FROM Orders WHERE CustomerID = 'BOTTM' AND Freight > 50
