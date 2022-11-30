#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 修改内核
#sed -i 's/PATCHVER:=5.15/PATCHVER:=5.19/g' target/linux/x86/Makefile
#sed -i 's/PATCHVER:=5.15/PATCHVER:=5.10/g' target/linux/x86/Makefile
sed -i 's/PATCHVER:=5.15/PATCHVER:=5.4/g' target/linux/x86/Makefile

# 添加源
#echo 'src-git jerryk https://github.com/jerrykuku/openwrt-package' >>feeds.conf.default
#git clone https://github.com/fw876/helloworld.git package/ssr
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git openwrt-passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git vssr https://github.com/jerrykuku/luci-app-vssr' >>feeds.conf.default
#vssr依赖
#echo 'src-git maxminddb https://github.com/jerrykuku/lua-maxminddbr.git' >>feeds.conf.default

# 软件中心istore
#svn co https://github.com/linkease/istore/trunk/luci package/istore
#svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
#rm -rf package/istore/.svn
git clone https://github.com/linkease/istore.git package/istore
git clone https://github.com/linkease/istore-ui.git package/istore-ui
sed -i 's/luci-lib-ipkg/luci-base/g' package/istore/luci/luci-app-store/Makefile
sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/istore/luci/luci-app-store/luasrc/controller/store.lua

# luci-theme-argon改版主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
sed -i 's/luci-theme-argon-18.06/luci-theme-argon/g' package/luci-theme-argon/Makefile

# luci-theme-opentopd主题
git clone https://github.com/sirpdboy/luci-theme-opentopd package/luci-theme-opentopd
rm -rf package/luci-theme-opentopd/README* package/luci-theme-opentopd/doc/

# ikoolproxy去广告插件
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
rm -rf package/luci-app-ikoolproxy/README*

# luci-app-ssr
git clone https://github.com/fw876/helloworld.git package/ssr

# luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
#svn co https://github.com/xiaorouji/openwrt-passwall/tree/luci/luci-app-passwall openwrt-passwall/luci-app-passwall
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
git clone -b luci https://github.com/xiaorouji/openwrt-passwall package/passwall

# luci-app-vssr及依赖
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr

# luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
rm -rf package/luci-app-openclash/.svn

# luci-app-v2ray
git clone https://github.com/kuoruan/openwrt-v2ray.git package/v2ray-core
git clone https://github.com/kuoruan/luci-app-v2ray.git
