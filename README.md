# 说明
1 利用[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)的Actions编译[Lean大源码的OpenWrt](https://github.com/coolsnowwolf/lede)

2 .github/workflows/Build.yml的env参数说明

|  环境变量   | 功能  |
|  ----  | ----  |
| REPO_URL  | 源码仓库地址 |
| REPO_BRANCH  | 源码的分支 |
| FEEDS_CONF | 自定义feeds.conf.default文件名 |
| CONFIG_FILE  | 自定义.config文件名 |
| DIY_P1_SH  | 自定义第一个shell脚本，一般用于安装依赖和插件。比如openclash、ssrp+。注意脚本中引用的依赖，如果上游依赖有问题会导致编译不成功 |
| DIY_P2_SH  | 自定义第二个shell脚本，一般用于设置themen、ip之类的。这个脚本影响的是你的页面样式、访问ip等，编译完成后需要先看里面的配置再访问 |
| UPLOAD_BIN_DIR | 上传 bin 目录。即包含所有 ipk 文件和固件的目录。默认false |
| UPLOAD_FIRMWARE | 上传固件目录。默认true |
| UPLOAD_COWTRANSFER | 上传固件到奶牛快传。默认false |
| UPLOAD_WERANSFER | 上传固件到 WeTransfer 。默认false |
|UPLOAD_RELEASE | 上传固件到 releases 。默认false |
| TZ  | 时区，基本不用关注。默认采用中国上海的时区。 |

## 其他：
- 《[拉取插件命令和各种命令的简单介绍](https://github.com/cddcx/immortalwrt-OpenWrt/blob/main/%E8%AF%B4%E6%98%8E/ming.md)》
- 《[X86编译时选固件格式和设置overlay空间容量](https://github.com/cddcx/immortalwrt-OpenWrt/blob/main/%E8%AF%B4%E6%98%8E/overlay.md)》
- 《[IPV4/IPV6选择](https://github.com/cddcx/immortalwrt-OpenWrt/blob/main/%E8%AF%B4%E6%98%8E/ip.md)》

## 鸣谢
> [`Lean`](https://github.com/coolsnowwolf/lede)
> [`P3TERX`](https://github.com/P3TERX/Actions-OpenWrt)
> [`感谢各位大佬的插件`](#/README.md)
