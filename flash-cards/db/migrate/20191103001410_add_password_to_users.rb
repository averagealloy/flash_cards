class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_colum :users, :password_digest
  end
end
