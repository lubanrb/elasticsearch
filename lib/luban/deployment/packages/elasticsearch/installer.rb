module Luban
  module Deployment
    module Packages
      class Elasticsearch
        class Installer < Luban::Deployment::Service::Installer
          include Paths

          define_executable 'elasticsearch'

          def source_repo
            @source_repo ||= 'http://download.elastic.co'
          end

          def source_url_root
            @source_url_root ||= "elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/#{package_version}"
          end

          def installed?
            file?(elasticsearch_executable)
          end

          protected

          def init
            super
            linked_dirs.push('data', 'logs')
          end

          def build_package
            info "Building #{package_full_name}"
            within install_path do
              rm('-r', '*') # Clean up install path
              execute(:mv, build_path.join('*'), '.', ">> #{install_log_file_path} 2>&1")
            end
          end

          def create_symlinks!
            super
            assure_symlink(log_path, install_path.join('logs'))
          end
        end
      end
    end
  end
end

