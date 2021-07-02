class AddAvatarToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :avatar, :string
  end
end
