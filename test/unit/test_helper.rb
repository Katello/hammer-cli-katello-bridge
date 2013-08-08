require 'simplecov'
require 'pathname'

SimpleCov.use_merging true
SimpleCov.start do
  command_name 'MiniTest'
  add_filter 'test'
end
SimpleCov.root Pathname.new(File.dirname(__FILE__) + "../../../")


require 'minitest/autorun'
require 'minitest/spec'
require "minitest-spec-context"
require "mocha/setup"

require 'hammer_cli'

# fake commands definition for module loading
tf = Tempfile.open('bridge_test')
tf.puts "[]"
tf.rewind
HammerCLI::Settings.load({ :katello_cli_description => tf.path })

Logging.logger.root.appenders = Logging::Appenders['__test__'] || Logging::Appenders::StringIo.new('__test__')

require 'hammer_cli_katello_bridge'

