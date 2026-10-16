-- 1. Nouvelle table
CREATE TABLE categorie (
    id_categorie SERIAL PRIMARY KEY,
    nom          VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO categorie (nom) VALUES
('Plat malagasy'),
('Plat chinois'),
('Soupe'),
('Dessert et goûter'),
('Boisson'),
('Entrée');   -- donnée de test : catégorie volontairement sans plat

-- 2. Colonne ajoutée d'abord facultative (la table contient déjà des lignes)
ALTER TABLE plat ADD COLUMN id_categorie INTEGER;

-- 3. Remplir les plats existants
UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Plat malagasy')
WHERE nom IN ('Romazava', 'Ravitoto sy henakisoa', 'Akoho sy voanio');

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Plat chinois')
WHERE nom = 'Mi sao';

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Soupe')
WHERE nom = 'Soupe chinoise';

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Dessert et goûter')
WHERE nom = 'Mofo gasy (les 4)';

UPDATE plat SET id_categorie = (SELECT id_categorie FROM categorie WHERE nom = 'Boisson')
WHERE nom = 'Ranon''ampango';

-- 4. Rendre obligatoire, puis poser la clé étrangère
ALTER TABLE plat ALTER COLUMN id_categorie SET NOT NULL;

ALTER TABLE plat
    ADD CONSTRAINT fk_plat_categorie
    FOREIGN KEY (id_categorie) REFERENCES categorie (id_categorie);