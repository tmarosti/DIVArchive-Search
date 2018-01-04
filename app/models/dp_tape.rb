class DpTape < ActiveRecord::Base
  has_many :dp_distinct_obj_tapes_view, primary_key: "ta_barcode", foreign_key: "ta_barcode"
end
