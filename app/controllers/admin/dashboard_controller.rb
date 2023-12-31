class Admin::DashboardController < ApplicationController
 before_action :authenticate
 
  def show
    @products = Product.order(id: :desc).all
    @categories = Category.order(id: :desc).all
  end
  private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end
end