# BookStack

A Docker-based audiobook management system that integrates Calibre, AudioBookShelf, and automated book organization. This system provides a complete solution for managing your audiobook collection with automated downloading, organizing, and streaming capabilities.

## Features

- **Calibre Web**: Web-based e-book and audiobook library management
- **AudioBookShelf**: Modern audiobook streaming server
- **Transmission with VPN**: Secure downloading with VPN integration
- **Automated Organization**: Automatic processing and organization of your audiobook files

## Prerequisites

- Docker and Docker Compose installed on your system
- A VPN subscription (ProtonVPN supported by default)
- Basic understanding of Docker containers
- Sufficient storage space for your audiobook collection

## Setup

1. Clone this repository to your local machine
2. Create a `.env` file in the root directory with the following variables:
```bash
VPN_PROVIDER=PROTONVPN
OPENVPN_USERNAME=your_vpn_username
OPENVPN_PASSWORD=your_vpn_password
LOCAL_NETWORK=192.168.1.0/24  # Adjust to match your network
```
Feel free to look at the example `.env.example` file for more information.
3. Triple check that `docker-compose.yml` is as you'd like it to be. 
4. Start the services:
```bash
docker-compose up -d
```

## Accessing Services

- **Calibre Web**: http://localhost:8083
- **AudioBookShelf**: http://localhost:13378
- **Transmission**: http://localhost:9091

## Directory Structure

```
./data/
├── abs/              # AudioBookShelf data
├── calibre/          # Calibre library, ingest, and configuration
├── media/            # Processed audiobooks
└── transmission-openvpn/     # Download directory
```

## Usage

1. Access Calibre Web to manage your book collection
2. Use AudioBookShelf for streaming your audiobooks
3. Configure Transmission for downloading new content
4. The system will automatically process and organize new downloads

## Troubleshooting

- If VPN connection fails, check your credentials in the `.env` file
- For service-specific issues, check the respective container logs:
```bash
docker-compose logs [service_name]
```

## Security Note

This setup includes VPN integration for secure downloading. Always ensure your VPN is properly configured before using the download functionality.

## Support

For issues and feature requests, please use the GitHub issues section.