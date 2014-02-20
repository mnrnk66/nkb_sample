class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :master_station_id

      t.timestamps
    end
  end
end
