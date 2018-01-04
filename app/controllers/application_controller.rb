require 'faraday'
require 'faraday_middleware'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :check_session
  protect_from_forgery with: :exception
  def index
    render html: "Welcome to SeaBass DV!"
  end

  def check_session
    if session[:current_session_code].nil?
      register = "http://127.0.0.1:9763/services/DIVArchiveWS_REST_2.1/registerClient"
      conn = Faraday.new(:url => register) do |builder|
        builder.request :url_encoded
        builder.response :xml,  :content_type => /\bxml$/ #logging stuff
        builder.adapter Faraday.default_adapter
      end
      res = conn.get do |request|
        request.url register, :appName => "DIVA_WS_TEST", :locName => "MX", :processId => "456576"
      end
      if res.success?
        session[:current_session_code] = res.body["registerClientResponse"]["return"]
      else
        redirect_to :root
      end
    end
  end

end
