# Seattle AI Society Website

This repository contains the Seattle AI Society website files and Docker configuration for easy deployment.

## Structure

- `www/` - Website files
  - `index.html` - Home page
  - `about.html` - About page
  - `get-involved.html` - Get Involved page
  - `files/` - Static assets (images, CSS, JS)

- `nginx.conf` - Nginx configuration for URL routing
- `Dockerfile` - Docker container configuration

## URL Structure

The website is configured with clean URLs:

- `/` - Home page
- `/about` - About page
- `/get-involved` - Get Involved page

## Building and Running

### Prerequisites

- Docker installed on your system

### Build the Docker Image

```bash
docker build -t seattle-ai-society .
```

### Run the Container

```bash
docker run -p 8080:80 seattle-ai-society
```

After running these commands, the website will be available at http://localhost:8080

## Development

To make changes:

1. Edit files in the `www/` directory
2. Rebuild the Docker image
3. Run the container to test your changes

## Deployment

For production deployment, consider:

- Using a reverse proxy like Nginx or Traefik
- Setting up SSL certificates for HTTPS
- Using Docker Compose for easier management

Example command for production deployment with a specific port:

```bash
docker run -d --restart unless-stopped -p 80:80 seattle-ai-society
```