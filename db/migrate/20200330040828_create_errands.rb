class CreateErrands < ActiveRecord::Migration[6.0]
  def change
    create_table :errands do |t|
      t.string :name
      t.integer :category, default: 0
      t.integer :urgency, default: 0
      t.text :notes
      t.boolean :completed?, default: false
      t.references :user, null: false, foreign_key: true
      t.bigint :helper_id, null: true
      t.timestamps
    end
  end
end
