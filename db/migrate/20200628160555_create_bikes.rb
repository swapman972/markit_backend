class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :title
      t.string :website
      t.string :category
      t.string :season
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end
