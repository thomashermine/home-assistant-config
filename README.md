# Home Assistant Config 

I’ve been working on my smart home since 2013, in 3 different flats.

It all started with a cheap connected MiLight Light bulb... \
— today, all my house is connected : every lights and switches, the heating system, various media players,...

The setup mainly consist of an Intel NUC running [Home Assistant](http://homeassistant.io/). \
I use lightbulbs from IKEA Tradfri, a few [Aqara](https://amzn.to/34WmDL9) sensors and a lot of [NodeMCU](https://amzn.to/34ZesO6) running [ESPHome](https://esphome.io/). 

_This README contains affiliate links._

### A note about the current status

I moved in October 2019 in a flat I'm the owner off, and that I'm completely renovating.

I took this opportunity to nuke my previous install and start again, with a clean & public codebase. \
I'm currently slowly re-importing automations & logics from my previous (private) repository.

Expect more awesomeness soon 😃

> ### Live Demo
> https://smarthome.thomashermine.be \
> Login : Dev | Password : dev


## Devices & Harware

- Intel NUC : Running HASSIO on top of Ubuntu, with Portainer. Heavy but really neat setup. [Tutorial](https://www.smarthomebeginner.com/install-hass-io-on-docker-linux/#Install_HASSio_on_Docker)
- IKEA Tradfri : GU10 Bulbs (individually controlled 😍), E27 & E14 Bulbs and the Gateway bridge
- NodeMCU : Turning on/off some appliances w/ 3v Relays, motion sensors hidden in ceilings,...


## Deploy Setup

### Deploys

- https://smarthome.thomashermine.be (Master, without Secrets)
- https://staging.smarthome.thomashermine.be (Develop, without Secrets)
- https://unstable.smarthome.thomashermine.be (Latest commit on any branch, without Secrets)
- Running Locally on my Intel NUC (Master, with Secrets)

The CI/CD stack used is heavily inspired by the one we use at my company, [nextmoov](https://github.com/nextmov/nextmoov).

### CircleCI :

For the Integration part, Circle is runned on every branch : 

- Clone public Repo
- [secrets_make_redacted.sh](https://github.com/thomashermine/home-assistant-config/blob/master/secrets_make_redacted.sh) : Create redacted secrets in secrets.yaml
- Test Config
- Build Public Docker Image

### Rancher 

For the Deployment, the [Rancher pipeline](https://github.com/thomashermine/home-assistant-config/blob/master/.rancher-pipeline.yaml) goes as follow : 

- Clone public Repo
- Build Public Docker Image : 
  - Copy Code
  - [secrets_make_redacted.sh](https://github.com/thomashermine/home-assistant-config/blob/master/secrets_make_redacted.sh) : Create redacted secrets in secrets.yaml
- Use image in given lane by applying Manifest: production, staging or unstable i

