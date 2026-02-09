FROM node:20-alpine
WORKDIR /app
COPY devops-app/package*.json .
RUN npm install
COPY devops-app/. .
ENV NODE_ENV=production
EXPOSE 8080
CMD [ "node","index.js" ]

##______ multistage____

#Stage 1 : build stage
#  FROM node:20-alpine AS builder
#  WORKDIR /app
#  COPY package*.json ./
#  RUN npm ci --omit=dev
#  COPY index.js

 #Stage 2: Runtime

#  FROM node:20-alpine
#  WORKDIR /app
#  COPY  --from=builder /app /app 
#  EXPOSE 8080
#  CMD [ "node", "index.js" ]


#