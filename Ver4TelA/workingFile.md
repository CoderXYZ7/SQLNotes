# Test

curl --location "https://api.mistral.ai/v1/chat/completions" \
     --header 'Content-Type: application/json' \
     --header 'Accept: application/json' \
     --header "Authorization: Bearer xxx" \
     --data '{
    "model": "mistral-large-latest",
    "messages": [{"role": "user", "content": "Who is the most renowned French painter?"}]
  }'

UCIcqtest1
M6m8wtest2
JwqsGtest3
oIiAutest4
yXvQAtest5
Ap4umtest6
qi

## Init.sql

```sql
CREATE DATABASE AutoAssicurazioni;

USE AutoAssicurazioni;

CREATE TABLE Proprietari(
	CodFiscale CHARACTER(16) NOT NULL,
	Cognome VARCHAR(30) NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	DataNascita DATE NOT NULL,
	PRIMARY KEY(CodFiscale));
	
CREATE TABLE Assicurazioni(
	CodAss INT NOT NULL AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL,
	Sede VARCHAR(100) NOT NULL,
	PRIMARY KEY(CodAss));
	
CREATE TABLE Automobili(
	Targa VARCHAR(10) NOT NULL,
	Marca VARCHAR(20) NOT NULL,
	Cilindrata INT NOT NULL,
	Potenza INT NOT NULL,
	CodFiscale CHARACTER(16),
	CodAss INT NULL,
	PRIMARY KEY(Targa),
	FOREIGN KEY(CodFiscale) REFERENCES Proprietari(CodFiscale) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(CodAss) REFERENCES Assicurazioni(CodAss) ON DELETE RESTRICT ON UPDATE CASCADE);
	
CREATE TABLE Sinistri(
	CodS INT NOT NULL AUTO_INCREMENT,
	Localita VARCHAR(100) NOT NULL,
	Data DATE NOT NULL,
	PRIMARY KEY(CodS));

CREATE TABLE AutoCoinvolte(
	CodS INT NOT NULL,
	Targa VARCHAR(10) NOT NULL,
	ImportoDanno DECIMAL(7,2) NOT NULL,
	PRIMARY KEY(CodS, Targa),
	FOREIGN KEY(CodS) REFERENCES Sinistri(CodS) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Targa) REFERENCES Automobili(Targa) ON DELETE CASCADE ON UPDATE CASCADE);


LOAD DATA
INFILE '%currentPathMySql%/Proprietari.csv'
INTO TABLE Proprietari
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA
INFILE '%currentPathMySql%/Assicurazioni.csv'
INTO TABLE Assicurazioni
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA
INFILE '%currentPathMySql%/Automobili.csv'
INTO TABLE Automobili
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA
INFILE '%currentPathMySql%/Sinistri.csv'
INTO TABLE Sinistri
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA
INFILE '%currentPathMySql%/AutoCoinvolte.csv'
INTO TABLE AutoCoinvolte
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
```

## 1
Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV.

```sql
SELECT Targa, Marca FROM Automobili WHERE Cilindrata > 2000 OR Potenza > 120;
```

## 2
Nome del proprietario e Targa delle Auto di cilindrata superiore a 2000 cc oppure di potenza
superiore a 120 CV.

```sql
SELECT P.Nome, P.Cognome, A.Targa FROM Proprietari P JOIN Automobili A ON P.CodFiscale = A.CodFiscale WHERE A.Cilindrata > 2000 OR A.Potenza > 120;
```

## 3
Targa, Cognome e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di
potenza superiore a 120 CV, assicurate presso la compagnia “Sara Assicurazioni”.

```sql
SELECT A.Targa, P.Cognome, P.Nome FROM Automobili A JOIN Proprietari P ON A.CodFiscale = P.CodFiscale JOIN Assicurazioni Ass ON A.CodAss = Ass.CodAss WHERE (A.Cilindrata > 2000 OR A.Potenza > 120) AND Ass.Nome = 'Sara Assicurazioni';
```

## 4
Targa e Nome del proprietario delle Auto assicurate presso la “Sara Assicurazioni” e coinvolte in
sinistri il nell’anno 2023.

```sql
SELECT A.Targa, P.Nome, P.Cognome FROM Automobili A JOIN Proprietari P ON A.CodFiscale = P.CodFiscale JOIN Assicurazioni Ass ON A.CodAss = Ass.CodAss JOIN AutoCoinvolte AC ON A.Targa = AC.Targa JOIN Sinistri S ON AC.CodS = S.CodS WHERE Ass.Nome = 'Sara Assicurazioni' AND YEAR(S.Data) = 2023;
```

## 5
Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate.

```sql
SELECT Ass.Nome, Ass.Sede, COUNT(A.Targa) AS NumeroAuto FROM Assicurazioni Ass JOIN Automobili A ON Ass.CodAss = A.CodAss GROUP BY Ass.CodAss;
```
