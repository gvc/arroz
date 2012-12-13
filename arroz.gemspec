# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'arroz/version'
 
Gem::Specification.new do |s|
  s.name        = "arroz"
  s.version     = Arroz::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Guilherme Carvalho"]
  s.email       = ["guilherme@guava.com.br"]
  s.homepage    = "http://github.com/gvc/arroz"
  s.summary     = "Simple attempt to build an IA framework in Ruby"
  s.description = "Simple attempt to build an IA framework in Ruby"
 
  s.required_rubygems_version = ">= 1.3.6"
 
  s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("{lib}/**/*")# + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
  s.require_path = 'lib'
end