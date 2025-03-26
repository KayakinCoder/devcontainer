# iff aws config file doesn't exist, create it and populate with my personal aws creds from codespaces env vars
if ! test -f ~/.aws/config; then
  mkdir ~/.aws
  cp /workspaces/devcontainer/tools/subtools/aws-creds ~/.aws
  mv ~/.aws/aws-creds ~/.aws/config

  # replace CS_ENVVAR_AWSSSOURL with my actual aws sso endpoint. this is an GH Codespaces scoped env var
  sed -i "s@CS_ENVVAR_AWSSSOURL@$CS_ENVVAR_AWSSSOURL@g" ~/.aws/config

  # replace placeholder with github codespaces env vars
fi
