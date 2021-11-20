class AddModelToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :model, :string
    add_column :cars, :brand, :string
    add_column :cars, :box, :string
    add_column :cars, :complect, :string
  end
end
