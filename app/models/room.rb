class Room < ApplicationRecord

  belongs_to :user
  has_many :reservations
  validates :name, :fee, :address, :introduction, presence: true, on: :create
  validates :fee, numericality: {greater_than_or_equal_to: 0}

  has_one_attached :room_image

end
