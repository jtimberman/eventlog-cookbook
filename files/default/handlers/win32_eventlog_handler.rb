#
# Cookbook Name:: eventlog
# Handler: win32_eventlog_handler.rb
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

require 'win32/eventlog'
include Win32

module Opscode
  class ReportEventLog < Chef::Handler
    def report
      resources_updated = run_status.updated_resources.map {|r| r.to_s}
      el = EventLog.open("Chef")
      el.write(
        :event_type => EventLog::INFO_TYPE,
        :data => if run_status.success?
                   "Chef run complete in \n#{run_status.elapsed_time}\n#{resources_updated}"
                 else
                   "Chef run failed with exception\n#{run_status.exception}"
                 end
      )
    end
  end
end
