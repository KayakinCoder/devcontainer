# download and install the aws cli, which we'll need to provision resources
source /workspaces/devcontainer/tools/subtools/aws-cli-install.sh

# download/install terraform cli
cd /workspaces/devcontainer
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# clone repo into the workspace
cd /workspaces/tools && git clone https://github.com/KayakinCoder/terraform.git
cd terraform

printf "\n\n" && terraform --version && aws --version
