# docker-nginx

_Dockerized nginx that runs with Supervisor using docker-compose._

Configuration file used:

- `nginx/default.conf`:
    - It is a simplified version of the original file (`nginx/default-original.conf`) that includes the location of the root and it has a sample of a reverse-proxy API endpoint (in comments)
    - Modify it as needed

Requirement:

- You need to have a Docker Engine available
- If you don't have one then you may want to use [Docker Machine](https://docs.docker.com/machine/overview/)

To start it:

- `docker-compose up -d`

To check the logs:

- `docker-compose logs -ft`

To reload `nginx/default.conf`:

- `docker-compose exec docker-nginx nginx -s reload`

To stop it:

- `docker-compose stop`