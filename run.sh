#!/bin/bash

# Define variables
REPO_URL="https://github.com/rpidanny/chatgpt-browser-api-proxy.git"
REPO_DIR="/Volumes/macOS-extravol/pythagora/gpt-pilot/workspace/chatgpt-browser-api-proxy"
TOKEN="eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1UaEVOVUpHTkVNMVFURTRNMEZCTWpkQ05UZzVNRFUxUlRVd1FVSkRNRU13UmtGRVFrRXpSZyJ9.eyJodHRwczovL2FwaS5vcGVuYWkuY29tL3Byb2ZpbGUiOnsiZW1haWwiOiJnZW5odWJ0QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlfSwiaHR0cHM6Ly9hcGkub3BlbmFpLmNvbS9hdXRoIjp7InBvaWQiOiJvcmctaHJId3Z4SkJDb016Z0Zkdjg1WGhsRUJFIiwidXNlcl9pZCI6InVzZXItU3VhcnJDWndrbFZIOElHN1FKQU50NlJ2In0sImh0dHBzOi8vYXBpLm9wZW5haS5jb20vbWZhIjp7InJlcXVpcmVkIjoieWVzIn0sImlzcyI6Imh0dHBzOi8vYXV0aDAub3BlbmFpLmNvbS8iLCJzdWIiOiJhdXRoMHw2NWRhYmU2NzcyZDViNDNjMGU4NDcwN2MiLCJhdWQiOlsiaHR0cHM6Ly9hcGkub3BlbmFpLmNvbS92MSIsImh0dHBzOi8vb3BlbmFpLm9wZW5haS5hdXRoMGFwcC5jb20vdXNlcmluZm8iXSwiaWF0IjoxNzEwNDA2OTU2LCJleHAiOjE3MTEyNzA5NTYsImF6cCI6IlRkSkljYmUxNldvVEh0Tjk1bnl5d2g1RTR5T282SXRHIiwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBlbWFpbCBtb2RlbC5yZWFkIG1vZGVsLnJlcXVlc3Qgb3JnYW5pemF0aW9uLnJlYWQgb3JnYW5pemF0aW9uLndyaXRlIG9mZmxpbmVfYWNjZXNzIn0.tVlTRmpGSKevYLFwaXdXB6_UFkJMg2bT4jn0-0uM1UENCojl0RPURZgqEBcA7EmIK5hQBFk30MaV2si7CTbE1R-rK7ONrpSr0SrhY6l-JkQhBJ6Itx79CH7Yly_ww0HlGkxuqxCVZX5QCylQmyPJ8p93ilzCptiBYAVuUdi01k0BayoCsaWw4OfS7tHRV2b3NSZdhnAqXbb8NBbGPH3DiyfIDMx4RnnV9DAZ_rfu6ZINQ_eDX8sIHmhOqTI404eltxIPQcDhbuvakeLpXxb7LYRj1T5BoOTve1c2eXd_KfL6UQX2MQj4DOXl2_tfn2EflMJWg4xKVqR6KkHaiy5Q4Q" # Replace this with your actual token

# Check if Node.js and Yarn are installed
if ! command -v node &> /dev/null
then
    echo "Node.js could not be found, please install it first."
    exit 1
fi

if ! command -v yarn &> /dev/null
then
    echo "Yarn could not be found, please install it first."
    exit 1
fi

# Clone the repository
if [ ! -d "$REPO_DIR" ]; then
    echo "Cloning the ChatGPT Browser API Proxy repository..."
    git clone $REPO_URL $REPO_DIR
else
    echo "Repository directory already exists."
fi

# Navigate to the project directory
cd $REPO_DIR

# Install dependencies
echo "Installing dependencies..."
yarn install

# Configure .env file
echo "Configuring .env file..."
echo "OPENAI_ACCESS_TOKEN=$TOKEN" > .env

# Start the proxy server
echo "Starting the proxy server in development mode..."
yarn start:dev

echo "ChatGPT Browser API Proxy is running..."
