#!/bin/bash

# CPU Usage Function
echo "CPU Usage"
top -b -n 1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $3+$5 "%"}'
echo

# Memory Usage Function
echo "Memory Stats"
free -h | awk '/Mem/{print "Total: "$4", Used: "$2", Free: "$3}'
echo

# Disk Usage Function
echo "Disk Usage"
df -h --total | awk '/total/{print "Total Disk: "$2", Used: "$1", Free: "$1}'
echo

# Recently Modified Files (Last 24 Hours)
echo "Recently Modified Files (Last 24 Hours)"
if command -v find >/dev/null 2>&1; then
    find ~ -type f -mtime -1 -print 2>/dev/null
fi
