FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy files
COPY package*.json ./
RUN npm install

COPY . .

# Build the app
RUN npm run build

# Expose port
EXPOSE 3000

# Start the app with env param
CMD ["node", "dist/main.js"]
