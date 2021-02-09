#! /bin/bash

## What it does
echo "This script create a luks encripted file"
echo "You need the package cryptsetup"
echo ""
## Asks for the file name
read -p "What will be the name of the file?" FNAME
echo ""
echo "-----------------------------"
echo "The encripted file will be named $FNAME"
echo "-----------------------------"
echo ""

## Asks for the size
read -p "What size will the file have?(in MB)" SIZE
echo ""
echo "-----------------------------"
echo "The size will be $SIZE MB"
echo "-----------------------------"
echo ""

## Creates the file in the actual directory
dd if=/dev/zero of=$PWD/$FNAME bs=1M count=$SIZE
echo ""
echo "-----------------------------"
echo "File Created"
echo "-----------------------------"
echo ""

## Encrypts the file
sudo cryptsetup -v --cipher aes-xts-plain64 --key-size 512 --hash sha256 --iter-time 5000 --use-random luksFormat --type luks2 $FNAME

echo ""
echo "-----------------------------"
echo "File encripted"
echo "-----------------------------"
echo ""

## Asks if you want a file system
echo "Do you wish to create a file system(ext4) inside the encripted file?(select 1 or 2)"
select yn in "Yes" "No"; do
    case $yn in
        Yes )sudo cryptsetup open --type luks2 $FNAME $FNAME;sudo mkfs.ext4 /dev/mapper/$FNAME;sudo cryptsetup close $FNAME; break;;
        No ) exit;;
    esac
done

echo ""
echo "-----------------------------"
echo "File system (ext4) created"
echo "-----------------------------"
echo ""
