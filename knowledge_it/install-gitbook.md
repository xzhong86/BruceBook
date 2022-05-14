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



