![ci](https://github.com/tcurdt/release-node/workflows/ci/badge.svg?branch=master)

A simple yet sane github action setup for node projects.
It builds and runs test for all selected platforms.
When a tag gets pushed it creates the github release, does a npm release and pushes an image to dockerhub.

# Secrets

The following secrets need to be set for the repository:

- DOCKERHUB_USERNAME
- DOCKERHUB_TOKEN
- NPM_AUTH_TOKEN
- PAT (github personal access token)
