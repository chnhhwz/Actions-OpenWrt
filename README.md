### Actions-OpenWrt
#
- 内核版本 5.15.175
- root  @  192.168.100.10
- ArgonTheme | PassWall | AccessControl | DDNS-GO | Msd_Lite | WOL | FrpS/C | UPnP | KMS | Qos | Eqos


  # Actions-OpenWrt

- 内核版本 5.15.175
- root  @  192.168.100.10
- ArgonTheme | PassWall | AccessControl | DDNS-GO | Msd_Lite | WOL | FrpS/C | UPnP | KMS | Qos | Eqos
#

- Debian 11 或 Ubuntu LTS
- 安装编译依赖

   ```bash
   sudo apt update -y
   sudo apt full-upgrade -y
   sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
   bzip2 ccache clang cmake cpio curl device-tree-compiler flex gawk gcc-multilib g++-multilib gettext \
   genisoimage git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libfuse-dev libglib2.0-dev \
   libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libpython3-dev \
   libreadline-dev libssl-dev libtool llvm lrzsz msmtp ninja-build p7zip p7zip-full patch pkgconf \
   python3 python3-pyelftools python3-setuptools qemu-utils rsync scons squashfs-tools subversion \
   swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
   ```

- 下载源代码，更新 feeds 并选择配置

   ```bash
   git clone https://github.com/coolsnowwolf/lede openwrt
   cd openwrt
   ./scripts/feeds update -a
   ./scripts/feeds install -a
   make menuconfig
   ```

- 下载dl库，编译固件
  ```bash
  make -j8 download V=s
  make V=s -j$(nproc)
  ```

#
- ❤️  [Lean](https://github.com/coolsnowwolf/lede) |  [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)  |  [ximiTech ](https://github.com/ximiTech)

