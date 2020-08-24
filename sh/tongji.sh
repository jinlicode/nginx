#!/bin/bash
sleep $RANDOM
source /etc/profile
d=`ls /etc/nginx/conf.d/ | xargs`
d=${d//_/.}
d=${d//.conf/}
d=${d// /,}
echo $d
curl="https://tongji.jinli.plus/?dom=$d&ver=$JINLIVER"
echo $curl
curl curl
