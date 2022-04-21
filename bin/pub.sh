#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version> "
        exit -1
fi



VERSION=$1
VERSION_CODE=${VERSION#./}
VERSION_CODE=${VERSION_CODE#+/}

bin/setver.sh $1
bin/build.sh
bin/reldev REL

git add .
git commit -m "Taudio-aaa_native : Version $VERSION"
git pull origin
git push origin
if [ ! -z "$VERSION" ]; then
    git tag -f $VERSION  -m "Taudio-aaa_native : Version $VERSION"
    git push  -f origin $VERSION
fi


pod trunk push taudio-waa_native.podspec
if [ $? -ne 0 ]; then
    echo "Error"
    #exit -1
fi


echo 'E.O.J'
