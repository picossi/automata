#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_dist() {
  git add client/dist/*
  git commit -m "Travis build: $TRAVIS_BUILD_NUMBER"
  git push origin master
}

notify_resin() {
  git remote add resin picossi@git.resin.io:picossi/automata.git
  #git push --quiet --set-upstream resin master
  git push resin master
}

cd .. 
setup_git
if [ -d "client/dist" ]; then
  commit_dist
  #notify_resin
fi