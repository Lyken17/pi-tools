# pi-tools
A repo includes some useful tools for raspberry pi farm setup

## Change hostname
Referenced from [Ubuntu 20.04 LTS change hostname permanently](https://www.cyberciti.biz/faq/ubuntu-20-04-lts-change-hostname-permanently/?__cf_chl_captcha_tk__=pmd_1b29680c4be50f46e93b3caebe30a07e2aa97ed0-1627699663-0-gqNtZGzNAyKjcnBszQkO)

1. `sudo hostnamectl set-hostname <newNameHere>`
2. `sudo vim /etc/hosts`
3. `sudo reboot` and check via `hostnamectl`.

## Install docker on Pi4
Referenced from [How To Install Docker and Docker-Compose On Raspberry Pi](https://dev.to/elalemanyo/how-to-install-docker-and-docker-compose-on-raspberry-pi-1mo)

1. `sudo apt-get -y update && sudo apt-get -y upgrade`
2. `curl -sSL https://get.docker.com | sh`
3. `sudo usermod -aG docker ${USER}`

## Quickly launch tvm tracker on Pi4

```bash
BASE=lyken/pi-tools:pi4-v0.8.0-4c1b66f
docker pull $BASE
docker run -it --rm \
    --net host \
    $BASE \
    /bin/python3 -m tvm.exec.rpc_server --tracker=g1.mit.edu:9190 --key rasp4b
```

