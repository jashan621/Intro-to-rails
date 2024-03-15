class CreateDataSources < ActiveRecord::Migration[6.0]
  def change
    create_table :data_sources do |t|
      t.string :DOI
      t.string :MonitoringLocationName
      t.float :MonitoringLocationLatitude
      # Add other columns as needed
      t.timestamps
    end
  end
end
