# Use official Node.js LTS Alpine image for a small footprint
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package*.json ./

# Install production dependencies only
RUN npm install --omit=dev

# Copy the rest of the application source code
COPY . .

# Expose the port the app listens on
EXPOSE 3003

# Start the application
CMD ["node", "app.js"]
