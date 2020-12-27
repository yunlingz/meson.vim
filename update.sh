#!/bin/bash

if [ ! -d tmp_git ]
then
  git clone -b master https://github.com/mesonbuild/meson.git tmp_git
else
  cd tmp_git
  git pull origin master
  cd ..
fi

if [ -d vim ]
then
  rm -rf vim
fi

cp -R tmp_git/data/syntax-highlighting/vim ./

git add .
git commit -m "auto update at `date`"
git push origin master
