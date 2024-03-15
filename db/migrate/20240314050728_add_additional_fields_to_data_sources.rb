class AddAdditionalFieldsToDataSources < ActiveRecord::Migration[7.1]
  def change
    add_column :data_sources, :monitoring_location_id, :string
    add_column :data_sources, :monitoring_location_longitude, :float
    add_column :data_sources, :monitoring_location_horizontal_coordinate_reference_system, :string
  end
end
