class AddAmountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :amount, :string
  end
end
