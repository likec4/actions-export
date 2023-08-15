#!/bin/sh

set -e

# Run likec4 export
# - either use the @likec4/cli from current project
# - or use latest @likec4/cli
npx --quiet @likec4/cli export --script-cwd /puppeteer-runner --output $1 $2
