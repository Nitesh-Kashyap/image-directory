class CreateUserRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_registrations do |t|
      t.integer :phone
      t.string :otp
      t.integer :otp_status

      t.timestamps
    end
  end
end
