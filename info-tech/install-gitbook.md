# Install Gitbook

## Install on Ubuntu/Fedora

Reference link: [uc3m: Install Gitbook](https://robots.uc3m.es/installation-guides/install-gitbook.html)

In the site page, I know that gitbook 3.2.3 only works with node version 10.

Than, I find [Node Version Manager](https://github.com/nvm-sh/nvm) which is very useful.

Here are the steps:
  * Install nvm: `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`
  * Install nodejs 10: `nvm install 10`
    * nodejs 10 is use after installed, with npm v6.14 in it.
  * Install gitbook: `npm install -g gitbook-cli`, npm is which in nvm in user local that we could install with out sudo .
  * gitbook init: `gitbook -V` (or `gitbook install`)


## Install on MacOS


## Use Gitbook Docker

  * First of all, install docker: https://docs.docker.com/engine/install/
    * you need to start docker after installed: `sudo systemctl start docker`
    * test docker: `sudo docker run hello-world`
    * Then add yourself into docker group, `usemod -aG docker username`.

  * Fellah/gitbook: https://github.com/Fellah/gitbook
    * `docker pull fellal/gitbook`
    * `docker run -p 80:4000 -v $PWD:/srv/gitbook fellah/gitbook` run gitbook serve (see Dockerfile in github code). this will use 80 port which is not recommanded.
    * `docker run -v $PWD:/srv/gitbook -v $PWD/html:/srv/html fellah/gitbook gitbook build . /srv/html`, generate html files in $PWD/html.
  * Another Chinese reference: https://www.cnblogs.com/xiaomingtx/p/5622514.html

