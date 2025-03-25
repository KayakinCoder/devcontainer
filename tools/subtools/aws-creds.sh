# iff ~/.aws/credentails doesn't exist, create it and populate with my personal aws creds from codespaces env vars
if ! test -f ~/.aws/credentails; then
  mkdir ~/.aws
  cp /workspaces/devcontainer/tools/subtools/aws-creds ~/.aws
  mv ~/.aws/aws-creds ~/.aws/credentials

  # replace placeholder with github codespaces env vars
fi
