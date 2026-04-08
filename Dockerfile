# Base: official Playwright image
FROM mcr.microsoft.com/playwright:v1.58.1-jammy

# Set working directory
WORKDIR /workspace

COPY . /workspace/

# Navigate into your Playwright project (adjust path!)
WORKDIR /workspace/Playwright/saucedemo/tests

# Install required tools
RUN apt-get update && \
    npm install -g serve

# Install dependencies
RUN npm install

# Run tests and serve report automatically
CMD npx playwright test --reporter=html && \
    serve -s playwright-report -l 8080
