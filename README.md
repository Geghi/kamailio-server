# Kamailio on VPS via Docker

## Prerequisites

- Linux VPS with public IP
- Docker + Docker Compose installed
- Firewall/security group allowing inbound `TCP 5060`

## Start Kamailio

From the project folder on VPS:

```bash
docker compose up -d --build
docker compose logs -f kamailio
```

Expected: container starts and listens on `tcp:0.0.0.0:5060`.

## DIDWW Routing

Set DIDWW destination to your VPS:

`sip:{DID}@<VPS_PUBLIC_IP>:5060;transport=tcp`

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

## Notes

- Kamailio accepts `INVITE`, calls your webhook, injects clinic headers, then forwards to Vapi.
- Upstream target is configured in `kamailio.cfg` via:
  `#!define UPSTREAM_URI "sip:sip.vapi.ai:5060;transport=tcp"`
- If webhook fails, defaults are used (`DEFAULT_CLINIC_ID`, `DEFAULT_CLINIC_NAME` in `kamailio.cfg`).
