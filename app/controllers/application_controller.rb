class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def current_user
  	current_userlogin
  end

  helper_method :current_user


  #protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token
  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :first, :last, :isTutor, :gender, :recieveReminders, :profilePicture, :passwordRecoverQuestion1, :passwordRecoverQuestion2, :passwordRecoverAnswer1, :passwordRecoverAnswer2, :isStudent, :aboutMe, :favoriteTutors, :classes, :price, :gender, :ratings, :reviews, :skills, :birthday, :email, :avatar) }
    end

end
