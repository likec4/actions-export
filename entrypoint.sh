#!/bin/sh

set -e
npx likec4 export --script-cwd /puppeteer-runner --output $1 $2
