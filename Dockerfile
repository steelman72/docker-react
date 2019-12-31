## Phase 1
# Image Base
FROM node:alpine AS builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN ["npm", "run", "build"]

# /app/build has the stuff needed for phase-2

## Phase 2
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


