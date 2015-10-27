#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "dhis2/dhis2-docs" ]  && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
	set -e # exit with nonzero exit code if anything fails

        cd ${HOME}
        git clone -b gh-pages "https://${GH_REF}" gh-pages
	rm -rf ${HOME}/gh-pages/${TRAVIS_BRANCH}	
        cp -R ${TRAVIS_BUILD_DIR}/target/site/en ${HOME}/gh-pages/${TRAVIS_BRANCH}
        #TODO Find a better solution for this static page	
	#cp ${TRAVIS_BUILD_DIR}/.utility/index.html ${HOME}/gh-pages/
	
	# inside this git repo we'll pretend to be a new user
        cd ${HOME}/gh-pages/	
        git config user.name "Travis CI"
	git config user.email "travis@dhis2.org"
	#Add the .nojekyll file since we are not using it for now
	#touch .nojekyll
	git add -A ${TRAVIS_BRANCH}
	git commit -a -m "Deploy to GitHub Pages"
	git push --force --quiet "https://${GITHUB_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1

fi
