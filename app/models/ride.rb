class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if self.attraction.tickets > self.user.tickets 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif self.attraction.min_height > self.user.height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            "hello world"
        end
    end
end
