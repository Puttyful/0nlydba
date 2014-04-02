#!/bin/bash
#set -vx
rsync=`which rsync`
host='10.50.28.66'
file='/home/mysql/my3306/log/binlog.*'
user='mysql'
backupdir='/home/mysql/my3306_backup/binlog_backup'
source /home/oracle/agent-info
ssh-add ~/.ssh/id_rsa
        ssh mysql@10.50.28.65 "$rsync -azvP -e ssh $file $user@$host:$backupdir" || echo 'rsycn down' | mail -s 'rsync' qiuzhiwei@upg.cn shendan@upg.cn
