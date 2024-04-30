# ------------ STAGE: Install deps
FROM node:20.10-alpine3.18 as deps
LABEL stage=deps

WORKDIR /srv/deps

COPY package*.json ./
COPY yarn.lock ./
COPY tsconfig*.json ./
COPY .npmrc ./

# RUN yarn global add @nestjs/cli
# RUN npm ci
RUN yarn install --frozen-lockfile

# ------------ STAGE: Build app
FROM node:20.10-alpine3.18 AS build
LABEL stage=build

WORKDIR /srv/build

COPY --from=deps /srv/deps/node_modules ./node_modules
COPY . .

RUN rm -f .npmrc
# RUN npm run build
RUN yarn build
RUN yarn install --production && yarn cache clean

# ------------ STAGE: Execute app
FROM node:20.10-alpine3.18 as execute
LABEL stage=execute

EXPOSE 8080
WORKDIR /app

#RUN apk update && \
#    apk upgrade && \
#    apk add curl && \
#    apk add wget && \
#    apk add git && \
#    apk add python3

COPY --from=build /srv/build/node_modules ./node_modules
COPY --from=build /srv/build/dist ./dist
COPY --from=build /srv/build/.env.local ./.env.local

CMD ["node", "dist/main.js"]
