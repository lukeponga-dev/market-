#!/bin/bash

# Ensure the script stops on first error
set -e

# Create directories if they don't exist
mkdir -p data
mkdir -p frontend

# Check if .env file exists, create if not
if [ ! -f .env ]; then
  echo "Creating default .env file..."
  cp .env.example .env || echo "# Server configuration
PORT=3000
NODE_ENV=development

# Session secret (generate a strong random string for production)
SESSION_SECRET=dev_session_secret_replace_in_production

# Database configuration
DB_PATH=./data/marketplace.db

# Tor Hidden Service (configured separately in torrc)
TOR_ENABLED=false
ONION_ADDRESS=example.onion

# Cryptocurrency settings
# Bitcoin configuration
BITCOIN_ENABLED=true
BITCOIN_NODE_URL=http://localhost:8332
BITCOIN_RPC_USER=dev_user
BITCOIN_RPC_PASSWORD=dev_password

# Monero configuration
MONERO_ENABLED=true
MONERO_WALLET_RPC_URL=http://localhost:18082
MONERO_WALLET_RPC_USER=dev_user
MONERO_WALLET_RPC_PASSWORD=dev_password

# Security settings
ADMIN_USERNAME=admin
# Default password is 'admin' (insecure, change in production)
ADMIN_PASSWORD_HASH=\$2b\$10\$rBUiZ3SLJN1umU7X5xSJcunFJk/cIcAYGEYdEA7wgU4gKc3sL1wTu
ENABLE_2FA=false
CSP_ENABLED=true

# Content settings
SITE_TITLE=\"Dark Market\"
SITE_DESCRIPTION=\"A privacy-focused marketplace with cryptocurrency support\"

# Marketplace settings
COMMISSION_RATE=2.5
ESCROW_ENABLED=true
PGP_REQUIRED=false
MINIMUM_VENDOR_REPUTATION=0

# Encrypt/decrypt settings
ENCRYPTION_KEY=dev_encryption_key_replace_in_production" > .env
fi

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  bun install
fi

# Start the server
echo "Starting server..."
bun run start
