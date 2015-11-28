#!/bin/sh
# CacheProgress by Doug Simmons 
# I cleared my mod_pagespeed cache and was trying to gauge how long it would take to rebuild,
# so I made this to help. Simple, but I'd like it to produce delta values, calculate rates 
# and make time estimates, in python of course.
# My first "bash" script, don't judge me. My website is https://hmm.nyc top score on ssllabs bro.

echo 'prev/now:'
cat /tmp/date.txt                       # reads the timestamp you last ran CacheProgress        
date                                    # recites the contemporaneous times
date > /tmp/date.txt                    # stores the present time that you're now running CacheProgress, overwriting the previous date
echo 'file count'
cat /tmp/files.txt                      # displays the number of files you had the last time
find | wc -l > /tmp/files.txt           # Counts how many files there are (recursively) and saves it to a text file
cat /tmp/files.txt                      # displays the current number if files 
echo 'size in bytes'
cat /tmp/size-bytes.txt                 # total bytes from last time
find -type l -print0 | xargs -0 du --max-depth=2 -c -L | grep total | tr -d 'total' > /tmp/size-bytes.txt # tallies, overwrites present size
cat /tmp/size-bytes.txt                         # displays current total bytes
echo 'size readable'
cat /tmp/size-human.txt                         # displays the total megs or gigs it found the last time (human readable)
find -type l -print0 | xargs -0 du --max-depth=2  -h -c -L | grep total | tr -d 'total' > /tmp/size-human.txt # tallies, overwrites previous human size
cat /tmp/size-human.txt                         # reads that text file to you, telling you the present total size of files in your current directory and all its children, crisply
