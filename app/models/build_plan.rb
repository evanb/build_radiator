require 'open-uri'

class BuildPlan < ActiveRecord::Base

    GREEN = "green"
    RED = "red"
    UNKNOWN = "unknown"

    validates_inclusion_of :status, :in => [ "green", "red", "unknown" ]

    def initialize params = nil
        super params
        self.rss_url = "http://" unless self.rss_url
        self.status = UNKNOWN unless self.status
    end
    
    def update_status
        begin
            doc = REXML::Document.new(open(self.rss_url).read)
            latest_build = doc.root.elements["channel/item"]

            if latest_build.elements["title"].text.include?('FAILED')
                self.status = RED
            else
                self.status = GREEN
            end
        rescue Exception => ex
            puts "Unable to retrieve status for build_plan: #{self.name} (#{ex.message})"
            self.status = UNKNOWN
        end
    end
    
    def BuildPlan.update_all
        plans = find(:all)
        plans.each { |plan|
            plan.update_status
            plan.save
        }
    end

end
