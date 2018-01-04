class OracleBase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection (:default)
end


class DpDistinctObjTapesView < OracleBase
  self.table_name = "DIVA.DP_DISTINCT_OBJ_TAPES_VIEW"
  belongs_to :dp_tape, foreign_key: "ta_barcode"
end
