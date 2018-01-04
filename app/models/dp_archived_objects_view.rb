class OracleBase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection (:default)
end


class DpArchivedObjectsView < OracleBase
  self.table_name = "DIVA.DP_ARCHIVED_OBJECTS_VIEW"
end
