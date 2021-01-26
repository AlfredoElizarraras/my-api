class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  
  respond_to :json
  protect_from_forgery with: :exception
end
