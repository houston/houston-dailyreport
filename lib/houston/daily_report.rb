require "houston/daily_report/engine"
require "houston/daily_report/configuration"

module Houston
  module DailyReport
    extend self
    
    attr_reader :config
    
    
    
    def deliver_all!(date=Date.today-1)
      reports_with_news_and_recipients(date).map(&:deliver!)
    end
    
    def reports_with_news_and_recipients(date)
      reports_with_news_and_recipients = []
      Project.find_each do |project|
        report = Houston::DailyReport::ProjectReport.new(project, date)
        reports_with_news_and_recipients << report if report.recipients.any? && report.any_news?
      end
      reports_with_news_and_recipients
    end
    
  end
  
  DailyReport.instance_variable_set :@config, DailyReport::Configuration.new
end
