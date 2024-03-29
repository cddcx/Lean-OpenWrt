#!/bin/bash

#1. 默认ip
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

#2 修改密码
sed -i 's/root::0:0:99999:7:::/root:$1$SOP5eWTA$fJV8ty3QohO0chErhlxCm1:18775:0:99999:7:::/g' package/base-files/files/etc/shadow

#3 修改默认主题
#sed -i 's/bootstrap/opentopd/' feeds/luci/collections/luci/Makefile
sed -i '/set luci.main.mediaurlbase*/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-opentopd/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-opentopd/g' feeds/luci/collections/luci-nginx/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-opentopd/g' feeds/luci/collections/luci-ssl-nginx/Makefile

# 修改include/target.mk
sed -i "s/ddns-scripts_aliyun ddns-scripts_dnspod luci-app-ddns luci-app-upnp luci-app-autoreboot/luci-app-upnp/" include/target.mk
sed -i "s/luci-app-arpbind luci-app-filetransfer luci-app-vsftpd luci-app-ssr-plus luci-app-vlmcsd/luci-app-firewall/" include/target.mk
sed -i "s/luci-app-accesscontrol luci-app-nlbwmon luci-app-turboacc luci-app-wol/luci-app-opkg/" include/target.mk


# 修改target/linux/x86/Makefile
sed -i "s/luci-app-adbyby-plus luci-app-ipsec-vpnd luci-proto-bonding luci-app-diskman/luci-app-istorex/" target/linux/x86/Makefile
sed -i "s/luci-app-unblockmusic luci-app-zerotier luci-app-xlnetacc ddns-scripts_aliyun ddns-scripts_dnspod ca-bundle luci-app-wireguard luci-app-ttyd/ca-bundle luci-app-openclash luci-app-udpxy/" target/linux/x86/Makefile

#修改iStore
#sed -i 's/luci-lib-ipkg/luci-base/g' package/linkease/istore/luci/luci-app-store/Makefile
#sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/linkease/istore/luci/luci-app-store/luasrc/controller/store.lua

# 整理
rm -rf feeds/luci/theme/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-serverchan
rm -rf feeds/packages/net/adguardhome
rm -rf feeds/packages/net/smartdns
#rm -rf feeds/packages/net/mosdns

# 修改网络
#sed -i 's/eth0/eth0 eth2 eth3/' package/base-files/files/etc/board.d/99-default_network
#sed -i '2i # network config' package/lean/default-settings/files/zzz-default-settings
#sed -i "3i uci set network.wan.proto='pppoe'" package/lean/default-settings/files/zzz-default-settings
#sed -i "4i uci set network.wan.username='CD0283366379757'" package/lean/default-settings/files/zzz-default-settings
#sed -i "5i uci set network.wan.password='19701115'" package/lean/default-settings/files/zzz-default-settings
#sed -i "6i uci set network.wan.ifname='eth1'" package/lean/default-settings/files/zzz-default-settings
#sed -i "7i uci set network.wan6.ifname='eth1'" package/lean/default-settings/files/zzz-default-settings
#set -i "8i uci network.lan.delegate='0'" package/lean/default-settings/files/zzz-default-settings    # 去掉LAN口使用内置的 IPv6 管理
#sed -i '8i uci commit network' package/lean/default-settings/files/zzz-default-settings
