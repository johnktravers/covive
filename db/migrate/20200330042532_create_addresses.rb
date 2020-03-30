class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, null: true, foreign_key: true
      t.references :errand, null: true, foreign_key: true
      t.timestamps
    end
  end
end
