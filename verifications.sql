-- Étape 01 : plats du plus cher au moins cher
SELECT id_plat, nom, prix
FROM plat
ORDER BY prix DESC;

-- Étape 02 : nombre de plats par catégorie, y compris les catégories vides
SELECT c.nom AS categorie, COUNT(p.id_plat) AS nb_plats
FROM categorie c
LEFT JOIN plat p ON p.id_categorie = c.id_categorie
GROUP BY c.id_categorie, c.nom
ORDER BY c.id_categorie;