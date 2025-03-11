# note: if you're using this devcontainer frequently, most if not all of this could be moved to a prebuild step
# rather than this which occurs when the devcontainer first spins up.

started=$(cat /workspaces/devcontainer/build/started.json | jq -r ".started")

if [[ $started == *"0"* ]]
  then
    sudo apt-get update

    # node is installed in the image, here we use nvm to set our version
    # importantly, nvm has to be sorced, not called. thus the . notation. also importantly, we must set our current version to the default
    . /usr/local/share/nvm/nvm.sh && nvm install --lts && nvm use --lts && nvm alias default node

    # udpate npm. note this needs to come after nvm node install, since npm is updated more frequently than node
    npm install npm@latest -g

    # install the neon.tech cli for postgres bliss
    sudo npm i -g neonctl

    # update our json to indicate that we've successfully completed initial startup, so that next start we won't
    # rerun all of this
    startup=$(jq --null-input '{"started":1}')
    echo $startup > /workspaces/devcontainer/build/started.json
  else
    # nothing yet
fi

# let the user know what versions are installed
printf "------------------- \n\n"
printf "npm version: %s\n" $(npm --version)
printf "node version: %s\n" $(node --version)
printf "neon cli version: %s\n" $(neonctl --version)
