module Luban
  module Deployment
    module Packages
      class Elasticsearch
        class Configurator < Luban::Deployment::Service::Configurator
          include Paths
          include Parameters
          include Controller::Commands
        end
      end
    end
  end
end
