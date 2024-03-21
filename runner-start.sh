#!/bin/bash

if grep -q "name = \"docker-runner\"" /etc/gitlab-runner/config.toml; then
    echo "Runner with description 'docker-runner' is already registered."
else
gitlab-runner register \
  --non-interactive \
  --url $GITLAB_URL \
  --registration-token $REGISTRATION_TOKEN \
  --executor docker \
  --name "docker-runner" \
  --docker-image alpine:latest \
  --tag-list "docker,linux,alpine,general" \
  --run-untagged="true" \
  --locked="false" \
  --docker-privileged \
  --docker-network-mode=$GITLAB_NETWORK
fi

sed -i "s/concurrent.*/concurrent = $(echo $RUNNER_CONCURRENCY)/" /etc/gitlab-runner/config.toml
gitlab-runner start

/usr/bin/dumb-init /entrypoint run --user=gitlab-runner --working-directory=/home/gitlab-runner
