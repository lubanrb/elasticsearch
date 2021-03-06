module Luban
  module Deployment
    module Packages
      class Elasticsearch
        class Controller < Luban::Deployment::Service::Controller
          module Commands
            def self.included(base)
              base.define_executable 'elasticsearch'
            end

            def java_bin_path
              @java_bin_path ||= package_bin_path('java')
            end

            def process_pattern
              @process_pattern ||= "#{control_path}$"
            end

            def start_command
              @start_command ||= shell_command("PATH=#{java_bin_path}:$PATH #{elasticsearch_executable} -d -p #{pid_file_path} --path.conf=#{control_path}")
            end

            def stop_command
              @stop_command ||= shell_command("kill $(cat #{pid_file_path} 2>/dev/null)")
            end
          end

          include Paths
          include Commands
        end
      end
    end
  end
end
