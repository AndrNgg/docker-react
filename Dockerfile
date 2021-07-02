###
# Build Phase
###

# Base
FROM node:alpine AS builder
WORKDIR  '/app'

# Dependency
COPY package.json .
RUN npm install
COPY . .

# Start-up command
RUN npm run build
########################

#####
# run phase
#####
# Base
FROM nginx
EXPOSE 80

# Dependency | from flag indicates take from the build phase
COPY --from=0 /app/build /usr/share/nginx/html


