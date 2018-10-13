#!/bin/bash

set -eoux pipefail

PRJT_DIR=/home/stacey/hd2/image_conversion_project
TIF_DIR=${PRJT_DIR}/images

JPG_DIR=${PRJT_DIR}/images_jpg

mkdir -p ${JPG_DIR}

### Converting all .tif files to .jpg
find ${TIF_DIR}/ -name "*.tif" | while read fname; do 
echo "$fname"
JPG_NAME=${fname%%.*}.jpg
FILE=`echo "$JPG_NAME" | cut -d'/' -f7- `
echo "$FILE"
JPG_FILE=${JPG_DIR}/${FILE}
echo $JPG_FILE
IMG_DIR=`dirname "$JPG_FILE"`
echo "$IMG_DIR"

mkdir -p "$IMG_DIR"

convert "$fname" "$JPG_FILE"
done


### Copying all existing .jpg files to new JPG_DIR
find ${TIF_DIR}/ -name "*.jpg" | while read fname; do 
echo "$fname"
FILE=`echo "$fname" | cut -d'/' -f7- `
echo "$FILE"
JPG_FILE=${JPG_DIR}/${FILE}
echo $JPG_FILE
IMG_DIR=`dirname "$JPG_FILE"`
echo "$IMG_DIR"

mkdir -p "$IMG_DIR"

cp "$fname" "$JPG_FILE"
done

### File numbers will not match. ImageMagick zooms in on some pictures
### and creates multiple files indcated by "-0" or "-1"
echo `find $TIF_DIR -type f | wc -l`
echo `find $JPG_DIR -type f | wc -l`
