class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private

    def current_cart
      @current_user ||= Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id 
      cart
    end
    helper_method :current_cart
end
