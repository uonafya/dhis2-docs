#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "dhis2/dhis2-docs" ]  && [ "$TRAVIS_PULL_REQUEST" == "false" ] && \
 ["TRAVIS_BRANCH" == "master" ]; then
    set -e # exit with nonzero exit code if anything fails
    mvn -Ddocbkx.fopLogLevel= -Denforcer.fail=false -q package
fi
   
if [ "$TRAVIS_REPO_SLUG" == "dhis2/dhis2-docs" ]  && [ "$TRAVIS_PULL_REQUEST" == "false" ] && \ 
 [ "$TRAVIS_BRANCH" != "master" ]; then
    set -e # exit with nonzero exit code if anything fails
    mvn -f pom-short.xml -Ddocbkx.fopLogLevel=ERROR -Denforcer.fail=false  package
fi 
