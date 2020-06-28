# SSH Client for docker

Small and Simple docker image for ssh client.

## Running container

```bash
docker run --rm -it \
    -v $PWD/client.key:/root/.ssh/id_rsa:ro \
    morkid/ssh-client ssh user@example.com "free -m"
```

## docker-compose Example

```yml
version: '3.7'
services:
  memory_check:
    image: morkid/ssh-client
    volumes:
      - ./client.key:/root/.ssh/id_rsa:ro
    command: "watch -n 60 ssh user@example.com 'free -m'"
```

## Gitlab CI Example

```yml
stages:
  - "Deploy"

release:
  stage: Deploy
  image: morkid/ssh-client
  script:
    - echo "$SSH_KEY" > ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa
    - ssh -p $SSH_PORT $SSH_USER@$SSH_SERVER "mkdir -p /opt/app"
    - scp -P $SSH_PORT -r build/* $SSH_USER@$SSH_SERVER:/opt/app/
  only:
    refs:
      - master
```
