#!/usr/bin/env bash

set -e -o pipefail

# NPM dependencies
#yarn install

# Generated theme assets (fonts, merged i18n, …)
# This site has no maps and no npm package.json, so map styles and the
# package.json merge are skipped
export SKIP_VERSATILES=1
for SCRIPT in $PWD/themes/projektemacher-base/scripts/init/*.sh ; do
    if [ "$(basename "$SCRIPT")" = "package.json.sh" ] ; then
        continue
    fi
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
