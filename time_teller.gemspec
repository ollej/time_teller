lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler/version'

Gem::Specification.new do |s|
  s.name        = 'time_teller'
  s.version     = '0.0.5'
  s.date        = '2014-05-15'
  s.summary     = "Tell time"
  s.description = "Speaks the time in English."
  s.authors     = ["Olle Johansson"]
  s.email       = 'Olle@Johansson.com'
  s.files       = ["lib/time_teller.rb"]
  s.executables << 'tell_time'
  s.add_dependency 'fuzzy_time', '~> 1.1'
  s.add_dependency 'docopt', '~> 0.5'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.homepage    =
    'http://rubygems.org/gems/time_teller'
  s.license       = 'MIT'
end
