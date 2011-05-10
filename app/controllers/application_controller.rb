class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  before_filter :correct_safari_and_ie_accept_headers
  after_filter :set_xhr_flash

  def set_xhr_flash
    flash.discard if request.xhr?
  end

  def correct_safari_and_ie_accept_headers
    ajax_request_types = ['text/javascript', 'application/json', 'text/xml']
    request
  end
  
  def get_user
    @current_user = current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end
end
