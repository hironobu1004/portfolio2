class AddPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password, :string

    rename_column :users, :password, :password_digest
  end
end
