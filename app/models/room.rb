class Room < ApplicationRecord

  belongs_to :user
  has_many :reservations
  validates :name, :fee, :address, :introduction, presence: true, on: :create

  has_one_attached :room_image

end
