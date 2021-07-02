class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.string :file_type
      t.integer :category
      t.boolean :sale
      t.float :price
      t.boolean :tnc

      t.timestamps
    end
  end
end
