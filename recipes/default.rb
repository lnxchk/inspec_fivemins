#
# Cookbook:: osdc-inspec-talk
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
remote_file '/tmp/inspec-1.23.0-1.el7.x86_64.rpm' do
  source "https://packages.chef.io/files/stable/inspec/1.23.0/el/7/inspec-1.23.0-1.el7.x86_64.rpm"
end

package "inspec" do
  #source "https://packages.chef.io/files/stable/inspec/1.23.0/el/7/inspec-1.23.0-1.el7.x86_64.rpm"
  source "/tmp/inspec-1.23.0-1.el7.x86_64.rpm"
  action :install
end

package 'git' 

git '/home/vagrant/linux-baseline' do
  repository 'https://github.com/dev-sec/linux-baseline.git'
  revision 'master'
  action :sync
end

package 'rng-tools'

service 'rngd' do
  action [:start,:enable]
end
