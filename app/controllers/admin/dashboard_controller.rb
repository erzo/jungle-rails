class Admin::DashboardController < ApplicationController
  Rails.configuration.authentication ={
    :username => ENV['HTTP_BASIC_USER'],
    :password => ENV['HTTP_BASIC_PASSWORD']
  }

  http_basic_authenticate_with name: Rails.configuration.authentication[:username], password: Rails.configuration.authentication[:password]
  
  def show
    @products = Product.all
    @category = Category.all
  end

end
