class ChangeToppingToStringInDesserts < ActiveRecord::Migration[5.2]
  def change
    change_column :desserts, :toppings, :integer
  end
end
