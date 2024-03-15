class AddCategoryIdToLakes < ActiveRecord::Migration[7.1]
  def change
    add_column :lakes, :category_id, :integer
  end
end
