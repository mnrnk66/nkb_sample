class Entry < ActiveRecord::Base
  belongs_to :master_station
  attr_accessor :dummy_label
end
