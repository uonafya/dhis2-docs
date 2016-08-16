#!/bin/bash



find content -maxdepth 1 -type d -exec ln -s $(pwd)/resources {} \;
