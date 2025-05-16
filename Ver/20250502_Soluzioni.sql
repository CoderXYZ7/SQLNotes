USE AutoAssicurazioni;
/*
--------------------------------------------
QUERY 1
Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV. */

SELECT Targa, Marca
FROM Automobili
WHERE Cilindrata > 2000 OR Potenza > 120;

/*
+---------+---------------+
| Targa   | Marca         |
+---------+---------------+
| AB222AB | Audi          |
| AB888AB | Jeep          |
| BC333BC | Volvo         |
| BC999BC | Land Rover    |
| CD444CD | Mazda         |
| CD888CD | Nissan        |
| DE555DE | Kia           |
| DE999DE | Honda         |
| EF000EF | BMW           |
| EF666EF | Subaru        |
| FF555FF | Toyota        |
| FG111FG | Mercedes-Benz |
| FG777FG | Suzuki        |
| GH222GH | Audi          |
| GH888GH | Jeep          |
| HI333HI | Volvo         |
| HI999HI | Land Rover    |
| II888II | Nissan        |
| IJ444IJ | Mazda         |
| JJ999JJ | Honda         |
| JK555JK | Kia           |
| KK000KK | BMW           |
| KL666KL | Subaru        |
| LL111LL | Mercedes-Benz |
| LM777LM | Suzuki        |
| MM222MM | Audi          |
| MN888MN | Jeep          |
| NN333NN | Volvo         |
| NO555NO | Toyota        |
| NO999NO | Land Rover    |
| OO444OO | Mazda         |
| PP555PP | Kia           |
| QQ666QQ | Subaru        |
| QR888QR | Nissan        |
| RR777RR | Suzuki        |
| RS999RS | Honda         |
| SS888SS | Jeep          |
| ST000ST | BMW           |
| TT999TT | Land Rover    |
| TU111TU | Mercedes-Benz |
| TU555TU | Toyota        |
| UV222UV | Audi          |
| VW333VW | Volvo         |
| WX444WX | Mazda         |
| WX888WX | Nissan        |
| XY555XY | Kia           |
| XY999XY | Honda         |
| YZ000YZ | BMW           |
| YZ666YZ | Subaru        |
| ZA111ZA | Mercedes-Benz |
| ZA777ZA | Suzuki        |
| ZZ555ZZ | Toyota        |
+---------+---------------+
52 rows in set


--------------------------------------------
QUERY 2
Nome del proprietario e Targa delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV. */

SELECT P.Cognome, P.Nome, A.Targa
FROM Proprietari P INNER JOIN Automobili A ON P.CodFiscale = A.CodFiscale
WHERE A.Cilindrata > 2000 OR A.Potenza > 120;

/*
+------------+----------+---------+
| Cognome    | Nome     | Targa   |
+------------+----------+---------+
| Perezzani  | Luca     | AB222AB |
| Parazzini  | Costa    | AB888AB |
| Falanga    | Lucia    | BC333BC |
| Bellocchi  | Riccardo | BC999BC |
| Palladino  | Martina  | CD444CD |
| Diventi    | Paolo    | CD888CD |
| Rossi      | Valeria  | DE555DE |
| Bellicini  | Rosa     | DE999DE |
| Sabarese   | Gianni   | EF000EF |
| Cencetti   | Marta    | EF666EF |
| Sabbatini  | Valeria  | FF555FF |
| Conti      | Vittoria | FG111FG |
| Gregoratti | Luca     | FG777FG |
| Perezzani  | Luca     | GH222GH |
| Parazzini  | Costa    | GH888GH |
| Falanga    | Lucia    | HI333HI |
| Bellocchi  | Riccardo | HI999HI |
| Diventi    | Paolo    | II888II |
| Palladino  | Martina  | IJ444IJ |
| Bellicini  | Rosa     | JJ999JJ |
| Rossi      | Valeria  | JK555JK |
| Sabarese   | Gianni   | KK000KK |
| Cencetti   | Marta    | KL666KL |
| Conti      | Vittoria | LL111LL |
| Gregoratti | Luca     | LM777LM |
| Perezzani  | Luca     | MM222MM |
| Parazzini  | Costa    | MN888MN |
| Falanga    | Lucia    | NN333NN |
| Sabbatini  | Valeria  | NO555NO |
| Bellocchi  | Riccardo | NO999NO |
| Palladino  | Martina  | OO444OO |
| Rossi      | Valeria  | PP555PP |
| Cencetti   | Marta    | QQ666QQ |
| Diventi    | Paolo    | QR888QR |
| Gregoratti | Luca     | RR777RR |
| Bellicini  | Rosa     | RS999RS |
| Parazzini  | Costa    | SS888SS |
| Sabarese   | Gianni   | ST000ST |
| Bellocchi  | Riccardo | TT999TT |
| Conti      | Vittoria | TU111TU |
| Sabbatini  | Valeria  | TU555TU |
| Perezzani  | Luca     | UV222UV |
| Falanga    | Lucia    | VW333VW |
| Palladino  | Martina  | WX444WX |
| Diventi    | Paolo    | WX888WX |
| Rossi      | Valeria  | XY555XY |
| Bellicini  | Rosa     | XY999XY |
| Sabarese   | Gianni   | YZ000YZ |
| Cencetti   | Marta    | YZ666YZ |
| Conti      | Vittoria | ZA111ZA |
| Gregoratti | Luca     | ZA777ZA |
| Sabbatini  | Valeria  | ZZ555ZZ |
+------------+----------+---------+
52 rows in set


--------------------------------------------
QUERY 3
Targa, Cognome e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV, assicurate presso la compagnia “Sara Assicurazioni”. */

SELECT AU.Targa, P.Cognome, P.Nome
FROM (Proprietari P INNER JOIN Automobili AU ON P.CodFiscale = AU.CodFiscale)
INNER JOIN Assicurazioni A ON AU.CodAss = A.CodAss
WHERE (AU.Cilindrata > 2000 OR AU.Potenza > 120) AND A.Nome = "Sara Assicurazioni";

/*
+---------+---------+-------+
| Targa   | Cognome | Nome  |
+---------+---------+-------+
| CD888CD | Diventi | Paolo |
| II888II | Diventi | Paolo |
| QR888QR | Diventi | Paolo |
| WX888WX | Diventi | Paolo |
+---------+---------+-------+
4 rows in set


--------------------------------------------
QUERY 4
Targa e Nome del proprietario delle Auto assicurate presso la “Sara Assicurazioni” e coinvolte in sinistri nell’anno 2023.
*/

SELECT DISTINCT AU.Targa, P.Cognome, P.Nome
FROM (((Proprietari P INNER JOIN Automobili AU ON P.CodFiscale = AU.CodFiscale)
INNER JOIN Assicurazioni A ON AU.CodAss = A.CodAss)
INNER JOIN AutoCoinvolte AC ON AU.Targa = AC.Targa)
INNER JOIN Sinistri S ON AC.CodS = S.CodS
WHERE A.Nome = "Sara Assicurazioni" AND YEAR(S.Data) = 2023;

SELECT A.Targa, P.Cognome, P.Nome 
FROM (Automobili A INNER JOIN Proprietari P ON A.CodFiscale = P.CodFiscale) INNER JOIN Assicurazioni ASS ON A.CodAss = ASS.CodAss
WHERE ASS.Nome = "Sara Assicurazioni" AND A.Targa IN (
	SELECT DISTINCT AC.Targa
	FROM Sinistri S INNER JOIN Autocoinvolte AC ON S.CodS = AC.CodS
	WHERE YEAR(S.Data) = 2023);

/*
Empty set


--------------------------------------------
QUERY 5
Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate.
*/

SELECT A.Nome, A.Sede, count(*) AS NumeroAutoAssicurate
FROM Assicurazioni A INNER JOIN Automobili AU ON A.CodAss = AU.CodAss
GROUP BY A.CodAss;

/*
+--------------------------+--------------------------------------------+----------------------+
| Nome                     | Sede                                       | NumeroAutoAssicurate |
+--------------------------+--------------------------------------------+----------------------+
| Allianz                  | Via Giuseppe Mazzini, 13, 20123 Milano MI  |                    4 |
| Generali                 | Piazza Cordusio, 2, 20123 Milano MI        |                    4 |
| AXA                      | Via Larga, 7, 20122 Milano MI              |                    4 |
| Zurich                   | Via del Lauro, 8, 20121 Milano MI          |                    4 |
| Lloyd Adriatico          | Piazza degli Affari, 3, 20123 Milano MI    |                    4 |
| UnipolSai                | Corso Venezia, 56, 20121 Milano MI         |                    4 |
| Intesa Sanpaolo Assicura | Via Monte di Pietà, 8, 20121 Milano MI     |                    4 |
| Reale Mutua              | Corso Magenta, 1, 20121 Milano MI          |                    4 |
| Cattolica Assicurazioni  | Corso di Porta Romana, 68, 20122 Milano MI |                    8 |
| Sara Assicurazioni       | Via Borgonuovo, 11, 20121 Milano MI        |                    4 |
| HDI Assicurazioni        | Via Vittor Pisani, 15, 20124 Milano MI     |                    4 |
| Achmea                   | Via dei Giardini, 3, 20121 Milano MI       |                    4 |
| Aviva                    | Via Dante Alighieri, 12, 20121 Milano MI   |                    4 |
| Baloise Group            | Via Larga, 5, 20122 Milano MI              |                    4 |
| Helvetia                 | Corso di Porta Romana, 81, 20122 Milano MI |                    4 |
| Assimoco                 | Via Montenapoleone, 21, 20121 Milano MI    |                    4 |
| Unipol Gruppo            | Via Manzoni, 45, 20121 Milano MI           |                    4 |
| AON                      | Via Vincenzo Monti, 8, 20123 Milano MI     |                    4 |
| Coface                   | Via Torino, 35, 20123 Milano MI            |                    4 |
+--------------------------+--------------------------------------------+----------------------+
19 rows in set


--------------------------------------------
QUERY 6
Per ciascuna auto “Fiat”, la targa dell’auto ed il numero di sinistri in cui è stata coinvolta.
*/

SELECT AU.Targa, count(*) AS NumeroSinistri
FROM Automobili AU INNER JOIN AutoCoinvolte AC ON AU.Targa = AC.Targa
WHERE Marca = "Fiat"
GROUP BY AU.Targa;

/*
+---------+----------------+
| Targa   | NumeroSinistri |
+---------+----------------+
| AA000AA |              1 |
| IJ000IJ |              1 |
| OP000OP |              1 |
| UU000UU |              1 |
+---------+----------------+
4 rows in set


--------------------------------------------
QUERY 7
Per ciascuna auto coinvolta in più di un sinistro, la targa dell’auto, il nome dell’Assicurazione e il totale dei danni riportati.
*/

SELECT AU.Targa, A.Nome, SUM(AC.ImportoDanno) AS TotaleDanni
FROM (Automobili AU INNER JOIN Assicurazioni A ON AU.CodAss = A.CodAss)
INNER JOIN AutoCoinvolte AC ON AU.Targa = AC.Targa
GROUP BY AU.Targa
HAVING count(*) > 1;

/*
Empty set
Nessuno dei veicoli registrati nel nostro database è rimasto coinvolto in più di un sinistro. Provate ad aggiungere un record nella tabella AutoCoinvolte con
INSERT INTO AutoCoinvolte(CodS, Targa, ImportoDanno) VALUES (40, 'ZA111ZA', 1500);
e vedrete che la targa ZA111ZA comparirà nei risultati perché sono registrati due suoi coinvolgimenti in sinistri diversi.


--------------------------------------------
QUERY 8
Codice Fiscale, Cognome e Nome di coloro che possiedono più di un’auto.
*/

SELECT P.CodFiscale, P.Cognome, P.Nome, COUNT(*) AS NumeroAutoPossedute
FROM Proprietari P INNER JOIN Automobili A ON P.CodFiscale = A.CodFiscale
GROUP BY P.CodFiscale
HAVING COUNT(*) > 1;

/*
+------------------+------------+----------+---------------------+
| CodFiscale       | Cognome    | Nome     | NumeroAutoPossedute |
+------------------+------------+----------+---------------------+
| BLCCRC72R16K741A | Bellocchi  | Riccardo |                   4 |
| BLCRSS95L05D369P | Bellicini  | Rosa     |                   4 |
| CNCMRT95R26A456L | Cencetti   | Marta    |                   4 |
| CNTVTR85M04D369X | Conti      | Vittoria |                   4 |
| DRGNTS81D24K286Q | Dragoni    | Teresa   |                   4 |
| DVNTPS80R24S369L | Diventi    | Paolo    |                   4 |
| FLNCST82D27A789C | Falcone    | Stefania |                   4 |
| FLNLCN79D22A456G | Falanga    | Lucia    |                   4 |
| FRSLUC96D13M357T | Farsetti   | Luigi    |                   4 |
| GNTNLC92M16A789G | Gentile    | Luca     |                   4 |
| GRRGLS92C13M832I | Gregoratti | Luca     |                   4 |
| LVSTNT82T23A456P | Lavista    | Anita    |                   4 |
| PLMNTL89R19H147R | Palladino  | Martina  |                   4 |
| PRMMLN83S15Z369I | Parma      | Milena   |                   4 |
| PRZCST67S27K741Z | Parazzini  | Costa    |                   4 |
| PRZVLL68M20H147A | Perazzini  | Valerio  |                   4 |
| PRZZLL98M25H789T | Perezzani  | Luca     |                   4 |
| RSSVLR84L30K741M | Rossi      | Valeria  |                   4 |
| SBLVCN87T29H789Y | Sabbatini  | Valeria  |                   4 |
| SBRGNM94R08M963P | Sabarese   | Gianni   |                   4 |
+------------------+------------+----------+---------------------+
20 rows in set


--------------------------------------------
QUERY 9
Le targhe delle auto che non sono state coinvolte in sinistri dopo il 2021-05-31.
*/

SELECT A.Targa
FROM Automobili A
WHERE A.Targa NOT IN
(SELECT DISTINCT AC.Targa 
FROM AutoCoinvolte AC INNER JOIN Sinistri S ON S.CodS = AC.CodS
WHERE S.Data > '2021-05-31');

SELECT A.Targa
FROM Automobili A
WHERE NOT EXISTS
(SELECT DISTINCT * 
FROM AutoCoinvolte AC INNER JOIN Sinistri S ON S.CodS = AC.CodS
WHERE S.Data > '2021-05-31');

/*
+---------+
| Targa   |
+---------+
| DE999DE |
| JJ999JJ |
| RS999RS |
| XY999XY |
| AB222AB |
| GH222GH |
| MM222MM |
| UV222UV |
| EE444EE |
| MN444MN |
| ST444ST |
| YY444YY |
| EF666EF |
| KL666KL |
| QQ666QQ |
| YZ666YZ |
| AA000AA |
| IJ000IJ |
| OP000OP |
| UU000UU |
| AB666AB |
| GG666GG |
| OP666OP |
| UV666UV |
| FG111FG |
| LL111LL |
| TU111TU |
| ZA111ZA |
| CC222CC |
| KL222KL |
| QR222QR |
| WW222WW |
| BC777BC |
| BC999BC |
| HH777HH |
| HI999HI |
| NO999NO |
| PQ777PQ |
| TT999TT |
| VW777VW |
| CD888CD |
| II888II |
| QR888QR |
| WX888WX |
| CD444CD |
| IJ444IJ |
| OO444OO |
| WX444WX |
| BB111BB |
| JK111JK |
| PQ111PQ |
| VV111VV |
| FG777FG |
| LM777LM |
| RR777RR |
| ZA777ZA |
| BC333BC |
| HI333HI |
| NN333NN |
| VW333VW |
| AB888AB |
| GH888GH |
| MN888MN |
| SS888SS |
| EF000EF |
| KK000KK |
| ST000ST |
| YZ000YZ |
| DD333DD |
| LM333LM |
| RS333RS |
| XX333XX |
| DE555DE |
| JK555JK |
| PP555PP |
| XY555XY |
| FF555FF |
| NO555NO |
| TU555TU |
| ZZ555ZZ |
+---------+
80 rows in set


--------------------------------------------
QUERY 10
Il codice dei sinistri in cui non sono state coinvolte auto con cilindrata inferiore a 2000 cc.
*/

SELECT S.CodS
FROM Sinistri S
WHERE S.CodS NOT IN
(SELECT DISTINCT AC.CodS
FROM AutoCoinvolte AC INNER JOIN Automobili AU ON AC.Targa = AU.Targa
WHERE AU.Cilindrata < 2000);

SELECT S.CodS
FROM Sinistri S
WHERE 2000 <= ALL
(SELECT AU.Cilindrata
FROM Automobili AU INNER JOIN AutoCoinvolte AC ON AU.Targa = AC.Targa
WHERE AC.CodS = S.CodS);

/*
+------+
| CodS |
+------+
|    6 |
|    7 |
|    8 |
|    9 |
|   10 |
|   16 |
|   17 |
|   18 |
|   19 |
|   20 |
|   26 |
|   27 |
|   28 |
|   29 |
|   30 |
|   36 |
|   37 |
|   38 |
|   39 |
|   40 |
+------+
20 rows in set


--------------------------------------------
QUERY 11
La targa dell’automobile con il Cognome e il Nome del proprietario del veicolo con il maggior numero di sinistri registrati.
*/

SELECT AU.Targa, P.Cognome, P.Nome, COUNT(*) AS NumeroSinistri
FROM (Automobili AU INNER JOIN Proprietari P ON AU.CodFiscale = P.CodFiscale)
INNER JOIN AutoCoinvolte AC ON AU.Targa = AC.Targa
GROUP BY AU.Targa
HAVING COUNT(*) >= ALL
(SELECT COUNT(*) AS SinistriPerAuto
FROM AutoCoinvolte AC1
GROUP BY AC1.Targa);


CREATE VIEW NumeroSinistriPerAuto AS
SELECT Targa, count(*) AS NumeroSinistriRegistrati
FROM AutoCoinvolte
GROUP BY Targa;

SELECT AU.Targa, P.Cognome, P.Nome, COUNT(*) AS NumeroSinistri
FROM (Automobili AU INNER JOIN Proprietari P
ON AU.CodFiscale = P.CodFiscale)
INNER JOIN AutoCoinvolte AC ON AU.Targa = AC.Targa
GROUP BY AU.Targa
HAVING COUNT(*) = 
(SELECT MAX(NumeroSinistriRegistrati)
FROM NumeroSinistriPerAuto);

/*
+---------+------------+----------+----------------+
| Targa   | Cognome    | Nome     | NumeroSinistri |
+---------+------------+----------+----------------+
| AA000AA | Perazzini  | Valerio  |              1 |
| AB222AB | Perezzani  | Luca     |              1 |
| AB666AB | Falcone    | Stefania |              1 |
| AB888AB | Parazzini  | Costa    |              1 |
| BB111BB | Dragoni    | Teresa   |              1 |
| BC333BC | Falanga    | Lucia    |              1 |
| BC777BC | Gentile    | Luca     |              1 |
| BC999BC | Bellocchi  | Riccardo |              1 |
| CC222CC | Farsetti   | Luigi    |              1 |
| CD444CD | Palladino  | Martina  |              1 |
| CD888CD | Diventi    | Paolo    |              1 |
| DD333DD | Lavista    | Anita    |              1 |
| DE555DE | Rossi      | Valeria  |              1 |
| DE999DE | Bellicini  | Rosa     |              1 |
| EE444EE | Parma      | Milena   |              1 |
| EF000EF | Sabarese   | Gianni   |              1 |
| EF666EF | Cencetti   | Marta    |              1 |
| FF555FF | Sabbatini  | Valeria  |              1 |
| FG111FG | Conti      | Vittoria |              1 |
| FG777FG | Gregoratti | Luca     |              1 |
| GG666GG | Falcone    | Stefania |              1 |
| GH222GH | Perezzani  | Luca     |              1 |
| GH888GH | Parazzini  | Costa    |              1 |
| HH777HH | Gentile    | Luca     |              1 |
| HI333HI | Falanga    | Lucia    |              1 |
| HI999HI | Bellocchi  | Riccardo |              1 |
| II888II | Diventi    | Paolo    |              1 |
| IJ000IJ | Perazzini  | Valerio  |              1 |
| IJ444IJ | Palladino  | Martina  |              1 |
| JJ999JJ | Bellicini  | Rosa     |              1 |
| JK111JK | Dragoni    | Teresa   |              1 |
| JK555JK | Rossi      | Valeria  |              1 |
| KK000KK | Sabarese   | Gianni   |              1 |
| KL222KL | Farsetti   | Luigi    |              1 |
| KL666KL | Cencetti   | Marta    |              1 |
| LL111LL | Conti      | Vittoria |              1 |
| LM333LM | Lavista    | Anita    |              1 |
| LM777LM | Gregoratti | Luca     |              1 |
| MM222MM | Perezzani  | Luca     |              1 |
| MN444MN | Parma      | Milena   |              1 |
| MN888MN | Parazzini  | Costa    |              1 |
| NN333NN | Falanga    | Lucia    |              1 |
| NO555NO | Sabbatini  | Valeria  |              1 |
| NO999NO | Bellocchi  | Riccardo |              1 |
| OO444OO | Palladino  | Martina  |              1 |
| OP000OP | Perazzini  | Valerio  |              1 |
| OP666OP | Falcone    | Stefania |              1 |
| PP555PP | Rossi      | Valeria  |              1 |
| PQ111PQ | Dragoni    | Teresa   |              1 |
| PQ777PQ | Gentile    | Luca     |              1 |
| QQ666QQ | Cencetti   | Marta    |              1 |
| QR222QR | Farsetti   | Luigi    |              1 |
| QR888QR | Diventi    | Paolo    |              1 |
| RR777RR | Gregoratti | Luca     |              1 |
| RS333RS | Lavista    | Anita    |              1 |
| RS999RS | Bellicini  | Rosa     |              1 |
| SS888SS | Parazzini  | Costa    |              1 |
| ST000ST | Sabarese   | Gianni   |              1 |
| ST444ST | Parma      | Milena   |              1 |
| TT999TT | Bellocchi  | Riccardo |              1 |
| TU111TU | Conti      | Vittoria |              1 |
| TU555TU | Sabbatini  | Valeria  |              1 |
| UU000UU | Perazzini  | Valerio  |              1 |
| UV222UV | Perezzani  | Luca     |              1 |
| UV666UV | Falcone    | Stefania |              1 |
| VV111VV | Dragoni    | Teresa   |              1 |
| VW333VW | Falanga    | Lucia    |              1 |
| VW777VW | Gentile    | Luca     |              1 |
| WW222WW | Farsetti   | Luigi    |              1 |
| WX444WX | Palladino  | Martina  |              1 |
| WX888WX | Diventi    | Paolo    |              1 |
| XX333XX | Lavista    | Anita    |              1 |
| XY555XY | Rossi      | Valeria  |              1 |
| XY999XY | Bellicini  | Rosa     |              1 |
| YY444YY | Parma      | Milena   |              1 |
| YZ000YZ | Sabarese   | Gianni   |              1 |
| YZ666YZ | Cencetti   | Marta    |              1 |
| ZA111ZA | Conti      | Vittoria |              1 |
| ZA777ZA | Gregoratti | Luca     |              1 |
| ZZ555ZZ | Sabbatini  | Valeria  |              1 |
+---------+------------+----------+----------------+
80 rows in set

Ciò accade perché tutte le targhe registrate nel DB sono coinvolte in UNO e UN SOLO sinistro.
Provate ad aggiungere un record nella tabella AutoCoinvolte con
INSERT INTO AutoCoinvolte(CodS, Targa, ImportoDanno) VALUES (40, 'ZA111ZA', 1500);
e vedrete che la targa ZA111ZA comparirà nei risultati perché sono registrati due suoi coinvolgimenti in sinistri diversi.
Il risultato in tal caso sarà:

+---------+---------+----------+----------------+
| Targa   | Cognome | Nome     | NumeroSinistri |
+---------+---------+----------+----------------+
| ZA111ZA | Conti   | Vittoria |              2 |
+---------+---------+----------+----------------+
1 row in set
*/