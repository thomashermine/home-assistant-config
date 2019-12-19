FROM homeassistant/home-assistant:stable

COPY . /config
COPY ./dev/storage /config/.storage
COPY ./secrets  /config
