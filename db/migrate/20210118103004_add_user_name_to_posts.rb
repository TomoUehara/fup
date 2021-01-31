class AddUserNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user_name, :integer
  end
end
