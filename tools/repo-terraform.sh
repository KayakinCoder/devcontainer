# download and install the aws cli, which we'll need to provision resources
source /workspaces/devcontainer/tools/subtools/aws-cli-install.sh

# download/install terraform cli
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
sudo apt update
sudo apt-get install terraform

printf "\n\n" && terraform --version

# clone repo into the workspace
cd /workspaces/tools && git clone https://github.com/KayakinCoder/terraform.git
