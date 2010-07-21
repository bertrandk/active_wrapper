require File.dirname(__FILE__) + '/active_wrapper/gems'

ActiveWrapper::Gems.new(:lib)

require 'action_mailer'
require 'active_record'
require 'fileutils'
require 'logger'
require 'yaml'

$:.unshift File.dirname(__FILE__) + '/active_wrapper'

require 'db'
require 'log'
require 'mail'
require 'version'

module ActiveWrapper
  class <<self
    
    def setup(options={})
      
      env = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || ENV['MERB_ENV'] || 'development'
      options = {
        :base => File.dirname($0),
        :env => options[:env] || env,
        :log => options[:env] || env
      }.merge(options.reject { |k, v| v.nil? })
      
      db = Db.new(options)
      log = Log.new(options)
      mail = Mail.new(options)
      
      ActionMailer::Base.logger = log
    
      [ db, log, mail ]
    end
  end
end

ActiveRecord::Base.default_timezone = :utc