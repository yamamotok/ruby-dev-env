#!/usr/bin/env bash

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo -e '\n#rbenv setup' >> ~/.profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

~/.rbenv/bin/rbenv install --list

echo 'Do `source ~/.profile` and then try `rbenv install 2.4.1` for example'
