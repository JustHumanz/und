#!/usr/bin/env bash
if [[ "$1" == "--h"  || "$1" == "-h" || "$1" == "--help" ]] ; then
    echo "usage:                              und -d [link] "
    echo $'usage download from google drive:   und -g [file_id]\n'
    echo "Optional arguments:"
    echo "    -d, --download  download file"
    echo "    -c, --check     Check request file"
    echo "    -s, --speed     Speed test"
    echo "    -g,             Downloads from google drive"
    echo "    -h, --h, --help show this help message and exit "
    echo "    -v, --version   display version"
    exit 0
elif [[ "$1" == "-s" || "$1" == "--speed" ]]; then
  speedtest-cli
  exit 1
elif [[ "$1" == "-v" || "$1" == "--version" ]]; then
  echo "Down Version 0.1"
  exit 1
elif [[ "$1" == "-c" || "$1" == "--check" ]]; then
  echo "Checking file request";
  sleep 3 &
  PID=$!
  i=1
  sp="/-\|"
  echo -n ' '
  while [ -d /proc/$PID ]
do
  printf "\b${sp:i++%${#sp}:1}"
done
  if which aria2c > /dev/null  && which python3.7 > /dev/null && which gdown > /dev/null && which speedtest-cli > /dev/null ; then
    echo "file request ready";
    exit 1
  else
    echo $'file not found\n';
    echo "Installing file request";
    if [[ -f /etc/pacman.conf ]]; then
      sudo pacman -S aria2 python3 python-pip --noconfirm && sudo pip3 install gdown speedtest-cli
    elif [[ -f /etc/apt/sources.list ]]; then
      sudo apt-get install aria2 python3 python3-pip -y && sudo pip3 install gdown speedtest-cli
    elif [[-f /etc/yum.conf ]]; then
      sudo yum install aria2 epel-release -y && sudo yum update && sudo yum install python34-pip -y && sudo pip3 install gdown speedtest-cli;
    else
      echo "your distro not found"
    fi
    echo "Install complete";
    exit 1
  fi
fi

if [ "$1" == "-g" ] ; then
    gdown https://drive.google.com/uc\?id\=$2 --output ~/Downloads/aria2
    exit 1
elif [[ "$1" == "-d" || "$1" == "-download" ]]; then
  mkdir -p ~/Downloads/aria2 && cd ~/Downloads/aria2
  aria2c -x 16 -s 16 -d ~/Downloads/aria2 $1
  exit 1
fi
echo "usage:                              und -d [link]"
echo $'usage download from google drive:   und -g [file_id]\n'
echo "Optional arguments:"
echo "    -d, --download  download file"
echo "    -c, --check     Check request file"
echo "    -s, --speed     Speed test"
echo "    -g,             Downloads from google drive"
echo "    -h, --h, --help show this help message and exit "
echo "    -v, --version   display version"
exit 0
