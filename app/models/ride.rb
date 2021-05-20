class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        user = self.user
        attraction = self.attraction

        if attraction.min_height > user.height && attraction.tickets > user.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif attraction.tickets > user.tickets 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif attraction.min_height > user.height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            user.update(
                tickets: user.tickets - attraction.tickets, 
                nausea: user.nausea + attraction.nausea_rating,
                happiness: user.happiness + attraction.happiness_rating
            )

            "Thanks for riding the #{attraction.name}!"
        end
    end
end
