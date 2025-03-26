A devcontainer with tools and scripts I like to use as a base for development. If you've found this on the interwebs, in a nutshell:
- Dev containers are awesome, they allow you to create a reproducible local dev setup
- This repo contains my personal dev container setup with some tools, script, aliases, repos etc. that I often use
- It's probably not a good idea to use this repo directly, but hopefully it gives you some ideas on setting up your own dev container

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

### AWS Auth

Some tools e.g. Terraform, Pulumi require authing to AWS. This is done by creating a ~/.aws/config file when this devcontainer spins up. In GH Codepsaces you should create an env var CS_ENVVAR_AWSCONFIG that has the full contents of your config file; those contents will automatically populated into .aws/config when the devcontainer is first created.
