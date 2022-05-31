# 编码与加密

## Base64编码
base64 是很有趣的编码算法（命令），例如： 它可以把二进制文件编码成字符串，这样可以很方便的嵌入到文本中去。
这个工具在网页领域用的很多，主要是方便在文本为基础的网络环境（http）中传输各种二进制数据。

Ruby Python JS等脚本环境以及 C/C++库都有现成的base64库，可以直接使用，自己写也很简单。

Linux 下有对应base64 命令，使用很方便：
执行 `base64 xxx.jpg > xxx.b64.txt` 就能将图片转为为字符串， 
执行 `base64 -d xxx.b64.txt > xxx.jpg` 就能将字符串转换回图片。

Base64 编码将6bit 数据编码到64个可打印字符中去， 一个字符通常为8bit，6bit数据用8bit存储（传输），数据大小增加33%。

## 对称加密
使用加密有很好的加密效果，又不会增加数据量，比较好用。 
非对称加密很安全，但是计算过程复杂，通常用来在一开始传输临时密匙用，完成密匙传输后就用对称加密算法加密传输的数据。

Linx 下可以使用 openssl 命令来做加解密：
加密 `openssl aes-128-cbc -salt -in [INPUT FILE] -out output.aes -k [PASSWORD]`
解密 `openssl aes-128-cbc -d -salt -in output.aes -out [FILE] -k [PASSWORD]`
`-salt` 参数会增加一个 “Salted” 文件头在加密后的文件里面， 通过 `xxd -l 64 output.aes` 可以看到。参数 `-nosalt`可以消除该文件头特征。

`openssl help` 可以查看所有支持的加密算法。

## 其他
`git format-patch` 命令可以将指定的提交记录（包括commit log 和 完整diff）导出到文件中去（每个提交是一个文件），方便加到邮件中去。

  * `git format-patch -N` ： 产生提交的patch文件，N为最近提交的个数
  * `git am *.patch` : 接收patch并提交， `git apply xxx.patch` 接受一个patch

> 以上信息组合起来能干什么用呢？

