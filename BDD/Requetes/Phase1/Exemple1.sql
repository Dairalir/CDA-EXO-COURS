1.
SELECT * 
FROM employe

2.
SELECT nodept, nom, noregion 
FROM dept

3.
SELECT nom, dateemb, nosup, nodep, salaire 
FROM employe

4.
SELECT nom, prenom, titre 
FROM employe

5.
SELECT DISTINCT titre 
FROM employe

6.
SELECT nom, noemp, nodep 
FROM employe
WHERE titre = 'secrétaire'

7.
SELECT nom, nodept 
FROM dept
WHERE nodep > 40

8.
SELECT nom, prenom 
FROM employe
WHERE nom < prenom

9.
SELECT nom, salaire, nodep 
FROM employe
WHERE titre = 'représentant' AND nodep = 35 AND salaire > 20000

10.
SELECT nom, salaire 
FROM employe
WHERE titre = 'représentant' OR titre = 'président'

11.
SELECT nom, titre, nodep, salaire 
FROM employe
WHERE titre = 'représentant' AND nodep = 34 OR titre = 'secrétaire' AND nodep = 34

12.
SELECT nom, titre, nodep, salaire 
FROM employe
WHERE titre = 'représentant' OR nodep = 34 AND titre = 'secrétaire'

13.
SELECT nom, salaire 
FROM employe
WHERE salaire < 30000 AND salaire > 20000

15.
SELECT nom 
FROM employe
WHERE nom LIKE 'h%'

16.
SELECT nom 
FROM employe
WHERE nom LIKE '%n'

17.
SELECT nom 
FROM employe
WHERE nom LIKE '__u%'

18.
SELECT salaire, nom 
FROM employe
WHERE nodep = 41
ORDER BY salaire ASC

19.
SELECT salaire, nom FROM employe
WHERE nodep = 41
ORDER BY salaire DESC

20.
SELECT titre, salaire, nom FROM employe
ORDER BY titre ASC, salaire DESC

21.
SELECT tauxcom, salaire, nom FROM employe
ORDER BY tauxcom ASC

22.
SELECT nom, salaire, tauxcom, titre FROM employe
WHERE tauxcom IS NULL

23.
SELECT nom, salaire, tauxcom, titre FROM employe
WHERE tauxcom IS NOT NULL

24.
SELECT nom, salaire, tauxcom, titre FROM employe
WHERE tauxcom < 15

25.
SELECT nom, salaire, tauxcom, titre FROM employe
WHERE tauxcom > 15

26.
SELECT nom, salaire, tauxcom, (salaire*tauxcom) AS commission FROM employe
WHERE tauxcom IS NOT NULL

27.
SELECT nom, salaire, tauxcom, (salaire*tauxcom) AS commission FROM employe
WHERE tauxcom IS NOT NULL
ORDER BY commission ASC

28.
SELECT CONCAT(nom, prenom) AS Employé FROM employe

29.
SELECT SUBSTRING(nom, 1,5) FROM employe

30.
SELECT nom, LOCATE('r', nom) FROM employe

31.
SELECT nom, UPPER(nom), LOWER(nom) FROM employe
WHERE nom = 'vrante'

32.
SELECT nom, LENGTH(nom) FROM employe