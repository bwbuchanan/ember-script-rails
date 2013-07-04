module EmberScript
  module Rails
    class Engine < ::Rails::Engine
      config.ember_script = ActiveSupport::OrderedOptions.new

      config.before_initialize do |app|
        if app.config.assets.enabled
          sprockets = if ::Rails::VERSION::MAJOR == 4
            Sprockets.respond_to?('register_engine') ? Sprockets : app.assets
          else
            app.assets
          end
          sprockets.register_engine '.em', EmberScript::EmberScriptTemplate
        end
      end
    end
  end
end