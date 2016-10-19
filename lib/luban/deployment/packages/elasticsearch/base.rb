module Luban
  module Deployment
    module Packages
      class Elasticsearch < Luban::Deployment::Service::Base
        module Paths
          def control_file_name
            @control_file_name ||= "#{service_name}.yml"
          end

          def data_path
            @data_path ||= shared_path.join('data')
          end
        end

        module Parameters
          extend Luban::Deployment::Parameters::Base

          DefaultPort = 9200
          parameter :port

          protected

          def set_default_elasticsearch_parameters
            set_default :port, DefaultPort
          end
        end

        include Parameters

        protected

        def set_default_parameters
          super
          set_default_elasticsearch_parameters
        end

        def include_default_templates_path
          default_templates_paths.unshift(base_templates_path(__FILE__))
        end
      end
    end
  end
end
