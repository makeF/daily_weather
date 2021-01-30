#!/bin/bash

#获取服务器参数
neofetch
lscpu
free -h
df -h

# 获取天气图片
curl zh.wttr.in/Chengdu_1MQn.png -o tq.png
ll tq.png
#base64编码
basetq=base64 -w 0 tq.png
echo${basetq}
#生成待发送md文档
echo "![tiqnq][tq]" > t01
echo "[tq]:data:image/png;base64,${basetq}" >> t01
#server酱推送到微信
tq=`cat t01`
#t=`date "+%Y_%m_%d_"`
curl --data-urlencode "desp=${tq}" https://sc.ftqq.com/SCU126376Td123af634152e7d8fe2ce3ac38c5a3595fae40493e52e.send?text=今日天气
