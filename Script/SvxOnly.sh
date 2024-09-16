#!/bin/bash -xe

esegui() {
  exec=$1
  printf "\x1b[38;5;104m --> ${exec}\x1b[39m\n"
  eval ${exec}
}

scrivi () {
  say=$1
  printf "\x1b[38;5;220m${say}\x1b[38;5;255m\n"
}

MYPATH=${PWD}

scrivi "10-08-2024 IU4QRW install script per P2_Pro"

scrivi "Aggiornamento"

esegui "apt-get --assume-yes update"


if [[ ! -d svxlink ]]; then
  scrivi "Aggiunta utente svxlink e guppi"
  esegui "groupadd svxlink"
  esegui "useradd -g svxlink -d /etc/svxlink svxlink"
  esegui "usermod -aG audio,nogroup,svxlink,plugdev svxlink"
  scrivi "Installazione e compilazione SvxLink"
  git clone https://github.com/sm0svx/svxlink.git
else
  scrivi "Aggiornamento e compilazione SvxLink"
  cd svxlink
  git fetch https://github.com/sm0svx/svxlink.git
  git checkout master
  git reset --hard origin/master
  cd ..
fi

cd svxlink/src/
[[ -d build ]] && rm -rf build
mkdir build
cd build

scrivi "COMPILAZIONE Svxlink"

cmake -DUSE_QT=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc \
      -DCMAKE_INSTALL_LOCALSTATEDIR=/var -DWITH_SYSTEMD=ON ..
	  
make

make doc

scrivi "INSTALLAZIONE Svxlink"

make install

ldconfig

# Download and extract audio file
cd /usr/share/svxlink/sounds

# Download audio file it_IT
git clone https://github.com/IU4QRW/svxlink-sounds-it_IT.git
mv svxlink-sounds-it_IT en_US
#ln -s svxlink-sounds-it_IT/ it_IT

cd ${MYPATH}

# Update with logrotare
cat > /etc/logrotate.d/svxlink <<EOF
  /var/log/svxlink.log {
    missingok
    notifempty
    daily
    create 0644 svxlink.log root
    postrotate
    killall -HUP svxlink
    endscript
  }
EOF

