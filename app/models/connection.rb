class Connection < ActiveRecord::Base
  belongs_to :starting_room, class_name: Room
  belongs_to :ending_room, class_name: Room
end
