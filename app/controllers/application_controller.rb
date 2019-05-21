class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ############ (added)
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource, if: :devise_controller?

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || cama_admin_url
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  end

  def layout_by_resource
    'camaleon_cms/login'
  end
  ############ (end added)

end
