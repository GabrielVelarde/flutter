class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #Call llamar a los parametros configurados
  before_action :configure_permitted_parameter, if: :devise_controller?

  #protect the database fron the enemy (el cucco)

  protected
  def configure_permitted_parameter
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname,:lname,:username, :email, :password, :password_confirmation, :remember_me) }
  	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
  	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  	
  end



end
