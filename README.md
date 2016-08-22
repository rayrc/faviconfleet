# Favicon Fleet
================

### A Scalable Favicon and App Icon Making Helper Utility

FaviconFleet is designed to take the burden of creating endless icons, endless file references in manifests, Meta Html blocks, all the proper paths and filename conventions, the sometimes dozens of sizes and compression formats, and their  file references, out of your app development flow. Because honestly? Its a just a **f#$^%ing icon**!! So if you have ever spent 1 hour coding and 6 hours on a manifest file fiddling with json syntax, cross referencing all your icons looking for the one that isnt referenced or is but doesnt exist, or has a typo, or a bad pixel and shows as corrupt because its nonsense. 

This will give you back your time and keep you from yanking your hair out. Because it replaces the bulk of that process with an automated one. So you can be hands off and still be all-in. type 2 words and wait perhaps 2 seconds, and its handled! 

Using greatly accelerates the process of and prepares you for a quick less error prone packaging process. And it's a little fun to use because 1 simple click (if using nautilus extension) can do it all or the new preferred method is actually favoring a quick console visit.

Let's look at the complete install and note that we'll be in bash specifically not 'sh' and yes the differences can be significant indeed. luckily we all for the most part have both natively in most Nix Distros and Homebrew. 


### SUMMARY
Shell executed Bash script for automating creation of icon sets designed to meet sizing and other standards and naming conventions across various common use cases with maximum speed and efficiency originally to aid with the Web Manifest Specs approx 11/2014

### Dependencies and limitations
* requires imagemagick 
* plain bash 
* optional nautilus scripts extension ready
* like everything else it does not work in internet explorer
 
* author: ray anthony 
* author site: http://rayanthony.io
* date: 12-02-2014
* updated 12-9-2014
* rewritten 8-16-2016 complete overhaul 

### INSTALL:
   copy script to /usr/bin/faviconfleet as root then,
```bash
$ git clone http://github.com/rayrc/faviconfleet
$ sudo chown root:root faviconfleet/faviconfleet && sudo chmod +x faviconfleet/faviconfleet && sudo cp -a faviconfleet/faviconfleet /usr/bin/.
```
>>note you can put the file elsewhere as long as it is in your executable paths


### Run it
>>assuming your present working directory has an icon file to start with you simply need give it to faviconfleet as a parameter and it will take it from there. Lets call your icon file: myapp.png
```sh
$ faviconfleet myapp.png
```
And done, that simple!

Here's what you can expect to see as a result: ![favicon fleet example output](https://raw.githubusercontent.com/rayrc/faviconfleet/master/faviconfleet.png)

### OUTPUT:
   a sub folder tree will be created with most needed things including all apple icons, common icon.png names, a properly encoded favicon.ico up tp 128px, a bundle of regular icons, and to make life really easy it cleans up after itself and even spits out some html and json for pasting into your webapp, web page, or chrome extension, or manifest.json

### MORE:
   Though its untested it should be scaled to iterate through multiple app icons fed on start allowing for a veritable fleet of icon sets. usage would be like this:
```bash
    $ faviconfleet myappicon1.png mywebsiteicon.png mychromeextension.png [...]
```
>>A separate tree with the aforementioned work should result for each item you enter on the command line, but be careful of your memory mangement though.

### ABOUT 
The faviconfleet app is written in bash script to be executed by the shell. You neednt worry about packages or folders, or compiling. It's straight up. And like most of your bins it is self contained but does have a dependency on ImageMagick, no particular version requirements, so if you think you need that, go get it ```$ sudo aptitude install imagemagick```

### TESTS Folder 
The rest of the files are various tests old drafts, similar functions before I decided I needed one combined simple process. You may delete them or do as you please for the love of god, please do not arbitrarily start executing them as drafts of fragments you are bound to have a problem perhaps a serious one. So review and incorporate as desired or throw them away to remove clutter. I will be doing that myself someday soon and removing them from the repo just so there is less chance of incident and because they are non-essential. 


### Project History: 
In preparation for some notably important Dev releases of Chrome and Mozilla in mid 2014 and the incorporation of manifest files, and a new spec for icons, I was furiously busy and seconds counted always I found myself like most linux hackers do, going through a phase of writing little utilities to automate my 'microtasks' if I may be 'San Francisco' about it. In particular Imagemagick routines, completely new to me I found to be remarkably efficient. so perfect for the command line. Infinitely flexible, it does everything but build a house or get you a girlfriend. Though it could conceivable help with the latter.

I resolved to handle the favicon issue with a click as it can easily be the majority of your time building apps. I mean that, back in 2013-2014 I wrote 10+ themes and 40+ apps half of which over a couple weekends, some ambitious some stupid but I have in 2 years published a total of 3. And in Firefox I have published maybe 1 maybe 0. I used back then about 18 on a regular basis but publishing meant packaging, and I just didn't have time for the frills part definitely not the troubleshooting. Themes were even worse. When I was publishing the ["IE Sucks Bar"](http://rayanthony.io/extensions/) for ["Chrome"](https://chrome.google.com/webstore/detail/ie-sucks/ejbiekjpeokjbhahjchhbgkpabjhbiec) I was writing a [shell script screencaster](https://gist.github.com/rayantony/eeede9b576079614869f) and was going to use the opportunity to do a quick 20 min 'here's how easy it is' tutorial but, after an hour of getting frustrated I turned off filming and in another 3 hours I published version 1.

During a forced browser update most of my personal dev install extensions wigged out because they now needed updated manifest conventions and once again a 20 icon pain in the ass. So I then sat down to once again automate the build but this time I needed a whole batch of new sizes and the companion websites needed HTML references, so on... I left it there in pieces until now. I never could release because the list never stopped growing, as well I thought it would be well served to be its own app, but I thought for others to use it would be best as either a PHP which has a cost implication I don't fancy, perhaps a future emulated PHP app instance in a Docker LXC container or best of all a javascript method. Because then we can run client side out of static buckets for pennies, yeah! I don't have time to even think about that as things changed for my own situation but, I came across a need for my !["XFrame  Assassin Extension"](https://chrome.google.com/webstore/detail/xframe-assassin-by-x-ray/nigpljchmlcjkhbglkdimgaplklombph) to take the burden off me for a night on coding around some header issues I went to download and low and behold, wouldn't you know it... For the best 12 months my only two Chrome extensions published, have been cancelling mid download from the chrome store. 

Why? Because each one, had a single icon that was not right in some way. Apparently it was right on submission, but not on downloading. Oops. 2 years, zero downloads lots of impressions. I should have done this sooner, but I have addressed the issue sufficiently for the time being and in such a way that I can share it with anyone else if they dont want to end up like I did. Do yourself a favor, get this. Ubuntu 10, Mint, Homebrew, SSH droplet, whatever you're on this will probably solve your problem. Unless you are a plumber and then , well it will I imagine be worthless. If you want to package a chrome app, they also just deprecated the official Chrome Development App for making plugins work easier like last month. So again. This is 100 times smaller and a thousand times faster and infinitely less filled with BS. 

Rewritten 2 years later, it's safer, it's faster, offers more sizes, features a whole new subprocess for how the favicon.ico is made, includes some incredibly useful snippets in HTML and JSON in anticipation of manifest.json for web apps, chrome apps, and HTML Meta blocks for everyday web sites. 

Also a notable improvement is I have a fondness for iteration efficiency in especially console apps. So one change is that it is built to take multiple file arguments as inputs on the command line, and intends that for each one it will perform the same work and spit out a separate tree of files and meta data. So you can give it 5 app icons and git back 5 trees of stuff in seconds. Hence the name FaviconFleet: Enterprise Edition. Just kidding on that last part. But really passing in multiple arguments, is in there now. Though to be fair I have not tested it yet. So watch it for bugs. 

I also changed the way it runs to be from your bin folder instead of focusing on nautilus shell extensions and very specific configuration assumptions that free software or not, largely serves to alienate and disenfranchise the overwhelming majority of mainline nix and homebrew installs. In the spirit of togetherness the focus is on mass operability and appeal, and those specific use cases and features can be explained in subsequent documentation and alterations to the now normal usage and install. Besides, those people with that desire know precisely how to integrate and run something like this and are fractured enough with Unity, Gnome, Nautilus, Numix, Mint, as it is. Better to focus on widespread usage such as its first test run which was on a text only console running Ubuntu Trusty over ssh. 

Easy!



 license: oneworldlicense.com is a less litigious license, "free forever, for everyone. Share, distribute, monetize, hack. Not allowed in courtrooms"
 copyright 2014,2016 all rights reserved, all liabilities waived and brushed aside with love

> by @rayantony, @rayrc [rayanthony website](http://rayanthony.io/extensions/)

=======

>>>>>>> 21b0cf9de2531589a7a50e9a91fdca2a94787488
