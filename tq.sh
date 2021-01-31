#!/bin/bash

#获取服务器参数
#sudo apt update -y
#sudo apt install neofetch -y
#neofetch

#切换时区
#sudo rm /etc/localtime
#sudo ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#TZ='Asia/Shanghai'
#export TZ
#date

# 获取天气图片
curl zh.wttr.in/Chengdu > /dev/null
curl zh.wttr.in/Chengdu_1msQn.png -o tq.png
#echo "图片大小"
#ls -lh tq.png

#base64编码
export basetq=`base64 -w 0 tq.png`
#echo${basetq}

#生成待发送md文档
echo "![tiqnq][tq]" > t01
echo "[tq]:data:image/png;base64,${basetq}" >> t01
#server酱推送到微信
export tq=`cat t01`
#t=`date "+%Y_%m_%d_"`
curl --data-urlencode "desp=${tq}" https://sc.ftqq.com/SCU126376Td123af634152e7d8fe2ce3ac38c5a3595fae40493e52e.send?text=今日天气
