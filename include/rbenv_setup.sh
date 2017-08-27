#!/usr/bin/env bash

# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo -e '\n#rbenv setup' >> ~/.profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile

# rbenv installer
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# my configuration
PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install '2.4.1'
rbenv global '2.4.1'
gem install \
  'ruby-debug-ide' \
  'debase' \
  'minitest-reporters' \
  'bundler'

echo 'Do not forget `source ~/.profile`'

