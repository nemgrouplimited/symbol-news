#!/bin/sh
setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git config pull.ff only
  git config receive.denyNonFastForwards false
}
commit_updates() {
  git remote add origin-pages https://${GITHUB_TOKEN}@${GH_REF} > /dev/null 2>&1
  git remote update
  git checkout gh-pages
  git add . *.html
  git commit -m "Travis Build:  $TRAVIS_BUILD_NUMBER" --allow-empty 
}

push_updates() {
  ## deploy updates to github pages
  git push  --set-upstream origin-pages gh-pages -f
}

setup_git
commit_updates
push_updates
