class AddSecretKeyToUserRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :user_registrations, :secret_key, :string
  end
end
