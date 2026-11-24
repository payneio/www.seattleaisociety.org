# Seattle AI Society Website

This repository contains the Seattle AI Society website files.

## Structure

- `www/` - Website files
  - `index.html` - Home page
  - `about.html` - About page
  - `get-involved.html` - Get Involved page
  - `files/` - Static assets (images, CSS, JS)

- `nginx.conf`, `Dockerfile` - Legacy Docker/nginx setup from the Render deployment (still works for local preview)

## URL Structure

The website is configured with clean URLs:

- `/` - Home page
- `/about` - About page
- `/get-involved` - Get Involved page

## Building

The site is served from `dist/`, which is generated from `www/` (and git-ignored):

```bash
wildpc program build seattleaisociety
```

The build copies `www/` to `dist/`, moves `about.html` and `get-involved.html` to
`about/index.html` and `get-involved/index.html` (so `/about` and `/get-involved`
work as clean URLs), and rewrites `./files/` asset paths to `/files/` so they resolve
from those subdirectories. The build command lives in the Wild PC program config
(`~/.wildpc/programs/seattleaisociety.yaml`).

To preview without Wild PC, the Docker setup still works:

```bash
docker build -t seattle-ai-society . && docker run -p 8080:80 seattle-ai-society
```

## Development

1. Edit files in the `www/` directory
2. Run `wildpc program build seattleaisociety`
3. Check https://seattleaisociety.civil.payne.io (LAN) or https://www.seattleaisociety.org

The gateway serves `dist/` in place, so a rebuild is live immediately — no restart.

## Deployment

Hosted on Wild PC (node `civil`) as the static deployment `seattleaisociety`
(`~/.wildpc/deployments/statics/seattleaisociety.yaml`, `reach: public`,
`public_host: www.seattleaisociety.org`). Caddy serves `dist/`, and the public
hostname reaches it through the node's Cloudflare tunnel.

Deploys are not automatic: pushing to GitHub does nothing. Rebuild on the node to publish.
