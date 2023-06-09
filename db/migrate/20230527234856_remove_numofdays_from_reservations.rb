class RemoveNumofdaysFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :num_of_days, :integer
  end
end
