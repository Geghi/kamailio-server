FROM ghcr.io/kamailio/kamailio:5.8.7-bookworm

# Use the project config by default.
COPY kamailio.cfg /etc/kamailio/kamailio.cfg
