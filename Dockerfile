# Use Node.js LTS version
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Install dev dependencies for building TS
RUN npm install --omit=dev

# Copy the rest of the source code
COPY . .

# Build TypeScript
RUN npm run build

# Expose the port your app uses
EXPOSE 5001

# Set environment variable for port
ENV PORT=5001

# Start the server
CMD ["node", "dist/server.js"]
