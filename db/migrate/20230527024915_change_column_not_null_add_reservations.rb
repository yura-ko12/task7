class ChangeColumnNotNullAddReservations < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:reservations, :check_in, false)
    change_column_null(:reservations, :check_out, false)
    change_column_null(:reservations, :num_of_persons, false)
  end
end
