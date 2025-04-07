# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all source code
COPY . .

# Expose port 3000
EXPOSE 3000

# Health check every 30s, timeout after 5s, retries 3 times
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl --fail http://localhost:3000 || exit 1

# Start the app
CMD ["node", "index.js"]
