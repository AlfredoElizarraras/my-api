class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  
  protect_from_forgery with: :exception
  before_action :underscore_params!

  private

  def underscore_params!
    deep_transform_keys(params, &:underscore)
  end

  # https://apidock.com/rails/v4.0.2/Hash/deep_transform_keys
  def deep_transform_keys(value, &block)
    result = {}
    value.each do |key, value|
      result[yield(key)] = value.is_a?(Hash) ? deep_transform_keys(value, &block) : value
    end
    result
  end
end
