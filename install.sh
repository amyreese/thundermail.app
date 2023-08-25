#!/bin/bash
set -eou pipefail

cd "$(dirname "$0")"
set -x

xcodebuild
rm -rf ~/Library/Mail/Bundles/GMailinator.mailbundle
cp -a build/Release/GMailinator.mailbundle ~/Library/Mail/Bundles/
spctl --add ~/Library/Mail/Bundles/GMailinator.mailbundle
defaults write com.apple.mail EnableBundles -bool true
