#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 添加SSRplus插件
# 使用Lean源
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# 使用其他源
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# 添加OpenClash插件
echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default

# 添加PassWall插件
# echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
# echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"

# 添加kenzok8插件集合（包含SSRplus、OpenClash、PassWall）
# echo 'src-git smpackage https://github.com/kenzok8/small-package' >>feeds.conf.default
