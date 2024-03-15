class AddLakeReferenceToSpecies < ActiveRecord::Migration[7.1]
  def change
    add_reference :species, :lake, null: false, foreign_key: true
  end
end
