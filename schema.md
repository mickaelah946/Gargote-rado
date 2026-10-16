## Étape 01

PLAT(**id_plat**, nom, prix)  (nouveau)

## Étape 01

**Type du prix.** Un entier (`INTEGER`) : les montants sont en ariary, sans centimes.
Un décimal ajouterait une précision inutile et des erreurs d'arrondi possibles.

**Identifiant.** Un numéro généré automatiquement (`id_plat SERIAL`), pas le nom du plat.
Un nom peut changer (« Mi sao » devient « Mi sao poulet ») : si le nom était la clé,
il faudrait le modifier partout où il est utilisé. Avec un numéro, le plat garde
la même identité quel que soit son nom.