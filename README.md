# 静态文件存储仓库

使用 Markdown 写文章非常简洁方便，但是这种方式存在着一个比较难以解决的问题，那就是**如果妥善且方便地管理文章中的图片文件**？

我的方案是使用 PicGo 上传图片，上传到「[又拍云](https://www.upyun.com/)」存储空间，同时 GitHub 做文件备份。

如果感觉 [GitHub](https://github.com/) 访问速度慢，可以同时将[码云](https://gitee.com/)作为国内备份方案。使用 GitHub 做文件备份还有一个好处是可以免费使用 [jsDelivr](https://www.jsdelivr.com/) 的 CDN 加速。

> [PicGo](https://github.com/Molunerfinn/PicGo/) 是一个用于快速上传图片并获取图片 URL 链接的工具

这个方案是使用 git 仓库（GitHub 和 码云/coding）备份文件，使用 CDN （又拍云和 jsDelivr）来提升图片访问速度，这两个步骤互为备份，确保数据不会丢失以及图片访问链接不会失效。将来不管哪个地方出问题，我都有相应的 Plan B。


## 步入正题

### 又拍云 CDN

国内云存储厂商那么多，为何单单选中了「又拍云」呢，答案就是：又拍云可以白嫖啊，白嫖的快乐你懂吗？

看这里：

> 「又拍云联盟」活动每月提供 10G 免费存储空间和 15G 免费 CDN 流量(HTTP/HTTPS 均可用)，活动页面见：https://www.upyun.com/league

但是要使用又拍云的服务，需要有一个已经备案成功的域名，事实上不仅仅是又拍云，只要是国内的厂商都需要你有一个备案的域名。

已经绑定了域名 `https://static.webjam.cn`，所以文件对应的 CDN 地址格式是：

```
https://static.webjam.cn/<文件目录+文件名>
```

例如: 看我蠢萌的菠萝头: `https://static.webjam.cn/images/whoami/boluotou.jpg`

![](https://static.webjam.cn/images/whoami/boluotou.jpg)

这个方案有几点风险：

1. 需要一个域名，且域名需要备案，以及域名记得及时续费
2. 使用的是又拍云免费 CDN，需要关注该活动是否结束
3. 又拍云可能出现的故障

但是这几点在我看来都没必要过分担忧，假如将来出现任何问题，我们可以随时将备份文件存到其他云存储厂商那里，甚至直接使用 jsDelivr 提供的 CDN 服务问题也不大，只需要将文章中图片链接的前缀统一替换即可。

洒洒水啦～

### jsDelivr CDN

jsDelivr 的使用则简单多了，只需要你有在 GitHub 创建一个公开的仓库即可。

> jsDelivr 支持对 GitHub 仓库文件进行 CDN 加速，见 https://www.jsdelivr.com/?docs=gh

jsDelivr 对应的 CDN 链接格式如下：

```
https://cdn.jsdelivr.net/gh/<GitHub 用户名>/<仓库名>/<文件目录+文件名>
```

由于这是一个 git 仓库，所以上面链接是指向 `main` 分支（以前叫做 `master` 分支）最新提交的文件。

如果你想指定某个版本

```
https://cdn.jsdelivr.net/gh/<GitHub 用户名>/<仓库名>@<version>/<文件目录+文件名>
```

我在使用的时候不需要指定版本，所以链接格式则是：

```
https://cdn.jsdelivr.net/gh/wencaizhang/static/<文件目录+文件名>
```

例如: 调皮的吐舌头表情 `https://cdn.jsdelivr.net/gh/wencaizhang/static/images/whoami/tiaopi.png`

![](https://static.webjam.cn/images/whoami/tiaopi.png)

这个方案的好处是对用户要求极少，只需创建一个公开的 GitHub 仓库，无需域名和备案。

## 关于容量

既然是作为文件存储仓库了，则必然要关心最多可以存储多少大小到文件。

前面有提到过，「又拍云联盟」活动每月提供 10G 免费存储空间和 15G 免费 CDN 流量，所以这一块不用担心。

GitHub 单个仓库的最大体积是 1 GB，详情看[这里](https://docs.github.com/cn/free-pro-team@latest/github/managing-large-files/what-is-my-disk-quota)。

而码云单仓库最大体积只有 500 M，详情看[这里](https://gitee.com/help/articles/4232#article-header0)。

出于一种忧虑的心态，我看了眼国内其他代码托管平台的情况，发现 coding 单仓库最大体积是 2 GB，在[这里](https://coding.net/pricing)可以看到免费版就足以使用了，惊喜～

所以如果仓库体积超过 500 M 之后，可以考虑从码云转投到 codeing，不过到那时我的文章数量应该也很客观了吧，嘻嘻～

所以其实短期内应该不用担心仓库空间不够用的问题，假如真到了那一天自然也会有相应的解决方法 :)

事实上，**Git 并非是一个备份工具**，所以这仅仅是一个思路（因为习惯了把代码放在 GitHub 上同步和备份），实际上将 git 仓库改为专业的文件备份工具，如 Dropbox、坚果云等，其实**备份效果和备份速度更好**。

## 最后

最后我有一个要求，希望有人可以满足我。

![](https://cdn.jsdelivr.net/gh/wencaizhang/static/images/%E7%BB%99%E6%88%91%E4%B8%80%E5%BC%A0%E5%BD%A9%E7%A5%A8%EF%BC%8C%E8%A6%81%E8%83%BD%E4%B8%AD%E5%A5%96%E7%9A%84.png)

