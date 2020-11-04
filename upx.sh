
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

############################
#
# 请提前安装 upx 并登录又拍云
#
############################

# 切换到正确到存储空间
upx switch static0901-upyun

# 使用 sync 同步本地文件到又拍云
# 避免同步 .git 目录和 DS_Store 文件，所以手动制定同步目标
upx sync -w 500 ./files /files
upx sync -w 500 ./images /images
