class AddUserIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_id, :string ,after: :name
    add_column :users, :user_image, :string ,after: :user_id
    add_column :users, :birth_day, :date ,after: :region
  end
end
