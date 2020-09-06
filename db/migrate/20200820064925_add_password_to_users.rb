class AddPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :titles, :password, :string
  end
end
