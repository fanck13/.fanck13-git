#!/bin/sh
#gitconfig=${HOME}/.gitconfig

#if [ ! -f "$gitconfig" ]; then
#    touch "$gitconfig"
#fi
#echo $gitconfig

#echo "[include]\n\tpath = ./.fanck13-git/config.include" >> $gitconfig

curPath=$(readlink -f "$(dirname "$0")")
scriptPath=$curPath/scripts/linux

for scriptFile in $scriptPath/*; do
    if [ -f $scriptFile ]; then
        echo $scriptFile
        echo ${scriptFile##*/}
    fi
done
