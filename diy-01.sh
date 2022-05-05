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

# 添加源
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git openwrt-passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#echo 'src-git vssr https://github.com/jerrykuku/luci-app-vssr' >>feeds.conf.default
#vssr依赖
#echo 'src-git maxminddb https://github.com/jerrykuku/lua-maxminddbr.git' >>feeds.conf.default

# 修改内核为5.4
sed -i 's/PATCHVER:=5.15/PATCHVER:=5.10/g' target/linux/x86/Makefile

# 软件中心istore
svn co https://github.com/linkease/istore/trunk/luci/luci-app-store package/luci-app-store
rm -rf package/luci-app-store/.svn
sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-store/Makefile
sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/luci-app-store/luasrc/controller/store.lua

# luci-theme-argon改版主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
rm -rf package/luci-theme-argon/README* package/luci-theme-argon/Screenshots/
#sed -i 's/luci-theme-argon-18.06/luci-theme-argon/g' package/luci-theme-argon/Makefile

# luci-theme-opentopd主题
git clone https://github.com/sirpdboy/luci-theme-opentopd package/luci-theme-opentopd
rm -rf package/luci-theme-opentopd/README* package/luci-theme-opentopd/doc/

# ikoolproxy去广告插件
#git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
#rm -rf package/luci-app-ikoolproxy/README*

# luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall

# luci-app-vssr及依赖
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
