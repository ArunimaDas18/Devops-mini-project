# FROM node:20-alpine
# WORKDIR /app
# COPY devops-app/package*.json .
# RUN npm install
# COPY devops-app/. .
# ENV NODE_ENV=production
# EXPOSE 8080
# CMD [ "node","index.js" ]



# -----------------------------
# Stage 1: Build Stage
# -----------------------------
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy only package files and install dependencies
COPY devops-app/package*.json ./
RUN npm ci --omit=production

# Copy application code
COPY devops-app/. .

# -----------------------------
# Stage 2: Runtime Stage
# -----------------------------
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy built app from builder stage
COPY --from=builder /app /app

# Set environment
ENV NODE_ENV=production

# Expose port
EXPOSE 8080

# Start app
CMD ["node", "index.js"]
