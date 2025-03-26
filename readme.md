A devcontainer with tools and scripts I like to use as a base for development.

### How To

Auth to AWS SSO: `aws sso login --sso-session terraform-dev`

### Tools and Repos

````bash
# terraform repo that has some common cloud resource builds
source /workspaces/devcontainer/tools/repo-terraform.sh

# pulumi repo that has some common cloud resource builds
source /workspaces/devcontainer/tools/repo-pulumi.sh

# redis local dev/db
source /workspaces/devcontainer/tools/repo-redis.sh

# neon.tech for postgres
source /workspaces/devcontainer/tools/neontech.sh
````

### Prereqs

- Create an env var for GH Codespaces named CS_ENVVAR_AWSSSOURL, that contains your AWS SSO (Identity Center) endpoint. This is used in tools like terraform, pulumi, etc. to auth to AWS:
https://someurl.awsapps.com/start