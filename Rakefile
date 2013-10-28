$:.unshift File.dirname(__FILE__) + 'lib'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

desc "Run tests with --format documentation"
task :local do
  sh "rspec -I. spec/frac_spec.rb --format documentation"
end

desc "Run tests with --format html"
task :lhtml do
  sh "rspec -I. spec/frac_spec.rb --format html"
end
