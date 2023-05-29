# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Lightly: A modern and minimalist theme for KDE Plasma 5"
HOMEPAGE="https://github.com/Luwx/Lightly"



if [[ ${PV} == 9999 ]]; then
	inherit git-r3

	EGIT_REPO_URI="
		https://github.com/Luwx/Lightly
	"
else
	MY_PN="Lightly"

	SRC_URI="https://github.com/Luwx/Lightly/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

	S="${WORKDIR}/${PN^}-${PV}"

	KEYWORDS="~amd64 ~arm64"
fi


IUSE="test"
RESTRICT="!test? ( test )"

LICENSE="GPL-2"
SLOT="0"

src_configure() {
    local mycmakeargs=(
        -DBUILD_TESTING=$(usex test)
    )
    cmake_src_configure
}


DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
