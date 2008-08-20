class BuildPlan < ActiveRecord::Base

    def initialize params
        super params
        self.url = "http://" unless self.url
    end

end
