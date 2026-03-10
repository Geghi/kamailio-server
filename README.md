# Kamailio on VPS via Docker

## Prerequisites

- Linux VPS with public IP
- Docker + Docker Compose installed
- Firewall/security group allowing inbound `TCP 50873`

## Start Kamailio

From the project folder on VPS:

```bash
docker compose up -d --build
docker compose logs -f kamailio
```

Expected: container starts and listens on `tcp:0.0.0.0:50873`.

## DIDWW Routing

Set DIDWW destination to your VPS:

`sip:{DID}@<VPS_PUBLIC_IP>:50873;transport=tcp`

## Stop

```bash
docker compose down
```

## Keep It Always Running

Use container restart policy (already set in `docker-compose.yml`):

`restart: unless-stopped`

Also ensure Docker starts on boot:

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

Quick verification after reboot:

```bash
docker compose ps
```
