class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.string :URL
      t.integer :rating

      t.timestamps
    end
  end
end
