class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :fullAddress
      t.string :hours
      t.string :phone
      t.string :website
      t.string :category
      t.string :season
      t.integer :zipcode
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
