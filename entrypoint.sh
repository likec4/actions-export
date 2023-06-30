#!/bin/sh

set -e

# Always install latest version of likec4
npm install -g @likec4/cli

# Run likec4 export
# - either use the @likec4/cli from current project
# - or use latest @likec4/cli
npx likec4 export --script-cwd /puppeteer-runner --output $1 $2
