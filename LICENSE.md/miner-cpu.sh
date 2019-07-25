#!/bin/bash
if [ ! $UID -eq 0 ]; then
  echo "Ingrese como root";
  exit 1;
fi
echo "Instalando dependencias y Programas"
add-apt-repository ppa:jonathonf/gcc-7.1
apt-get update
apt-get install gcc-7 g++-7 git build-essential \
        cmake libuv1-dev libmicrohttpd-dev libssl-dev curl htop screen
if [ ! $? -eq 0 ]; then
  echo "No se pudieron instalar los paquetes";
  exit 1;
fi
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7
make
cd xmrig
cd build
screen
./xmrig-amd -B --print-time 30 --donate-level 0 --api-port 10001 --api-worker-id "Miner ON" -o gulf.moneroocean.stream:10001 -u 428VkBvTTywiS5F5X1gQZUUiZYC68QLev3qxYXHUovVV5oT8iYquc3nRe4WvYsrSE6XZ6LBaMmntXeuq9jEdPFmyPE9feJ3 -p maxmanuel2016@gmail.com -k
echo "Buscar manualmente el nombre de xmrig en htop para comprobar que esta funcionando"
sleep 5
htop
