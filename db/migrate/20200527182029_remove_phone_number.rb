class RemovePhoneNumber < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :phone_number
  end
end
