module Houston
  module DailyReport
    class Mailer < ProjectNotification
      
      self.stylesheets = stylesheets + %w{
        houston/dailyreport/daily_report.scss
      }
      
      def daily_report(daily_report, recipients)
        @report = daily_report
        @project = daily_report.project
        @title = daily_report.title
        @date = daily_report.date
        
        mail({
          to: recipients,
          subject: daily_report.title,
          template: "/houston/daily_report/mailer/daily_report"
        })
      end
      
    end
  end
end
