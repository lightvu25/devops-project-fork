# ===========================================
# Multi-Stage Dockerfile for Frontend
# ===========================================

# Stage 1: Builder
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code and build the React app
COPY . .
RUN npm run build

# Stage 2: Production
FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]