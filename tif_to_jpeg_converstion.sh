#!/bin/bash

set -eoux pipefail

PRJT_DIR=/home/stacey/hd2/image_conversion_project
TIF_DIR=${PRJT_DIR}/images

JPG_DIR=${PRJT_DIR}/images_jpg

mkdir -p ${JPG_DIR}

find ${TIF_DIR}/Romero\ Family/Drew\ and\ Viv\ with\ kids.tif -name *.tif -type f -print0 | xargs -0 -I {} cp -r '{}' ${JPG_DIR}/