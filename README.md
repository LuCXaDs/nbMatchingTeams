# NbMatchingTeams
L'objectif de cet exercice est d'écrire un programme capable de déterminer le nombre d'équipes de freelancers qui peuvent être constituées en fonction de la taille d'équipe et du budget donnés en paramètre.

<center>
  <img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/c5aa4533-71d9-4127-8d65-7e471a42164c" width="410" height="490" />
</center>

# Exécuter directement dans un prompt
Pour executer l'agorithme sans passer par flutter <a href="https://github.com/LuCXaDs/nbMatchingTeams/tree/main/AlgoNbMatchingTeams">cliquer ici<a/>


# Exécuter flutter dans docker
## Prérequis
Vous devez avoir installer Docker ! <a href="https://docs.docker.com/engine/install/">Voir la Docs</a>
## Construction de l'image Docker
Utilisez docker pour construire l'image du conteneur.
```
docker compose -f docker-compose.yml build
```

## Après la réussite de la construction de l'image
Exécutez l'image Docker sur le port de base, qui est 1200. Vous pouvez le modifier dans le docker-compose.
```
docker compose -f docker-compose.yml up -d
```

Rendez-vous sur http://localhost:1200/

## Supprimer le Container et l'image
Dans un premier temps, cela va arrêter le conteneur en cours, puis le supprimer, ainsi que le réseau associé.
```
docker compose -f docker-compose.yml down
```
Suppression de l'image
```
docker rmi nb-matching-teams
```
## Remarques
Si, après avoir supprimé correctement l'application comme ci-dessus et que vous pouvez toujours accéder au site lorsque vous utilisez le navigateur "Brave", c'est parce que le code est compilé en JavaScript et que Brave le conserve dans son cache. De ce fait, il semble que votre application tourne en continu, mais si vous videz le cache, vous n'aurez normalement plus de soucis lorsque vous accéderez à "http://localhost:1200/". :)

![image](https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/69e89e27-f9c4-440c-89e3-6ca184a94a94)


# Images du Site

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/81458f01-483e-4bd4-b676-eb88ff7a3865" width="410" height="490" />

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/2dba78f0-6cd3-480e-811d-adb96055997a" width="410" height="490" />

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/79a48eb6-011f-4e7b-92e5-dd2e190eb975" width="410" height="490" />

<img src="https://github.com/LuCXaDs/nbMatchingTeams/assets/69203865/fe5b2164-bda3-4c26-b55d-6ae4f3aea3af" width="410" height="490" />

