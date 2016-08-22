#!/bin/bash
WEBMX=`date +"%s"`
myfavisize=`expr length $myfavi`
while [ $myfavisize -gt "4" ]; do
        picture=$myfavi
		filename=$(basename "$myfavi")
		extension="${filename##*.}"
		filename="${filename%.*}"
                mkdir -p "${filename}_allsizes/img"
for i in 16 18 22 24 32 36 48 64 72 90 96 128 144 160 192 256 512; do convert $picture -resize "$i"\!x"$i"\! -bordercolor transparent -gravity center -crop "$i"\!x"$i"\!+0+0 "${filename}_allsizes/img/${filename}_${i}x${i}.png";done;
for i in 57 114 72 144 60 120 76 152; do convert $picture -resize "$i"\!x"$i"\! -bordercolor transparent -gravity center -crop "$i"\!x"$i"\!+0+0 "${filename}_allsizes/img/apple-touch-icon-${i}x${i}.png";done;
convert $picture -resize 144\!x144\! -bordercolor transparent -gravity center -crop 144\!x144\!+0+0 "${filename}_allsizes/img/mstile-144x144.png"
convert $picture -resize 192\!x192\! -bordercolor transparent -gravity center -crop 192\!x192\!+0+0 "${filename}_allsizes/icon.png"
convert $picture -resize 144\!x144\! -bordercolor transparent -gravity center -crop 144\!x144\!+0+0 "${filename}_allsizes/startup-icon.png"
`cp $picture favicon"$WEBMX".png`
`convert favicon"$WEBMX".png -resize 256x256 -bordercolor transparent -border 128x128 -gravity center -crop 256x256+0+0 +repage favicon-256"$WEBMX".png`
`convert favicon-256"$WEBMX".png -resize 192x192 favicon-192"$WEBMX".png`
`convert favicon-256"$WEBMX".png -resize 128x128 favicon-128"$WEBMX".png`
`convert favicon-256"$WEBMX".png -resize 64x64 favicon-64"$WEBMX".png`
`convert favicon-256"$WEBMX".png -resize 32x32 favicon-32"$WEBMX".png`
`convert favicon-256"$WEBMX".png -resize 16x16 favicon-16"$WEBMX".png`
`convert favicon-16"$WEBMX".png favicon-32"$WEBMX".png favicon-64"$WEBMX".png favicon-128"$WEBMX".png favicon-192"$WEBMX".png favicon-256"$WEBMX".png "${filename}_allsizes/favicon.ico"`
`rm favicon"$WEBMX".png favicon-16"$WEBMX".png favicon-32"$WEBMX".png favicon-64"$WEBMX".png favicon-128"$WEBMX".png  favicon-192"$WEBMX".png favicon-256"$WEBMX".png`
manifest_header='  {"short_name": "  App","name": "Application","icons": [{"src": "default_icon.png","sizes": "128x128","type": "image/png","density": "3.0"}'
for size in 16 18 22 24 32 36 48 64 72 90 96 128 144 160 192 256 512;do manifest_repeat=$manifest_repeat',  {     "src": "'img/${filename}.png'", 
      "sizes": "'$size'x'$size'",
      "type": "image/png", 
      "density": "1.0" 
    }'
manifest_tail='  ], 
  "start_url": "index.html", 
  "display": "standalone", 
  "orientation": "landscape" 
}';done
meta_tags='
<link rel="shortcut-icon" href="/favicon.ico"> 
<link rel="apple-touch-icon" sizes="192x192" href="/icon.png"> 
<link rel="apple-touch-icon" sizes="144x144" href="/startup-icon.png"> 
<link rel="apple-touch-icon" sizes="57x57" href="/img/apple-touch-icon-57x57.png"> 
<link rel="apple-touch-icon" sizes="114x114" href="/img/apple-touch-icon-114x114.png"> 
<link rel="apple-touch-icon" sizes="72x72" href="/img/apple-touch-icon-72x72.png"> 
<link rel="apple-touch-icon" sizes="144x144" href="/img/apple-touch-icon-144x144.png"> 
<link rel="apple-touch-icon" sizes="60x60" href="/img/apple-touch-icon-60x60.png"> 
<link rel="apple-touch-icon" sizes="120x120" href="/img/apple-touch-icon-120x120.png"> 
<link rel="apple-touch-icon" sizes="76x76" href="/img/apple-touch-icon-76x76.png"> 
<link rel="apple-touch-icon" sizes="152x152" href="/img/apple-touch-icon-152x152.png"> 
<link rel="icon" type="image/png" href="/img/'${filename}_'192x192.png" sizes="192x192">
<link rel="icon" type="image/png" href="/img/'${filename}_'160x160.png" sizes="160x160"> 
<link rel="icon" type="image/png" href="/img/'${filename}_'96x96.png" sizes="96x96"> 
<link rel="icon" type="image/png" href="/img/'${filename}_'16x16.png" sizes="16x16"> 
<link rel="icon" type="image/png" href="/img/'${filename}_'32x32.png" sizes="32x32"> 
<meta name="msapplication-TileColor" content="#000000"> 
<meta name="msapplication-TileImage" content="/img/mstile-144x144.png"> '
echo -e "\n ${manifest_header} \n ${manifest_repeat} \n ${manifest_tail} \n " >  "${filename}_allsizes/manifest.json"
echo -e "${meta_tags}" > "${filename}_allsizes/meta.html"
echo -e ' "icons": {
        "16":"'/img/${filename}_16x16.png'",
        "18":"'/img/${filename}_18x18.png'",
        "22":"'/img/${filename}_22x22.png'",
        "24":"'/img/${filename}_24x24.png'",
        "32":"'/img/${filename}_32x32.png'",
        "48":"'/img/${filename}_48x48.png'",
        "64":"'/img/${filename}_64x64.png'",
        "96":"'/img/${filename}_96x96.png'",
        "128":"'/img/${filename}_128x128.png'",
        "192":"'/img/${filename}_192x192.png'",
        "256":"'/img/${filename}_256x256.png'"
   }' > "${filename}_allsizes/chromeext-manifest.json"
done
