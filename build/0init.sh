sudo apt-get update

# node is installed in the image, here we use nvm to set our version
# importantly, nvm has to be sorced, not called. thus the . notation
# also importantly, we must set our current version to the default
. /usr/local/share/nvm/nvm.sh && nvm install --lts && nvm use --lts && nvm alias default --lts

# install the neon.tech cli for postgres bliss
sudo npm i -g neonctl

# let the user know what versions are installed
node --version
neonctl --version
