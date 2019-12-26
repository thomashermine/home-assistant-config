# ==============================================================================
# Dockerfile
# ==============================================================================
#
# This build a public Docker image, with placeholder secrets
#
# Steps :
# - Copy the code
# - Copy some placeholder storage data
# - Generate some fake secrets by parsing the repository
#
# ==============================================================================

FROM homeassistant/home-assistant:stable

COPY . /config
COPY ./dev/storage /config/.storage

RUN sh /config/secrets_make_redacted.sh
