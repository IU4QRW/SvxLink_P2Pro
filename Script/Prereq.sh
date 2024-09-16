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

scrivi "Installazione prerequisiti"

esegui "apt install nano"

esegui "apt-get --assume-yes install libjsoncpp-dev"

esegui "apt-get --assume-yes install libcurl4-nss-dev"

esegui "apt-get --assume-yes install dialog"

esegui "apt-get --assume-yes install wget" 
 
esegui "apt-get --assume-yes install evtest" 
 
esegui "apt-get --assume-yes install screen" 
 
esegui "apt-get --assume-yes install cmake" 
 
esegui "apt-get --assume-yes install git" 
 
esegui "apt-get --assume-yes install g++" 
 
esegui "apt-get --assume-yes install make" 
 
esegui "apt-get --assume-yes install libsigc++-2.0-dev" 
 
esegui "apt-get --assume-yes install libgsm1-dev" 
 
esegui "apt-get --assume-yes install libpopt-dev" 
 
esegui "apt-get --assume-yes install tcl8.6-dev" 
 
esegui "apt-get --assume-yes install libgcrypt20-dev" 
 
esegui "apt-get --assume-yes install libspeex-dev" 
 
esegui "apt-get --assume-yes install libasound2-dev" 
 
esegui "apt-get --assume-yes install alsa-utils" 
 
esegui "apt-get --assume-yes install libogg-dev" 
 
esegui "apt-get --assume-yes install libvorbis-dev" 
 
esegui "apt-get --assume-yes install vorbis-tools" 
 
esegui "apt-get --assume-yes install libopus-dev" 
 
esegui "apt-get --assume-yes install opus-tools" 
 
esegui "apt-get --assume-yes install rtl-sdr" 
 
esegui "apt-get --assume-yes install librtlsdr-dev" 
 
esegui "apt-get --assume-yes install ntp" 
 
esegui "apt-get --assume-yes install doxygen" 
 
esegui "apt-get --assume-yes install groff"

esegui "apt-get --assume-yes install swh-plugins tap-plugins ladspa-sdk"

esegui "apt-get --assume-yes install libgpiod-dev" 

esegui "apt-get --assume-yes install gpiod"

esegui "apt-get --assume-yes install libssl-dev"