#!/bin/sh
# temp dir used to store downloaded/extracted files before copying
TEMPCHROMEDIR="/tmp/userchrome"
# find profile dir in about:profiles "root directory"
PROFILEDIR="/Users/${USERNAME}/Library/Application Support/Firefox/Profiles/xxxxxxxx.default-release"
# file to download
UPDATEURL="https://github.com/bmFtZQ/edge-frfox/archive/refs/heads/main.tar.gz"

# make temp dir
mkdir -p "$TEMPCHROMEDIR"
# download file using curl
curl -Lo "$TEMPCHROMEDIR/theme.tar.gz" "$UPDATEURL"
# extract archive into temp dir
tar -xf "$TEMPCHROMEDIR/theme.tar.gz" --strip 1 -C "$TEMPCHROMEDIR"
# remove existing chrome dir
rm -rf "$PROFILEDIR/chrome"
# copy chrome folder to profile
cp -r "${TEMPCHROMEDIR}/chrome" "$PROFILEDIR/chrome"
# remove temp dir
rm -rf "$TEMPCHROMEDIR"
