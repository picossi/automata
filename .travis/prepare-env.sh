#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

remove_dist() {
  git rm -r client/dist
  git commit -m "Remove dist directory"
  git push origin master
}

cd ..
setup_git
if [ -d "client/dist" ]; then
  remove_dist
fi