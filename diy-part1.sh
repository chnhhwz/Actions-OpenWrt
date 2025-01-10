# 更改LuCi为18.06分支
sed -i '/^#src-git luci https:\/\/github.com\/coolsnowwolf\/luci$/s/^#//' feeds.conf.default 
sed -i '/^src-git luci https:\/\/github.com\/coolsnowwolf\/luci\.git;openwrt-23\.05$/s/^/#/' feeds.conf.default

# 添加OpenClash插件
echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default

# 添加PassWall插件
#echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
#echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
