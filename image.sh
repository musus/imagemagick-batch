#!/bin/sh

ALLFILE=0

count() {
    while [ "$1" ]; do
        if [ -d "$1" ]; then
            count "$1"/*
        else
            if [[ "$1"  = *.jpg  ]]; then
                let ALLFILE++
            fi
            if [[ "$1"  = *.jpeg  ]]; then
                let ALLFILE++
            fi
            if [[ "$1"  = *.png  ]]; then
                let ALLFILE++
            fi

        fi
        shift
    done
}

count *

COUNTER=0

imagemin() {
    while [ "$1" ]; do
        if [[ -d "$1" ]]; then
            imagemin "$1"/*
        else
            if [[ "$1"  = *.jpg ]]; then
                let COUNTER++
                echo "convert" $1 "-" $COUNTER "/" $ALLFILE;
                convert -resize 1200x\> -quality 80 "$1" "$1"
            fi
            if [[ "$1"  = *.jpeg ]]; then
                let COUNTER++
                echo "convert" $1 "-" $COUNTER "/" $ALLFILE;
                convert -resize 1200x\> -quality 80 "$1" "$1"
            fi
            if [[ "$1"  = *.png ]]; then
                let COUNTER++
                echo "convert" $1 "-" $COUNTER "/" $ALLFILE;
                convert -resize 1200x\> -quality 80 "$1" "$1"
            fi

        fi
        shift
    done
}

imagemin *


