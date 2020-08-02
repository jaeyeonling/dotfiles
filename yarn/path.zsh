# sup yarn
# https://yarnpkg.com

if (( $+commands[yarn] )); then
  echo "Export yarn global bin"
  export PATH="$PATH:`yarn global bin`"
fi
