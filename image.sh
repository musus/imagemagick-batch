#!/bin/sh

# if [ "$1" = "" ]
# then
#     echo "[ERROR] 引数にリストのファイルを指定してください。"
#     exit
# fi



ALLFILE=$(ls ./ | wc -l)
EXCLUSION=1

if [ ! -d "resize" ]; then
	mkdir "resize"
else
	let EXCLUSION++
fi

CONVERTFILE=$(( $ALLFILE - $EXCLUSION))

echo "Converting " $CONVERTFILE "files"

COUNTER=0

for file in *.jpg *.JPG *.jpeg *.JPEG;
do
    [ -f "$file" ] || continue
    # COUNTER=$((counter++))
    let COUNTER++
	echo "convert" $file "-" $COUNTER "/" $CONVERTFILE;
    convert -resize 1200x\> -quality 80 "$file" "resize/$file"
done

for file in *.png;
do
	let COUNTER++
	echo "convert" $file "-" $COUNTER "/" $CONVERTFILE;
    [ -f "$file" ] || continue
	convert -resize 1200x\> -quality 80 "$file" "resize/$file"
done