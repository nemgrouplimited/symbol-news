#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout -b gh-pages
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GITHUB_TOKEN}@${GH_REF} > /dev/null 2>&1
  git remote update
  echo "pulling main branch"
  git pull origin main
  echo "pulling pages branch"
  git pull origin gh-pages
  echo "push to gh-pages"
  git push -f --quiet --set-upstream origin-pages gh-pages 
}

setup_git
commit_website_files
upload_files