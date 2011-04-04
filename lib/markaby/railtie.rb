require 'rails'
require 'markaby/rails/template_handler'
require 'markaby/rails/action_controller_helpers'

module Markaby
  class Railtie < ::Rails::Railtie
    initializer "markaby.register_template_handler" do
      ActiveSupport.on_load(:action_view) do
        ::ActionView::Template.register_template_handler(:mab, Markaby::Rails::TemplateHandler)
      end

      ActiveSupport.on_load(:action_controller) do
        ::ActionController::Base.send :include, Markaby::Rails::ActionControllerHelpers
      end
    end
  end
end
