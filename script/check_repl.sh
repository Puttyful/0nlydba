#!/bin/bash
set -vx
mysql=`which mysql`
mail=`which mail`
master1=10.50.28.65
master2=10.50.28.66
user=root
password=P@ssw0rdupg
array=($($mysql -h$master1 -u$user -p$password  -e "show slave status\G"|grep "Running" |awk '{print $2}'))
array1=($($mysql -h$master2 -u$user -p$password  -e "show slave status\G"|grep "Running" |awk '{print $2}'))
 	if [ "${array[0]}" == "Yes" ] || [ "${array[1]}" == "Yes" ] 
          then 
            echo "slave is OK" 
       else 
            echo "slave error! host:$master1 " | $mail -s error qiuzhiwei@upg.cn shendan@upg.cn
fi
	if [ "${array1[0]}" == "Yes" ] && [ "${array1[1]}" == "Yes" ] 
                                then 
                                        echo "slave is OK" 
                                else 
                                        echo "slave error! host:$master2" | $mail -s error qiuzhiwei@upg.cn shendan@upg.cn
    fi
