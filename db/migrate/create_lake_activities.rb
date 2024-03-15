class CreateLakeActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :lake_activities do |t|
      t.integer :lake_id
      t.integer :activity_id
    end
  end
end
