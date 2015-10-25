#!/bin/bash
# 5-3-1015
for i in ./*.png; do convert "$i" -background grey \( +clone -background lightblue -shadow 119x6+0+6 \) +swap -background transparent -layers merge -repage \!128x\!128 -resize \!128x\!128 "$i";done

