# Favicon Fleet
================

### Favicon Maker
Designed to easily prepare a fleet of dimensioned favicon and startup icons for your app or page from any starter graphic with 1 simple click (if using nautilus extension) or the preferred method is 
```sh
$ faviconfleet myapp.png
```

That simple.

![favicon fleet example output](https://raw.githubusercontent.com/rayrc/faviconfleet/master/faviconfleet.png)

The rest of the files are various tests that need to be placed in a sub folder to remove clutter as they are non-essential. The app is a bash script in file **'faviconfleet'**

### Project Notes: 
In preparation for the dev releases of Chrome and Mozilla in 2014 I resolved to handle the favicon issue with a click as it can easily be the majority of yur time building aps and extensions. Never released because the list never stopped growing, as well I thouhgt it would be well served to be its own app. But JS based not PHP and Imagemagick. For now it is what it was a year ago, a largely complete imagemagick script for Ubuntu/debian.

Rewritten 2 years later, its safer faster, offers more sizes, a great favicon.ico making component, snippets for easing  adding these into your web app, manifest or chrome extension file. Also a notable change is that it is built to take multipl inputs on the command line so multiple fleets of icons can be had in seconds instead of hours of mundane work. I also changed the way it runs to be run from your bin folder instead of focusing on nautilus shell extensions. Those people with that desire know precisely how to integrate and run something like this so better to focus on widespread usage such as its first test case was on a text only console running Ubuntu Trusty over ssh. 

Easy!


### SUMMARY
script for creating a set of icons designed to meet sizing standards and naming conventions for the web manifest 11-2014

> image magick using nautilus scripts or just plain bash
> like everything else it does not work in internet explorer
 
> author: ray anthony 
> author site: http://rayanthony.io
> date: 12-02-2014
> updated 12-9-2014
> rewritten 8-16-2016 complete overhaul 

### INSTALL:
   copy script to /usr/bin/faviconfleet as root then,
```sh
   $sudo chmod +x /usr/bin/faviconfleet
```

### USE: 
```
  $faviconfleet myappicon.png
```

### OUTPUT:
   a sub folder tree will be created with most needed things including all apple icons, common icon.png names, a properly encoded favicon.ico up tp 128px, a bag of regular icons, and to make life really easy it cleans up after itself and even spits out some html and json for pasting into your webapp, web page, or chrome extension, or manifest.json

### MORE:
   Though its untested it should be scaled to do this whole fleet per icon so use like this:
```sh
    $ faviconfleet myappicon1.png mywebsiteicon.png mychromeextension.png [...]
```
a tree with the aforementioned work should result for each item you enter on the command line, but be careful of your memory mangement though.

> license: oneworldlicense "free forever, for everyone. Share, distribute, monetize, hack. Not allowed in courtrooms"
> oneworldlicense.com
> copyright 2014,2016 all rights reserved, all liabilities waived and brushed aside with love

> by @rayantony, @rayrc [rayanthony website](http://rayanthony.io/extensions/)


=======
>>>>>>> 21b0cf9de2531589a7a50e9a91fdca2a94787488
