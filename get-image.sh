#!/bin/bash
set -e

programs=("curl" "bsdtar")
for program in "${programs[@]}"
do
    if ! command -v "$program" &> /dev/null; then
        echo "$program is not installed"
        exit 1
    fi
done

if [ ! -d "/tmp/arch" ]; then
    mkdir /tmp/arch
fi

pushd /tmp/arch
curl -# -O https://mirrors.tuna.tsinghua.edu.cn/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.zst
sudo bsdtar -xpf archlinux-bootstrap-x86_64.tar.zst
sudo bsdtar -cpf archlinux-bootstrap.tar -C root.x86_64 .
popd

if [ ! -d "/mnt/d/WSL/" ]; then
    mkdir /mnt/d/WSL
fi

sudo mv /tmp/arch/archlinux-bootstrap.tar /mnt/d/WSL
sudo rm -rf /tmp/arch
