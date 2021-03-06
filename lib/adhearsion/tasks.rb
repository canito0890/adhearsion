# encoding: utf-8

require 'adhearsion'

Dir[File.join(File.dirname(__FILE__), "tasks/*.rb")].each do |file|
  require file
end

initializer = Adhearsion::Initializer.new
initializer.configure_plugins
initializer.load_lib_folder
initializer.load_config_file
initializer.load_events_file
initializer.load_routes_file
initializer.start_logging
initializer.init_plugins

Adhearsion::Plugin.load_tasks

puts "\nAdhearsion configured environment: #{Adhearsion.environment}\n" unless ARGV.empty?

desc "Dump useful information about this application's Adhearsion environment"
task :about do
  puts "Adhearsion version: #{Adhearsion::VERSION}"
end

task :default => :about
