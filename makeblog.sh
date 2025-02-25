#!/usr/bin/env bash
[[ $1 == "" ]] && echo "u have to input a file!!" && exit
sed -e 's:^:<p class="text" >:' $1 > thingies/$1.tmp
sed -i -e 's:$:</p>:' thingies/$1.tmp
sed -z -i -e 's:<p class="text" >:<p class="text title" >:' thingies/$1.tmp
sed -z -i -e 's:<p class="text" >:<p class="text subtitle" >:' thingies/$1.tmp
sed -i -e 's:^:\t:' thingies/$1.tmp

cat thingies/top.html > $1.html
cat thingies/$1.tmp >> $1.html
cat thingies/bottom.html >> $1.html

rm thingies/$1.tmp
