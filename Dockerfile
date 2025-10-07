FROM node:22-bookworm-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
EXPOSE 3000
ENV NODE_ENV=development
CMD ["npm", "run", "dev"]