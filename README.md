# SIT737 – 5.1P: Dockerized Node.js App - One Bash Run

# Step 1: Create and move to project directory
cd F:\SIT737
mkdir sit737-2025-prac5p
cd sit737-2025-prac5p

# Step 2: Initialize Node.js project
npm init -y

# Step 3: Install Express.js
npm install express

# Step 4: Create index.js file
echo "const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Dockerized Node.js App!');
});

app.listen(port, () => {
  console.log(\`App listening at http://localhost:\${port}\`);
});" > index.js

# Step 5: Create Dockerfile
echo "FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
 CMD curl -f http://localhost:3000/ || exit 1

CMD [\"node\", \"index.js\"]" > Dockerfile

# Step 6: Build Docker image
docker build -t sit737-prac5p-app .

# Step 7: Run the Docker container
docker run -p 3000:3000 sit737-prac5p-app

# Step 8: Check output in browser
# Open http://localhost:3000
# You should see: "Hello from Dockerized Node.js App!"

# Step 9: Check Docker health status
docker ps
# Look for: STATUS = (healthy)


