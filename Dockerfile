# Use official Node.js 18 image (required for quick.db compatibility)
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Set environment variable for production
ENV NODE_ENV=production

# Start the bot
CMD ["npm", "start"]
