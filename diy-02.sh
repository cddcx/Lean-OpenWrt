#!/bin/bash

#1. 默认ip
#sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

#2 修改密码
sed -i 's/root::0:0:99999:7:::/root:$1$SOP5eWTA$fJV8ty3QohO0chErhlxCm1:18775:0:99999:7:::/g' package/base-files/files/etc/shadow

#3 修改默认主题
sed -i 's/bootstrap/argon/' feeds/luci/collections/luci/Makefile

# 修改网络
#sed -i 's/eth0/eth0 eth2 eth3/' package/base-files/files/etc/board.d/99-default_network
#sed -i '2i # network config' package/default-settings/files/zzz-default-settings
#sed -i "3i uci set network.wan.proto='pppoe'" package/default-settings/files/zzz-default-settings
#sed -i "4i uci set network.wan.username='CD0283366379757'" package/default-settings/files/zzz-default-settings
#sed -i "5i uci set network.wan.password='19701115'" package/default-settings/files/zzz-default-settings
#sed -i "6i uci set network.wan.ifname='eth1'" package/default-settings/files/zzz-default-settings
#sed -i "7i uci set network.wan6.ifname='eth1'" package/default-settings/files/zzz-default-settings
#sed -i "8i uci set network.IPTV.proto='static'" package/default-settings/files/zzz-default-settings
#sed -i "9i uci set network.IPTV.ifname='eth1.43'" package/default-settings/files/zzz-default-settings
#sed -i "10i uci set network.IPTV.ipaddr='192.168.12.12'" package/default-settings/files/zzz-default-settings
#sed -i "11i uci set network.IPTV.netmask='255.255.255.0'" package/default-settings/files/zzz-default-settings
#sed -i '12i uci commit network' package/default-settings/files/zzz-default-settings
