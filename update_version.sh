#!/bin/sh

set -e

executable="burgaur"
version=$(grep -oP '__version__ = \K(.*)' "${executable}" | sed 's|"||g')
current_date=$(date +'%Y-%m-%d')

echo "Updating version to ${version}"

sed "s|:Version: .*|:Version: ${version}|" -i README.rst
sed "s|pkgver=.*|pkgver=${version}|" -i misc/PKGBUILD
sed "s|pkgver=.*|pkgver=${version}|" -i misc/PKGBUILD.stable

echo "Updating date to ${current_date}"

sed "s|:Date: .*|:Date: ${current_date}|" -i README.rst

echo "Generating manpage"

rst2man README.rst burgaur.1
gzip -f burgaur.1
