#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#


# 修改默认IP 
sed -i 's/192.168.1.1/192.168.100.10/g' package/base-files/files/bin/config_generate

# 修改版本信息
sed -i "s/OpenWrt /w.z $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改主机名
sed -i 's/OpenWrt/WangZ-Router/g' package/base-files/files/bin/config_generate

# 修改密码为空
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

# 删除可能冲突的插件
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb}

# 安装MultiSD_Lite
rm -rf feeds/packages/net/msd_lite
git clone https://github.com/ximiTech/msd_lite.git feeds/packages/net/msd_lite

# 更改源码版本
# sed -i "s/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=6.1/g" target/linux/x86/Makefile

# 修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
