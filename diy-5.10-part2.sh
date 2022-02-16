#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.3/g' package/base-files/files/bin/config_generate
########### 更改大雕源码（可选）###########
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' target/linux/x86/Makefile
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt Compiled by Xiaosage '/g" ./package/lean/default-settings/files/zzz-default-settings
# 删除自定义源默认的 argon 主题
rm -rf package/lean/luci-theme-argon
# 拉取 argon 原作者的源码
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon-jerrykuku
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
########### 安装smartdns（必选）###########
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
########### 安装atmaterial主题###########
git clone https://github.com/esirplayground/luci-theme-atmaterial-ColorIcon.git package/luci-theme-atmaterial-ColorIcon-esirplayground
########### 安装neobird主题###########
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird-thinktip
