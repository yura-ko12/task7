class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, :null => false
      t.integer :fee, :null => false
      t.string :address, :null => false
      t.text :introduction, :null => false
      t.string :img

      t.timestamps
    end
  end
end
