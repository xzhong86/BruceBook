#!/bin/sh

html_dir=/var/www/html
folder=gitbook
dest=$html_dir/$folder

rm -fr $dest
cp -r _book $dest

ip=`hostname -I | cut -d ' ' -f 1`
echo "Access http://$ip/$folder"

