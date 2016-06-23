#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "dhis2/dhis2-docs" ]  && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    set -e # exit with nonzero exit code if anything fails

    cd ${HOME}

    # Remove master git dir
    rm -rf ${HOME}/.git 2>/dev/null

    # Grab the pages branch we want to push the updated docs to
    git clone -b gh-pages https://github.com/dhis2/dhis2-docs.git gh-pages

    # Start with a clean dir so we also account for deletions
    rm -rf ${HOME}/gh-pages/${TRAVIS_BRANCH} 2>/dev/null
    mkdir -p ${HOME}/gh-pages/${TRAVIS_BRANCH}

    # Copy the build files from the build branch into the docs branch
    cp -R ${TRAVIS_BUILD_DIR}/target/site/en ${HOME}/gh-pages/${TRAVIS_BRANCH}
    # Add the landing pages for the github pages webpage
    cp ${TRAVIS_BUILD_DIR}/.utility/index.html ${HOME}/gh-pages/ 2>/dev/null
    cp ${TRAVIS_BUILD_DIR}/.utility/google4d4dd2fbabf00e20.html ${HOME}/gh-pages/ 2>/dev/null
    cp ${TRAVIS_BUILD_DIR}/.utility/dhis2-docs.css ${HOME}/gh-pages/ 2>/dev/null
    cp ${TRAVIS_BUILD_DIR}/.utility/sitemap.xml ${HOME}/gh-pages/ 2>/dev/null
    cd ${HOME}/gh-pages/

    # Re-init the git repo for gh-pages so we start clean
    rm -rf .git 2>/dev/null
    git init

    # inside this git repo we'll pretend to be a new user
    git config user.name "Travis CI"
    git config user.email "travis@dhis2.org"

    # Add the .nojekyll file since we are not using it for now
    touch .nojekyll

    # Make sure we add all files
    git add .; git add -u .

    git commit --quiet -a -m "Build $TRAVIS_JOB_NUMBER from updates to $TRAVIS_BRANCH"
    git push --force --quiet "https://${GITHUB_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
fi
