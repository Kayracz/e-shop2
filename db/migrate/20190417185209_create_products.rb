class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :color
      t.integer :quantity
      t.string :size
      t.string :gender
      t.string :category

      t.timestamps
    end
  end
end
