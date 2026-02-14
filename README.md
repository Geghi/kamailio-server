# Kamailio on Windows via Docker

This project runs Kamailio in Docker Desktop on Windows and exposes SIP TCP via ngrok.

## Prerequisites

- Docker Desktop (WSL2 backend enabled)
- ngrok installed and authenticated (`ngrok config add-authtoken ...`)

## Start Kamailio

From this folder:

```powershell
docker compose up -d --build
docker compose logs -f kamailio
```

Expected: container starts and listens on `tcp:0.0.0.0:5060`.

## Expose SIP with ngrok

In a second terminal:

```powershell
ngrok tcp 5060
```

Copy the public address ngrok prints, for example:

`tcp://0.tcp.ngrok.io:12345`

## DIDWW Routing

Use the ngrok endpoint in DIDWW destination:

`sip:0.tcp.ngrok.io:12345;transport=tcp`

## Stop

```powershell
docker compose down
```

## Notes

- Kamailio currently accepts `INVITE` and forwards to ElevenLabs:
  `sip:sip.rtc.elevenlabs.io:5060;transport=tcp`
- A static SIP header is added:
  `X-clinic-name: LOCAL_TEST`
