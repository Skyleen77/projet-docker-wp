# Containerisation de cette Application

Ce projet est une application WordPress containerisée. Vous trouverez le code source sur cette URL : [https://github.com/tasmer/exemple-wp-docker](https://github.com/tasmer/exemple-wp-docker).

## Configuration des Services

Nous avons besoin de 4 services orchestrés avec un fichier `docker-compose.yml` :

1. Un service avec **MariaDB 10.3** pour la gestion de notre base de données.
2. Un service avec **Adminer** pour nous connecter sur la base de données.
3. Un service qui va utiliser notre **Dockerfile**.
4. Un service pour exécuter **Nginx**.

## Installation du Projet

1. Clonez le dépôt sur votre machine locale.
2. Exécutez la commande `docker-compose up --build` pour construire et démarrer les conteneurs.
3. Exécutez la commande suivante pour installer les dépendances du projet avec Composer :

```bash
docker-compose exec wp composer install
```

Copiez le fichier .env.example vers un nouveau fichier .env et configurez les accès à la base de données :

```bash
docker-compose exec wp cp .env.example .env
```

Éditez le fichier .env avec les informations de la base de données :

```bash
DB_NAME=wp
DB_USER=root
DB_PASSWORD=R00t
DB_HOST=mariadb
WP_HOME=http://localhost
```

Accédez à http://localhost dans votre navigateur pour voir l'application WordPress en action.

## Commandes Utiles

```bash
docker-compose up --build : Construit et démarre les conteneurs.
docker-compose down : Arrête et supprime les conteneurs.
docker-compose exec wp composer install : Installe les dépendances du projet avec Composer.
```

## Note

Si vous souhaitez installer la ligne de commande WordPress (WP-CLI), suivez les instructions fournies ici et modifiez le Dockerfile en conséquence. Cette étape est facultative mais peut vous rapporter des points supplémentaires.
