#
# Cookbook Name:: eventlog
# Recipe:: default
#
# Author:: Joshua Timberman <joshua@opscode.com>
# Copyright 2011, Opscode, Inc <legal@opscode.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

gem_package "win32-eventlog" do
  action :nothing
end.run_action(:install)

require 'rubygems'
Gem.clear_paths

cookbook_file "#{node['chef_handler']['handler_path']}/win32_eventlog_handler.rb" do
  source "handlers/win32_eventlog_handler.rb"
end

chef_handler "Opscode::ReportEventLog" do
  source "#{node['chef_handler']['handler_path']}/win32_eventlog_handler.rb"
  action :enable
end
