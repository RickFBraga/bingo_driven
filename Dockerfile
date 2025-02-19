# busca imagem base do node
FROM node:alpine

# usa essa pasta como diretório de trabalho (tipo um CD)
WORKDIR /usr/src

RUN apk add openssl3
# copia o diretório atual para a workdir definida acima
COPY . .

# "expõe" a porta 5000
EXPOSE 5000

# baixa as dependências
RUN npm i

# faz a compilação do TS para JSz
RUN npx prisma generate
RUN npm run build

# só roda quando a imagem se torna um container em execução (comando inicial)
CMD ["npm", "start"]