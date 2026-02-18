# Image officielle Node
FROM node:25-alpine
 
# Dossier de travail
WORKDIR /app
 
# Copier package.json
COPY package*.json ./
 
# Installer dépendances
RUN npm install
 
# Copier le reste du code
COPY . .
 
# Exposer le port
EXPOSE 3000
 
# Lancer l'application
CMD ["node", "index.js"]