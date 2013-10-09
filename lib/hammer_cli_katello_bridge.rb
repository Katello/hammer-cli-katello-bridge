require 'hammer_cli'
require 'json'
require 'logging'

module HammerCLIKatelloBridge

  class KatelloCommand < HammerCLI::AbstractCommand

    option "--dry-run", :flag, "do not run the command just log what would have been executed"

    class << self
      attr_accessor :command_prefix
    end

    @command_prefix = ''

    def execute
      katello_params = options.select { |k,v| k != 'dry_run' }
      safe_params = katello_params.map do |k,v|
        if v.is_a?(TrueClass)
          param = "--#{k}"
        else
          param = "--#{k}='%s'" % v.gsub("'","\\\\'")
        end
        param
      end
      katello [self.class.command_prefix] + safe_params
      0
    end

    protected

    def katello args
      cml = args.join(' ')

      username = context[:username] || ENV['KATELLO_USERNAME'] || HammerCLI::Settings.get(:katello_bridge, :username)
      password = context[:password] || ENV['KATELLO_PASSWORD'] || HammerCLI::Settings.get(:katello_bridge, :password)

      username_param = username ? "-u #{username}" : ''
      password_param = password ? "-p #{password}" : ''

      command = "katello #{username_param} #{password_param} #{cml}"

      logger.info "Passing control to: %s" % command.gsub(/\s\-p\s\S*/, ' -p ***')

      exec command unless dry_run?
    end

    def logger
      Logging.logger["KatelloBridge %s" % self.class.command_prefix]
    end
  end

  def self.load_commands(cli_definition)
    json = JSON.parse(cli_definition)
    commands = self.convert_commands(json, '')
  end

  def self.convert_commands(command_list, prefix)
    commands = {}
    command_buffer = []
    command_list.each do |command|
      command_name = command['name']
      commands[command_name] = Class.new KatelloCommand

      command_prefix = prefix.empty? ? command_name : "#{prefix} #{command_name}"
      commands[command_name].command_prefix = command_prefix
      command['options'].each do |opt|
        dest = (opt['dest'] || 'arg').upcase
        commands[command_name].option opt['names'], dest, opt['description'], :required => opt['required']
      end
      self.convert_commands(command['subcommands'], command_prefix).each do |c|
        commands[command_name].subcommand c[:name], c[:desc], c[:cls]
      end
      command_buffer << { :name=>command_name, :desc=>command['description'], :cls=>commands[command_name] }
    end
    command_buffer
  end


  spec = Gem::Specification.find_by_name("hammer_cli_katello_bridge")
  json_file = HammerCLI::Settings.get(:katello_bridge, :cli_description) || File.join(spec.gem_dir, 'katello.json')
  raise RuntimeError.new("Path to katello CLI description is not set or file does not exist") unless (json_file && File.exist?(json_file))
  self.load_commands(File.read(json_file)).each do |command|
    HammerCLI::MainCommand.subcommand!(command[:name], command[:desc], command[:cls])
  end

end
