class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstN
      t.string :lastN
      t.integer :zipcode

      t.timestamps
    end
  end
end
