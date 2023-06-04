class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, :check_out, :num_of_persons, presence: true, on: :create
  validate :check_in_out_check

  def check_in_out_check
    if self.check_in == nil || self.check_out ==nil
      errors.add :check_in, :check_out, message: "は空欄にしないでください"
    elsif self.check_out < self.check_in
      errors.add :check_out, message: "無効な日付です"
    end
  end
end
