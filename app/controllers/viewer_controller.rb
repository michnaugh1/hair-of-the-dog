class ViewerController < ApplicationController
  
  def show
    @page = Page.find_by_name(params[:name])
    login_required if @page.admin?
  end
end
