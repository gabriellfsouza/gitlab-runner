# Local GitLab CE + Runner - Docker Compose

```bash
cp .env.runner.example .env.runner
docker-compose -f docker-compose.yml up -d
docker exec -it gitlab-container grep 'Password:' /etc/gitlab/initial_root_password
```
Wait until Github is available
Log in with the `root` user using the password generated, go to Admin Configs / CI-CD / Runners / Copy Runners Token from the top right options button.

Fill the .env.runner file

```bash
docker-compose -f docker-compose.yml -f docker-compose.runner.yml up -d
```