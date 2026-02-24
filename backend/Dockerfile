# ===========================================
# Multi-Stage Dockerfile for Backend
# ===========================================

# Stage 1: Builder
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files and install ALL dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Stage 2: Production
FROM node:18-alpine

WORKDIR /app

# Copy package files from builder
COPY --from=builder /app/package*.json ./

# Install ONLY production dependencies
RUN npm install --only=production

# Copy application code from builder
COPY --from=builder /app/server.js ./

# Expose the backend port
EXPOSE 8080

# Start the application
CMD ["node", "server.js"]
