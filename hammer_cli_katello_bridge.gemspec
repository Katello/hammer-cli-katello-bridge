# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hammer_cli_katello_bridge/version"

Gem::Specification.new do |s|

  s.name          = "hammer_cli_katello_bridge"
  s.version       = HammerCLIKatelloBridge.version.dup
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Martin Bačovský"]
  s.email         = "mbacovsk@redhat.com"
  s.homepage      = "http://github.com/theforeman/hammer-cli-katello-bridge"

  s.summary       = %q{Katello commands for hammer-cli}
  s.description   = <<EOF
Katello commands for Hammer CLI. This plugin use Katello CLI to run the commands. 
EOF

  # s.files         = `git ls-files`.split("\n")
  s.files = Dir['lib/**/*.rb'] + Dir['bin/*']
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.test_files = Dir.glob('test/tc_*.rb')
  s.require_paths = ["lib"]

  s.add_dependency 'json'
  s.add_dependency 'hammer_cli'

end
