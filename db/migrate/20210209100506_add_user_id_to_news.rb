class AddUserIdToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :user_id, :int
  end
end