# db/migrate/[timestamp]_create_categories.rb

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      # Add more columns if needed
      t.timestamps
    end
  end
end
