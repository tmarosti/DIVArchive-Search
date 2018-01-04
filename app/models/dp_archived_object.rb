class DpArchivedObject < ActiveRecord::Base
  has_many :dp_object_instances, foreign_key: 'on_object_ao_id'
end
