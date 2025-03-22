# Tor-Compatible Marketplace with Cryptocurrency Support

A privacy-focused marketplace built with Node.js, Express, and SQLite that supports Tor hidden services and cryptocurrency payments (BTC and XMR).

## Features

- **Enhanced Privacy**: Optional Tor-only mode for maximum privacy
- **Cryptocurrency Support**: Integrated BTC and XMR payment processing
- **Vendor Management**: Apply for vendor status, manage products
- **PGP Encryption**: Support for PGP communication
- **Two-Factor Authentication**: Additional security layer for user accounts
- **Digital & Physical Products**: Support for both digital and physical product listings
- **Secure Architecture**: Privacy-enhancing architecture with minimal attack surface

## Technologies

- **Backend**: Node.js with Express
- **Database**: SQLite with full encryption support
- **Frontend**: Lightweight template with HTMX and Alpine.js (minimal JS)
- **Cryptocurrency**: Direct integration with BTC and XMR APIs
- **Security**: Content Security Policy, PGP, 2FA, and more

## Getting Started

### Prerequisites

- Node.js 16+ or [Bun](https://bun.sh/) (recommended)
- Tor Browser (for testing Tor features)
- Optional: Bitcoin and/or Monero nodes (or use simulation mode)

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/tor-marketplace.git
cd tor-marketplace
```

2. Install dependencies
```bash
bun install
# or with Node.js
npm install
```

3. Configure environment variables
```bash
cp .env.example .env
# Edit .env with your configuration
```

4. Start the server
```bash
bun run start
# or with Node.js
npm run start
```

The server will be running at http://localhost:3000 by default.

## Development Mode

For development purposes, you can use the built-in simulation mode for cryptocurrency payments:

1. Set `NODE_ENV=development` in your `.env` file
2. Generate a payment using the API
3. Simulate a confirmation using:
```
POST /api/payments/simulate-confirmation
```

## Configuration

### Tor Hidden Service

To run this as a Tor hidden service, add the following to your torrc file:

```
HiddenServiceDir /var/lib/tor/hidden_service/
HiddenServicePort 80 127.0.0.1:3000
```

Then set the following in your `.env` file:
```
TOR_ENABLED=true
ONION_ADDRESS=your_onion_address.onion
```

### Cryptocurrency Configuration

#### Bitcoin

1. Set up a Bitcoin node or use an external service
2. Update your `.env` file:
```
BITCOIN_ENABLED=true
BITCOIN_NODE_URL=http://localhost:8332
BITCOIN_RPC_USER=your_rpc_username
BITCOIN_RPC_PASSWORD=your_rpc_password
```

#### Monero

1. Set up a Monero wallet RPC or use an external service
2. Update your `.env` file:
```
MONERO_ENABLED=true
MONERO_WALLET_RPC_URL=http://localhost:18082
MONERO_WALLET_RPC_USER=your_rpc_username
MONERO_WALLET_RPC_PASSWORD=your_rpc_password
```

## API Endpoints

### Authentication
- `POST /api/auth/register`: Register a new user
- `POST /api/auth/login`: Login
- `POST /api/auth/verify-2fa`: Verify 2FA code
- `POST /api/auth/logout`: Logout
- `GET /api/auth/me`: Get current user
- `POST /api/auth/pgp`: Update PGP key
- `POST /api/auth/pgp/generate`: Generate PGP key pair
- `POST /api/auth/2fa/enable`: Enable 2FA
- `POST /api/auth/2fa/disable`: Disable 2FA
- `POST /api/auth/vendor/apply`: Apply to become a vendor

### Products
- `GET /api/products`: Get all products (with search/filter)
- `GET /api/products/:id`: Get product by ID
- `GET /api/products/slug/:slug`: Get product by slug
- `POST /api/products`: Create a new product (vendor only)
- `PUT /api/products/:id`: Update a product (vendor only)
- `DELETE /api/products/:id`: Delete a product (vendor only)
- `POST /api/products/:id/images`: Add an image to a product (vendor only)
- `DELETE /api/products/images/:id`: Delete a product image (vendor only)
- `PUT /api/products/images/:id/main`: Set a product image as the main image (vendor only)
- `GET /api/products/vendor/my-products`: Get all products for the logged-in vendor

### Payments
- `POST /api/payments/generate`: Generate a new payment address
- `GET /api/payments/status/:paymentId`: Check payment status
- `POST /api/payments/simulate-confirmation`: Simulate payment confirmation (development only)
- `GET /api/payments/pending`: Get all pending payments (admin only)
- `PUT /api/payments/status/:paymentId`: Update payment status (admin only)

## Security Considerations

- **Server Hardening**: Production deployments should use a hardened Linux distribution
- **PGP Encryption**: Enable PGP for sensitive communications
- **Encryption Keys**: Change the encryption key in production
- **Password Security**: Use strong passwords and enable 2FA
- **Tor Configuration**: Ensure proper Tor hidden service configuration
- **Database Encryption**: Consider full disk encryption for the database
- **Admin Account**: Change the default admin credentials

## Disclaimer

This software is provided for educational and research purposes only. The authors are not responsible for any misuse of this software or illegal activities conducted with it.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
