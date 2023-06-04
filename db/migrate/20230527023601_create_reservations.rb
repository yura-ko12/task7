class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :check_in
      t.date :check_out
      t.integer :num_of_days
      t.integer :num_of_persons

      t.timestamps
    end
  end
end
