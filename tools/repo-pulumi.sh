# clone pulumi into the workspace
cd /workspaces/tools && git clone https://github.com/KayakinCoder/pulumi.git
cd pulumi

# install the cli
curl -fsSL https://get.pulumi.com | sh

# pulumi isn't in path initially. open a new terminal and run  pulumi version  if you want to see installed version
printf "\n\n" && aws --version