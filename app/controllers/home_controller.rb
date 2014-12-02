class HomeController < ApplicationController

  def index
  end

  def get_current_user
    render json: current_user
  end
end
