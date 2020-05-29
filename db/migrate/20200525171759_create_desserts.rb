class CreateDesserts < ActiveRecord::Migration[5.2]
  def change
    create_table :desserts do |t|
      t.string :type
      t.string :flavor
      t.string :toppings
    end
  end
end
