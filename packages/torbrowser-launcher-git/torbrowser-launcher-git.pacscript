name="torbrowser-launcher-git"
gives="torbrowser-launcher"
breaks="${gives}"
repology=("project: ${gives}")
url="https://github.com/micahflee/torbrowser-launcher.git"
build_depends="build-essential"
depends="gettext python3-pip dh-python python3-all python3-pyqt5 python3-gpg python3-requests python3-socks python3-packaging gnupg2 tor"
description="Securely and easily download, verify, install, and launch Tor Browser in Linux"
optdepends=("apparmor: support for apparmor profiles")
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

pkgver() {
    git ls-remote "${url}" develop | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
    sudo pip3 install distro
}

build() {
    python3 setup.py build
}

install() {
    sudo python3 setup.py install --root="${STOWDIR}/${name}" --optimize=1
}
