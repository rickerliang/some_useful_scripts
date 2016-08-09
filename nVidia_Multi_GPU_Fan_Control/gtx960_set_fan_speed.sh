#!/bin/sh
killall Xorg
sleep 1
cp xorg.gtx960.conf /etc/X11/xorg.conf
X :2 &
sleep 1
export DISPLAY=:2
nvidia-settings -q all | grep "Attribute 'GPUCurrentFanSpeed'"
if [ "$1" = "0" ]; then
    nvidia-smi -i 0 -pm 0
    nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=30
    nvidia-settings -q all | grep "Attribute 'GPUTargetFanSpeed'"
    sleep 10
    nvidia-settings -a [gpu:0]/GPUFanControlState=0
else
    nvidia-smi -i 0 -pm 1
    nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUTargetFanSpeed=$1
fi
nvidia-settings -q all | grep "Attribute 'GPUFanControlState'"
nvidia-settings -q all | grep "Attribute 'GPUCurrentFanSpeed'"
killall Xorg
