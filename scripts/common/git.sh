echo
echo "Installing Git and associated tools"
brew install git
brew tap git-duet/tap
brew install git-duet
brew cask install gitup

brew install vim

echo
echo "Setting global Git configurations"
git config --global core.editor /usr/local/bin/vim
git config --global transfer.fsckobjects true

HOOKS_DIRECTORY=$HOME/workspace/git-hooks-core
if [ ! -d $HOOKS_DIRECTORY ]; then
  echo
  echo "Installing git hooks for cred-alert"
  # for more information see https://github.com/pivotal-cf/git-hooks-core
  git clone https://github.com/pivotal-cf/git-hooks-core $HOOKS_DIRECTORY
  git config --global --add core.hooksPath $HOOKS_DIRECTORY
else
  echo
  echo "Updating git-hooks for cred-alert"
  pushd $HOOKS_DIRECTORY
  git pull -r
  popd
fi

# install cred-alert-cli
os_name=$(uname | awk '{print tolower($1)}')
curl -o cred-alert-cli \
  https://s3.amazonaws.com/cred-alert/cli/current-release/cred-alert-cli_${os_name}
chmod 755 cred-alert-cli
mv cred-alert-cli /usr/local/bin # <= or other directory in ${PATH}
