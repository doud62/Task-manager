class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :projects
  
  def home
  end
end
