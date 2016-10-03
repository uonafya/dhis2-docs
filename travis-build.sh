#!/bin/bash
BRANCH_REGEX="2.2[0-9]|master"

set -e # exit with nonzero exit code if anything fails

mvn -T 1C -Ddocbkx.fopLogLevel=ERROR -Denforcer.fail=false -q package

exit $?
