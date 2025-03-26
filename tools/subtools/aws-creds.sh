# iff aws config file doesn't exist, create it and populate with my personal aws creds from codespaces env vars
if ! test -f ~/.aws/config; then
  mkdir ~/.aws
  touch ~/.aws/config

  echo "$CS_ENVVAR_AWSCONFIG" > ~/.aws/config
fi
