#!/bin/bash

user=`whoami`
config_dir="$COLM"
[ -n $config_dir ] && config_dir=.config/colm
config_file=/home/$user/$config_dir/config
if [[ ! -d /home/$user/$config_dir ]]; then
  mkdir /home/$user/$config_dir
  echo "Configuration file went missing. Generated an empty one."
fi

lists_dir=`grep "lists_dir" $config_file | awk '{print $2}'`
list_name="$user-list"

while getopts 'C:L:a:' key; do
  case "$key" in
    C) echo 1
    ;;
    L) list_name=$OPTARG
    ;;
    a) entry_name=$OPTARG
    ;;
  esac
done

if (echo "$list_name" | grep -xq "\-.*"); then
  echo "Must pass an option to an -L key"
  exit 1
fi

[ ! -n "$entry_name" ] && exit 2
[ ! -n "$list_name" ] && exit 2
[ ! -f "$lists_dir/$list_name" ] && touch "$lists_dir/$list_name"

echo "Appending to : $lists_dir/$list_name"
echo "$entry_name" >> $lists_dir/$list_name
