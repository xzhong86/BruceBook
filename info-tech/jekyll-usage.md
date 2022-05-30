# Jekyll Usage

## Install

On Fedora36, the simplest way is run `dnf install rubygem-jekyll`, and do NOT run 'gem install jekyll'.
dnf will install jekyll into /usr/local/bin, and gem install into /usr/bin and doesn't works well.

On Ubuntu, 'gem install jekyll' works well.

## Use Jekyll 

  * create blog folder: `jekyll new blog-name`
  * build and start server: `cd blog-name ; jekyll serve` which same as gitbook.
  * only build: `jekyll build` or `jekyll build -s . -d /var/www/html/blog`
    * change baseurl in \_config.yml before push into http server.

### Use post-receive hook

Used on my web server, to automatically push to github and update web pages.


## Others
创建单独的页面，在根目录或者任何文件夹里面创建markdown文件或者html文件即可。 markdown文件需要在文件头给出layout: page 才能生成。

更新About页面时发现一个有用的图标生成网站：https://icon-sets.iconify.design/logos/jekyll/， 我用它生成了jekyll的图标，且可以设置图标大小。

