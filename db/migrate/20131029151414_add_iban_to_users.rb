class AddIbanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :iban, :string
  end
end
