#!/bin/bash
sync; echo 3 > /proc/sys/vm/drop_caches
sync; free -w -h 
