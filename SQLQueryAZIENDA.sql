-- Creazione della tabella Impiego

USE Azienda;

CREATE TABLE Impiego (
    IDImpiego INT IDENTITY(1,1) PRIMARY KEY,
    TipoImpiego NVARCHAR(255) NOT NULL,
    Assunzione DATETIME NOT NULL
);

-- Creazione della tabella Impiegato
CREATE TABLE Impiegato (
    CF NVARCHAR(16) PRIMARY KEY,
    Nome NVARCHAR(100) NOT NULL,
    Cognome NVARCHAR(100) NOT NULL,
    Eta INT NOT NULL,
    RedditoMensile DECIMAL(10,2) NOT NULL,
    DetrazioneFiscale BIT NOT NULL,
    IDImpiego INT NOT NULL,
    FOREIGN KEY (IDImpiego) REFERENCES Impiego(IDImpiego)
);

-- Popolamento della tabella Impiego
INSERT INTO Impiego (TipoImpiego, Assunzione) VALUES 
('Ingegnere', '2007-05-10'),
('Tecnico', '2008-03-15'),
('Manager', '2006-12-01');

-- Popolamento della tabella Impiegato
INSERT INTO Impiegato (CF, Nome, Cognome, Eta, RedditoMensile, DetrazioneFiscale, IDImpiego)
VALUES 
('ABC123', 'Mario', 'Rossi', 30, 1000, 1, 1),
('DEF456', 'Luca', 'Verdi', 25, 1200, 0, 2),
('GHI789', 'Giorgio', 'Gatti', 40, 900, 1, 3);

-- a. Impiegati oltre i 29 anni
SELECT * FROM Impiegato WHERE Eta > 29;

-- b. Impiegati con reddito di almeno 800 euro mensili
SELECT * FROM Impiegato WHERE RedditoMensile >= 800;

-- c. Impiegati con detrazione fiscale
SELECT * FROM Impiegato WHERE DetrazioneFiscale = 1;

-- d. Impiegati senza detrazione fiscale
SELECT * FROM Impiegato WHERE DetrazioneFiscale = 0;

-- e. Impiegati con cognome che inizia per "G", ordinati alfabeticamente
SELECT * FROM Impiegato WHERE Cognome LIKE 'G%' ORDER BY Cognome;

-- f. Numero totale degli impiegati
SELECT COUNT(*) AS NumeroImpiegati FROM Impiegato;

-- g. Totale dei redditi mensili di tutti gli impiegati
SELECT SUM(RedditoMensile) AS TotaleRedditi FROM Impiegato;

-- h. Media dei redditi mensili di tutti gli impiegati
SELECT AVG(RedditoMensile) AS MediaReddito FROM Impiegato;

-- i. Reddito mensile massimo
SELECT MAX(RedditoMensile) AS RedditoMassimo FROM Impiegato;

-- j. Reddito mensile minimo
SELECT MIN(RedditoMensile) AS RedditoMinimo FROM Impiegato;

-- k. Impiegati assunti tra il 01/01/2007 e il 01/01/2008
SELECT * FROM Impiego WHERE Assunzione BETWEEN '2007-01-01' AND '2008-01-01';

-- l. Query parametrica per il tipo di impiego
DECLARE @Tipo NVARCHAR(50) = 'Ingegnere';
SELECT * FROM Impiegato 
INNER JOIN Impiego ON Impiegato.IDImpiego = Impiego.IDImpiego 
WHERE Impiego.TipoImpiego = @Tipo;

-- m. Età media dei lavoratori
SELECT AVG(Eta) AS EtaMedia FROM Impiegato;
