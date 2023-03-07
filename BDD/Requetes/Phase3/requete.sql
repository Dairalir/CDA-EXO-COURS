1.
SELECT entcom.numfou, entcom.numcom
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou
WHERE entcom.numfou = 9120

2.
SELECT entcom.numfou, COUNT(entcom.numcom) AS nb_cmd
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou
GROUP BY numfou

3.
SELECT COUNT(entcom.numfou) AS nb_fou, COUNT(entcom.numcom) AS nb_cmd
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou

4.
SELECT codart, libart, stkphy, stkale, qteann
FROM produit
WHERE stkphy <= stkale AND qteann < 1000

5.
SELECT posfou, nomfou
FROM fournis
WHERE SUBSTRING(posfou,1,2) = '75' OR SUBSTRING(posfou,1,2) = '78' OR SUBSTRING(posfou,1,2) = '92' OR SUBSTRING(posfou,1,2) = '77'
ORDER BY posfou DESC, nomfou ASC

6.
SELECT numcom, datcom
FROM entcom
WHERE datcom LIKE '%-03-%' OR datcom LIKE '%-04-%'

7.
SELECT numcom, obscom
FROM entcom
WHERE obscom != ''

8.
SELECT numcom, SUM(qtecde) as total_cmd
FROM ligcom
GROUP BY numcom
ORDER BY total_cmd DESC

9.
SELECT numcom, SUM(qtecde*priuni) as total_cde
FROM ligcom
GROUP BY numcom
HAVING total_cde > 10000 AND SUM(qtecde) >= 1000

10.
SELECT nomfou, numcom, datcom
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou
GROUP BY numcom

11.
SELECT produit.codart, obscom, entcom.numcom, SUM(qtecde*priuni) AS sous_total
FROM produit
JOIN ligcom ON produit.codart = ligcom.codart
JOIN entcom ON ligcom.numcom = entcom.numcom
WHERE obscom LIKE '%urgent%'
GROUP BY produit.codart

12.
SELECT nomfou
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou
JOIN ligcom ON entcom.numcom = ligcom.numcom
WHERE qteliv >= 1
GROUP BY nomfou

SELECT nomfou
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou
JOIN ligcom ON entcom.numcom = ligcom.numcom
WHERE qteliv != 0
GROUP BY nomfou

13.
SELECT numcom, datcom
FROM entcom
JOIN fournis ON entcom.numfou = fournis.numfou
WHERE numcom = '70210'
GROUP BY nomfou

SELECT numcom, datcom
FROM entcom
JOIN fournis ON entcom.numfou = fournis.numfou
WHERE numcom LIKE '70210'
GROUP BY nomfou

/* A TEST */
14.
SELECT libart, prix1
FROM produit
JOIN vente ON produit.codart = vente.codart
WHERE priuni < prix1

15.
SELECT nomfou, codart
FROM produit
JOIN vente ON vente.codart = produit.codart
JOIN fournis ON fournis.numfou = vente.numfou
WHERE stkphy <= (stkale * 1.5)
ORDER BY nomfou DESC, codart DESC

16.
SELECT nomfou, codart
FROM produit
JOIN vente ON vente.codart = produit.codart
JOIN fournis ON fournis.numfou = vente.numfou
WHERE stkphy <= (stkale * 1.5) AND delliv <= 30
ORDER BY nomfou DESC, codart DESC

17.
SELECT nomfou, codart, SUM(stkphy)
FROM produit
JOIN vente ON vente.codart = produit.codart
JOIN fournis ON fournis.numfou = vente.numfou
WHERE stkphy <= (stkale * 1.5) AND delliv <= 30
GROUP BY nomfou
ORDER BY nomfou DESC, codart DESC

18.
SELECT codart, libart
FROM produit
JOIN ligcom ON produit.codart = ligcom.codart
where 100*qtecde/qteann < qteann*0.9 and derliv LIKE'%-12-%'
group by libart

19
SELECT nomfou, SUM(qtecde * priuni * 0.2) AS CA
FROM ligcom
JOIN entcom ON entcom.numcom = ligcom.numcom
JOIN fournis ON entcom.numfou = fourni.numfou
WHERE datcom LIKE '__93-%-%'
GROUP BY nomfou