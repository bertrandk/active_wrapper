# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'active_wrapper/gems'
require 'active_wrapper/version'

Gem::Specification.new do |s|
  s.name = "active_wrapper"
  s.version = ActiveWrapper::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Winton Welsh"]
  s.email = ["mail@wintoni.us"]
  s.homepage = "http://github.com/winton/active_wrapper"
  s.summary = "Wraps ActiveRecord and Logger for use in non-Rails environments"
  s.description = "Wraps ActiveRecord and Logger for use in non-Rails environments"

  ActiveWrapper::Gems::TYPES[:gemspec].each do |g|
    s.add_dependency g.to_s, ActiveWrapper::Gems::VERSIONS[g]
  end
  
  ActiveWrapper::Gems::TYPES[:gemspec_dev].each do |g|
    s.add_development_dependency g.to_s, ActiveWrapper::Gems::VERSIONS[g]
  end

  s.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md)
  s.executables = Dir.glob("{bin}/*").collect { |f| File.basename(f) }
  s.require_path = 'lib'
end