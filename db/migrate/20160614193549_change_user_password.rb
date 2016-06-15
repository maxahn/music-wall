class ChangeUserPassword < ActiveRecord::Migration
  def change
    rename_column :users, :user_name, :username
    rename_column :users, :password, :password_hash
  end
end
