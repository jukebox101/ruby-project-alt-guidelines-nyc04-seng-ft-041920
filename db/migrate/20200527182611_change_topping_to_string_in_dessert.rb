class ChangeToppingToStringInDessert < ActiveRecord::Migration[5.2]
  def change
    change_column :dessert, :toppings, :integer
  end
end
