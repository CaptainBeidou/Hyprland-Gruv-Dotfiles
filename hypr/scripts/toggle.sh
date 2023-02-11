#!/bin/bash
        tmp_file="/tmp/bar_status"
        
        if [[ ! -f $tmp_file  ]];then
            echo 1 > $tmp_file
        fi
        
        get_status() {
            if [[ $(cat $tmp_file) == 1 ]];then
                exit 1
            else
                exit 0
            fi
        }
        
        reload() {
            val=$(cat $tmp_file)
            echo $(( (val+1)%2  )) > $tmp_file
            pkill -RTMIN+1 waybar
            pkill -RTMIN+2 waybar
        }
        
        "$@"
