# note: if you're using this devcontainer frequently, most if not all of this could be moved to a prebuild step
# rather than this which occurs when the devcontainer first spins up.

# determine if this is the first start of the container, and if it is set things up!
started=$(cat /workspaces/devcontainer/build/started.json | jq -r ".started")
if [[ $started == *"1"* ]]
  then
    # nothing needed yet
    printf ""
  else
    sudo apt-get update

    # this will hold any optional tools/repos we want to load
    mkdir /workspaces/tools

    # node is installed in the image, here we use nvm to set our version
    # importantly, nvm has to be sorced, not called. thus the . notation. also importantly, we must set our current version to the default
    . /usr/local/share/nvm/nvm.sh && nvm install --lts && nvm use --lts && nvm alias default node

    # udpate npm. note this needs to come after nvm node install, since npm is updated more frequently than node
    npm install npm@latest -g

    # plop template generator
    npm install -g plop

    # aws cli
    source /workspaces/devcontainer/tools/subtools/aws.sh

    # my aliases
    cp /workspaces/devcontainer/tools/.bash_aliases ~

    # update our json to indicate that we've successfully completed initial startup, so that next start we won't
    # rerun all of this
    startup=$(jq --null-input '{"started":1}')
    echo $startup > /workspaces/devcontainer/build/started.json
fi

# let the user know what versions are installed
printf "___________________ \n\n"
aws --version
printf "npm version: %s\n" $(npm --version)
printf "node version: %s\n" $(node --version)
