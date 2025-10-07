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
    - Dans ce `settings.json`, assurez-vous d'avoir en plus des configs par defaut les configs suivantes :
        ```json
        {
        // Sauvegarde automatique après un court délai
        "files.autoSave": "afterDelay",

        // Prettier comme formateur par défaut pour plusieurs langages
        "[javascript]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode",
            "editor.formatOnSave": true
        },
        "[typescript]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode",
            "editor.formatOnSave": true
        },
        "[json]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode",
            "editor.formatOnSave": true
        },
        "[yaml]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode",
            "editor.formatOnSave": true
        },
        "[graphql]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode",
            "editor.formatOnSave": true
        },
        "[markdown]": {
            "editor.defaultFormatter": "esbenp.prettier-vscode",
            "editor.formatOnSave": true
        },

        // ESLint activé
        "eslint.enable": true,
        "eslint.format.enable": true,
        "eslint.validate": [
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json"
        ],

        // Correction automatique ESLint à chaque sauvegarde
        "editor.codeActionsOnSave": {
            "source.fixAll": true,
            "source.fixAll.eslint": true
        },

        // Prettier doit respecter la config du projet
        "prettier.requireConfig": true
        }
        ```

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
    docker compose exec frontend cd /app && npm install # "frontend" est le nom du service déclaré dans docker-compose.yml
    ```
<br/>

## Comment ont été mis en place `ESLint` et `Prettier` (Etape à ne plus suivre)
- **`ESLint`**

```bash
npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin 
```

```js
// eslint.config.mjs
import { dirname } from "path";
import { fileURLToPath } from "url";
import { FlatCompat } from "@eslint/eslintrc";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const compat = new FlatCompat({
  baseDirectory: __dirname,
});

const eslintConfig = [
  ...compat.extends(
    "next/core-web-vitals",
    "next/typescript",
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:@typescript-eslint/recommended-requiring-type-checking",
    "plugin:prettier/recommended"
  ),

  {
    files: ["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx"],

    languageOptions: {
      ecmaVersion: 2020,
      sourceType: "module",
      parserOptions: {
        project: "./tsconfig.json",
      },
    },

    plugins: {
      "@typescript-eslint": require("@typescript-eslint/eslint-plugin"),
    },

    rules: {
      "@typescript-eslint/explicit-function-return-type": "warn",
      "@typescript-eslint/no-explicit-any": "warn",
      "@typescript-eslint/no-unused-vars": [
        "error",
        { argsIgnorePattern: "^_" },
      ],
    },
  },

  {
    ignores: [
      "node_modules/**",
      ".next/**",
      "out/**",
      "build/**",
      "next-env.d.ts",
    ],
  },
];

export default eslintConfig;
```

```json
// package.json
{
  "scripts": {
    "dev": "next dev --turbopack",
    "build": "next build --turbopack",
    "start": "next start",
    "lint": "eslint . --ext .ts,.tsx,.js,.jsx",
    "lint:eslint": "eslint src --ext .js,.jsx,.ts,.tsx",
    "lint:eslint:check": "eslint src --ext .js,.jsx,.ts,.tsx --max-warnings=0",
    "lint:prettier": "prettier --write \"src/**/*.{js,jsx,ts,tsx,json,css,md}\"",
    "lint:prettier:check": "prettier --check \"src/**/*.{js,jsx,ts,tsx,json,css,md}\"",
    "type-check": "tsc --noEmit"
  }
}
```

- **`Prettier`**
```bash
npm install --save-dev prettier eslint-config-prettier eslint-plugin-prettier 
```

```json
// .prettierrc
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "printWidth": 100,
  "trailingComma": "es5",
  "bracketSpacing": true,
  "arrowParens": "avoid"
}
```

```
// .prettierignore
node_modules
build
dist
.next
.vscode
```