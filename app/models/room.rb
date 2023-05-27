class Room < ApplicationRecord

  belongs_to :user
  validates :name, :fee, :address, :introduction, presence: true, on: :create

end
