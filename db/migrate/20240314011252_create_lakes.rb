class CreateLakes < ActiveRecord::Migration[7.0]
  def change
    create_table :lakes do |t|
      t.string :name
      t.text :description
      t.float :area
      t.string :access
      t.timestamps
    end
  end
end
