class Room < ActiveRecord::Base
  validates :name, presence: true
  has_many :outgoing_connections, class_name: "Connection",
    foreign_key: "starting_room_id"
  has_many :ending_rooms, through: :outgoing_connections
  has_many :incoming_connections, class_name: "Connection",
    foreign_key: "ending_room_id"
  has_many :starting_rooms, through: :incoming_connections
  has_many :items
  belongs_to :player
end
