# Use a imagem oficial do Node.js como base, com uma versão compatível com Next.js
FROM node:18-alpine

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo package.json e package-lock.json para o diretório de trabalho
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o restante do código do projeto para o diretório de trabalho
COPY . .

# Compile o projeto Next.js
RUN npm run build

# Exponha a porta que o Next.js usará
EXPOSE 3000

# Defina a variável de ambiente NODE_ENV como produção
ENV NODE_ENV=production

# Comando para iniciar o servidor Next.js
CMD ["npm", "start"]