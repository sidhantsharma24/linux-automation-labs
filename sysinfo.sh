#!/bin/bash

echo "=========================================="
echo "		SYSTEM INFORMATION		"
echo "=========================================="

username=$(whoami)
host=$(hostname)
kernel=$(uname -r)
uptime=$(uptime -p)
date=$(date)
echo ""

echo "Current User: $username"
echo "Hostname: $host"
echo "Kernel Version: $kernel"
echo "System Uptime: $uptime"
echo "Current Date: $date"
echo ""
echo "=========================================="
