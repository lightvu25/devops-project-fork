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
FROM node:18-alpine

WORKDIR /app

# Install serve globally to serve static files
RUN npm install -g serve

# Copy only the build folder from builder stage
COPY --from=builder /app/build ./build

# Expose port 3000
EXPOSE 3000

# Serve the static files
CMD ["serve", "-s", "build", "-l", "3000"]