#
# Cookbook Name:: acl
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'acl'

execute 'sed -i -e "s/\(ext4\|auto\|xfs\)\([\t ]*\)\(defaults\)/\1\2acl,\3/" /etc/fstab' do
  not_if "grep -q 'acl,defaults' /etc/fstab"
end

execute "mount -o remount /" do
  not_if "mount | grep -q 'acl'"
end
