#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "dhis2/dhis2-docs" ]  && [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then
	set -e # exit with nonzero exit code if anything fails

	#TODO Find a better solution for this
	#Copy the static index file
	cmd="mv target/site target/${TRAVIS_BRANCH}"
	exec $cmd
	echo $cmd
	cmd2="cp .utility/index.html target/${TRAVIS_BRANCH}"
	exec $cmd2
	echo $cmd2
	# go to the out directory and create a *new* Git repo
	cd target/
	git init

	# inside this git repo we'll pretend to be a new user
	git config user.name "Travis CI"
	git config user.email "travis@dhis2.org"
	#Add the .nojekyll file since we are not using it for now
	touch .nojekyll
	cmd3="git add ${TRAVIS_BRANCH}"
	exec $cmd3
	echo $cmd3
	git commit -m "Deploy to GitHub Pages"
	git push --force --quiet "https://${GITHUB_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1

fi
