# iff aws config file doesn't exist, create it and populate with my personal aws creds from codespaces env vars
if ! test -f ~/.aws/config; then
  mkdir ~/.aws
  cp /workspaces/devcontainer/tools/subtools/aws-creds ~/.aws
  mv ~/.aws/aws-creds ~/.aws/config

  # replace CS_ENVVAR_AWSCONFIG with my aws config file contents. CS_ENVVAR_AWSCONFIG is a GH codespaces scoped env var
  sed -i "s@CS_ENVVAR_AWSCONFIG@$CS_ENVVAR_AWSCONFIG@g" ~/.aws/config
fi
