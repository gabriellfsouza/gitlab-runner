# Local GitLab CE + Runner - Docker Compose

```bash
cp .env.runner.example .env.runner
docker-compose -f docker-compose.yml up -d
docker exec -it gitlab-container grep 'Password:' /etc/gitlab/initial_root_password
```
Wait until Gitlab is available under http://localhost
Log in with the `root` user using the password generated, and go to Admin Configs / CI-CD / Runners / Copy Runners Token from the top right options button.

Fill the .env.runner file with that token

```bash
docker-compose -f docker-compose.yml -f docker-compose.runner.yml up -d
apt install nano -y
sudo nano /etc/hosts
```

Add the following line to the last line in the `/etc/host` file:
```
127.0.0.1 gitlab
```


Create a new user and project in your new gitlab instance (disable the self signup if you want).
Copy the [./gitlab-project/Dockerfile](gitlab-project/Dockerfile) and [./gitlab-project/.gitlab-ci.yml](gitlab-project/.gitlab-ci.yml) files to your project and push them.

To connect your local registry to your machine:
```bash
docker login gitlab:5050
```

Fill your new user's username and password.

```bash
cd gitlab-project
docker build -t gitlab:5050/<your-project-path>/<your-project-name>/my-app .
docker push gitlab:5050/<your-project-path>/<your-project-name>/my-app
```

