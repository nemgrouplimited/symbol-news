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
  git branch -d gh-pages
  git checkout -b gh-pages
  git add . *.html
  git commit -m "Travis Build:  $TRAVIS_BUILD_NUMBER" --allow-empty
  echo "pulling changes from main..."
  git pull origin-pages main
  echo "pulling changes from gh-pages..."
  git pull origin-pages gh-pages
}

push_updates() {
  echo "pushing updates to github..."
  git push  --set-upstream origin-pages gh-pages -f
}

setup_git
commit_updates
push_updates
