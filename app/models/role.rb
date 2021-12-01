class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def lead
        chosen_actor = self.auditions.find_by(hired: true)
        chosen_actor == nil ? "No actor has been hired for this role" : chosen_actor
    end

    def understudy
        understudy = self.auditions.where(hired: true)
        if understudy.length <2
            "No actor has been hired to understudy for this role"
        else
            understudy.second
        end
    end
end