#!/usr/bin/env bash

set -e -o pipefail

# NPM dependencies
# Merges the theme's package.json (needed by js.Build, e.g. the Pagefind
# search) into the site's package.json and installs it
#npm install
# Generated theme assets (fonts, merged i18n, …)
# This site has no maps, so map styles stay skipped
export SKIP_VERSATILES=1
for SCRIPT in $PWD/themes/projektemacher-base/scripts/init/*.sh ; do
    echo "Running $SCRIPT"
    bash "$SCRIPT"
    ERR=$?
    if [ $ERR -ne 0 ] ; then
        echo "Execution of '$SCRIPT' failed!"
        exit $ERR
    fi
done

# Generate the OG preview images (SVG → PNG)
TARGETFORMAT=png $PWD/themes/projektemacher-base/scripts/preview.sh
