class DpArchivedObjectsController < ApplicationController
  def index
    if params[:search]
      @step = "%#{params[:search]}%"
      @data = DpArchivedObjectsView.joins("INNER JOIN dp_distinct_obj_tapes_view ON dp_archived_objects_view.ao_object_name = dp_distinct_obj_tapes_view.te_object_name INNER JOIN dp_tapes ON dp_distinct_obj_tapes_view.ta_barcode = dp_tapes.ta_barcode").select('dp_archived_objects_view.*,dp_tapes.*').where("ao_object_name LIKE ? AND TA_GROUP_TG_ID = ?","#{@step}", "45")
    else
      @data = ""
    end
    #@data = DpArchivedObjectsView.where("ao_object_name LIKE ?","%993687%")

    #@data = DpArchivedObject.joins(:dp_object_instances).where("ao_object_name LIKE ?","%993687%")
  end
  def show
    @data = params[:post]
    #@data = DpArchivedObjectsView.where("ao_object_name LIKE ?","%993687%")
    #@data = DpArchivedObject.where("ao_object_name LIKE ?","%993687%")
  end
end
