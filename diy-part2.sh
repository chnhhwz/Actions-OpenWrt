# 修改默认IP 
sed -i 's/192.168.1.1/192.168.100.10/g' package/base-files/files/bin/config_generate

# 修改版本信息
sed -i "s/LEDE /Z-turn /g" package/lean/default-settings/files/zzz-default-settings

# 修改密码为空
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings

# 安装MultiSD_Lite
rm -rf feeds/packages/net/msd_lite
git clone https://github.com/ximiTech/msd_lite.git feeds/packages/net/msd_lite

# 安装argon主题 (使用kenzok8插件集合仓库时不用添加)
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon

rm -rf feeds/luci/applications/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-app-argon-config.git feeds/luci/applications/luci-app-argon-config

# 更改源码版本
#sed -i "s/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=6.1/g" target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile

# 修改默认主题
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
