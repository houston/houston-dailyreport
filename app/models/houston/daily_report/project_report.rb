module Houston
  module DailyReport
    class ProjectReport
      
      def initialize(project, date=Date.today-1)
        @project = project
        @date = date.to_date
        @timespan = date.beginning_of_day...date.end_of_day
      end
      
      attr_reader :project, :date, :timespan
      
      
      
      def title
        "activity on #{date.strftime("%A, %B %e")}"
      end
      
      
      
      def recipients
        @recipients ||= project.followers.developers.unretired
      end
      
      def any_news?
        tickets_closed.any? || new_exceptions.any?
      end
      
      
      
      def tickets_closed
        @tickets_closed ||= project.tickets.closed_on(date).order(:resolution)
      end
      
      
      
      def exceptions
        @exceptions ||= project.error_tracker.problems_during(timespan)
      end
      
      def new_exceptions
        @new_exceptions ||= exceptions.select { |exception| timespan.cover? exception.first_notice_at }
      end
      
      
      
      def deliver!
        deliver_to!(recipients)
      end
      
      def deliver_to!(recipients)
        Mailer.daily_report(self, recipients).deliver! if any_news?
      end
      
      
      
    end
  end
end
