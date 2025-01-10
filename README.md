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
   cd ~/openwrt
   ```
   
- 更改Luci为18.06
   ```bash
   sed -i '/^#src-git luci https:\/\/github.com\/coolsnowwolf\/luci$/s/^#//' feeds.conf.default
   sed -i '/^src-git luci https:\/\/github.com\/coolsnowwolf\/luci\.git;openwrt-23\.05$/s/^/#/' feeds.conf.default
   ```
- 添加OpenClash插件库
   ```bash
   echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default
   ```

- 添加passwall插件库
   ```bash
   echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
   echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
   ```

- 添加luci-app-msd_lite
  ```bash
  cd package/lean
  git clone https://github.com/ximiTech/luci-app-msd_lite.git
  cd ~/openwrt
  ```

- 更新feeds源
  ```bash
  ./scripts/feeds update -a
  ./scripts/feeds install -a
  ```
  强制安装（-f）feeds，如feeds和lean源有同名的package，强制安装feeds里的
  ```bash
  ./scripts/feeds update -a
  ./scripts/feeds install -a -f 
  ```

- 添加msd_lite
  ```bash
  rm -rf feeds/packages/net/msd_lite
  git clone https://github.com/ximiTech/msd_lite.git feeds/packages/net/msd_lite
  ```

- 添加argon主题
  ```bash
  rm -rf feeds/luci/themes/luci-theme-argon
  git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
  rm -rf feeds/luci/applications/luci-app-argon-config
  git clone https://github.com/jerrykuku/luci-app-argon-config.git feeds/luci/applications/luci-app-argon-config
  ```

- 添加ddns-go
  ```bash
  git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
  ```

- 修改默认IP、密码为空、固件信息
  ```bash
  sed -i 's/192.168.1.1/192.168.100.10/g' package/base-files/files/bin/config_generate
  sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings
  sed -i "s/LEDE /Z-turn /g" package/lean/default-settings/files/zzz-default-settings
  ```

- 配置.config
  ```bash
  make menuconfig
  ```
  ```bash
  # Extra packages中  勾选ipv6helper 
  # Network----Firewall---ip6tables 中勾选全部
  ```
  
- 下载dl库，编译固件
  ```bash
  make -j8 download V=s
  make V=s -j$(nproc)
  ```

#
- ❤️  [Lean](https://github.com/coolsnowwolf/lede) |  [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)  |  [ximiTech ](https://github.com/ximiTech)

