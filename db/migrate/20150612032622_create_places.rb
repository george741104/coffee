class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :capacity
      t.boolean :is_open


      t.timestamps null: false
    end
  end
end
