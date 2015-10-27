#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "dhis2/dhis2-docs" ]  && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
	set -e # exit with nonzero exit code if anything fails

	#TODO Find a better solution for this
	#Copy the static index file
        mkdir ${HOME}/gh-pages/
	cp -R target/site/en ${HOME}/gh-pages/${TRAVIS_BRANCH}
	cp .utility/index.html ${HOME}/gh-pages/
	# go to the out directory and create a *new* Git repo
	cd ${HOME}/gh-pages/ 
	git init

	# inside this git repo we'll pretend to be a new user
	git config user.name "Travis CI"
	git config user.email "travis@dhis2.org"
	#Add the .nojekyll file since we are not using it for now
	touch .nojekyll
	git add -A .
	git commit -a -m "Deploy to GitHub Pages"
	git push --force --quiet "https://${GITHUB_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1

fi
