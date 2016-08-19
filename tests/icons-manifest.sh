#!/bin/bash
# summary: script for creating a set of icons designed to meet sizing standards and naming conventions for the web manifest 11-2014
# image magick using nautilus scripts or just plain bash
# like everything else it does not work in internet explorer
# be IN the folder you are running this from or your files will end up somewhere you didnt want a folder will be created based on filename though
# author: ray anthony 
# author site: http://rayanthony.io
# date: 12-02-2014
# updated 12-9-2014
# license: oneworldlicense "free forever, for everyone. Share, distribute, monetize, hack. Not allowed in courtrooms"  oneworldlicense.com
# copyright 2014 all rights reserved, all liabilities waived and brushed aside with love

set -e

while [ $# -gt 0 ]; do
        picture=$1
		filename=$(basename "$1")
		extension="${filename##*.}"
		filename="${filename%.*}"
                mkdir -p "${filename}_allsizes"
		for i in 16 32 36 48 64 72 90 96 128 144 256 192 512; do convert $picture -resize "$i"\!x"$i"\! "${filename_allsizes}/${filename}_${i}.png";done;
		for i in 57 114 72 144 60 120 76 152; do convert $picture -resize "$i"\!x"$i"\! "${filename_allsizes}/${filename}/apple-touch-icon-${i}.png";done;
        shift
done

manifest_header=`  {"short_name": "  App","name": "Application","icons": [{"src": "default_icon.png","sizes": "128x128","type": "image/png","density": "3.0"}`
manifest_repeat=`,  { \
`     "src": "img/${filename}.png", \
      "sizes": "$i"x"$i", \
      "type": "image/png", \
      "density": "1.0" \
    }`
manifest_tail=`  ], \
  "start_url": "index.html", \
  "display": "standalone", \
  "orientation": "landscape" \
}`
meta_tags=`,  { \
<link rel="shortcut icon" href="/assets/images/icons/favicons/favicon.ico"> \
<link rel="apple-touch-icon" sizes="57x57" href="/assets/images/icons/favicons/apple-touch-icon-57x57.png"> \
<link rel="apple-touch-icon" sizes="114x114" href="/assets/images/icons/favicons/apple-touch-icon-114x114.png"> \
<link rel="apple-touch-icon" sizes="72x72" href="/assets/images/icons/favicons/apple-touch-icon-72x72.png"> \
<link rel="apple-touch-icon" sizes="144x144" href="/assets/images/icons/favicons/apple-touch-icon-144x144.png"> \
<link rel="apple-touch-icon" sizes="60x60" href="/assets/images/icons/favicons/apple-touch-icon-60x60.png"> \
<link rel="apple-touch-icon" sizes="120x120" href="/assets/images/icons/favicons/apple-touch-icon-120x120.png"> \
<link rel="apple-touch-icon" sizes="76x76" href="/assets/images/icons/favicons/apple-touch-icon-76x76.png"> \
<link rel="apple-touch-icon" sizes="152x152" href="/assets/images/icons/favicons/apple-touch-icon-152x152.png"> \
<link rel="icon" type="image/png" href="/assets/images/icons/favicons/favicon-196x196.png" sizes="196x196">
<link rel="icon" type="image/png" href="/assets/images/icons/favicons/favicon-160x160.png" sizes="160x160"> \
<link rel="icon" type="image/png" href="/assets/images/icons/favicons/favicon-96x96.png" sizes="96x96"> \
<link rel="icon" type="image/png" href="/assets/images/icons/favicons/favicon-16x16.png" sizes="16x16"> \
<link rel="icon" type="image/png" href="/assets/images/icons/favicons/favicon-32x32.png" sizes="32x32"> \
<meta name="msapplication-TileColor" content="#000000"> \
<meta name="msapplication-TileImage" content="/assets/images/icons/favicons/mstile-144x144.png"> \
<meta name="msapplication-config" content="/assets/images/icons/favicons/browserconfig.xml">`
echo -e '"\n "$manifest_header" \n "$manifest_repeat" \n "$manifest_tail" \n "' > manifest_test.json
echo -e "$meta_tags" > meta.html
