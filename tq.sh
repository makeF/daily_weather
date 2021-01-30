#!/bin/bash

# 获取天气图片
#curl zh.wttr.in/Chengdu_1MQn.png -o tq.png 
#生成待发送md文档
echo "\![tiqnq][tq] \
[tq]:data:image/png;base64,`base64 -w 0 tq.png`" > t01
#server酱推送到微信
tq=`cat ./t01`
t=`date "+%Y-%m-%d "`
curl --data-urlencode "desp=${tq}" https://sc.ftqq.com/SCU126376Td123af634152e7d8fe2ce3ac38c5a3595fae40493e52e.send?text=${t}今日天气
