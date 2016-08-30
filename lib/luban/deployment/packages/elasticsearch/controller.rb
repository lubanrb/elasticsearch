module Luban
  module Deployment
    module Packages
      class Elasticsearch
        class Controller < Luban::Deployment::Service::Controller
          module Commands
            def self.included(base)
              base.define_executable 'elasticsearch'
            end

            def java_home_path
              @java_home_path ||= readlink(app_path.join('java'))
            end

            def process_pattern
              @process_pattern ||= "#{profile_path}$"
            end

            def start_command
              @start_command ||= "#{elasticsearch_executable} -d -p #{pid_file_path} --path.conf=#{profile_path}"
            end

            def stop_command
              @stop_command ||= "kill $(cat #{pid_file_path} 2>/dev/null)"
            end
          end

          include Paths
          include Parameters
          include Commands
        end
      end
    end
  end
end
