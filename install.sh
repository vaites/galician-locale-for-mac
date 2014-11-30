#!/bin/bash

TEMPPATH="glfm-`date +%s`"
SOURCE='https://codeload.github.com/vaites/galician-locale-for-mac/zip/master'

if [ ! -d /usr/share/locale/gl_ES ]; then
    cd /tmp
    mkdir "$TEMPPATH"
    cd "$TEMPPATH"
    curl --silent --remote-name "$SOURCE"

    if [ -f master ]; then
        unzip -qq master

        if [ -d galician-locale-for-mac-master ]; then
            cd galician-locale-for-mac-master
            sudo cp -r gl_ES /usr/share/locale
            sudo cp -r gl_ES.ISO8859-1 /usr/share/locale
            sudo cp -r gl_ES.ISO8859-15 /usr/share/locale
            sudo cp -r gl_ES.UTF-8 /usr/share/locale
            cd ../../
            rm -rf "$TEMPPATH"

            echo "Install completed"
        else
            echo "Extract error"
        fi
    else
        echo "Download error"
    fi
else
    echo "Already installed"
fi
