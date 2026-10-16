## Étape 01

PLAT(**id_plat**, nom, prix)  (nouveau)

**Type du prix.** Un entier (`INTEGER`) : les montants sont en ariary, sans centimes.
Un décimal ajouterait une précision inutile et des erreurs d'arrondi possibles.

**Identifiant.** Un numéro généré automatiquement (`id_plat SERIAL`), pas le nom du plat.
Un nom peut changer (« Mi sao » devient « Mi sao poulet ») : si le nom était la clé,
il faudrait le modifier partout où il est utilisé. Avec un numéro, le plat garde
la même identité quel que soit son nom.

## Étape 02

CATEGORIE(**id_categorie**, nom)  (nouveau)

PLAT(**id_plat**, nom, prix, #id_categorie)  (modifié)

Une colonne `categorie VARCHAR(50)` dans `plat` répéterait le nom de la catégorie
sur chaque plat, sans contrôle. Exemple : si Rado écrit « Soupe » sur un plat et
« Soupes » ou « soupe » sur un autre, la base contient deux catégories différentes
pour la même chose, et le comptage par catégorie est faux. Renommer « Soupe » en
« Soupes » obligerait à modifier tous les plats concernés. Une catégorie sans plat
ne pourrait pas non plus exister. Avec une table `categorie` et une clé étrangère,
le nom est écrit une seule fois, chaque plat y renvoie, et la base refuse
une catégorie inexistante.