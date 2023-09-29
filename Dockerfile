# Build stage
FROM node:lts as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Production stage
FROM node:lts
WORKDIR /app
COPY --from=build /app ./
RUN npm install -g serve
EXPOSE 3000
CMD ["npm", "start"]
