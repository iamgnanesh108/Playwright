# Base: official Playwright image
FROM mcr.microsoft.com/playwright:v1.58.1-jammy

# Set working directory
WORKDIR /workspace

COPY . /workspace

WORKDIR /workspace/saucedemo

RUN npm install && apt-get update && npm install -g serve

WORKDIR /workspace/saucedemo/tests

RUN npx playwright test --reporter=html && serve -s playwright-report -l 8080
