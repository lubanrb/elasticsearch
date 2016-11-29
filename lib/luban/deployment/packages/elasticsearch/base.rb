module Luban
  module Deployment
    module Packages
      class Elasticsearch < Luban::Deployment::Service::Base
        module Paths
          def control_file_dir; @control_file_dir ||= "config"; end

          def control_file_name
            @control_file_name ||= "#{service_name}.yml"
          end

          def data_path
            @data_path ||= shared_path.join('data')
          end
        end

        DefaultPort = 9200
        DefaultNetworkHost = `hostname -f`.chomp

        parameter :port, default: DefaultPort
        parameter :network_host, default: DefaultNetworkHost

        protected

        def include_default_templates_path
          default_templates_paths.unshift(base_templates_path(__FILE__))
        end
      end
    end
  end
end
