class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end
  
  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :first_name, :last_name, :remember_me, :title, :amount, :phone_number, :title]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
