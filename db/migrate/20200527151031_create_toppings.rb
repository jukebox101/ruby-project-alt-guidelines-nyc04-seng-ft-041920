class CreateToppings < ActiveRecord::Migration[5.2]
  def change
    create_table :toppings do |t|
      t.integer :dessert_id_top
      t.integer :order_id_top
      t.string :topping_1
      t.string :topping_2
      t.string :topping_3
    end
  end
end
