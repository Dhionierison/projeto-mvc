class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :quantidade

      t.timestamps
    end
  end
end
