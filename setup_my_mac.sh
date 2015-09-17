#!/bin/bash
#
set -e

INS="installing"

BREW_BASE="ansible autoconf caskroom/cask/brew-cask exiftool exiv2 ffmpeg git lame s3cmd sqlite wget fontconfig freetype gdbm libpng libyaml libvo-aacenc media-info xz yasm zeroms sip"

CASK_BASE="vagrant virtualbox iterm"
CASK_SOURCECTL="git mercurial tower"
CASK_EDITORS="macvim aquamacs textwrangler"
CASK_IDES="pycharm android-studio"
CASK_BROWSERS="google-chrome firefox"
CASK_METADATA="exiftool exiv2 mediainfo"
CASK_MULTIMEDIA="mplayerx xld vlc audacity air-video-server"
CASK_MONITORS="little-snitch istat-menus hyperdock disk-inventory-x meteorologist" 
CASK_OTHER="1password opencv"  # limechat filebot 

CASK_PACKAGES="$CASK_BASE $CASK_SOURCECTL $CASK_EDITORS $CASK_IDES $CASK_BROWSERS $CASK_MULTIMEDIA $CASK_MONITORS $CASK_OTHER"

echo "$INS Xcode and command line tools"
if [[ ! -x /usr/bin/clang ]]; then
    xcode-select --install
else 
    echo 'Xcode already installed, continuing'
fi

echo "$INS brew"
if [[ ! -x /usr/local/bin/brew ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "$INS brew basics"
for app in `echo $BREW_BASE`; 
do 
    echo " - $INS $app"
    brew install $app
done

echo "$INS cask packages"
for app in `echo $CASK_PACKAGES`; 
do 
    echo " - $INS $app"
    brew cask install $app
done

#TODO: provision .profile
