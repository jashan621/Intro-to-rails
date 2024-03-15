class CreateJoinTableActivitiesLakes < ActiveRecord::Migration[7.1]
  def change
    create_join_table :activities, :lakes do |t|
      # t.index [:activity_id, :lake_id]
      # t.index [:lake_id, :activity_id]
    end
  end
end
