1.
SELECT COUNT(noemp) as nbemploye, titre 
FROM employe
GROUP BY titre

2.
SELECT AVG(salaire) AS moyenne_salaire, SUM(salaire) AS somme_des_salaire 
FROM employe
GROUP BY nodep

3.
SELECT nodep , COUNT(noemp) AS nbemploye 
FROM employe
GROUP BY nodep
HAVING nbemploye >= 3

4.
SELECT SUBSTRING(nom,1,1) AS initiale  
FROM employe
GROUP BY initiale
HAVING COUNT(initiale) >=3

5.
SELECT MAX(salaire) AS salaire_max, MIN(salaire) AS salaire_min, MAX(salaire)-MIN(salaire) AS diff 
FROM employe

6.
SELECT COUNT(DISTINCT titre) 
FROM employe

7.
SELECT titre ,COUNT(noemp) as nbemploye 
FROM employe
GROUP BY titre

8.
SELECT dept.nom, COUNT(employe.noemp) as nbemploye
FROM dept
JOIN employe ON dept.nodept = employe.nodep
GROUP BY dept.nom

9.
SELECT titre, AVG(salaire) AS moy_salaire 
FROM employe
GROUP BY titre
HAVING moy_salaire > (
    SELECT AVG(salaire) 
    FROM employe
    WHERE titre = 'représentant')

10.
SELECT COUNT(salaire) AS nb_salaire, COUNT(tauxcom) AS nb_tauxCom
FROM employe
WHERE tauxcom IS NOT NULL