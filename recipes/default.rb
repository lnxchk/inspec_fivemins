#
# Cookbook:: osdc-inspec-talk
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
remote_file '/tmp/inspec.rpm' do
  source "https://packages.chef.io/files/stable/inspec/2.2.20/el/7/inspec-2.2.20-1.el7.x86_64.rpm"
end

package "inspec" do
  source "/tmp/inspec.rpm"
  action :install
end

package 'git' 

