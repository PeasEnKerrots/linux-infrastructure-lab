#!/bin/bash

echo "================================="
echo "      SYSTEM MONITOR REPORT"
echo "================================="

echo ""
echo "Hostname:"
hostname

echo ""
echo "Current User:"
whoami

echo ""
echo "System Uptime:"
uptime

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "IP Address:"
hostname -I

echo ""
echo "Apache Status:"
systemctl is-active httpd

echo ""
echo "SSH Status:"
systemctl is-active sshd

echo ""
echo "================================="
echo "       REPORT COMPLETE"
echo "================================="
