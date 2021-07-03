#!/usr/bin/env bash
# 参考：
# CSDN博主「小啊小木头」的原创文章, https://blog.csdn.net/lxfHaHaHa/article/details/95769201
#

echo "install utils..."
sudo apt install pciutils
echo "utils installed."

echo ""
echo "############################################"
echo "# View Linux Server Hardware Configuration #"
echo "############################################"
echo ""

echo "#CPU:"
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c | xargs

echo ""
echo "----------------------------------------"
echo ""

echo "#RAM:"
free -m

echo ""
echo "----------------------------------------"
echo ""

echo "#GPU:"
gpuinfo="$(lspci | grep -i vga)"
has_nvida_gpu="$(lspci | grep -i vga | grep -i nvidia)"

echo "${gpuinfo}"

if [ "${has_nvida_gpu}" ]; then
    nvidia-smi
fi

echo ""
echo "----------------------------------------"
echo ""

echo "#Hard Disk Drive:"
lsblk | grep -v "loop"
echo ""
du -sh /home/*
echo ""
sudo fdisk -l | grep Disk | grep -v "loop"
