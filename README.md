# Capstone Project: Homely

## Steps for Manual Deployment Using Docker
- Deploy Postgresql DB
- Deploy Backend
- Deploy Frontend

## Steps...

## 1. Deploy Postgresql DB

First pull the postrgres image by running ```docker pull postgres```

Next, run the following command to start the postgres DB container:
```sh
docker run --name postgresql -e POSTGRES_USER=homely -e POSTGRES_PASSWORD=password1 -p 5100:5432 -v /data:/var/lib/postgresql/data -d postgres
```

_N.B: the POSTGRES_USER and POSTGRES_PASSWORD env values should correspond with the username and password specified in the config/database.yml file. Also, normally, the port binding is 5432:5432 but 5432 was in use on my machine, so I used 5100 instead._

Your postgres container should now be running.

- Get the postgres container IP address by running:
```sh
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <POSTGRES_CONTAINER_ID>

```

## 2. Deploy the Backend Container

First go to the *config/database.yml* file and paste the ip address of the postgres container as the value of "host: ". Save and exit.

- Next, build the Docker image for the backend container
Run:
```sh
docker build -t backend_image .
``` 

When that's done, run the container, exec into it and run the following commands:
```sh

rails db:create
rails db:migrate

# You can then start the project by running

rails server

```

You could also run these commands against the container from outside it like so...
```docker exec -d <cotainer_id> /bin/rails db:create```

N.B: I have not commented on how to deploy for prod yet

## 3. Deploy the frontend container
...





















