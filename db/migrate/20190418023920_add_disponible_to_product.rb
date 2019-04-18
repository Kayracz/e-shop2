class AddDisponibleToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :disponible, :boolean
  end
end
