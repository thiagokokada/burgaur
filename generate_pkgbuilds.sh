#!/bin/sh

set -e

executable="burgaur"
version=$(grep -oP '__version__ = \K(.*)' "${executable}" | sed 's|"||g')
url="https://github.com/m45t3r/burgaur"
source="${url}/archive/${version}.tar.gz"

echo "Downloading ${source} and calculating sha256sum"

sha256sum=$(curl -L --silent ${source} | sha256sum -b - | cut -d" " -f1)

echo "Calculated ${version}.tar.gz sha256sum is ${sha256sum}. Updating PKGBUILD.stable"

sed "s|sha256sums=.*|sha256sums=(\'${sha256sum}\')|" -i misc/PKGBUILD.stable

echo "Generating source packages with makepkg --source"

cd misc
for pkgbuild in "PKGBUILD" "PKGBUILD.stable"; do
  makepkg --clean --cleanbuild --noarchive -p ${pkgbuild}
  makepkg --source --force -p ${pkgbuild}
done
cd -
