#!/bin/sh
# Copyright (C) 2007 Bart Massey
# ALL RIGHTS RESERVED
# 
# [This program is licensed under the GPL version 3 or later.]
# Please see the file COPYING in the source
# distribution of this software for license terms.
SCALE='pnmscale -xysize $SIZE $SIZE $BASE.ppm'
SCALE_MASK='pnmscale -xysize $SIZE $SIZE $BASE-mask.pgm'
case $1 in
--prescaled)
  SCALE='pngtopnm -background \#ffffff $BASE-$SIZE.png'
  SCALE_MASK='pngtopnm -alpha $BASE-$SIZE.png'
  shift
  ;;
esac  
SRC=$1
BASE=`echo $SRC | sed 's/\.[^.]*$//'`
pngtopnm -background '#ffffff' $SRC > $BASE.ppm
pngtopnm -alpha $SRC > $BASE-mask.pgm
LAYERS=""
while read SIZE COLORS
do
  eval $SCALE |
   ppmquant $COLORS > $BASE-$SIZE.ppm 2>/dev/null
  eval $SCALE_MASK > $BASE-$SIZE-mask.pgm
  LAYERS="$LAYERS $BASE-$SIZE.ppm $BASE-$SIZE-mask.pgm"
done <<'EOF'
16 16
32 16
48 256
EOF
ppmtowinicon -andpgms $LAYERS > $BASE-favicon.ico
