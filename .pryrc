# turn color on
Pry.config.color = true
Pry.config.theme = "solarized"

# custom prompt to show ruby version, useful with RVM
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, \
proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

# Plugins
require 'interactive_editor'

# setup collins biznatch
begin
  require 'collins_auth'
  require 'etc'
  c = Collins::Authenticator.setup_client
rescue LoadError
  require 'collins_client'
  options = {
  :collins_config_file => '/var/db/collins.yaml'
  }
  collins = YAML.load_file(options[:collins_config_file]).reduce({}){|memo,(k,v)|memo[k.to_sym] = v; memo    }
  collins = collins[:collins] if collins.key? :collins
  c = Collins::Client.new(collins)
end
