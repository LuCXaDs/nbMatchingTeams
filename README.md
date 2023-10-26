# AlgoNbMatchingTeams
L'objectif de cet exercice est d'écrire un programme capable de déterminer le nombre d'équipes de freelancers qui peuvent être constituées en fonction de la taille d'équipe et du budget donnés en paramètre.

# Exécuter directement dans un prompt
Pour executer l'agorithme sans passer par flutter <a href="https://github.com/LuCXaDs/nbMatchingTeams/tree/main/AlgoNbMatchingTeams">cliquer ici<a/>
# Exécuter avec Flutter et Docker
## Construction de l'image Docker
Utilisez docker pour construire l'image du conteneur.
```
docker build -t nb-matching-teams .
```
Si vous rencontrez des problèmes avec le cache, vous pouvez le nettoyer en utilisant la commande suivante.
```
docker build --no-cache -t nb-matching-teams .
```

## Après la réussite de la construction de l'image
Exécutez l'image Docker en utilisant le port localhost 1200. Vous pouvez le changer en un autre port en le remplaçant.
```
docker run -d -p 1200:80 --name matching nb-matching-teams
```

Rendez-vous sur http://localhost:1200/"

# Images du Site

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/c5aa4533-71d9-4127-8d65-7e471a42164c" width="500" height="600" />

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/2dba78f0-6cd3-480e-811d-adb96055997a" width="500" height="600" />

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/79a48eb6-011f-4e7b-92e5-dd2e190eb975" width="500" height="600" />

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/fe5b2164-bda3-4c26-b55d-6ae4f3aea3af" width="500" height="600" />

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/81458f01-483e-4bd4-b676-eb88ff7a3865" width="500" height="600" />
