#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}

git clone --depth 1 -b 18.06 https://github.com/kiddin9/luci-theme-edge
git clone --depth 1 https://github.com/yaof2/luci-app-ikoolproxy
git clone --depth 1 https://github.com/tty228/luci-app-serverchan
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-app-vssr
git clone --depth 1 https://github.com/sirpdboy/luci-app-advanced
git clone --depth 1 https://github.com/esirplayground/luci-app-poweroff
git clone --depth 1 https://github.com/hubbylei/luci-app-clash
git clone --depth 1 https://github.com/Jason6111/luci-app-netdata
git clone --depth 1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
git clone --depth 1 https://github.com/QiuSimons/openwrt-mos && mv -n openwrt-mos/*mosdns ./; rm -rf openwrt-mos
git clone --depth 1 https://github.com/thinktip/luci-theme-neobird
git clone --depth 1 -b lede https://github.com/pymumu/luci-app-smartdns
git clone --depth 1 https://github.com/pymumu/openwrt-smartdns smartdns
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall passwall1 && mv -n passwall1/luci-app-passwall ./; rm -rf passwall1
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./; rm -rf passwall2
git clone --depth 1 https://github.com/kiddin9/openwrt-bypass && mv -n openwrt-bypass/luci-app-bypass openwrt-bypass/lua-maxminddb ./; rm -rf openwrt-bypass
git clone --depth 1 https://github.com/ophub/luci-app-amlogic amlogic && mv -n amlogic/luci-app-amlogic ./; rm -rf amlogic
git clone --depth 1 https://github.com/linkease/istore && mv -n istore/luci/* ./; rm -rf istore
git clone --depth 1 https://github.com/linkease/nas-packages && mv -n nas-packages/network/services/ddnsto ./; rm -rf nas-packages
git clone --depth 1 https://github.com/linkease/nas-packages-luci && mv -n nas-packages-luci/luci/luci-app-ddnsto ./; rm -rf nas-packages-luci
git clone --depth 1 https://github.com/messense/aliyundrive-webdav aliyundrive && mv -n aliyundrive/openwrt/* ./; rm -rf aliyundrive
git clone --depth 1 https://github.com/messense/aliyundrive-fuse aliyundrive && mv -n aliyundrive/openwrt/* ./; rm -rf aliyundrive
git clone --depth 1 https://github.com/lisaac/luci-app-dockerman dockerman && mv -n dockerman/applications/* ./; rm -rf dockerman

svn export https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome
svn export https://github.com/kiddin9/openwrt-packages/trunk/adguardhome
svn export https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy
svn export https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-ssr-mudb-server
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-eqos
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-aliddns
svn export https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-gowebdav
svn export https://github.com/immortalwrt/packages/trunk/net/gowebdav
svn export https://github.com/coolsnowwolf/packages/trunk/multimedia/UnblockNeteaseMusic
svn export https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-wizard
svn export https://github.com/haiibo/packages/trunk/luci-theme-atmaterial
svn export https://github.com/haiibo/packages/trunk/luci-theme-atmaterial_new
svn export https://github.com/haiibo/packages/trunk/luci-theme-opentomcat
svn export https://github.com/haiibo/packages/trunk/luci-theme-opentomato
svn export https://github.com/haiibo/packages/trunk/luci-theme-netgear
svn export https://github.com/haiibo/packages/trunk/luci-app-wrtbwmon
svn export https://github.com/haiibo/packages/trunk/wrtbwmon
svn export https://github.com/haiibo/packages/trunk/luci-app-onliner

mkdir -p helloworld
pushd helloworld
git clone --depth 1 -b packages https://github.com/xiaorouji/openwrt-passwall && mv -n openwrt-passwall/chinadns-ng openwrt-passwall/dns2socks openwrt-passwall/dns2tcp openwrt-passwall/hysteria openwrt-passwall/ipt2socks openwrt-passwall/pdnsd-alt openwrt-passwall/trojan-go openwrt-passwall/trojan-plus openwrt-passwall/ssocks openwrt-passwall/microsocks openwrt-passwall/brook ./; rm -rf openwrt-passwall
svn export --force https://github.com/openwrt/packages/trunk/net/shadowsocks-libev
svn export --force https://github.com/fw876/helloworld/trunk/simple-obfs
svn export --force https://github.com/fw876/helloworld/trunk/shadowsocks-rust
svn export --force https://github.com/fw876/helloworld/trunk/shadowsocksr-libev
svn export --force https://github.com/fw876/helloworld/trunk/trojan
svn export --force https://github.com/fw876/helloworld/trunk/v2ray-core
svn export --force https://github.com/fw876/helloworld/trunk/v2ray-geodata
svn export --force https://github.com/fw876/helloworld/trunk/v2ray-plugin
svn export --force https://github.com/fw876/helloworld/trunk/v2raya
svn export --force https://github.com/fw876/helloworld/trunk/xray-core
svn export --force https://github.com/fw876/helloworld/trunk/xray-plugin
svn export --force https://github.com/fw876/helloworld/trunk/lua-neturl
svn export --force https://github.com/fw876/helloworld/trunk/naiveproxy
svn export --force https://github.com/fw876/helloworld/trunk/sagernet-core
svn export --force https://github.com/fw876/helloworld/trunk/tcping
popd

rm -rf ./*/.git & rm -rf ./*/.gitattributes & rm -rf ./*/LICENSE
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore
rm -rf ./*/README.md & rm -rf ./*/ReadMe.md

find -type f -name Makefile -exec sed -ri 's/mosdns[-_]neo/mosdns/g' {} \;

sed -i \
-e 's?\.\./\.\./\(lang\|devel\)?$(TOPDIR)/feeds/packages/\1?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's?2. Clash For OpenWRT?3. Applications?' \
*/Makefile

sed -i 's/luci-lib-ipkg/luci-base/g' luci-app-store/Makefile
sed -i 's/luci-lib-ipkg/luci-base/g' luci-app-bypass/Makefile
sed -i 's/"admin"/"admin", "system"/g' luci-app-wizard/files/luci/controller/wizard.lua

bash diy/create_acl_for_luci.sh -a >/dev/null 2>&1
bash diy/convert_translation.sh -a >/dev/null 2>&1

rm -rf create_acl_for_luci.err & rm -rf create_acl_for_luci.ok
rm -rf create_acl_for_luci.warn

exit 0