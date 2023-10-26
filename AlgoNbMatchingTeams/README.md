# AlgoNbMatchingTeams
L'objectif de cet exercice est d'écrire un programme capable de déterminer le nombre d'équipes de freelancers qui peuvent être constituées en fonction de la taille d'équipe et du budget donnés en paramètre.

# Prérequis
Vous devez avoir Dart version 3 minimum !

# Comment Exécuter
Utilisez la commande Dart avec le nom du fichier, puis ajoutez les arguments.
Le premier argument est le nombre de personnes dans une équipe, vous pouvez mettre de 1 à 4 personnes.
Le deuxième argument est le budget de l'équipe, vous pouvez mettre un budget de 100 à 10 000.
```
dart .\AlgoNbMatchingTeams.dart [ int(TeamSize), int(Budget) ]
```
## Example du prompt de sortie
1er exemple
```
dart .\AlgoNbMatchingTeams.dart 1 560
```
```
Result : 3
[15]
Anne
560
[104]
Luc-André
560
[130]
Pierre-Gabriel
560
```

2ème exemple
```
dart .\AlgoNbMatchingTeams.dart 2 390
```
```
Result : 2
[108, 127]
Marie
205
Philippe-Émile
185
[127, 133]
Philippe-Émile
185
Pulchérie
205
```
Le tableau que vous voyez dans le prompt correspond aux ID des personnes :
```
[108, 127] ----> Id de Marie est 108 et de Philippe-Émile est 127.
Marie
205
Philippe-Émile
185
```
Cela est simplement fait pour mieux traiter les informations, mais aussi au cas où,
il y aurait une personne ayant le même nom deux fois.

## Remarque
N'oubliez pas de vous rendre dans le dossier "AlgoNbMatchingTeams".
Il se peut que le programme prenne du temps pour calculer, maximum 30 secondes pour trouver 5123 résultats.
