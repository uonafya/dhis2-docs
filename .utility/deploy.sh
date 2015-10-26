#!/bin/bash
if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" != "false"  ]]; then
  echo -e '\n============== deploy will not be started (from the fork) ==============\n'
  exit 0
fi
 
# Choose necessary argument according to the current branch.
if [[ $TRAVIS_BRANCH == '2.21' ]]; then
    echo $1
elif [[ $TRAVIS_BRANCH == 'master' ]]; then
    echo $2
else
    exit 0
fi



if [ "$TRAVIS_REPO_SLUG" == "dhis2/dhis2-docs" ]  && [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then
	set -e # exit with nonzero exit code if anything fails

	#TODO Find a better solution for this
	#Copy the static index file
	cmd="mv target/site/en target/site/${TRAVIS_BRANCH}"
        echo $cmd	
	exec $cmd
	cp .utility/index.html target/site/
	# go to the out directory and create a *new* Git repo
	cd target/site/
	git init

	# inside this git repo we'll pretend to be a new user
	git config user.name "Travis CI"
	git config user.email "travis@dhis2.org"
	#Add the .nojekyll file since we are not using it for now
	touch .nojekyll
	git add .
	git commit -m "Deploy to GitHub Pages"
	git push --force --quiet "https://${GITHUB_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1

fi
