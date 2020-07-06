class AddPersonalInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :region, :string
    add_column :users, :sex, :string
  end
end
