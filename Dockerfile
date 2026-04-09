# Base: official Playwright image
FROM mcr.microsoft.com/playwright:v1.58.1-jammy

#Timezone declaration for cli
ENV TZ=Asia/Kolkata
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /workspace

# Copy entire repo into container
COPY . /workspace

# Navigate into saucedemo (where package.json lives)
WORKDIR /workspace/saucedemo

# Install dependencies
RUN npm install

# Install AWS CLI for uploading reports
RUN apt-get update && apt-get install -y awscli && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace/saucedemo/tests

# Run Playwright tests and upload report to S3
# Replace BUCKET_NAME with your actual S3 bucket name
CMD sh -c "npx playwright test --reporter=html && aws s3 cp /workspace/saucedemo/playwright-report s3://playwright-pw-sample/playwright-report-$(date +%Y%m%d%H%M%S)/ --recursive"
