module Houston::Dailyreport
  class Configuration
    
    def initialize
      config = Houston.config.module(:dailyreport).config
      instance_eval(&config) if config
    end
    
    # Define configuration DSL here
    
  end
end
