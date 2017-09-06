# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator

CUDA_PV=9.0

if [ $(get_after_major_version) == 0 ]; then
	MYD=$(get_major_version)
else
	MYD=$(get_version_component_range 1-2)
fi

einfo "version is ${MYD} from $(get_major_version) and $(get_version_component_range 1-2)"

DESCRIPTION="NVIDIA Accelerated Deep Learning on GPU library"
HOMEPAGE="https://developer.nvidia.com/cuDNN"
SRC_URI="cudnn-${CUDA_PV}-linux-x64-v${MYD}.tgz"

SLOT="0/6"
KEYWORDS="~amd64 ~amd64-linux"
RESTRICT="fetch"
LICENSE="NVIDIA-cuDNN"

S="${WORKDIR}"

DEPENDS="=dev-util/nvidia-cuda-toolkit-${CUDA_PV}*"
RDEPENDS="${DEPENDS}"

src_install() {
	insinto /opt
	doins -r *
}
