class DpObjectInstance < ActiveRecord::Base
  belongs_to :dp_archived_object, foreign_key: 'on_object_ao_id'
end
