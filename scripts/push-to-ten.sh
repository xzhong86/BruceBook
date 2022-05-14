#!/bin/sh

# on remote server, create bare repo like:
#   $ mkdir repo/gitbook && cd repo/gitbook
#   $ git init --bare
#
# git remote add ten zpzhong@ten:~/repo/gitbook
# git push -u ten master

echo "git push ten"
git push ten

# on remote server, the script will checkout gitbook and run build-update.sh
echo ">>> run ssh command on ten:"
ssh zpzhong@ten /home/zpzhong/scripts/update-gitbook.sh

echo ">>> update done."

