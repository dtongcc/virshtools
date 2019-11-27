# Function of the scripts:
# To "grep" output from "virsh domstats" command in such a way that the domain name (virtual machine name) will be the header of the found strings
# Usage:
# virshgrep.sh [string]
# where [string] is the string value you want to find in the "virsh domstats" output
# Use case (many more, please feel free to leave your use cases as comments):
# 1. The below command will show all virtual machines that have been mounted with an iso image (which is my intented purpose of the script)
# virshgrep.sh iso 
# 2. The below command will show the block devices of each virtual machines
# virshgrep.sh block.*.path
# 3. The below command will show if there is any block devices resides in /usr/local path
# virshgrep.sh block.*.path=/usr/local
# Remarks:
# Yes, this script has only one effective line.
#!/bin/bash
virsh domstats | grep -x "Domain.*\|.*$1.*" | grep --color=never -Pzo "Domain.*\\n  .*$1.*\\n|  .*\\n"
