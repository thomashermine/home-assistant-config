FROM homeassistant/home-assistant:stable

COPY . /config
COPY ./dev/storage /config/.storage

RUN sh /config/secrets_make_redacted.sh
