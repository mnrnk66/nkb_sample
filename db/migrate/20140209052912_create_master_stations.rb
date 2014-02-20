class CreateMasterStations < ActiveRecord::Migration
  def change
    create_table :master_stations do |t|
      t.string :name

      t.timestamps
    end
  end
end
