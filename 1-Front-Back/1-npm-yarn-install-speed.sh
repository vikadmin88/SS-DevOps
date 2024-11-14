#!/bin/bash

# Speed difference npm vs yarn
# Viktor viktork8888@gmail.com (c)

# npm
echo -e "\n**************** npm test ****************"

rm -fr node_modules
npm cache clean --force

time_start=$(date +%s%3N)
npm install
npm run build
time_end=$(date +%s%3N)
npm_time=$((time_end - time_start))

# yarn
echo -e "\n**************** yarn test ****************"

rm -fr node_modules
yarn cache clean --force

time_start=$(date +%s%3N)
yarn install
yarn run build
time_end=$(date +%s%3N)
yarn_time=$((time_end - time_start))

echo -e "\n**************** Result ****************"
echo "npm (install) : ${npm_time} millis."
echo "yarn (install): ${yarn_time} millis."
