class RenameDessertColumnType < ActiveRecord::Migration[5.2]
  def change
    rename_column :desserts, :type, :dessert_type
  end
end
