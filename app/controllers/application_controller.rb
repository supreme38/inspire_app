class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # looks at configure_permitted_parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    # allow devise to accept username
    devise_parameter_sanitizer.for(:sign_up) << :username
    # allow devise to accept username when editing
    devise_parameter_sanitizer.for(:account_update) << :username
  end
end
