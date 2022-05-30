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


