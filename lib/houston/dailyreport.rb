require "houston/dailyreport/engine"
require "houston/dailyreport/configuration"

module Houston
  module Dailyreport
    extend self
    
    attr_reader :config
    
  end
  
  Dailyreport.instance_variable_set :@config, Dailyreport::Configuration.new
end
