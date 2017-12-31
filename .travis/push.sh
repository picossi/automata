#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_dist() {
  git checkout master
  git add dist/*
  git commit -m "Travis build: $TRAVIS_BUILD_NUMBER"
  git push origin master
}

notify_resin() {
  git remote add resin picossi@git.resin.io:picossi/automata.git
  #git push --quiet --set-upstream resin master
  git push resin master
}

setup_git
commit_dist
#notify_resin