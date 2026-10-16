CREATE TABLE commande (
    id_commande   SERIAL PRIMARY KEY,
    date_commande DATE NOT NULL
);

CREATE TABLE ligne_commande (
    id_commande INTEGER NOT NULL REFERENCES commande (id_commande),
    id_plat     INTEGER NOT NULL REFERENCES plat (id_plat),
    quantite    INTEGER NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_commande, id_plat)
);

-- Données de test
INSERT INTO commande (date_commande) VALUES
('2026-10-01'),
('2026-10-02');

INSERT INTO ligne_commande (id_commande, id_plat, quantite)
SELECT c.id_commande, p.id_plat, v.quantite
FROM (VALUES
    (DATE '2026-10-01', 'Romazava',          2),
    (DATE '2026-10-01', 'Ranon''ampango',    2),
    (DATE '2026-10-02', 'Mi sao',            1),
    (DATE '2026-10-02', 'Soupe chinoise',    1),
    (DATE '2026-10-02', 'Mofo gasy (les 4)', 3)
) AS v(d, plat, quantite)
JOIN commande c ON c.date_commande = v.d
JOIN plat p     ON p.nom = v.plat;