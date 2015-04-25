class AddSignInTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sign_in_time, :integer, default: 0
  end
end
