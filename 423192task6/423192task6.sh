#!/bin/bash

# Backup using tar command

# Example 1: Create a tar archive of a directory
echo "Creating tar backup of the /home/user directory..."
tar -cvf /tmp/backup_home.tar /home/user
echo "Backup created as /tmp/backup_home.tar"

# Example 2: Extract a tar archive
echo "Extracting backup_home.tar..."
tar -xvf /tmp/backup_home.tar -C /tmp/
echo "Backup extracted to /tmp/"

# Example 3: Create a compressed tar archive (.gz)
echo "Creating compressed tar backup of the /etc directory..."
tar -czvf /tmp/backup_etc.tar.gz /etc
echo "Compressed backup created as /tmp/backup_etc.tar.gz"

# Example 4: List contents of a tar archive without extracting
echo "Listing contents of backup_home.tar..."
tar -tvf /tmp/backup_home.tar

# Example 5: Create a tar archive excluding certain files
echo "Creating tar backup of /home/user excluding *.log files..."
tar --exclude="*.log" -cvf /tmp/backup_home_exclude_logs.tar /home/user
echo "Backup created excluding *.log files as /tmp/backup_home_exclude_logs.tar"

# Backup using cpio command

# Example 1: Create a cpio backup of a directory
echo "Creating cpio backup of the /var/log directory..."
find /var/log -print | cpio -ov > /tmp/backup_var_log.cpio
echo "cpio backup created as /tmp/backup_var_log.cpio"

# Example 2: Extract a cpio backup
echo "Extracting cpio backup..."
cpio -id < /tmp/backup_var_log.cpio
echo "cpio backup extracted."

# Example 3: Backup using cpio with gzip compression
echo "Creating compressed cpio backup of the /usr/local directory..."
find /usr/local -print | cpio -ov | gzip > /tmp/backup_usr_local.cpio.gz
echo "Compressed cpio backup created as /tmp/backup_usr_local.cpio.gz"

# Example 4: List contents of a cpio archive
echo "Listing contents of cpio backup..."
cpio -it < /tmp/backup_var_log.cpio

# Example 5: Create a cpio backup excluding certain files (e.g., *.bak files)
echo "Creating cpio backup of /home/user excluding *.bak files..."
find /home/user -type f ! -name "*.bak" -print | cpio -ov > /tmp/backup_user_no_bak.cpio
echo "cpio backup created excluding *.bak files as /tmp/backup_user_no_bak.cpio"

echo "Backup operations completed."


