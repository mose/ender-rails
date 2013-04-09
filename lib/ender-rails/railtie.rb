require 'ender-rails'
require 'rails'
module EnderRails
  class Railtie < Rails::Railtie
    railtie_name :ender

    rake_tasks do
      load "tasks/ender.rake"
    end
  end
end