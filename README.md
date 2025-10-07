Ceci est un projet [Next.js](https://nextjs.org) initialisé avec [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Techos déjà en place
- Next.js `App Router`
- `TypeScript`
- `Tailwindcss`
- `ESLint` et `Prettier`

## Prérequis
- [Node.js](https://nodejs.org/en/download) avec `npm`
- [Docker](https://docs.docker.com/engine/install/)

## Prise en main
```bash
git clone https://github.com/Rojonantenaina-RAK/Template-DevFlow-NextJS

git remote set-url origin #<url_de_ton_nouveau_repo_github_ou_gitlab_que_tu_crées>

cd Template-DevFlow-NextJS

# Dans le fichier package.json, remplace la valeur "miray-d-frontend" du champ "name" par le nom de ton projet, par exemple : { "name": "<nom_de_ton_projet>" }

npm install
```

## Recommandation de collaboration entre Devs
- Utiliser globalement **`ESLint`** et **`Prettier`** dans **VsCode**.
    - `ESLint` : détecte et signale les erreurs de code et les mauvaises pratiques en JavaScript/TypeScript pour garantir la qualité et la sécurité.
    - `Prettier` : formate automatiquement le code pour assurer un style uniforme.

- Comment ? En installant les <u>extensions VsCode</u> suivantes :
    - `ESLint` (officiel de Microsoft)
    - `Prettier - Code formatter`
    - `Error Lens` (Affiche les erreurs directement dans le code)

- Puis, bien configurer pour qu'ils formattent les codes à chaque sauvegarde.
    - `Ctrl` + `Shift` + `P`
    - `>Preferences: Open User Settings (JSON)`
## Lancement - DevFlow
- Lance ton frontend dans :
    ```bash
    docker compose up -d
    ```
- Ouvre [http://localhost:3000](http://localhost:3000) pour voir le resultat. **Tu peux continuer à développer tes fonctionnalitées, les changements s'appliqueront à volonté.** 🎉
<br/>
<br/>
<br/>
- Pour arrêter ton frontend :
    ```
    docker compose down
    ```
<br/>

- ⚠️<u>**NB**</u> : Tu modifies ton code, les changements s'appliqueront à volonté, 🔴mais si tu installes une ou plusieurs nouvelles dépendances dans ton projet, il est obligatoire de lancer la commande
    ```bash
    docker compose exec frontend npm install # "frontend" est le nom du service déclaré dans docker-compose.yml
    ```